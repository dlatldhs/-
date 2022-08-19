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
> ##### `System Core` 에서 `Timers`를 선택하고 TIM을 선택 > 채널2를 `PWM Geberatuib CH2`로 선택한다.<br>이렇게 설정을 해주면 그 네모판 stm32에서 선택됬다고 초록색 불이 들어오면 성공이다.(PA7 PWM핀 설정한거임)
#### 5. 클럭 설정해야할 거
> ##### ![image](https://user-images.githubusercontent.com/80656700/185403772-672a57bf-dca7-463f-9b01-973d1e97c50c.png)<br>`Prescaler` 하고 `Period`가 중요함
> . 이거 하기 전에 MCU 클럭 설정을 해야함.
#### 5-5. MCU 클럭 설정
> ##### ![image](https://user-images.githubusercontent.com/80656700/185637352-4e452453-026d-45c6-912a-a7c88543d231.png)<br> 여기 HCLK 라고 하는 곳에다가 `72`를 설정 해줘야함. 근데 잘 보면 Prescaler 하고 Period 가 있어서 이 둘의 의미와 사용방법을 알면 원하는 방식으로 바꿀 수 있음. ( 만약 값이 제대로 나오지 않는다면 System Core > RCC >High speed Clock(HSE)보기 )
#### PWM 클럭 설정
> ##### 이 과정이 끝나면 PWM 클럭을 설정해주면 됨<![image](https://user-images.githubusercontent.com/80656700/185646189-a71c9cd6-7409-4040-83ac-75b393a35d87.png) 이 사진에서는 timer3에서 설정하고 있는데 자기가 설정한 timer로 하면 될듯 근데 보통 다 timer3하는듯 그리고 사진에서는 71이라고 되있음 근데 가독성을 위해서 `72-1` 이렇게 표현을 해줘도 좋음

#### 실습
```
int main(void)
{
  /* USER CODE BEGIN 1 */
	uint16_t value = 0;   // 추가한 것 PWM Duty 값
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM3_Init();               // 여기서 PWM 기본적인 설정이 다 되어 있다.
  /* USER CODE BEGIN 2 */
  HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2); // 추가한 것 PWM Start timer3의 채널 2
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
  	htim3.Instance->CCR2 = value;  // duty 변경
  	HAL_Delay(10);                 // 10ms 대기
  	value++;
  	if(value > 999)                // 최대치까지 갔으면 다시 0으로 시작
  		value = 0;
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}
```
가져온건데 이거 되는거 보려면 `오실로 스코프`가 필요함.

#### Prescaler & Period
> ##### Prescaler
> ##### - 속도를 느리게 해주는 것 | 클럭을 나눠줌
> ##### Period
> ##### - 주기를 정하는데 사용됨 ( Counter Period , Prescaler 이거 둘다 0부터 시작함 그래서 나중에 STM32에서 설정할 때 -1 을 해줘야함)
> ##### timer Clock 설정할 때 등장함 예시를 들자면 84MHz로 설정을 하게 되면 | Prescaler : 84 -1 | Period : 1000-1 

<a href="https://dkeemin.com/stm32f0xx-pwm-%EC%84%A4%EC%A0%95-%EB%B6%80%EB%A1%9D-%EC%84%A4%EB%AA%85/">자료 출처</a><br>
<a href="https://m.blog.naver.com/chandong83/221900888917">자료 출처2</a>
