## stm32 와 라즈베리파이의 차이점

### 만약
> ##### LED와 모터를 제어한다고 가정을 할 때에 stm32로 센서를 제어하고 서버를 라즈베리파이로 사용할 수도 있다. 하지만 라즈베리파이에도 GPIO가 있기 때문에 라즈베리파이로 센서를 제어가능하다. 그렇지만 왜 라즈베리파이로 센서를 제어하지 않을까 ?? <br>이유는 라즈베리파이는 리눅스용 AP 이기 때문이다. 간단하게 말하자면 라즈베리ㅏ이는 리눅스용이라서 클럭에 딱 맞춰서 곗ㄴ하고 작업하는게 아니라 약간 느슨하게 계산하고 작업을 하는 반면에 stm32는 HRT(hard real time) 이라서 정확하게 딱 맞아떨어지게 처리를 함. 그래서 정확하게 처리를 하기 떄문에 모터 제어 같은 경우데 stm32 가 라즈베리파이 보다 좀 더 부드럽게 움직이는 것을 볼 수 있음.
