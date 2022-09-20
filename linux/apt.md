# apt 란 무엇인가 ??

### 패키지 란
> #### 간단하게 말하면 실행할 수 있는 파일을 압축시켜놓은거임

### apt
> #### 우분투의 데비안 계열 `패키지`관리를 하는데 쓰이는 도구
> #### 쉽게 생각하면 대신 패키지를 가지고 있는 애 ?
> #### ```/etc/apt/sources.list``` 여기에 패키지들이 설치됨 하지만 모든 패키지를 담으면 손해임 사용하는것만 담아야 함.
> #### 그래서 PPA 를 사용함 ( Personal Packge Archivce ) 개인 패키지 저장소를 사용함<br>사용하는 패지키 저장소를 apt 패키지 저장소에 추가해주면 apt를 통해 패키지를 내려받을 수 있다.

### 간단한 명령어 사용법
```
$ apt --reinstall install [packge name]    // 재설치

$ apt remove [packge name]   // 패키지 삭제 근데 설정파일은 안지움
$ apt purge [packge name]    // 완전 다 지움

$ apt-cache show [packge name]      // 패키지 정보보여줌

$ apt-cache search [packge name]    // 패키지 검색함 있는지 없는지
```
