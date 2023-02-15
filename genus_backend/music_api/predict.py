import pickle
import os
import pandas
from django.conf import settings
def predict_gen(meta_d):
    path = os.path.join(settings.MODELS, 'models.p')
    
    with open(path, 'rb') as pickled:
        data = pickle.load(pickled)
    print(data)
    meta_d = pd.DataFrame(meta_d)
    data.predict(meta_d)
    # svmp = data['svmp']
    # norma = data['norma']
    # lgn = data['lgn']
    # x = norma.transform([meta_d])
    # pred = svmp.predict(x)
    # return(lgn[pred[0]])