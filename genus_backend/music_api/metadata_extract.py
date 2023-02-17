import librosa
import numpy as np

def getmetadata(filename):
    y, sr = librosa.load(filename)
    #fetching tempo
    #chroma_stft

    chroma_stft = librosa.feature.chroma_stft(y=y, sr=sr)

    #rmse

    rmse = librosa.feature.rms(y=y)

    #fetching spectral centroid

    spec_centroid = librosa.feature.spectral_centroid(y = y, sr = sr)

    #spectral bandwidth

    spec_bw = librosa.feature.spectral_bandwidth(y=y, sr=sr)

    #fetching spectral rolloff

    spec_rolloff = librosa.feature.spectral_rolloff(y = y, sr=sr)

    #zero crossing rate

    zero_crossing = librosa.feature.zero_crossing_rate(y)

    #mfcc

    mfcc = librosa.feature.mfcc(y=y, sr=sr)

    #metadata dictionary

    metadata_li = [np.mean(chroma_stft), np.mean(rmse), np.mean(spec_centroid), np.mean(spec_bw), np.mean(spec_rolloff), np.mean(zero_crossing)]

    for i in range(1,21):
        metadata_li.append(np.mean(mfcc[i-1]))
    arr = np.array(metadata_li).reshape(1, -1)
    return arr