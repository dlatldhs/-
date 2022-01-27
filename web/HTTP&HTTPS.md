# HTTP / HTTPS

## 정의
> HTTP 란 Hyper Text Transfer Protocol 의 약어로<br>
> `서버`와 `클라이언트`의 `데이터 교환`을 요청(Request) 응답(Response) 형식으로 정의한 Protocol이다.<br>
> 참고로 Protocol은 언어 규약 체계/언어 사용 규칙(?) 비슷하게 생각하면 됨 라고 생각하면 됨 ㅇㅇ

## 기본 매커니즘
> 기본 매커니즘은 `client`가 `server`에게 요청(Request)하면 `server`가 응답(Response)하는 것임<br>
> 웹 서버는 HTTP 서버를 HTTP 서비스 포트에 대기시킴 일반적으로 port 는 TCP/80 또는 TCP/8080이 보통임<br>
> HTTP 면 80 or 8080 인 경우가 보통

### 서비스 포트 ? 
> - 여기서 말하는 서비스 포트(Service Port) 는 네트워크 포트 중에서 특정 서비스가 점유하고 있는 포트를 말함
> - 예를 들어 HTTP 가 80 포트를 점유 중이다. --> HTTP 의 서비스 포트는 80 이 되는거임! 

### 여기서 말하는 네트워크 포트란 ?
> 네트워크에서 서버와 클라이언트가 정보를 교환하는 추상화된 장소를 의미함.<br>
> `client`가 `server`의 `port`에 `access`하여 데이터를 내려놓고, `server`가 `client`에 보낼 데이터를 실어서 돌려보내는 장면을 연상(하면 포트 기능을 이해하는데 도움이 됨)<br>
> 정리 :
> 흔이 우리가 말하는 포트(port)인데 걍 네트워크 상에서 줄여서 말한거임 

### (네트워크)포트로 데이터를 교환 하는 방식<br>
> 포트로 데이터를 전달할 때에는 `전송 계층(Transport Layer)` 방식을 따름<br>
> 대표적으로 `TCP` 와 `UDP` 가 있음<br>
> 예로 들면 TCP 로 전송하려고 하는 서비스에 UDP 클라이언트(client)가 접근(Access)가 안됨<br>
> so 서비스 포트를 표현할 때에 전송 게층도 같이 표기하는 경우가 많다.<br>
> 또 예를 들자면<br>
> HTTP 가 서비스 하고 있는 서비스 포트가 `TCP / 80` 이다. -> HTTP 를 80 포트에서 TCP 형태로 제공하고 있다 라는 뜻으로 해석 가능

## Request 와 Response 대략적인 형태

### Request
> `GET` `/index.html` `HTTP/1.1` // HTTP Method Requset URL HTTP Version<br>
> Host : ~~~ <br>
> Connection : keep-alive<br>
> User-Agent: Mozilla/5.0<br>
> 대충 이런 식으로 생김
### Response
> `HTTP/1.1` `200 OK`<br>
> Response Header<br>
> Response Body<br>
> 헤더랑 바디 부분으로 나눌 수 있음 Response 는 HTTP Version 이랑 Return status(상태)를 받음

## HTTP 메시지
> HTTP 에는 2가지가 있다. -> Request & Response<br>
> 이 둘은 기능 과 구조에서는 차이가 있지만 HTTP head / body 로 구성된다는 교집합이 존재한다.<br>
> ##### http head 의 각줄은 `CRLF`(Carriage Return Line Feed)로 구분됨<br>
> #### (head의)첫 줄은 `시작줄(Start-line)` 나머지는 `Header`라고 부름 시작줄(Start-line)은 Request 와 Response에서 큰 차이 존재
> #### header 는 `필드`(fild)와 `값`(value)으로 구성되며 HTTP 메시지 또는 바디의 속성을 나타냄

## 상태코드 STATUS CODE
##### 1xx 요청을 제대로 받았고, 처리가 진행 중임
##### 2xx 요청이 제대로 처리됨
##### > 200: 성공
##### 3xx 요청을 처리하려면, 클라이언트가 추가 동작을 취해야 함.
##### > 302: 다른 URL로 갈 것
##### 4xx 클라이언트가 잘못된 요청을 보내어 처리에 실패했습니다.
##### > 400: 요청이 문법에 맞지 않음
##### >403: 클라이언트가 리소스에 요청할 권한이 없음
##### > 404: 리소스가 없음
##### 5xx 클라이언트의 요청은 유효하지만, 서버에 에러가 발생하여 처리에 실패했습니다.
##### > 500: 요청을 처리하다가 에러가 발생함
##### > 503: 서버가 과부하로 인해 요청을 처리할 수 없음
