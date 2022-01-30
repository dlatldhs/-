## WEB Browser
기본적으로 웹은 인터넷이라는 글로벌 네트워크 위에 구현되어 정해진 프로토콜(protocol)을 기반으로 통신함<br>
서버와 HTTP 통신을 대신해주고 수신한 리소스(Resource)르 시각화하여 보여줌 + UX 제공(User eXperience)

<img src = https://media.vlpt.us/images/devegg/post/3e59600f-47be-4385-b6f7-23089a690ba6/image.png />

#### 웹 브라우저의 기본 동작
1. 웹 브라우저의 주소창에 입력된 주소(`github.com/dlatldhs/mind-palace/new/main/web`)를 해석(URL 분석)<br>
2. (`github.com/dlatldhs/mind-palace/new/main/web`)에 해당하는 주소 탐색(DNS 요청)<br>
3. HTTP를 통해 (`github.com/dlatldhs/mind-palace/new/main/web`)에 요청(Request)
4. (`github.com/dlatldhs/mind-palace/new/main/web`)의  HTTP 응답(Response) 수신
5. 리소스(Resource) 다운로드 및 웹 렌더링(HTML,CSS,JS)

#### URL 구조 복습
<img src = https://www.howdy-mj.me/static/62b0d3310d0ed1df86d08aeaa8084042/90cbd/uri-url-urn.png />
Scheme : 웹 서버와 어떤 프로토콜로 통신할지 나타냄<br>
Host,Port : Authority의 일부로, 접속할 웹 서버의 주소에 대한 정보를 가지고 있음<br>
Path : 접근할 웹 서버의 리소스 경로로 '/'로 구분됨.<br>
Query : 웹 서버에 전달하는 파라미터이며 URL에서 '?' 뒤에 위치함.<br>
Fragment : 메인 리소스에 존재하는 서브 리소스를 접근할 때 이를 식별하기 위한 정보를 담고 '#' 문자 뒤에 위치.<br>

#### Domain Name
URL 구성 요소 중 Host 는 웹 브라우저가 접속할 웹 서버의 주소 or Domain Name IpAddress의 값을 가질 수 있다.<br>
```
IP Address는 네트워크 상에서 통신이 이루어 질 때 장치를 식별하기 위해 사용되는 주소
```
##### Domain Name을 Host 값으로 이용할 때 
###### 브라우저는 DNS(Domain Name Server)에 Domain Name을 질의하고 DNS 가 응답한 IP Address를 사용함
예를 들어, 웹 브라우저에서 `http://example.com`에 접속할 경우, DNS에 질의해 얻은 `example.com`의 IP와 통신함<br>
Domain에 대한 정보는 cmd 에서 `nslookup` 명령어를 통해서 알 수 있다.<br>
$ nslookup example.com<br>
Server:		8.8.8.8<br>
Address:	8.8.8.8#53<br>
