
####
import flask ## 
from flask import request
from flask import Flask , render_template , url_for
import matplotlib.pyplot as plt
import numpy as np
import os
import PIL
from flask import request
import tensorflow as tf

from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.models import Sequential

app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('gp.html')

@app.route('/gp',methods=['GET','POST'])
def result():
    if request.method == 'POST':
        val = request.form
        return render_template("ttt.html",result=val)
    else :
        return render_template("ttt.html")

@app.route('/gpp', methods=['GET','POST'])
def result1():
    return str(request.form)

@app.route('/test2')
def test2():
    return render_template('test.html')

@app.route('/exam')
def predict():

    # variable
    img_height = 180
    img_width = 180
    class_names = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']

    # load model
    model = tf.keras.models.load_model('model_save2.h5')

    # test용 필요한 것들
    rose_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Garden_roses_%28yellow-red%29.jpg/800px-Garden_roses_%28yellow-red%29.jpg"
    rose_path =  tf.keras.utils.get_file('Sunflower', origin=rose_url)
    img = tf.keras.utils.load_img(
        rose_path, target_size=(img_height, img_width)
        )
    img_array = tf.keras.utils.img_to_array(img)
    img_array = tf.expand_dims(img_array,0)
    predictions = model.predict(img_array)
    score = tf.nn.softmax(predictions[0])
    
    # 프린트
    print(
        "This image most likely belongs to {} with a {:.2f} percent confidence."
        .format(class_names[np.argmax(score)], 100 * np.max(score))
    )
    
    # 결과 html에 전달하기
    Textttt = "This image most likely belongs to {} with a {:.2f} percent confidence.".format(class_names[np.argmax(score)], 100 * np.max(score))
    
    return Textttt

if __name__ == '__main__':
    app.run(debug=True,port=8080)