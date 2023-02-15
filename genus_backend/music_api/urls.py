from django.urls import path
from . import views

urlpatterns = [
    path("", views.getMusics, name = "genus-home"), 
    path("add/", views.index, name = "upload-sample"),
    
    path("login/", views.loginView, name = "login"), 
    path("register/", views.registerView, name = "register")

]
