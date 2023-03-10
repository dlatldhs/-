### using namespace std;

---

std 라는 namespace 를 사용한다는 의미. cin 이나 cout 을 사용할 때 std 라는 namespaec를 통해서 

std::cin 이렇게 해야하는데 이거 해주면 안해도 됨

### cin >> a ; cout << a << “\n”;

---

cin 은 받는거 띄어쓰기 전까지만 입력을 받음 ex⇒ hello world 하면 hello 만 받는거임 , cout은 출력하는거

### typedef <type> <name>

---

ex ) ⇒ typedef int  i; 이렇게 하면 int를 i 로 대신 사용한다는 의미

### #define <name> <value>

---

매크로 정의 ex )⇒ #define PI 3.141592 이렇게 하면 PI를 3.141592 로 정의를 하는거임

### getline()

---

한꺼번에 다 받은 거 , hello world 라고 보내면 다 받아버림 , ex⇒ getline(cin , variable);

### cout.precision(n)

---

소수점 cout으로 얼마나 나타낼건지 , cout.precision(7)을 하면 7자리 반올림 하고 6자리 나타냄.

### printf 출력형식

---

%.6lf : 7자리 꺼 반올림하고 6자리 나타냄

%02d : 정수를 2자리로 표현함 ⇒ 02

### string method

---

`+=` 이렇게 하면 문자열 더 넣을 수 있음

```cpp
string a = “hello”;
a += “world”;
```

begin() : 문자열 첫번째 문자(이터레이터) 반환

end() : 문자열 마지막 이터레이터 반환

size() : 사이즈 반환 , O(1)

insert(위치 ,문자열) : 특정 위치에 문자 삽입

erase(위치 , 크기) : 5 , 2 를 매개변수로 넣으면 5 부터 2개를 지움

pop_back() : 문자열 마지막 지움

find(문자열):  찾으면 문자열 위치 반환 , 못찾으면 string::npos 반환

substr(위치,크기) : 특정 위치에서 그 크기만큼 추출

### ASCII CODE

---

a : 97 , A : 65

### reverse()

---

거꾸로 뒤집음 , 매개변수 start 랑 end 지정 가능

```cpp
string a = "It's hard to have a sore leg";
reverse( a.begin() , a.end() );
cout << a << "\n";

// gel eros a evah ot drah s'tI 
```

### split()

---

없어서 직접 만들어야됨

```cpp
#include <bits/stdc++.h>
using namespace std;
vector<string> split(string input , string delimeter)
{
	vector<string> ret;
	long long pos;
	string token = "";
	while( ( pos = input.find(delimeter) ) != string::npos ){
		token = input.substr(0,pos);
		ret.push_back(0,pos);
		ret.erase(0,pos+delimeter.length);
	}
	ret.push_back(input);
	return ret;
}

int main()
{
	string s = "I go home!!!" , d = " ";
	vector<string> a = split(s,d);
	for ( string b , a) cout << b << "\n";

	return 0;
}
```

코드 해석 : vector 형태 string으로 input 과 delimeter 을 받는다. input은 split 할 문자열 , delimeter은 어떤 문자를 통해서 분리 할 것인지 (띄어쓰기 , 반점 등) 그 다음 3줄은 다 변수

pos 는 split할 문자열에서 분리할 문자를 찾아서 위치를 넣어준다.  ⇒ 분리할 수 있는 값이 있으면 계속 돌아감 , 그걸 받아서 token에다가 분리를 한 거를 넣음 , 그리고 토큰을 vector<string> 형태에 push 넣어줌 , 그리고 erase 로 지움 , 여기서 pos + delimeter.length 한 이유는 분리할 문자까지 다 지워버릴려고 하는거임.

### 범위기반 for 루프

```cpp
for ( range_declaration : range_expression )
		loop_statement
```

예시 코드

`for (string b : a ) cout << b << "\n";` == → a라는 문자열을 b가 돌면서 출력하는 코드

 `for(int i=0; i< a.size(); i++) cout < a[i] << "\n";` 둘이 같은거임

### atoi(s.c_str())

---

atoi(문자열.c_str())

만약 입력받은 문자열이 문자라면 0 아니라면 숫자를 반환함.

### bool

---

0 은 false , 0이 아닌 값들은 전부 true + 음수도 포함됨

### int 연산

---

실수 계산을 하게 되면 실수는 모두 버림 , 1e9 까지만 사용함 → INF(infinity) 를 기반으로 INF + INF 연산 일어날 수도 있고 , (INF + 다른 연산 | INF * 2 )일어날 때 오버플로방지 , 

### const

---

수정 불가 변수  , 보통 INF 같은 거나 방향 벡터를 나타내는 dy , dx 에 const 를 사용함

문제에서 주어진 맵의 크기가 10 * 10 이면 이럴 때 사용가능함

```cpp
const int mx = 10;
int a[mx][mx]; 
```

### 오버플로(overflow)

---

타입의 허용범위를 넘어갈 때 발생하는 에러를 뜻함

### 언더플로(underflow)

---

취급할 수 있는 결과값보다 작아지면 발생함

### long long , 8 byte 정수

---

