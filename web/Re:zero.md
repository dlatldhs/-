# Re quest & sponse

## 개념
> Request
> - Request 란 클라이언트가 서버에 대한 요청이다.(통신을 위해선 서로 이해간으한 데이터 구조여야됨)

> Response
> - Response 는 사용자의 요청에 대한 서버의 응답이다.

## method 종류
> `Options` 
> - 리소스가 허용하는 메소드 목록을 반환
> EX) /login 페이지가 Options , Get , POST 만 허용하는 경우 -> Options , Get , POST 반환

> `Head`
> - GET과 동일 하지만 Response의 body 부분X(안받음) header만 받음
> EX) 서버의 상태확인
