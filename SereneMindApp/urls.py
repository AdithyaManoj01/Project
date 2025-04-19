from django.urls import path
from . import views

appname = "SereneMindApp"

urlpatterns = [
    path("", views.home, name="home"),
    path("login", views.login, name="login"),
    path("register", views.register, name="register"),
    path("view_patients", views.view_patients, name="view_patients"),
    path("pending_approvals/<int:id>/", views.pending_approvals, name="pending_approvals"),
    path("change_status/<int:id>/<str:type>/<int:status>/", views.change_status, name="change_status"),
    path("add_alert/<str:type>/", views.add_alert, name="add_alert"),
    path("view_alerts", views.view_alerts, name="view_alerts"),
    path("add_kin", views.add_kin, name="add_kin"),
    path("detect_face/", views.detect_face, name="detect_face"),
    path("logout", views.logout, name="logout"),
]