import time
from pop.Pilot import SerBot

print('Hello world!!!')

bot = SerBot() # 객체
bot.setSpeed(30)

bot.forward()
time.sleep(4)

bot.stop()