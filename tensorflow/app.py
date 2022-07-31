from distutils.command.config import config
from email.policy import default
from flask import Flask , render_template , url_for
import matplotlib.pyplot as plt
import numpy as np
import os
import PIL
import tensorflow as tf

from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.models import Sequential

app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('index.html')

@app.route('/test')
def test():
    return render_template('test.html')

@app.route('/exam')
def predict():
    img_height = 180
    img_width = 180
    class_names = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']
    model = tf.keras.models.load_model('model_save2.h5')
    rose_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Garden_roses_%28yellow-red%29.jpg/800px-Garden_roses_%28yellow-red%29.jpg"
    Tulip_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Sunflower_sky_backdrop.jpg/1200px-Sunflower_sky_backdrop.jpg"
    rose_path =  tf.keras.utils.get_file('Sunflower', origin=Tulip_url)
    img = tf.keras.utils.load_img(
        rose_path, target_size=(img_height, img_width)
        )
    img_array = tf.keras.utils.img_to_array(img)
    img_array = tf.expand_dims(img_array,0)
    predictions = model.predict(img_array)
    score = tf.nn.softmax(predictions[0])
    print(
        "This image most likely belongs to {} with a {:.2f} percent confidence."
        .format(class_names[np.argmax(score)], 100 * np.max(score))
    )
    Textttt = "This image most likely belongs to {} with a {:.2f} percent confidence.".format(class_names[np.argmax(score)], 100 * np.max(score))
    
    return Textttt

if __name__ == '__main__':
    app.run(debug=True)