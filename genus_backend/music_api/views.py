
from django.shortcuts import render
from .models import Music
from .serializers import MusicSerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view
# Create your views here.

@api_view(['GET'])
def getMusics(request):
    musics = Music.objects.all()
    serializer = MusicSerializer(musics, many = True)
    return Response(serializer.data)

    