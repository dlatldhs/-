## API 개념
`front-end` 와 `back-end` 가 서로 주고 받을 때 `front-end` 가 `Request` 할 때 어떠한 `규칙`에 맞게 끔 요청을 해야함<br>
-> 이게 `API` 임`(Application Programing Interface)`
`front-end` 만 만들고 `OPEN API` 쓰는 걸 `Serverless`라고 부르기도 함
#### API 가이드

###### Request 
1. 주소
2. 전송 방식
3. 보낼 것(Request 할 때 요청해야할 것들)
###### REsponse
1. 형식(JSON ,xml 등등)
2. 응답 의미 설명(어떤 것이 포함되어 있는지)

##### JSON(JavaScript Object Notation)객체 문법으로 구조화 된 데이터
###### JSON Key 와 value 로 이루어진 자료구조 = Object(객체) = {key1:value1,key2:value2}
 
###### JSON 접근방법
```
data = {"number":1,"운동":['농구','축구'],"음식":{"한식":"김밥","중식":"짜장면"}}
data.number  		        result => 1
data.운동[1]  	  	        result =>"축구"
data.음식.중식  	        result => 짜장면
```
