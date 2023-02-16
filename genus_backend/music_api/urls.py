from django.urls import path
from . import views

urlpatterns = [
    # path("", views.getMusics, name = "genus-home"), 
    path("predict/", views.predict, name = "predict"),
    path('add/',views.add_song,name='addsong'),

]
