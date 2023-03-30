### 인터럽트(interrupt)
```마이크로 프로세서(cpu)가 프로그램을 실행하고 있을 때 시스템에 예외 상황이 발생하여 처리 해야 할 때 cpu에게 알려 처리를 하는 것을 말함```
혹은 ```정상적인 마이크로 프로세서(cpu)의 실행을 방해했다는 의미도 가짐```

### 명령어 사이클
<img src="https://i.imgur.com/sA0vHHB.png" />
참조 :https://whatisthenext.tistory.com/147

##### 1. INTR(Interrupt Request)
##### - INTR 신호가 IE(Interrupt Enable) 플래그와 AND 하여 제어장치로 입력됨

##### 2. 인터럽트 루틴
##### - 인터럽트 벡터 (interrupt Vector)<- 인터럽트 서비스 루틴에 대한 정보를 모아놓은 영역

##### 3. 프로그램 상태 보관
##### 현재 실행하던 프로그램을 중단하고,(프로그램) 상태를 스택에 저장한다.
##### - PC (program Counter) 저장
##### - SR (Status Register) 저장
#### 인터럽트 번호는 예외상황 인터럽트를 제외하고 운영체제가 결정함
```
0 ~ 31 : 예외상황 인터럽트
32 ~ 47 :  하드웨어 인터럽트
128 : 시스템 콜
```
