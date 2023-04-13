#%%
from pop.Pilot import SerBot  # SerBot 모듈을 import합니다.
from lidar import Lidar      # Lidar 모듈을 import합니다.
import time
#%%
def main():                  # main 함수를 정의합니다.
    serbot_width = 500       # SerBot의 너비를 500으로 설정합니다.
    direction_count = 8      # 이동 가능한 방향의 수를 8로 설정합니다.
    speed = 50               # SerBot의 이동 속도를 50으로 설정합니다.

    bot = SerBot()           # SerBot 객체를 생성합니다.
    lidar = Lidar(serbot_width, direction_count)  # Lidar 객체를 생성하고 SerBot의 너비와 이동 가능한 방향의 수를 전달합니다.
    current_direction = 0    # 현재 이동 방향을 0으로 설정합니다.
    flag = True              # while 루프를 실행할 flag 변수를 True로 초기화합니다.
    
    print("Start SerBot!!!")  # SerBot을 시작한다는 메시지를 출력합니다.

    while flag:              # while 루프를 실행합니다.
        try:
            if lidar.collisonDetect(300):  # LIDAR에서 현재 이동 방향에 장애물이 있을 경우
                bot.stop()                       # SerBot을 정지시킵니다.
                continue                                     # 다음 루프를 실행합니다.

            detect = lidar.collisonDetect(1200)                 # LIDAR에서 SerBot 주변의 장애물 여부를 감지합니다.

            if sum(detect) == direction_count:                # LIDAR에서 모든 방향이 막혔을 경우
                bot.stop()                                   # SerBot을 정지시킵니다.
                continue                                     # 다음 루프를 실행합니다.
            
            if detect[0] or detect[1]:
                bot.turnRight()
                print()                       # LIDAR에서 감지한 장애물 여부를 출력합니다.

        except (KeyboardInterrupt, SystemError):  # KeyboardInterrupt 또는 SystemError가 발생한 경우
            flag = False                          # while 루프를 종료합니다.
    
    bot.stop()              # SerBot을 정지시킵니다.
    print('Stopped Serbot!') # SerBot이 정지되었다는 메시지를 출력합니다.

if __name__ == '__main__':   # 이 파일이 직접 실행되
    main()

#%%
bot.stop()