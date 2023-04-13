# 5m 왕복 주행
# 정확히 5m 직진 후 턴 , 다시 5m 직진 후 출발지 멈춤
#%%
import timeit
import time
from pop.Pilot import SerBot
from pop.Pilot import IMU
from pop.LiDAR import Rplidar

bot = None
imu = None
lidar = None

def init():
    global bot , imu , lidar
    bot = SerBot()
    imu = IMU()
    lidar = Rplidar()

    # Lidar 2ce
    lidar.connect()
    lidar.startMotor()

    bot.setSpeed(50)
    bot.forward()

def destroy():
    bot.stop()
    lidar.stopMotor()

def main():
    init()
    print("start")
    t0_ms = timeit.default_timer()
    delay=False
    while True:
        t1_ms = timeit.default_timer()
        if (( t1_ms - t0_ms ) * 1000) >= 5000:
            break
        else :
            yaw = tuple(imu.getGyro().values())[2]
            # if yaw > 0.05:
            #     bot.steering = -1.0
            #     t2_ms = timeit.default_timer()
            #     delay = True
            
            if yaw < -0.05:
                bot.steering = 1.0
                t2_ms = timeit.default_timer()
                delay = True
                
            t3_ms = timeit.default_timer()
            if ( delay ):
                if (t3_ms - t2_ms ) * 10000 >= 10:
                    bot.steering = 0.0
                    delay = False

    destroy()

if __name__ == "__main__":
    main()
    destroy()
#%%
bot.stop()