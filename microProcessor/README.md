# 마이크로 프로세서 수업 시간내용 정리 한 곳 입니다💽
<!-- <a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2F%2FTIL&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a> -->

## 📑Contents
### 관련 용어
#### <details markdown="1"><summary>toolchain & cross tool chain</summary><p>- toolchain : 프로그램(실행파일) 개발을 하는데 필요한 개발 도구들의 모임<br>- cross-toolchain : 컴파일 해서 만든 실행코드가 컴파일한 os 가 아닌 다른 os에서 실행코드를 생성하는 컴파일러를 말함</p></details>
#### <details markdown="1"><summary>심볼</summary><p>- 심볼 : 컴파일 과정에서 아직 처리되지 않은 전역변수 & 함수 이름<br>-> 나중에 심볼이 메모리 주소로 변하게 되는데 이게 처리 되면 심볼 처리 됨 아니면 심볼 처리 안됬다고 말함<br> 심볼이 생기는 이유 : C 컴파일을 할 때 하나씩 하는데 다른 파일에 함수가 정의되어있을 수도 있어서 심볼로 미리 남겨놓는 거임 주소를 처리 하지 않고</p></details>
