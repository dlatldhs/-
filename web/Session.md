## 세션(Session)
클라이언트가 인증 정보를 변조할 수도 있기에 변조 못하게 하려고 세션을 사용함.<br>
세션은 인증 정보를 서버에 저장하고 해당 데이터에 접근할 수 있는 키(유추할 수 없는 랜덤한 문자열)을 만들어서 클라이언트한테 줌<br>
위에 나온 키를 `Session ID` 라고 일반적을 부름 브라우저는 해당 키를 쿠키에 저장하고 이후에 HTTP 요청을 보낼 때 그 Key로 정보에 접근 가능한거임

### 쿠키와의 차이점
쿠키 =  `데이터 자체`를 사용자가 저장<br>
세션 = 서버가 저장