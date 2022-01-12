# `Cookie` 란 무엇인가? 
### 탄생 배경
    - HTTP(Hyper Text Transfer Protocol) 는 Request 와 Response 의 쌍이 독립적으로 구성되어 통신하는 Connectionless Protocol 임
    - Connectionless 속성은 하나의 요청에 하나의 응답`을 한 후 네트워크 연결을 끝 맺는 것
    - HTTP 요청마다 새로운 커넥션을 열기 때문에 사용자 인증을 계속해야됨 -> Cookie 생김!
    - 결론 : 브라우저가 `사용자의 정보`를 저장하여 갖고 있다가 `같은 서버`에 접속하여 필요할 때 마다 주는게 `쿠키`다.(Request 할 때 같이 보냄)
