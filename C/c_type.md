# 타입
## 1. char
> ``` 1 byte의 정수를 저장하는 타입```
> ```
> int main()
> {
>   char ch = 250;
>   printf("%d\n", ch);
> }
> 결과값 : -6
## 결과값이 -6으로 나오는 이유
### 250을 비트로 바꾸면<br>![image](https://user-images.githubusercontent.com/80656700/183676417-24d0dc84-bb88-4a60-8357-0fc80d95f10e.png)<br>⭐위에 있는 그림 해석⭐<br> 1. MSB(Most Sinificant Bit)최상위 비트가 0인지 1인지 판단 => `MSB`가 0이면 음수 1이면 양수로 판단함<br>2. 양수면 바로 2진수를 10진수로 변환하여 구하면 됨<br>3. 음수면 2의 보수를 이용하여 절대값을 추출하여 구함(양수로 만들어주는거임)<br>4. 1의 보수를 만듬<br>![image](https://user-images.githubusercontent.com/80656700/183679369-65b6229f-3e33-48cb-b2bf-13413fb10383.png) <br>이렇게 만들어 진거에 1을 더함 <br>![image](https://user-images.githubusercontent.com/80656700/183679056-94fd8dc8-d65a-40ed-a7b0-4f53111336f5.png)<br>5. 최종값 6에 (-1)^s 를 곱함 이 s는 부호비트 즉 MSB를 의미함 1의 보수 말고 MSB가 1이였으니까 -1 * 6 을 하면 됨<br> 그래서 -6 이 나오는거임        
