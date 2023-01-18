from django.urls import path
from . import views

urlpatterns = [
    path("", views.getMusics, name = "genus-home"), 
    path("form/", views.index, name = "upload-sample")
]
