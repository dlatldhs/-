# LED ON OFF 하기

## 1. 하드웨어 PIN 설정하기
![image](https://user-images.githubusercontent.com/80656700/186171668-ad28e30f-3660-4527-891a-6b0ec4a3e7f9.png)

## 2. stm32 보드 선택해서 pin 살려주기
> #### `GPIO_Output`이거 선택해서 눌러줘야됨![image](https://user-images.githubusercontent.com/80656700/186172728-1c658659-babd-4f79-b8b1-1eb948cfd2de.png)<br>참고로 led만 해볼꺼면 clock을 설정을 안해줘도 됨`System Core`에 들어가서 RCC 에서 꺼주면 됨<br>clock도 설정하고 싶으면 설정하면 됨
## 3 실습 코드
```
typedef struct led_ary{
		GPIO_TypeDef *port;
		int pin;
	} led_ary;

	led_ary led[8] = {
			{GPIOB,GPIO_PIN_1},
			{GPIOB,GPIO_PIN_15},
			{GPIOB,GPIO_PIN_14},
			{GPIOB,GPIO_PIN_10},
			{GPIOB,GPIO_PIN_4},
			{GPIOB,GPIO_PIN_5},
			{GPIOB,GPIO_PIN_3},
			{GPIOB,GPIO_PIN_13}
	};
```

```
for ( int i=0; i < 8; i++ ) {
		int random = rand() % 2;
		HAL_GPIO_WritePin(led[i].port, led[i].pin , random);
		HAL_Delay(300);
```
<a href="https://docs.zephyrproject.org/3.1.0/boards/arm/nucleo_l452re/doc/index.html">자료출처</a>
