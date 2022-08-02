
####
from msilib import type_binary
from tkinter import Image
import flask ## 
from flask import request
from flask import Flask , render_template , url_for
import matplotlib.pyplot as plt
import numpy as np
import os
import PIL
from PIL import Image
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

    img_height = 180
    img_width = 180
    class_names = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']

    # load model
    model = tf.keras.models.load_model('model_save2.h5')

    result1 = request.files['chooseFile']
    result1.save('./static/imgs/'+ 'a.jpg') #str(result1.filename)
    
    img_path = os.path.dirname(os.path.abspath('__file__'))
    img_path += r'/static/imgs/a.jpg'
    im = Image.open(img_path)
    # print(im)
    # img = tf.keras.utils.load_img(
    #     result1, target_size=(img_height, img_width)
    #     )
    # print(im.size) # 550,557 size 크기가 안맞아서 predictions 할 때 에러 걸림
    resized_img = im.resize( (img_width , img_height) )
    # print('this is resized_img: ')
    # print(resized_img) # <PIL.Image.Image image mode=RGB size=180x180 at 0x2611C4D82B0>
    img_array = tf.keras.utils.img_to_array(resized_img)
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
    return render_template('test.html',result1=result1,Textttt=Textttt)

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
        ) ## img type PIL.image
    # print(rose_path)
    # print('this is img')
    print(img) # <PIL.Image.Image image mode=RGB size=180x180 at 0x176E4AE39A0>
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
