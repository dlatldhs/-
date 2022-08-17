# stm32 pwm
## pwm
##### ```Pulse Width Modulation : 펄스폭 변조로 만들어지는 신호```<br>PWM은 신호의 주기 , 펄스 폭(Duty rate) , 전압 레벨로 정의할 수 있음

### config
#### 1. ST Link를 사용하게 해주기
> ##### `Pinouot & Configuration` 탭에서 `System Core` > `SYS` > Debug : `Serial Wire` 선택시 자동으로 MCU Pin 두 개가 할당됨. 할당된게 ST Link 포트임.
> ##### ❂위에 MCU Pin 두 개를 할당하지 않을 경우 한 번만 St Link로 업로드 되고 더 이상 안되는 문제가 발생함❂<br> 이 때 Reset을 누르고 있는 상태에서 업로드를 시작한 다음 업데이트 되는 시점에 reset을 놓으면 업데이트가 됨
#### 2. 외부 크리스탈 설정( RCC 설정 )
> ##### `System Core`에서 RCC를 클릭한다음 외부 크리스탈을 무엇을 쓸건지 선택을 함.<br>`세라믹 레지스터`가 달려있다면 `Crystal/Ceramic Resonator`
#### 3. PWM 핀 설정
> ##### Pinout 창에서 `PA7`을 선택하고 팝업창에 `TIM3_CH2`를 선택한다.(우클릭해서)<br>
#### 4. Timmer PWM 설정
