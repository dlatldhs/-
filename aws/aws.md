2022-07-11 aws
react를 JS /html /css 형태로 바꿔야 띄울 수 있음 => npm run build

EC2 = 컴퓨터(가상)
클라우드 컴퓨터 같은 거
그리고 나머지도 알아서 관리해줌

Node js 하는거
JS 를 웹 브라우저 말고 다른 곳에서 사용하게 해주는거
자바스크립트를 실행하게 해주는 틀

DB 종류
- 관계형 데이터 베이스  --> mysql , mariadb
- 관계형 데이터 베이스가 아닌 것 --> mongo db( 몽고 db )
  - 읽기가 빠름

한 컴퓨터에 모든 시스템을 다 설계하면 조금 손해임
웹 서버랑 데이터 베이스 서버랑 분리하면 좋음

RDS( Relational Databese System )
1. 데이터 베이스 서버를 분리 시켜놓으면 확장을 시킬 수 있음
2. 성능 상의 이점이 있음
3. 데이터 베이스만 하는 서버

자동화 순서
cd project_file_name
git pull
pm2 stop index.js
pm2 start index.js

public access  --> yes

EC2 에 들어갈때
wsl 을 통해 들어감
1713
들어가서 mnt\c\User~~~ 들어가면 됨

CIContinuous Delivery(Deploy) : 지속적인 서비스 제공 ( 지속적인 배포 )


git code push -> CD -> EC2

프레임워크와 라이브러리의 차이점
프레임워크 : 규칙적으로 자기가 맞춰해야됨(개발을)
라이브러리 : 자유롭게 개발 가능 내가 하고 싶은대로 할 수 있음

npm 사용방법 모를때
npm 사이트 가서 사용방법 보면 됨

package.json 에 적혀있으면 걍 
npm install 하면 필요한거 다깔아줌

pm2 터미널을 종료해도 실행할 수 있게 해줌

IAM ( 자동배포 )	

pm2 실행 방법
pm2 stop index
pm2 start index --watch    <- 코드 바뀔 때마다 감지해서 껐다 킴
