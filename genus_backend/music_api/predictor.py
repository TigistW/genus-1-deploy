import joblib
import cv2 as cv
import os
from pathlib import Path
import keras
import pickle
import numpy as np

from .metadata_extract import getmetadata
BASE_DIR = Path(__file__).resolve().parent.parent.parent
class Cnn:
    def __init__(self) -> None:
        self.labels = {0:"Ambasel", 1:"Anchihoye", 2:"Bati",3:"Tizita"}
        self.classify = joblib.load("Models/model.joblib",'r')
        # with open("Models/model.joblib", 'rb') as pickled:
        #     self.model = pickle.load(pickled)
        
        # self.knn = self.model['svmp']
        print("_______________________i am here________________________")
        # print(self.knn.summary())
        # self.classifier = pickle.load("model_training/cnn.joblib",'r')
        
    # with open(path, 'rb') as pickled:
    #     data = pickle.load(pickled)
    # 
    # norma = data['norma']
    # lgn = data['lgn']
    # x = norma.transform([meta1])
    # pred = svmp.predict(x)
    # return(lgn[pred[0]])
    
    def make_prediction(self,song):
        print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk")
        music_info = getmetadata(song)
        print(music_info)
        prediction = self.classify.predict(music_info)
        print(prediction[0])
        print("ttttttttttttttttttttttttggggggggtttttttttttttttttttttttttttttttt")
        print(self.labels[int(prediction[0])])
        return self.labels[int(prediction[0])]
    
    # def re_shape(self,image):
    #     image = cv.resize(image,(28,28))
    #     return image
    # def predict_number(self,number):
        
        # word_dict = {0:'0',1:'1',2:'2',3:'3',4:'4',5:'5',6:'6',7:'7',8:'8',9:'9',10:"10",11:'11',12:'12',13:'13',14:'14',15:'15',16:'16',17:'17',18:'18',19:'19',20:"20",21:'21',22:'22',23:'23',24:'24',25:'25',26:'26',27:'27',28:'28',29:'29',30:"30",31:'31',32:'32',33:'33',34:'34',35:'35',36:'36',37:'37'}        
        # img_final =np.reshape(number, (-1,28,28,1))
        # predicted = word_dict[np.argmax(self.classifier.predict(img_final))]
         
        # return predicted
        