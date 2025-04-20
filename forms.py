from django import forms
from django.core.exceptions import ValidationError
from .models import *

class LoginForm(forms.Form):
    username = forms.CharField(max_length=100)
    password = forms.CharField(max_length=100)

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data["username"]
        password = cleaned_data["password"]

        try:
            Logdata.objects.get(username=username,
                                password=password)
        except Logdata.DoesNotExist:
            raise ValidationError("Invalid Username or Password")
        
class LogdataForm(forms.ModelForm):
    class Meta:
        model = Logdata
        exclude = ["utype"]

class UserDetailsForm(forms.ModelForm):
    class Meta:
        model = UserDetails
        fields = "__all__"

class MedicineForm(forms.ModelForm):
    class Meta:
        model = Medicine
        exclude = ["user", 
                   "status"]

class ReminderForm(forms.ModelForm):
    class Meta:
        model = Reminder
        exclude = ["user", 
                   "status"]

class KinForm(forms.ModelForm):
    class Meta:
        model = Kin
        fields = "__all__"