#%%
import cv2
n = int(input())
if ( 1 >= n ):
    print("N 크기가 부족합니다...")
# cv2.namedWindow("Webcam")
cv2.createTrackbar('red color','Webcam',3,21,1)
cv2.setTrackbarPos('red color','Webcam',125)
# 웹캠 영상 캡쳐를 위한 VideoCapture 객체 생성
cap = cv2.VideoCapture(0)
# cap = cv2.VideoCapture(1)
while True:
    # 웹캠에서 프레임을 읽어옴
    ret, frame = cap.read()
    frame = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
    rp = cv2.GaussianBlur(frame,(3,21),0)
    # 프레임이 정상적으로 읽어왔을 경우 화면에 표시
    if ret:
        cv2.imshow('Webcam', frame)
        
    # q를 누르면 프로그램 종료
    if cv2.waitKey(1) == ord('q'):
        break

# 객체와 창 닫기
cap.release()
cv2.destroyAllWindows()
#%%
import cv2
n = int(input())
# 웹캠 영상 캡쳐를 위한 VideoCapture 객체 생성
cap = cv2.VideoCapture(0)

# 창 생성
cv2.namedWindow("Webcam")

# 트랙바 생성
cv2.createTrackbar('filter size', 'Webcam', 3, 21, lambda x: None)

while True:
    # 웹캠에서 프레임을 읽어옴
    ret, frame = cap.read()

    # 프레임이 정상적으로 읽어왔을 경우 화면에 표시
    if ret:
        # 필터 크기 가져오기
        filter_size = n
        
        # 필터 적용
        filtered = cv2.GaussianBlur(frame, (filter_size, filter_size), 0)
        cv2.imshow('Webcam', filtered)
        
    # q를 누르면 프로그램 종료
    if cv2.waitKey(30) == ord('q'):
        break

# 객체와 창 닫기
cap.release()
cv2.destroyAllWindows()
