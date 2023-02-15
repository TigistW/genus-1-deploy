import pickle
import os
import pandas
from django.conf import settings
def predict_gen(meta_d):
    path = os.path.join(settings.MODELS, 'models.pkl')
    
    with open(path, 'rb') as pickled:
        data = pickle.load(pickled)
    print(data)
    meta_d = pd.DataFrame(meta_d)
    ans = data.predict(meta_d)
    
    return ans[0]
    