from django.forms import ModelForm
from .models import Music, User

# from django.contrib.auth.forms import AuthenticationForm
# from django.contrib.auth import authenticate
# from django.utils.translation import ugettext_lazy as _

class MusicForm(ModelForm):
    class Meta:
        model= Music
        fields = ['song']

# class LoginForm(AuthenticationForm):
#     username = forms.CharField(max_length=30)
#     password = forms.CharField(widget=forms.PasswordInput, required=False)
#     user_cache = None

#     def clean(self):
#         try:
#             username = User.objects.get(username=self.cleaned_data['username']).username
#         except User.DoesNotExist:
#             raise forms.ValidationError(_("No such user registered."))

#         self.user_cache = authenticate(username=username, password=self.cleaned_data['password'])
#         if self.user_cache is None or not self.user_cache.is_active:
#             raise forms.ValidationError(_("Username or password is incorrect."))
#         return self.cleaned_data

#     def get_user(self):
#         return self.user_cache

class UserForm(ModelForm):
    class Meta:
        model= User
        fields = ['name']
        
class LoginForm(ModelForm):
    class Meta:
        model = User
        fields = ['name']