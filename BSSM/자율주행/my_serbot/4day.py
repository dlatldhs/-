# %%
from pop.LiDAR import Rplidar
import matplotlib.pyplot as plt
import numpy as np
import cv2

lidar = Rplidar()
lidar.connect()
lidar.startMotor()

fig = plt.figure(figsize=(12.8, 7.2), dpi=100)
ax = fig.add_subplot(111, projection='polar')
fig.tight_layout()

# dist = 5000 #5m
dist = 500 # 50cm

while True:
    V = np.array(lidar.getVectors(True))
    V = np.where(V <= dist, V, 0)
    ax.plot(np.deg2rad(V[:,0]), V[:,1])
    fig.canvas.draw()

    cv2.imshow("lidar", np.array(fig.canvas.renderer._renderer))
    plt.cla()
    ax.set_theta_zero_location("N")

    if cv2.waitKey(10) == 27:
        break

lidar.stopMotor()
cv2.destroyAllWindows()

# %%
from pop.LiDAR import Rplidar
from pop.Pilot import SerBot, IMU
import time

lidar = Rplidar() # 인스턴스 변수 선언(lidar)
lidar.connect()
lidar.startMotor() # 라이다가 도라감
bot = SerBot()
bot.setSpeed(50)

bot.forward()
# while True:
V = lidar.getVectors()
for item in V:
    if item[0] >= 340 or item[0] < 30: # 50도
        if item[1] < 800:
            bot.turnLeft()
            # time.sleep(2)
            print('turn...!')
            break
bot.stop()
lidar.stopMotor()


# %%
bot.stop()

# %%
from pop.LiDAR import Rplidar
from pop.Pilot import SerBot, IMU
import time

lidar = Rplidar() # 인스턴스 변수 선언(lidar)
lidar.connect()
lidar.startMotor() # 라이다가 도라감
bot = SerBot()
bot.setSpeed(50)
keep_serbot = True
bot.forward()

while keep_serbot:
    V = lidar.getVectors()
    for item in V:
        if item[0] >= 340 or item[0] < 30: # 50도
            if item[1] < 800:
                bot.turnLeft()
                time.sleep(0.4)
                bot.forward()
                # lidar.stopMotor()
                print('turn...!')
                break
bot.stop()
lidar.stopMotor()

#%%
bot.stop()

lidar.stopMotor()

# %%
from pop.Pilot import SerBot
from lidar import Lidar
import random

def main():
    serbot_width = 500
    direction_count = 8
    speed = 50

    bot = SerBot()
    lidar = Lidar(serbot_width, direction_count)
    current_direction = 0
    flag = True
    
    print("Start SerBot!!!")

    while flag:
        try:
            if lidar.collisonDetect(300)[current_direction]:
                bot.stop()
                continue

            detect = lidar.collisonDetect(800)

            if sum(detect) == direction_count:
                bot.stop()
                continue
            
            if detect[current_direction]:
                open_directions = [i for i, val in enumerate(detect) if not val]
                current_direction = random.choice(open_directions)

            bot.move(lidar.degrees[current_direction], speed)
            print(detect)

        except (KeyboardInterrupt, SystemError):
            flag = False
    
    bot.stop()
    print('Stopped Serbot!')

if __name__ == '__main__':
    main()
# %%
