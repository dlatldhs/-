#%% lib

from serbotex import SerBotEx

serbot = SerBotEx()

serbot.turnAngleLeft(190)
serbot.forward(50)
# serbot.turnAngleRight(180)
serbot.stop()

# %%
from serbotex import SerBotEx
from time import sleep
serbot = SerBotEx()

def go():
    serbot.forward(forward_distance)
    sleep(2)
    serbot.stop()

forward_distance = 50
turn_angle = 120

for i in range(3):
    serbot.turnAngleRight(35) 
    go()

# %%
serbot.stop()

# %%
go()
serbot.turnAngleLeft(155)
go()
serbot.turnAngleLeft(155)
go()

# %%
import ipywidgets as widgets

w = widgets.FloatSlider(min=-10,max=10,step=0.01,value=-5)
display(w)

# %%
print(w.value)
w.value = 0.0


# %%
delay = widgets.IntSlider(max=1000, value=1, description='delay')
gyro = [widgets.FloatSlider(min=-90, max=90, description='gyro_'+s) for s in ('x', 'y', 'z')] #degree/s
accel = [widgets.FloatSlider(min=-12, max=12, step=0.01, description='accel_'+s) for s in ('x', 'y', 'z')] #m/s^2
display(delay)
for i in range(3):
    display(gyro[i])
for i in range(3):   
    display(accel[i])


# %%
is_imu_thread = True # 상태 변수 true 면 돔 , false 면 빠져나옴

from pop.Pilot import IMU
imu = IMU()
cnt=0
def onReadIMU():
    while is_imu_thread:
        gyro[0].value, gyro[1].value, gyro[2].value = imu.getGyro().values() # 자이로 값 둘다 딕셔너리 -> 딕셔너리 value type의 튜플
        # z 값만 억고 싶을 때 tuple(imu.getGyro().values())[2] 이렇게 해야됨
        accel[0].value, accel[1].value, accel[2].value = imu.getAccel().values() # 엑셀 값 얘도 딕셔너리
        time.sleep(delay.value/1000)
        if gyro[2].value < -10:
            print(gyro[2].value)
        elif gyro[2].value > 10:
            print(gyro[2].value)
            
Thread(target=onReadIMU).start() # 쓰레드 함수 , 메인 프로그램과 분리되서 실행됨


# %%
is_imu_thread = False # 안전한 종료

# %%
if gyro[2].value < -10:
    print('오른쪽으로 휘었습니다!!!')

# %%
import time
import ipywidgets as widgets
from threading import Thread
from serbotex import SerBotEx
from pop.Pilot import IMU
imu = IMU()
serbot = SerBotEx()

# %%
# serbot.forward(50)
while True:
    if tuple(imu.getGyro().values())[2] > 10:
        print('왼쪽')
        print(tuple(imu.getGyro().values())[2])
        break
        # serbot.stop()
        # break
# sleep(12)
# serbot.stop()


# %%
serbot.stop()