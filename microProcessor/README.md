# 마이크로 프로세서 수업 시간내용 정리 한 곳 입니다💽
<!-- <a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2F%2FTIL&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a> -->

## 📑Contents
### 관련 용어
#### <details markdown="1"><summary>toolchain & cross tool chain</summary><p>- toolchain : 프로그램(실행파일) 개발을 하는데 필요한 개발 도구들의 모임(간단하게 말하면 컴파일러)<br>- cross-toolchain : 컴파일 해서 만든 실행코드가 컴파일한 os 가 아닌 다른 os에서 실행코드를 생성하는 컴파일러를 말함</p></details>
#### <details markdown="1"><summary>심볼</summary><p>- 심볼 : 컴파일 과정에서 아직 처리되지 않은 전역변수 & 함수 이름<br>-> 나중에 심볼이 메모리 주소로 변하게 되는데 이게 처리 되면 심볼 처리 됨 아니면 심볼 처리 안됬다고 말함<br> 심볼이 생기는 이유 : C 컴파일을 할 때 하나씩 하는데 다른 파일에 함수가 정의되어있을 수도 있어서 심볼로 미리 남겨놓는 거임 주소를 처리 하지 않고</p></details>
#### <details markdown="1"><summary>인터럽트(interrupt)</summary><p>(입출력 하드웨어에서)예외 상황이 발생하여 처리 가능하도록 알려주는 것을 말함<br></p></details>
#### <details markdown="1"><summary>히스테리시스(과거 이력)</summary><p>물질이 거쳐온 과거가 현재 상태에 영향을 주는 현상<br></p></details>
#### <details markdown="1"><summary>임계값(thresholds)</summary><p>물질이 어떠한 현상에 의해 변할 때 , 상태가 변하는 경계의 상태를 임계라고 함. 약간 내가 이해한 방식으로 풀어 쓰자면 디지털 신호가 0 과 1로 나뉘는데 이 값이 정확히 0 과 1로 맞아 떨어지는 것이 아니라서 어떤 특정 값을 넘어가면 1 로 치고 어떤 특정값보다 작으면 0 으로 치는 이 특정값을 임게값이라고 부르는 것 같음<br></p></details>
#### <details markdown="1"><summary>슈미트 트리거(schmitt trigger)</summary><p>`임계값` 2개를 만들어서 정제하는거<br><img src="https://mblogthumb-phinf.pstatic.net/20111009_279/eslectures_1318150622693zdPy7_JPEG/debouncing_circuit.jpg?type=w2" /><br>여기 보이는 `VT+` 하고 `VT−` 이게 임계값임 이걸 기준으로 `VT+`를 넘어가면 1로 취급하고 `VT-` 값 보다 낮으면 0으로 취급하는게 슈미트 트리거 방식임</p></details>
#### <details markdown="1"><summary>2진 논리 시스템(컴퓨터 시스템)</summary><p>모든 것들을 2개로 처리하는것<br>{논리 : 1 , 논리 : 0}</p></details>
#### <details markdown="1"><summary>멀티 스레드</summary><p>: 하나의 프로세스 내에서 둘 이상의 스레드가 동시에 작업을 수행하는 것</p></details>
#### <details markdown="1"><summary>부모/자식 프로세서</summary><p>: 부모 프로세서 : 프로세서를 만드는 프로세서<br>자식 프로세서 :만듬 당한 프로세서</p></details>
#### <details markdown="1"><summary>스레드</summary><p>: 스레드 : 프로세서에 비해 자원을 덜 차지함</p></details>
#### <details markdown="1"><summary>동시성</summary><p>: 동시성 : 동시에 처리함 , 하지만 속도가 느려지지 않음 그렇다고 빨라지는 것도 아님<br>이게 뭔 소리냐? => 처리하는 인원이 늘어나면서 동시에 처리함 -> 작업량이 줄어듬 -> 시간이 줄어든거임<br>--->작업 효율이 올라감 작업량을 더 늘릴 수 있음</p></details>
#### <details markdown="1"><summary>컨텀점프</summary><p>: 상위 개념을 보면 하위개념이 이해됨</p></details>
#### <details markdown="1"><summary>경량 프로세스</summary><p>: 스레드 약간 그런 개념 가벼운 프로세스</p></details>
#### <details markdown="1"><summary>파이프 라인(Pipeline)</summary><p>
   ```
    1단계 : Instruction Fetch
     명령어를 메모리에서 가져옴
    2단계 : Instruction Decode 
    	명령어를 해석
    3단계 : Execution 
    	명령어 실행
    4단계 : Memory access 
    	특정 위치에 접근
    5단계 : Write Back 
    	레지스터에 다시 씀
    ```</p></details>
### 잡다한 것
> #### 1. 헤더파일을 만드는 이유
> ##### 컴파일러(compiler)가 c 파일을 컴파일(compile)할 때 하나 씩 컴파일을 하는데 만약 `다른 곳에 정의된 함수`를 쓴다면 에러가 걸리기 때문에 헤더파일을 주면서 `다른곳에 정의된 함수`가 <i>여기서 제대로 쓰인게 맞는건지 확인</i>만 하고 `컴파일에 에러가 없게 만들기 위해서` 헤더파일이 존재하는거임

> #### 2. 입력과 출력은 동시에 일어나지 않는다.
> ##### <제어>는 0 과 1로 구분함 , 입력을 사용하고 싶으면 입력을 <i>활성화 출력</i>을 하고 출력을 사용하고 싶음 출력을 <i>활성화 출력</i> 물론 GPIO에서 해당되는 이야기임 ㅇㅇ

> #### 3. 모든 데이터는 직선의 데이터는 없음
> ##### 슈미트 트리거 같은 방식을 이용하여 정제해서 그런 거임

> #### 4. C에서 메모리 할당 및 프로세서 연산
> ##### 변수는 stack 함수는 heap에 할당 됨
> ##### int a : 프로세서(cpu) 연산 ( 사칙,논리(비트 관계),대입(메모리연산)
> ##### int *p : 메모리 접근 , 연산(대입,주소번지에 대한 증/감,역참조)
> ##### int c[1] : 메모리에 접근함(대입,주소번지+오프셋),프로세스 연산
> ##### int *d[1] : 메모리 접근 연산
