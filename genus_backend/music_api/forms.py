from django.forms import ModelForm
from .models import Music, User


class MusicForm(ModelForm):
    class Meta:
        model= Music
        fields = ['song']



class UserForm(ModelForm):
    class Meta:
        model= User
        fields = ['name']
        
class LoginForm(ModelForm):
    class Meta:
        model = User
        fields = ['name']