import numpy as np
import cv2
from matplotlib import pyplot as plt

img1 = cv2.imread("./images/road.jpg",cv2.IMREAD_GRAYSCALE)
is_true = False
globalXs = []
globalYs = []
globalX=0
globalY=0
def onMouse(event,x,y,flags,param) :
    if event == cv2.EVENT_LBUTTONDOWN:
        globalX = x
        globalY = y
        globalXs.append(x)
        globalYs.append(y)
        print('# of clicked point = ',len(globalXs))
       
## main code ##
cv2.imshow('image',img1)
cv2.setMouseCallback('image',onMouse)

# 4개의 점이 입력될 때까지 기다리는 코드
while(1):
    cv2.waitKey(30)
    if len(globalXs) == 4:
        # 창 닫기
        cv2.destroyAllWindows()
        # while 루프 종료!
        break

# 이제 4개의 점을 입력받았으니 다음 순서 진행
print('start transoformation')
h,w = img1.shape

if globalXs[0] > globalXs[1]:

    if globalXs[2] > globalXs[3]:

        point1_src = np.float32([[globalXs[0],globalYs[0]],[globalXs[1],globalYs[1]],[globalXs[2],globalYs[2]],[globalXs[3],globalYs[3]]]) # 현재
        
        point1_dst = np.float32([[globalXs[0],globalYs[0]],[globalXs[0],globalYs[1]],[globalXs[2],globalYs[2]],[globalXs[2],globalYs[3]]]) # 현재

    elif globalXs[3] > globalXs[2]:
        point1_src = np.float32([[globalXs[0],globalYs[0]],[globalXs[1],globalYs[1]],[globalXs[2],globalYs[2]],[globalXs[3],globalYs[3]]]) # 현재
        
        point1_dst = np.float32([[globalXs[0],globalYs[0]],[globalXs[0],globalYs[1]],[globalXs[3],globalYs[2]],[globalXs[3],globalYs[3]]]) # 현재

elif globalXs[1] > globalXs[0]:
    if globalXs[2] > globalXs[3]:

        point1_src = np.float32([[globalXs[0],globalYs[0]],[globalXs[1],globalYs[1]],[globalXs[2],globalYs[2]],[globalXs[3],globalYs[3]]]) # 현재
        
        point1_dst = np.float32([[globalXs[1],globalYs[0]],[globalXs[1],globalYs[1]],[globalXs[2],globalYs[2]],[globalXs[2],globalYs[3]]]) # 현재

    elif globalXs[3] > globalXs[2]:
        point1_src = np.float32([[globalXs[0],globalYs[0]],[globalXs[1],globalYs[1]],[globalXs[2],globalYs[2]],[globalXs[3],globalYs[3]]]) # 현재
        
        point1_dst = np.float32([[globalXs[1],globalYs[0]],[globalXs[1],globalYs[1]],[globalXs[3],globalYs[2]],[globalXs[3],globalYs[3]]]) # 현재

per_mat1 = cv2.getPerspectiveTransform(point1_src,point1_dst)

res1 = cv2.warpPerspective(img1,per_mat1,(w,h))

ress = []
ress.append(img1), ress.append(res1)
titles = ['input','res1','res2','res3','res4','res5']

for i in range(2):
    plt.subplot(2,2,i+1)
    plt.imshow(ress[i],cmap='gray')
    plt.xticks([]
