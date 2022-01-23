# HTTP / HTTPS

## 정의
> HTTP 란 Hyper Text Transfer Protocol 의 약어로<br>
> `서버`와 `클라이언트`의 `데이터 교환`을 요청(Request) 응답(Response) 형식으로 정의한 Protocol이다.<br>
> 참고로 Protocol은 언어 규약 체계/언어 사용 규칙(?) 비슷하게 생각하면 됨 라고 생각하면 됨 ㅇㅇ

## 기본 매커니즘
> 기본 매커니즘은 `client`가 `server`에게 요청(Request)하면 `server`가 응답(Response)하는 것임<br>
> 웹 서버는 HTTP 서버를 HTTP 서비스 포트에 대기시킴 일반적으로 port 는 TCP/80 또는 TCP/8080이 보통임<br>
> HTTP 면 80 HTTPS 면 8080 인 경우가 보통

> 서비스 포트 ? 
> - 여기서 말하는 서비스 포트(Service Port) 는 네트워크 포트 중에서 특정 서비스가 점유하고 있는 포트를 말함
> - 예를 들어 HTTP 가 80 포트를 점유 중이다. --> HTTP 의 서비스 포트는 80 이 되는거임! 

> 네트워크 포트
> 네트워크에서 서버와 클라이언트가 정보를 교환하는 추상화된 장소를 의미함.<br>
> `client`가 `server`의 `port`에 `access`하여 데이터를 내려놓고, `server`가 `client`에 보낼 데이터를 실어서 돌려보내는 장면을 연상하면 포트 기능을 이해하는데 도움이 됨
> 흔이 우리가 말하는 포트(port)인데 걍 네트워크 상에서 줄여서 말한거임 

> (네트워크)포트로 데이터를 교환 하는 방식
> 포트로 데이터를 전달할 때에는 `전송 계층(Transport Layer)` 방식을 따름<br>
> 대표적으로 `TCP` 와 `UDP` 가 있음 
> - TCP<br>
> 
> - UDP
