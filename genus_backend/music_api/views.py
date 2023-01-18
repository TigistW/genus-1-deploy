
from django.shortcuts import render
from .models import Music
from .serializers import MusicSerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .forms import MusicForm

from mutagen.mp3 import MPEGInfo
import mutagen

# Create your views here.

"""
GETTING ALL THE MUSICS FOR HISTORY PAGE
"""
@api_view(['GET'])
def getMusics(request):
    musics = Music.objects.all()
    serializer = MusicSerializer(musics, many = True)
    return Response(serializer.data)



def upload_music(request):
    if request.method == 'POST':
        pass
    
def index(request):
    form = MusicForm()
    if request.method == 'POST':
       
        form = MusicForm(request.POST,request.FILES)
        
        if form.is_valid():
            song = request.FILES['song']
            # print(song)
            audio_file_prop = mutagen.File(song, easy=True)
            audio_file = MPEGInfo(song)

            title = audio_file_prop.get('title')
            artist = audio_file_prop.get('artist')
            genre = audio_file_prop.get('genre')
            size = audio_file.length
            attrs =  [title[0], artist[0], genre[0], size]
            m = Music(title = attrs[0], artist = attrs[1], length = attrs[3], genre = attrs[2], song=song)
            m.save()
            # form.save()
    # if request.method == 'POST':
    #     # print(request.POST)
    #     ans = request.POST
    #     form = MusicForm(request.POST, request.FILES)
    #     # print(form)
    #     song = ans.get('song')
    #     audio_file_prop = mutagen.File(song, easy=True)
    #     audio_file = MPEGInfo(song)

    #     title = audio_file_prop.get('title')
    #     artist = audio_file_prop.get('artist')
    #     genre = audio_file_prop.get('genre')
    #     length = audio_file.length
    #     attrs =  [title[0], artist[0], genre[0], length]
        
    #     if form.is_valid():
    #         m = Music(title = attrs[0], artist = attrs[1], length = attrs[3], genre = attrs[2], song=song)
    #         m.save()
    context = {'form' : form}
    return render(request, 'music_api/form.html', context)

def extract_metadata():
    # filePath = "01 - Rolling In the Deep.mp3"

    pass