from pop.Pilot import SerBot
from time import sleep

class SerBotEx(SerBot):
    def __how_long_time_delay(self,angle):
        speed_status = self.getSpeed()
        if speed_status <= 20:
            w = 0.0
        elif speed_status <= 40:
            w = 0.4
        elif speed_status <= 60:
            w = 0.6
        elif speed_status <= 80:
            w = 0.7
        elif speed_status <= 100:
            w = 0.76
        return angle/90 - (angle/90)*w

    def turnAngleLeft(self,n):
        d = self.__how_long_time_delay(n)
        self.turnLeft()
        sleep(d)
        self.stop()

    def turnAngleRight(self,n):
        d = self.__how_long_time_delay(n)
        self.turnRight()
        sleep(d)
        self.stop()