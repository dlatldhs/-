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

### TCP 전송 제어 프로토콜(Transmission Control Protocol)
데이터 전송에 신뢰성을 더하기 위해서 데이터를 세그먼트 단위로 분할/전송 속도를 조절/데이터가 제대로 전달되지 않았을 경우 재전송을 함 + 데이터를 보내기 위해 사용하는 프로토콜(언어규약체계)
<img src = https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/TCP_CLOSE.svg/260px-TCP_CLOSE.svg.png />
인터넷에서 메세지를 보내기 위해 IP 와 같이 사용되는 프로토콜임<br>
#### [ TCP 특징 ]
###### 연결형 서비스로 가상 회선 방식을 제공한다.
###### 흐름 제어 및 혼잡 제어.
###### 높은 신뢰성을 보장한다.
###### UDP보다 속도가 느리다.
###### 전이중(Full-Duplex), 점대점(Point to Point) 방식.

## HTTP1 과 HTTP2 그리고 HTTP3 의 차이점
### 먼저 HTTP1
> 기본적으로 한 `연결`당 하나의 `요청`을 처리하도록 설계됨 -> `RTT` 증가<br>
> `RTT` 란 `패킷`이 목적지에 도달하고 나서 , 다시 출발지로 돌아오기까지 걸리는 시간 , 즉 `패킷 왕복 시간` 이라고 보면 됨<br>
> 서버로부터 파일을 가져올 때마다 TCP의 `3-way handshake` 를 계속해서 열어야 하기 때문에 `RTT`가 증가하는 단점 보유<br>
> 3웨이 핸드 셰이크( TCP 3-way HandShake ) `데이터 전송` 전 정확한 전송을 위해 `상대방 컴퓨터`와 사전에 `세션`을 수립하는 과정( 확인 하는 과정)<br>
> 1. Client(A) --> Server(B) : TCP SYN( Synchronize Sequence Numbers )<br>
> - A -> B 접속 요청 SYN 패킷 , Client 는 SYN을 보내고 SYN/ACK응답 기다리는 상태 Server 는 Client를 기다림<br>
> 2. Server(B) --> Client(A) : TCP SYN , ACK( acknowledgment )<br>
> - B는 SYN요청을 받고 A 에게 요청을 수락한다는 ACK 와 SYN flag 패킷 발송 그리고 ACK 응답을 기다림<br>
> 3. Client(A) --> Server(B) : ACK
> - A는 B에게 ACK를 보내고 이후로 연결이 이루어짐 B는 ESTABLISHED(3 way-handshaking이 완료된 후 연결된 상태)
### HTTP 단점 극복 방법
> - 이미지 스플리팅( 많은 이미지를 합친 이미지를 다운 받아서 background position에 따라서 이미지를 나눔 )
> - 코드 압축( 개행 문자 , 띄어쓰기 같은거 다 없애서 네트워크 부하를 줄임 )
> - Base64 인코딩( 64진법으로 이루어진걸로 인코딩 하는거 )

### HTTP 1.0 에서 발전한 HTTP 1.1
> TCP 연결을 매번 하는게 아니고 초기화 한 후 Keep-alive 라는 옵션으로 여러 개의 파일을 송수신할 수 있게 바뀜( 기본 옵션으로 )<br<
> 하지만 `HOL Blocking` 이라는 문제점이 해결이 안됨<br>
> `HOL BLOCKING` : Head of Line Blocking( 네트워크에서 같은 큐에 있는 패킷이 첫 번째 패킷에 의해 지연될 때 발생하는 성능 저하 현상) 간단하게 성능 저하 현상이라고 생각하면 됨<br>
> 예시로는 image.jpg 파일을 style.css data.xml 같이 다운로드 받을 때 보통은 순차적을 받지만 image.jpg가 느리게 받아진다면<br>
> 그 뒤에 있는 것들이 대기하게 되며 다운로드가 지연되는 상태가 됨

### 이 문제점을 해결한 HTTP2
> 요약하자면 HTTP 1 보다 지연 시간 응답 시간 등 전부다 처리를 HTTP 1 보다 빠르게 지원함<br>
> 멀티플렉싱, 헤더 압축 , 서버 푸시 , 요청의 우선순위

### What is 멀티 플렉싱? 
> `멀티플렉싱이란 여러 개의 스트림을 사용하여 송수신을 하는 것`<br>
> -> 특정 스트림의 패킷이 손실되어도 나머지 스트림은 잘 동작됨
> 스트림(Stream): 시간이 지남에 따라 사용할 수 있게 되는 일련의 `데이터 요소`를 가리키는 `데이터 흐름`

### 허프만 코딩 압축 알고리즘
> HTTP 1 은 크기가 큰 헤더라는 문제가 있다. 이를 HTTP 2 에서는 헤더 압축을 써서 해결한다.<br>
> 허프만 코딩 압축 알고리즘을 사용하는 HPACK 압축 형식을 가진다.<br>
> 허프만 코딩( Huffman coding ) 은 `문자열`을 `문자` 단위로 쪼개 `빈도수`를 세어 `높은 정보`는 `적은 비트` 수를 사용 ,`낮은 빈도`는 `비트 수를 많이 사용`하여 전체 데이터의 표현에 `필요한 비트양`을 줄이는 원리가 들어감

### 서버 푸시
> HTTP 1 : 서버에 요청을 해야 파일 다운로드 가능<br>
> HTTP 2 : 서버 요청 없이 바로 가져오기 

### HTTP3 
> TCP 기반이 아닌 UDP 기반으로 돌아감 , 또한 멀티플렉싱을 가지고 있으며 `초기 연결 설정 시 지연 시간 감소` 라는 대표적 특징이 있음
