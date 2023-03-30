### 아날로그 : 연속적으로 변화하는 물리량 ( 예 : 음파 , 생체 신호등 )

### 디지털 : High 와 Low 의 1 bit data로 이루어진 신호

논리 = logic  , 논리회로는 소형화 가능

TTL ⇒ 논리회로 소형화된 IC를 통틀어서 부르는 용어

집적회로 분류

IC 와 ASIC(Application Specific IC)

IC : 회로의 입력과 출력을 규격화 하여 제작 , 74시리즈  8051CPU 범용 IC

- ASIC : 사용자가 특정 목적에 따라 설계하는 chip ?
    - semi custom
        
        Gate Array : 논리 소자 미리 설계하고 선만 연결함
        
        Standard Cell : 반만 미리 설계하고 반은 주문대로 넣음
        
    
    Full Custom : 모든 걸 다 만들어야함
    
    ASSP(Application Specific Standard Products) 
    
    - PLD : 테스트용 chip , 양산할떄에는 ASIC 화를 해서 함
        
        FPGA
        

TTL(Transisor to Transisotr Logic) 

![image](https://user-images.githubusercontent.com/80656700/223954452-eecf099d-ca5f-4c9a-8fdb-97e08e9d7e3c.png)

---

### FPGA DESIGN FLOW

기획 → 설계 → 컴파일(프로그래밍 파일 만들고 문법 검사, 칩이 알아듣기 쉬운 언어로 바꿈)→→

→검증(소프트웨어 검증 | 하드웨어 검증)

HDL ( Hardware Description Language) 

특징 : 마이크프로세서는 포트가 정의가 되어 있고 내부적으로 특정 블록이 정의가 있어서 레지스터를 제어하는 식으로 됨 , 근데 FPGA는 only 디지털제어만 가능하고 전부다 사용자 맘대로 가능함. 또한 **병렬처리도 함.**

---

### HDL(Hardware Description Language)

: 순차구분으로 구성(sequential statements)

1. Verilog HDL
    - 계층적인 구조를 가지고 있음
    - 설계 방법
        - Top Down
        - Bottom up
        - 예시 4bit adder
            
            ```vhdl
            문법
            module <module-name>(inputs,outputs); // y,a,b
            // define inputs and outputs
            input a,b; // 1비트 입력 포트 a,b
            output y; // 1비트 출력 포트
            and gate_1(y,a,b);
            endmodule
            ```
            
2. VHDL

---

### 4 bit counter

q[3:0] ⇒ q 출력으로 4bit를 제어한다는거 q3 q2 q1 q0

assignment 핀 설정해줌

*합성 ⇒ chip이 알아들을 수 있는 언어로 바꾸는 것

Implementation 결과를 이용해 FPGA의 Login cell 단위로 바꿈
