## BSSM OPENCV 수업

### 1주차
```python
import cv2 # OpenCV 라이브러리를 불러온다.

img = cv2.imread('image.jpg') # 'image.jpg' 파일을 읽어와서 img 변수에 저장한다.

cv2.imshow('y_na',img) # 'y_na'라는 윈도우 창에 img 이미지를 보여준다.

cv2.waitKey(0) # 아무 키나 누를 때까지 대기한다.

cv2.destroyAllWindows() # 모든 OpenCV 창을 닫는다.
```
#### computer vision
> muchine vision -> 영상처리 이용 ( PCB 납땜이 잘 되어 있는지 검사) , 자동화 분석
> image processing( 화소 처리 picture processing) 라고도 함 : 디지털화된 신호를 원하는 목적에 맞게 처리를 하기 위한 방법 , 의료쪽에서도 쓰임( 어두운 폐 사진 같은거 밝고 선명하게)
> 스테레오 카메라 : 좌우배치한 카메라
> SLAM: 영상을 통해 위치를 찾고 지도를 만들어가느 기술
> NCC , SURF : 패턴 인식 알고리즘
> 셔터 스피드 : 카메라 열리고 닫히는 시간
> Bayer Pattern
> ![image](https://user-images.githubusercontent.com/80656700/227781906-b61b4d2c-60f0-4819-aacb-335ade62a477.png) <br> 에너지 -> (카메라 필터) -> ADC => 전하
> light -> object -> camera -> ADC -> digital data -> memory 저장
> ccd: 비싼데 화질이 좋음 , cmos : 발열이 적고 저렴 , 화질 조금 좋음 , ccd는 글로벌 셔터를 사용하고 cmos 는 롤링 셔터를 사용함
> 글로벌 셔터 -> 동시에 셔터를 열고 / 닫음
> 롤링 셔터 -> 위에서 부터 한줄 한줄 (사진을) 읽어들임
> 핀돌 카메라 모델 : 상이 뒤집혀서 찍힘 (초점거리) , 초점거리 를 제어하면 멀리있는 것을 크게 볼수 있음
> sampleing(샘플링) -> 해상도에 영향 , 픽셀이 얼마나 촘촘하게 설계 되어 있는지
> 양자화(Quatization) 밝기를 몇 단계로 표현할 것인가 ?
----

### 2주차
```python
# %%
import cv2 as cv
import sys

img = cv.imread('image.jpg')
if img is None:
    sys.exit('could not read the image.')

cv.imshow('distplay window',img)

k = cv.waitKey(0)
if k == ord('s'):
    cv.imwrite('image2.jpg',img)

# %%
width = 3
height = 5
RectArea = width * height
TriangleArea = width*height/2

print(RectArea)
print(width,'*',height,'=',RectArea)

print('{0} : {1} * {2} / 2 = {3}'.format('Triangle Area', width,height,TriangleArea))



# %% 
import os
os.system('clear')

numbers = [11,12,13,14,15]
print(numbers)
print(numbers[2])
print(numbers[2:4])

numbers[1], numbers[3] = 22 , 24
print(numbers[:])

numbers[:] = []
print(numbers[:])

numbers = [1,2,3,4,5]
alphabet = ['a','b','c']
collabo = [numbers,alphabet]
print(collabo[:])
print(collabo[0])
print(collabo[1])


# %%
import os
os.system('clear')

a = 0xff
b = 0o67
c = 0b1010

print(a,b,c)

print("%x, %o %s" %(a,b,bin(c)) )

print("%d, %x %o" %(12,12,12))
print("%s, %s %s" %(bin(12), hex(12),oct(12)))
# %%
import os
os.system('clear')

num = 0
while num < 5:
    print(num)
    num += 1
print('end')

num = 0
while num < 5:
    num += 1
    print(num)
print('end')
# %%
def caffe(beverage, *arguments, **keywords):
    print("Do U have any?",beverage,"?")
    for arg in arguments:
        print(arg)
    print("*****")
    for kw in keywords:
        print(kw,":",keywords[kw])
    

caffe("coffee","it's yummy, sir","wolud you try ?",
      barista = "Jay Kim",
      client  ="BSSM",
      cup     = "Venti-size")

# %%
import os
os.system('clear')

nation = {'Korea':'+82','US':'+1','Japen':'+81'}

print(nation['Korea'])

let = input()

if let in nation:
    print('countury code =',nation[let])
else:
    print('something wrong~~~!!!')

# %%
print(os.getcwd())
pwd = os.getcwd()
path = 'data.txt'
fp = open(path)
str = fp.read()
print(str,end='')
fp.close()

# %%
import os
import cv2 as cv
img = cv.imread('image.jpg')
height = img.shape[0]
width = img.shape[1]

for y in range(0,height):
    img.itemset(y,int(width/2),0,0)
    img.itemset(y,int(width/2),1,0)
    img.itemset(y,int(width/2),2,255)

    for x in range(0,width):
        img.itemset(y,int(width/2),0,255)
        img.itemset(y,int(width/2),1,0)
        img.itemset(y,int(width/2),2,0)

cv.imshow('result',img)
cv.waitKey(0)
cv.destroyAllWindows()
```
-------

### 3주차
```python
#%%
from socket import *

host = '127.0.0.1'
port = 9999

server_socket = socket(AF_INET,SOCK_STREAM)
server_socket.setsockopt(SOL_SOCKET,SO_REUSEADDR,1)

server_socket.bind((host,port))

print('listing...')
server_socket.listen()

client_socket , addr = server_socket.accept()
print('connected by' , addr ) 

cnt = 0

while True:
    data = client_socket.recv(1024)
    
    if not data:
        break
    
    cnt += 1
    print(cnt,':: received from',addr,data.decode())
    client_socket.sendall(data)

client_socket.close()
server_socket.close()

#%%
from socket import *

host = '127.0.0.1'
port = 9999

client_socket = socket(AF_INET,SOCK_STREAM)

client_socket.connect((host,port))
client_socket.sendall('안녕.'.encode())

data = client_socket.recv(1024)
print('received from', repr(data.decode()))

client_socket.close()
# %%
import os
import cv2
cap = cv2.VideoCapture('./images/video2.mp4')

while cap.isOpened():
    success, frame = cap.read()
    if success:
        cv2.imshow('image',frame)

        key = cv2.waitKey(30) & 0xFF

        if ( key == 27 ):
            break
    else:
        break
cap.release()

cv2.destroyAllWindows()
# %%
import cv2
import numpy as np

def draw_rect(event,x,y,flags,param):
    print(event)
    if event == cv2.EVENT_LBUTTONDOWN:
        cv2.rectangle(img, (x,y) , (x+50 , y+50) ,  (255,0,0) , -1 )

img = np.zeros((512,512,3),np.uint8)
cv2.namedWindow('image')
cv2.setMouseCallback('image',draw_rect)

while(1):
    cv2.imshow('image',img)
    if cv2.waitKey(1) & 0xFF == 27:
        break

cv2.destroyAllWindows()

#%%
import cv2

CAMERA_ID = 0

cam = cv2.VideoCapture(CAMERA_ID)
if cam.isOpened() == False:
    print
    'Cannot open the camera-%d' % (CAMERA_ID)
    exit()

cv2.namedWindow('CAM Window')

while(True):
    ret, frame = cam.read()
    cv2.imshow('CAM Window',frame)

    if cv2.waitKey(10) > 0:
        break
cam.release()
cv2.destroyAllWindows()

#%%
import cv2
import numpy as np

def nothing():
    pass

cv2.namedWindow('RGB track bar')

cv2.createTrackbar('red color', 'RGB track bar',0,255,nothing)
cv2.createTrackbar('green color', 'RGB track bar',0,255,nothing)
cv2.createTrackbar('blue color', 'RGB track bar',0,255,nothing)

cv2.setTrackbarPos('red color', 'RGB track bar',125)
cv2.setTrackbarPos('green color', 'RGB track bar',125)
cv2.setTrackbarPos('blue color', 'RGB track bar',125)

img = np.zeros((512,512,3),np.uint8)

while(1):
    redVal = cv2.getTrackbarPos('red color','RGB track bar')
    greenVal = cv2.getTrackbarPos('green color','RGB track bar')
    blueVal = cv2.getTrackbarPos('blue color','RGB track bar')

    print(redVal)

    cv2.rectangle(img,(0,0) , (512,512) , (blueVal,greenVal,redVal) , -1 )
    cv2.imshow('RGB track bar',img)

    if cv2.waitKey(30) & 0xFF == 27:
        break
# %%
import cv2 as cv
import numpy as py
from matplotlib import pyplot as plt

img = cv.imread('image.jpg',cv.IMREAD_GRAYSCALE)
assert img is not None, "file could not be read , check with os.path.exists()"

ret,thresh1 = cv.threshold(img,127,255,cv.THRESH_BINARY)
ret,thresh2 = cv.threshold(img,127,255,cv.THRESH_BINARY_INV)
ret,thresh3 = cv.threshold(img,127,255,cv.THRESH_TRUNC)
ret,thresh4 = cv.threshold(img,127,255,cv.THRESH_TOZERO)
ret,thresh5 = cv.threshold(img,127,255,cv.THRESH_TOZERO_INV)

titles = ['Original Image','BINARY','BINARY_INV','TRUNC','TOZERO','TOZERO_INV']

images = [img, thresh1,thresh2,thresh3,thresh4,thresh5]
for i in range(6):
    plt.subplot(2,3,i+i),plt.imshow(images[i],'gray',vmin=0,vmax=255)
    plt.title(titles[i])
    plt.xticks([]),plt.yticks([])
plt.show()
```
