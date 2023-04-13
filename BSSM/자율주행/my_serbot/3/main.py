#%%
from pop.Pilot import SerBot , IMU
import timeit

bot = SerBot()
bot.setSpeed(50)

t0_10 = timeit.default_timer() # 100 마이크로 마다 읽어옴
count =0
imu = IMU()
bot.forward()
delay=False
while True:
    t1_10 = timeit.default_timer()
    yaw = tuple(imu.getGyro().values())[2]
    print(yaw)
    if ((t1_10 - t0_10) * 1000) >= 10000:
        break
    else :
        # print(tuple(imu.getGyro().values())[2])
        if yaw > 2:
            print(yaw)
            bot.steering = -1.0
            delay = True
            t0_1 = timeit.default_timer()

        if yaw < -2:
            print(yaw)
            bot.steering = 1.0
            delay = True
            t0_1 = timeit.default_timer()

        if (delay):
            t1_1 = timeit.default_timer()
            if ( t1_1-t0_1 ) * 10000 >= 10:
                delay = False
                bot.steering = 0.0
                
bot.stop()

#%%
bot.turnRight()
import time
time.sleep(1)
bot.stop()
# %%
from pop.Pilot import SerBot, IMU
import time
start_time = 0
bot = SerBot()
bot.setSpeed(50)
bot.forward()

imu = IMU()
last_time = time.time()
steering_time = None

while True:
    current_time = time.time()
    elapsed_time = current_time - last_time

    # 자이로스코프 값을 이용하여 로봇을 회전시킵니다.
    gyro_z = imu.getGyro()['z']
    if abs(gyro_z) > 5:
        if not steering_time:
            bot.steering = -1 if gyro_z < 0 else 1
            steering_time = current_time
            print("Rotating...")
        else:
            # 일정 시간이 지나면 조향각을 0으로 설정합니다.
            if current_time - steering_time > 0.5:
                bot.steering = 0
                steering_time = None
                print("Stopped rotating.")
    
    # 일정 시간마다 로봇을 전진시킵니다.
    if elapsed_time > 0.1:
        bot.forward()
        last_time = current_time
    
    # 총 실행 시간이 30초를 넘으면 종료합니다.
    if current_time - start_time > 30:
        break

bot.stop()
#%%
from pop.Pilot import SerBot, IMU
import timeit

bot = SerBot()
imu = IMU()

bot.setSpeed(50)
bot.forward()
count = 0
delay = False

t0_10 = timeit.default_timer()
while True:
    t1_10 = timeit.default_timer()
    if (t1_10-t0_10) * 10000 >= 100:
        t0_10 = t1_10
        count += 1
        if tuple(imu.getGyro().values())[2]:      
            bot.steering = -1.0
            delay = True
            t0_1 = timeit.default_timer()

    if (delay):
        t1_1 = timeit.default_timer()
        if (t1_1-t0_1) * 10000 >= 10:
            delay = False
            bot.steering = 0.0
            
    if count > 500:
        break
bot.stop()

#%%
bot.steering = 0
bot.forward()
bot.stop()
#%%
from pop.Pilot import SerBot, IMU
import timeit

bot = SerBot()
bot.setSpeed(50)

t0_10 = timeit.default_timer() # 100 마이크로 마다 읽어옴
imu = IMU()
bot.forward()
delay = False
initial_yaw = tuple(imu.getGyro().values())[2]
while True:
    t1_10 = timeit.default_timer()
    yaw = tuple(imu.getGyro().values())[2]
    print(yaw)
    if ((t1_10 - t0_10) * 1000) >= 10000:
        break
    else:
        # print(tuple(imu.getGyro().values())[2])
        if yaw > 2:
            print(yaw)
            bot.steering = -1.0
            delay = True
            t0_1 = timeit.default_timer()

        if yaw < -2:
            print(yaw)
            bot.steering = 1.0
            delay = True
            t0_1 = timeit.default_timer()

        if (delay):
            t1_1 = timeit.default_timer()
            if ( t1_1-t0_1 ) * 10000 >= 10:
                delay = False
                bot.steering = 0.0

        # Check if the yaw has deviated too far from the initial yaw
        if abs(yaw - initial_yaw) > 10:
            # Turn in the opposite direction to get back on track
            if yaw > initial_yaw:
                bot.steering = -1.0
            else:
                bot.steering = 1.0
            delay = True
            t0_1 = timeit.default_timer()

        # If the bot is back on track, reset the initial_yaw
        if not delay and abs(yaw - initial_yaw) <= 2:
            initial_yaw = yaw

bot.stop()
