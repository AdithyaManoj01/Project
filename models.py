from django.db import models

class Logdata(models.Model):
    username = models.CharField(max_length=100,
                                unique=True,
                                error_messages={
                                    "unique": "This username is already registered"
                                })
    password = models.CharField(max_length=100)
    utype = models.CharField(max_length=20,
                             default="user")
    
class UserDetails(models.Model):
    name = models.CharField(max_length=100)
    photo = models.ImageField(upload_to="Users/")
    dob = models.DateField()
    kin = models.CharField(max_length=100)
    relation = models.CharField(max_length=20)
    phone = models.CharField(max_length=20)
    username = models.CharField(max_length=100,
                                unique=True,
                                error_messages={
                                    "unique": "This username is already registered."
                                })
    
class Medicine(models.Model):
    medicine = models.CharField(max_length=100)
    time = models.TimeField()
    dose = models.CharField(max_length=20)
    user = models.ForeignKey(UserDetails,
                             on_delete=models.CASCADE)
    status = models.SmallIntegerField(default=0)

    class Meta:
        unique_together = ("medicine", "time", "dose", "user")
    
class Reminder(models.Model):
    topic = models.CharField(max_length=100)
    reminder = models.TextField()
    time = models.TimeField()
    user = models.ForeignKey(UserDetails,
                             on_delete=models.CASCADE)
    status = models.SmallIntegerField(default=0)


class Kin(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()

class UnknownFaces(models.Model):
    username = models.CharField(max_length=200)
    timestamp = models.DateTimeField(auto_now_add=True)
    image = models.CharField(max_length=200)