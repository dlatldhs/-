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

def trun_180():
    pass

def stablilizer(yaw):
    pass

def forward_detect(point_frame):
    pass

def main():
    init()

    is_trun = False

    print("start")
    t0_ms = timeit.default_timer()
    while True:
        t1_ms = timeit.default_timer()
        if (( t1_ms - t0_ms ) * 1000) >= 3500:
            if not is_trun:
                trun_180()
                is_turn = True
                t0_ms = timeit.default_timer()
            else:
                break
            break

        yaw = tuple(imu.getGyro().values())[2] # 안에 있는 값만 z
        point_frame = lidar.getVectors()

        stablilizer(yaw)
        # detect = forward_detect(point_frame) # 정면에 충돌이 있는지 ..?

        # print(yaw,detect)
        print(yaw)
    
    destroy()
    print("stop")
    

if __name__ == "__main__":
    main()
    destroy()