int 보다 큼  , 1e18 정도 사용할 수 있음 이래서 아까 int 처럼 에러 안나

```cpp
typedef long long ll;
ll INF = 1e18;
```

### double , 실수 타입

---

8 byte , 소수점 15자리까지 , float는 4byte 7자리 but double이 더 정확하게 표현가능함.

### unsigned long long 8 byte 양의 정수

---

범위 큼 , 약 18경 정도

### pair 와 tuple

---

type 이나 struct는 아님 → 템플릿 클래쓰임

second  멤버 변수를 가지는 클래쓰

pair 는 두가지 담을 때 tuple 은 3가지 담을 때

```cpp
#include <bits/stdc++.h>
using namespace std;
pair<int,int> pi;
tuple<int , int , int> tl;
int a, b, c;

int main () {
	pi = { 1, 2 };
	tl = make_tuple(1,2,3);
	tie(a,b) = pi;
	cout << a << " : " << b << "\n";
	tie(a,b,c) = tl;
	cout << a << " : " << b << " : " << c << "\n";
	
	return 0;
}
```

pair 는 {a,b} 아니면 make_pair(a,b); 로 만들 수 있음

원래 값을 꺼내야하려면 pi.first , pi.second 로 꺼내야하는데 tie(a,b) 를 사용하게 되면 가능함

→ tie(a,b) = pi , tuple 은 get<0> 으로 꺼낼 수 있음

```cpp
#include<bits/stdc++.h>
using namespace std;
pair<int, int> pi;
tuple<int, int, int> ti;
int a, b, c;
int main(){
pi = {1, 2};
a = pi.first;
b = pi.second;
cout << a << " : " << b << "\n";
ti = make_tuple(1, 2, 3);
a = get<0>(ti);
b = get<1>(ti);
c = get<2>(ti);
cout << a << " : " << b << " : "<< c << "\n";
return 0;
}
// 1 : 2
// 1 : 2 : 3
```

---

### auto type

---

말 그대로 자동임 , 어려운 거 걍 이거 가져다 쓰면 됨

### 타입 변환

---

doube → int 로 바꿀려면 앞에 걍 (int) 이거 하면 됨

또한 double은 double 끼리 연산하고 int는 int끼리 연산해야됨 , 안하면 맞왜틀 됨

주의점 

```cpp
int a = (int) p * 100; // 변환 잘됨
int a = (int) 100 * p; // 변환 안됨 
```

### 메모리 와 포인터

---

### 메모리

메모리는 하나의 메모리 셀(1 byte)로 구성이 되어있음 , 그 메모리 셀들은 각자 고유의 주소를 가지고 있음. 

메모리는 언어마다 다르게 관리가 됨… 파이썬 , 자바 , 자바스크립트 는 가비지 컬렉터가 할당하고 분배하는데 c , c++ 들은 그런게 없음 대신 개발자가 메모리를 조금 더 핸들링 가능함

### 포인터

포인터는 메모리의 주소를 담는 타입이다.

`*`  애스터 리스크 라고 불림 , 어떠한 변수를 가르키고 있는 변수 , 타입명을 정확하게 맞춰야됨

```cpp
int a;
int *b = &a;

// 이게 역참조임
cout << b << "\n"; // 주소 나옴
cout << *b << "\n"; // 값 나옴
```

포인터의 크기는 실행 OS 체계의 비트마다 다름. 32bit 에서는 4byte , 64bit에서는 8byte , 타입이 달라도 포인터가 할당 받고 있는 메모리는 똑같음

```cpp
int *a;      // 8 byte
double *b;   // 8 byte
```

### array to pointer decay

배열의 이름을 주소값으로 사용할 수 있는 것 , 배열이 포인터로 부식(decay)되는 현상

T * 라는 포인터에 배열의 이름을 할당하면 배열의 크기 정보가 없어지고 첫번째 요소가 바인딩 되는 현상 , vector는 안됨 array 만 가능함

```cpp
#include<bits/stdc++.h>
using namespace std;
int a[3] = {1, 2, 3};

int main(){
int * c = a;
cout << c << "\n";
cout << &a[0] << "\n";
cout << c + 1 << "\n";
cout << &a[1] << "\n";
return 0;
}
/*
0x472010
0x472010
0x472014
0x472014
*/
```

### 프로세스 메모리 구조와 정적할당/동적할당

---

![image](https://user-images.githubusercontent.com/80656700/224330115-586dfb3e-497b-44e4-b996-39c83f3af116.png)

위에서부터 stack , heap , 데이터 영역(BSS segment , Data segment)  , 코드 영역( code segment)

**스택**

지역 변수 , 매개변수 , 함수가 저장됨 . 컴파일 시 크기가 결정됨 , 함수가 함수를 호출 하는 등의 따라 런타임시에도 크기가 변경됨 → [Dynamic]

**힙**

동적 할당할 때 사용되며 런타임 시 크기가 결정됨 → [Dynamic]

**데이터 영역**

BSS 영역 과 Data 영역으로 나뉘고 정적할당에 관한 부분 담당함 → [static]

**코드 영역**

소스 코드 들감 → [static]

************************정적 할당************************

컴파일 단계에서 메모리를 할당하는 것
