# `Cookie` 란 무엇인가? 
### 탄생 배경
    - HTTP(Hyper Text Transfer Protocol) 는 Request 와 Response 의 쌍이 독립적으로 구성되어 통신하는 Connectionless Protocol 임
    - Connectionless 속성은 하나의 요청에 하나의 응답`을 한 후 네트워크 연결을 끝 맺는 것
    - HTTP 요청마다 새로운 커넥션을 열기 때문에 사용자 인증을 계속해야됨 -> Cookie 생김!
    - 결론 : 브라우저가 `사용자의 정보`를 저장하여 갖고 있다가 `같은 서버`에 접속하여 필요할 때 마다 주는게 `쿠키`다.(Request 할 때 같이 보냄)
### 1. HTTP 프로토콜 특징

Connectionless: 하나의 요청에 하나의 응답을 한 후 연결을 종료하는 것을 의미합니다. 특정 요청에 대한 연결은 이후의 요청과 이어지지 않고 새 요청이 있을 때 마다 항상 새로운 연결을 맺음

Stateless: 통신이 끝난 후 상태 정보를 저장하지 않는 것을 의미합니다. 이전 연결에서 사용한 데이터를 다른 연결에서 요구할 수 없음..
