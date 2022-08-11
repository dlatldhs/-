# unsigned
```부호 없는 정수 타입```
### 예시로
- ##### unsigned char
- ##### unsigned int
- ##### unsigned long long int
- 이런 타입은 전부 부호가 없는 타입임

# signed
```부호가 있는 정수 타입```

## unsigned 정수의 비교
##### 1 앞의 숫자가 더 큰 경우
```
unsigned char a=3 , b=2;
if ( a < b )     // cmp a b
   ......;       // 3 - 2
```
### 산술 연산 플래그
- ##### carry flag (CF)
- ##### Over flag (OF)
- ##### 둘다 over flow 가 발새했음을 알리기 위한 플래그임
#### CF 와 OF 의 차이점
```
프로그램이 처리하는 데이터의 타입과 관계가 있음. MUL 과 DIV (곱하기 와 나누기) 같은 명령에서는 처리하는 인자가 부호가 있는 값인지 부호 없는 값인지에 따라서 다른 명령을 사용한다.
```
