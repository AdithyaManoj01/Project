from django.shortcuts import (render,
                              redirect,
                              get_object_or_404)
from django.template.defaulttags import register as reg
from django.db import IntegrityError
from .models import *
from .forms import *
from .utils import *

@reg.filter
def has_pending_alerts(patient):
    return Medicine.objects.filter(user=patient, status=0).exists() \
        or Reminder.objects.filter(user=patient, status=0).exists()

def home(request):
    username = request.session.get("username")
    unknown_faces = UnknownFaces.objects.filter(username=username).order_by("-id") \
        if username else None
    return render(request, "Common/Home.html", {"unknown_faces": unknown_faces})

def login(request):
    form = LoginForm(request.POST or None)
    if form.is_valid():
        user = get_object_or_404(Logdata,
                                 username=form.cleaned_data["username"])
        request.session["username"] = user.username
        request.session["utype"] = user.utype
        return redirect("home")
    return render(request, "Common/Login.html", {"form": form})

def register(request):
    success = False
    logdata_form = LogdataForm(request.POST or None)
    user_details_form = UserDetailsForm(request.POST or None,
                                        request.FILES or None)
    if logdata_form.is_valid() and user_details_form.is_valid():
        logdata_form.save()
        user_details_form.save()
        success = True
    return render(request, "User/Register.html", {"logdata_form": logdata_form,
                                                  "user_details_form": user_details_form,
                                                  "success": success})

def view_patients(request):
    patients = UserDetails.objects.all()
    return render(request, "Admin/ViewPatients.html", {"patients": patients})

def pending_approvals(request, id):
    patient = get_object_or_404(UserDetails, id=id)
    medicines = patient.medicine_set.filter(status=0)
    reminders = patient.reminder_set.filter(status=0)
    return render(request, "Admin/PendingApprovals.html", {"medicines": medicines,
                                                           "reminders": reminders})

def change_status(request, id, type, status):
    model = Medicine if type == "medicine" else Reminder
    alert = model.objects.get(id=id)
    alert.status = status
    alert.save()
    return redirect("pending_approvals", id=alert.user.id)

def add_alert(request, type):
    success = False
    if type == "medicine":
        form = MedicineForm(request.POST or None)
        template = "User/AddMedicine.html"
    else:
        form = ReminderForm(request.POST or None)
        template = "User/AddReminder.html"
    if form.is_valid():
        try:
            user = get_object_or_404(UserDetails,
                                     username=request.session["username"])
            alert = form.save(commit=False)
            alert.user = user
            alert.save()
            success = True
        except IntegrityError:
            form.add_error(None, "This medicine is already entered!")
    return render(request, template, {"form": form,
                                      "success": success})

def view_alerts(request):
    username = request.session["username"]
    medicines = Medicine.objects.filter(user__username=username, status=1)
    reminders = Reminder.objects.filter(user__username=username, status=1)
    return render(request, "User/ViewAlerts.html", {"medicines": medicines,
                                                    "reminders": reminders})

def add_kin(request):
    success = None
    form = KinForm(request.POST or None)
    if form.is_valid():
        form.save()
        success = True
    return render(request, "User/AddKin.html", {"form": form,
                                                "success": success})


def detect_face(request):
    name = detection(request.session["username"])
    return redirect(request.META["HTTP_REFERER"])


def logout(request):
    request.session.flush()
    return redirect("home")