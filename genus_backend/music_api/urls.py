from django.urls import path
from . import views

urlpatterns = [
    path("", views.getMusics, name = "genus-home"), 
]
