# URI


> URI가 무엇인가요?
- Uinform Resource Identifier 로 `리소스 식별자`로 해석 가능


> Web 에서 Resource
- 모든 콘텐츠 HTML , CSS , JS , PNG , 동영상 등 그 외 모든 파일을 포함한 개념임 ㅇㅇ
e.g
```
https://github.com/dlatldhs/mind-palace/edit/main/web/URI.md <- Resource
github.com/dlatldhs/mind-palace/edit/main/web 에 존재하는 URI.md 리소스에 대해 요청
```

> URL 과 URI 의 차이점
```
Uniform Resource Identifier -> 리소스 식별자
Uniform Resource Locator -> 리소스 위치
별거 없고 걍 URI 가 URL 상위개념임
```
e.g) 예를 들어 이런 주소가 있다고 치면 ```
https://github.com/dlatldhs/mind-palace/edit/main/web/URI.md```
```
https://github.com/dlatldhs/mind-palace/edit/main/web(리소스 위치) <- URL
https://github.com/dlatldhs/mind-palace/edit/main/web/URI.md(리소스 식별) <-URI
```

> URI의 구성요소<br>`HTTPS://example.com:8042/over/there?name=ferret#nose`
- Scheme(HTTPS://)
  - 웹 서버에 접속할 때 이용할 프로토콜에 대한 정보를 담고 있음
- Authority(example.com:8042)
  - Host(example.com)
    - 서버 주소에 대한 정보를 가짐
  - Port(8042)
    - 서버의 포트에 대한 정보를 가짐
  - Userinfo
    - Userinfo 
- Path(/over/there)
  - 웹 서버의 경로에 대한 정보(문자로 구분)
- Query(?name=ferret)
  - 웹 서버에 전달하는 파라미터(추가적인 정보) URI 뒤에 붙음
- Fragment(#붙은거임)
  -  메인 리소스 내에 존재하는 서브 리소스에 접근할 때 같은 이름의 리소스가 있을 수도 있어서 식별하려고 붙음
