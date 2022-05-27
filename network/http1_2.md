### HTTP1.1 vs HTTP2.0 차이점 살펴보기

#### HTTP1.1
```클라이언트와 웹서버간 통신을 위한 프로토콜 중 하나```

##### 1. 기본적으로 연결당 하나의 요청과 응답을 처리 -> 동시전송 문제와 다수의 리소스 처리하기에 속도와 성능 이슈가 있음\
##### 2. hol(hEAD OoF lINE) bLOCKING 특정 응답지연
##### 3. RTT(Round Trip Time) 증가
##### 4. 무거운 Header 구조 라는 문제점 보유

#### HTTP2
###### 1. 성능 good
###### 2. 속도도 빠름
###### 3. Multiplexed Streams(한 커넥션(연결)에서 여러개의 메세지를 동시에 주고 받기 가능)
###### 4. Stream Prioritization(요청 리소스간의 의존관계를 설정
###### 5. Server Push(HTML 문서상에 필요한 리소스를 클라이언트 요청없이 보내기 가능)
###### 6. Header Compression(헤더 정보를 HPACK 압축방식을 이용해 압축전송을 사용) => 성능 향샹

<img src="https://miro.medium.com/max/1400/1*m3TqLQ2sXE51-6b8rNLsmA.gif" />
