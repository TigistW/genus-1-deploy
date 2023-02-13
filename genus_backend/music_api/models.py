from django.db import models
# from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
class CustomUserManager(BaseUserManager):

    def create_user(name):
        
        user = User(name=name)
        user.set_unusable_password()
        user.save()
        return user

    def create_superuser(name):
        pass

class User(AbstractBaseUser):
    """
    Custom django User model.
    """
    name = models.CharField(max_length=80,
                        null=False, unique=True)

    # phone = PhoneNumberField(unique=True, blank=False, null=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'name'
    REQUIRED_FIELDS = []
    
class Music(models.Model):
    title = models.CharField(max_length = 60)
    artist = models.CharField(max_length = 60, default= None, blank=True, null=True)
    length = models.DecimalField(decimal_places = 2, max_digits = 6)
    genre = models.CharField(max_length = 20)
    thumbnail = models.CharField(max_length = 200, default = None, blank=True, null=True)
    song = models.FileField(default = 'Some music',upload_to='music')
    user = models.ForeignKey(User,null = True,on_delete = models.CASCADE)

# class User(AbstractUser):
    """
    Users within the Django authentication system are represented by this
    model.

    Username and password are required. Other fields are optional.
    """

    # class Meta(AbstractUser.Meta):
    #     swappable = "AUTH_USER_MODEL"

# Create your models here.
