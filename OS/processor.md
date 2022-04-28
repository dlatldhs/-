### ProCessor

##### 의미 : ```컴퓨터 내에서 프로그램을 처리하는 유닛```

##### 프로세서 분류 기준
1. System struct(시스템 구조) 명령어
2. Data BUS SIze( 데이터 버스 크기에 따라)
3. CPU core 내부 연산장치 개수
4. 아키텍쳐
5. 사용 용도

##### 일반적으로 CPU의 명령어 처리 및 구성방식으로 2가지 나눔
1. CISC(Complex Instruction Set Computer) 복잡함
2. RISC(Reduced Instruction Set Computer) 덜복잡함

##### CISC
```
CPU Instruction : 명령이 많음 -> 길이가 다양함 -> access time & 실행 사이클 등등이 다 다름
회로 구성하는게 복잡함, 레지스터가 적음 -> 속도 느림
메모리를 효율적으로 사용함(memory 밀도가 굉장히 높음)
프로그램측 명령어(프로그램에서 주는(?)명령어는 적고 CPU 명령어나 다른 명령어가 굉장히 많음
--> compiler 가 복잡함
```

##### RISC
```
CISC 보다 CPU 명령어가 적음
레지스터가 CISC보다 많음 -> 속도 빠름
회로 구성하는게 간단함(비교적)
```

##### 다른 Processor Unit 들
##### 1. MPU(micro processor Unit) : CPU보다 좀 더 목적성을 가진 (micro)초소형 연산처리 장치임
```   
: 주로 기계어 실행,연산 수행 기능을 가짐
```
##### 2. MCU(micro controller Unit) : 전자기기 프로세서 대다수
```
MCU = CPU + Memory + interface + controller ==> 내장형 소형 컴퓨터(참고.아두이노에도 들어가 있음)
```
##### 3. DSP(Digital Signal Processor)
```
Digital 신호 처리 연산기 , Data를 고속엿난 , 행렬연산 하는데 최적화된 CPU 라고 보면 됨
```
##### 4. GPU(Graphices Processing Unit)
```
일상생활 속에서 실수(IR) 를 저장을 하기 위해 부동 소수점/고정 소수점 저장 방식을 활용함
참고로 부동소수점이 매우 효율적임
--> 그래픽 & 멀티 미디어, 음성 제일 빨리 처리함 CPU가 좋아서
```
<img src="https://t1.daumcdn.net/cfile/tistory/2744C0495927956D21" />
보면 ALU(Arithmetic Logical Unit) 가 매우 매우 매우 매우 매우 매우 매우 매우 많음<br>
이게 `행 연산`에 특화됨 이런 `GPU의 병렬 처리방식`은 (빅데이터,인공지능,3D 등)을 매우 빠르게 계산함
