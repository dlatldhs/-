# python string formatting( 파이썬 문자열 포멧팅 )
## 포멧팅이란 무엇인가 ?
```코드를 더 경제적으로 사용할 수 있게 하는 방법중 하나 , 출력 되는 문자열 중 일부분만 바꾸는 방법임```
### 포멧팅 방법 3가지

#### 1. % 사용하기
```
print("%s %s python string formatting"%("This","is"))
print("my name is %s"%sion)
```
##### %d %s 같은 것들은 `문자열 포멧 코드`라고 한다.

#### 2. .format()
```
print("hi I'm {name}".format(name="sion"))
```
#### 3. f-string
```
name="sion"
print(f"Good night! {name}")
```
