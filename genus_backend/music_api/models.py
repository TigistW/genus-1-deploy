from django.db import models

# Create your models here.
class Music(models.Model):
    title = models.CharField(max_length = 60)
    artist = models.CharField(max_length = 60, default= None, blank=True, null=True)
    length = models.DecimalField(decimal_places = 2, max_digits = 6)
    genre = models.CharField(max_length = 20)
    thumbnail = models.CharField(max_length = 200, default = None, blank=True, null=True)
    