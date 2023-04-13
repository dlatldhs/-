from pop.LiDAR import Rplidar
import math

class Lidar:
    def __init__(self, width, directions):
        self.serbot_width = width
        self.degrees = list(range(0, 360, 360 // directions))

        self.lidar = Rplidar()
        self.lidar.connect()
        self.lidar.startMotor()

    def __del__(self):
        self.lidar.stopMotor()

    def __calcAngle(self, length):
        tan = (self.serbot_width / 2) / length
        angle = math.atan(tan) * (180 / math.pi)
        return angle

    def collisonDetect(self, length):
        detect = [0] * len(self.degrees)
        angle = self.__calcAngle(length)
        ret = self.lidar.getVectors()
        for degree, distance, _ in ret:
            for i, detect_direction in enumerate(self.degrees):
                min_degree = (detect_direction - angle) % 360
                if (degree + (360 - min_degree)) % 360 <= (angle * 2):
                    if distance < length:
                        detect[i] = 1
                        break
        return detect