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

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/29b46163-0486-464d-9c2d-a843017d5c5f/Untitled.png)

**BSS Segment** : 전역 변수 , static , const 로 선언되어 있는 변수 중 

( 0으로 초기화 / 초기화가 어떤 값으로 되어 있지 않은 변수 )가 여기에 담김

예시 , 여기 나오는 변수 같은 형태가 **BSS 에 메모리가 할당되는거임**

```cpp
#include<bits/stdc++.h>
using namespace std;
int a;
int b = 0;
const int c = 0;
int main(){
	static int d;
	static int e = 0;
	
	return 0;
}
```

**Data segment** : 전역 변수 , static , const 로 선언되어 있는 변수 중

( 0이 아닌 값으로 초기화 된 변수 ) 가 이 메모리 영역에 할당됨

예시 코드

```cpp
#include<bits/stdc++.h>

using namespace std;
int a=1;
const int b = 2;
int main() {
	 static int c = 3;
	return 0;
}
```

****************************************code / text segment****************************************

프로그램의 코드가 들어감

************************동적 할당************************

런타임 단계에서 메모리를 할당받는 것 , Stack 과 heap 으로 나눠짐

**stack**

- 지역변수 , 매개변수 , 실행되는 함수에 의해 늘어나거나 줄어드는 메모리 영역
- 함수가 호출될 때마다 호출될 때의 환경 등 특정 정보가 stack에 계속 저장됨
- 재귀함수가 호출된다고 했을 때 새로운 스택 프레임이 매번 사용되기 때문에 함수내의 변수 집합이 해당 함수의 다른 인스턴스 변수를 방해하지 않음
    
    → 재귀 함수 내의 지역 변수로 선언하게 되면 해당 변수는 독립적임 , 다른 함수에 있는 변수에 영향을 끼치지 않음 
    

**heap**

- 동적으로 할당되는 변수들을 담음
- malloc() , free() 함수를 통해 관리 가능
- 동적으로 관리되는 자료구조도 heap 영역을 사용함 → vector 는 내부적으로 heap 을 씀

************************이터레이터 ( 포인터를 일반화 한 것 )************************ 

컨테이너에 저장되어 있는 요소의 주소를 가리키는 개체

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a91791ae-b1e6-497a-b512-0c3c29b5b9be/Untitled.png)

바로 주소값 반환 X , &* 을 통해 한단계 거처서 요소 주소값 반환함

예시 코드

```cpp
#include <bits/stdc++.h>
using namespace std;

vector<int> v;

int main()
{
    for ( int i=1; i <= 5; i++ ) v.push_back(i);
    for ( int i=0; i < 5; i++ ) {
        cout << i << " of element :" << *(v.begin() + i ) << "\n"; // v.begin 은 첫번째 문자를 반환함
        cout << &*(v.begin() + i ) << "\n";
    }

    for ( auto it = v.begin(); it != v.end(); it++ ) {
        cout << *it << ' ';
    }
    cout << "\n";
    for ( vector<int>::iterator it = v.begin(); it != v.end(); it++ ) {
        cout << *it << ' ';
    }
    auto it = v.begin();
    advance(it,3); // n => index
    cout << "\n";
    cout << *it << "\n";

}
```

이터레이터 함수 중 많이 사용하는 함수

begin() , end() , advance()

begin() : 컨테이너 시작 **위치** 반환

end() : 컨테이버 끝 다음의 위치 반환 , it ≠ v.end() → 컨테이너를 다 순회하고 컨테이너 끝에 도착했다는것을 의미함

advance() : 해당 iterator 를 cnt 까지 증가 시킴

**이터레이터 와 포인터의 차이**

이터레이터는 어떠한 컨테이너(배열 , 맵 등) 의 **********범위 안에서 일부 요소********** 를 가르키며 **해당 요소들을 순회할 수 있는 개체**임 , 컨테이너의 개체를 참조하는 것이기 때문에 이 자체를 제거 할 수는 없음

포인터는 변수의 메모리 주소   를 **저장하는 개체** 이며 포인터는 제거 가능함

둘의 차이점은 이터레이터는 요소를 순회하는 그런 개체라서 제거가 불가한데 , 포인터는 주소를 저장하는 개체 , 약간 변수 느낌이라서 제거가 가능함 , 이게 둘의 차이점인듯

**이터레이터 = 일반화 된 포인터**

일반화(generalization) → 공통되는 속성들을 일반적인 개념으로 추상화한 형태

이터레이터는 컨테이너의 구조 , 들어가 있는 요소 의 타입과는 상관없이 컨테이너에 저장된 데이터를 순회하는 과정을 담당함 , 각각의 다른 요소들을 쉽게 탐색할 수 있게 일반화한 장치임

### 함수

---

**fill() , memset() →** 배열을 초기화 할 때 쓰임

---

fill()  모든 값으로 초기화 할 수 있음 , 0 , 1 , 100 등 모든 숫자로 초기화 가능

memset() : -1 , 0 으로만 초기화 가능함 , -1 이나 0 으로 초기화 할 때는 fill 보다 빨라서 시간적으로 최적화 가능함

fill()

- O(n)
- fill( 시작값 , 끝값 , 초기화 하는 값 ) 으로 사용함
- 모든 값으로 초기화 가능
- [first,last)] 까지 val로 초기화함

`sort( first , last , custome_compare_function )`

`first , last 는 필수 , 3번째는 커스텀하게 비교하고 싶을 때 넣음`

- first : 배열의 첫번째 이터레이터
- last : 정렬하고 픈 배열의 마지막 다음의 이터레이터
- 범위  → [ first , last ) → first 는 포함 , last 는 포함 X
- 예시 ) 크기가 5인 ary를 정렬한다 → sort(ary[0] , ary[0] +5 ) , 마지막 원소 ary[0]+4가 아닌 그 원소의 다음 위치를 가르킴
- default 값이 오름차순
- 3번째에 greater<int>() 을 넣으면 내림차순 , less<int>() 을 넣으면 오름차순

```cpp
#include <bits/stdc++.h>
using namespace std;
vector<int> a;
int b[5];
int main(){

	for(int i = 5; i >= 1; i--) b[i - 1] = i;
	for(int i = 5; i >= 1; i--) a.push_back(i);
	
	// 오름차순
	sort(b, b + 5);
	sort(a.begin(),a.end());

	for(int i : b) cout << i << ' ';
	cout << '\n';
	for(int i : a) cout << i << ' ';
	cout << '\n';
	
	sort(b, b + 5, less<int>());
	sort(a.begin(),a.end(), less<int>());
	
	for(int i : b) cout << i << ' ';
	cout << '\n';
	for(int i : a) cout << i << ' ';
	cout << '\n';
	
	//내림차순
	sort(b, b + 5, greater<int>());
	sort(a.begin(),a.end(), greater<int>());
	
	for(int i : b) cout << i << ' ';
	cout << '\n';
	for(int i : a) cout << i << ' ';
	cout << '\n';
	
	return 0;
}
/* 
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
5 4 3 2 1
5 4 3 2 1
*/
```

### 활용  sort()

---

pair 를 기반으로 만들어진 vector의 경우 따로 설정 안하면 

first , second , third 순으로 오름차순 정렬됨

```cpp
#include<bits/stdc++.h>
using namespace std;
vector<pair<int , int >> v;
int main() {
	for ( int i = 10 ; i >= 1; i-- ) {
		v.push_back({i,10-i});
	}
	sort(v.begin(),v.end()); // 참고로 v.end()는 끝 다음의 위치를 반환함
	for ( auto it : v ) cout << it.first << " : " << it.second << "\n";
	// vector v 에 있는 Elements 들을 끄집어내서 순회한다.
	return 0;
}
/*
1: 9
2 : 8
3 : 7
4 : 6
5 : 5
6 : 4
7 : 3
8 : 2
9 : 1
10 : 0
*/
```

내림차순 정렬 → 커슽머 연산자 제작 

sort 함수에 3번째 인자는 커스텀 오퍼레이터를 넣는 인자

```cpp
#include<bits/stdc++.h>
using namespace std;
vector<pair<int,int>> v;
bool cmp(pair<int,int> a, pair<int,int> b) {
	return a.first > b.first;
}
int main() {
	for ( int i=10; i>=1 ; i-- ) {
		v.push_back({i,10-i});
	}
	sort(v.begin(),v.end(),cmp);
	for ( auto it : v ) cout << it.first << " : " << it.second << "\n";
	return 0;
}
/*
10 : 0
9 : 1
8 : 2
7 : 3
6 : 4
5 : 5
4 : 6
3 : 7
2 : 8
1 : 9
*/
```

### 참고 지식

function sum ( number 1, number2 ) 할 때 number1 과 number2가 매개변수(parameter) 이다.

sum( 4, 3) 에서 4 와 3이 인자(argument) 라고 부른다.

**unique()**

안에 돌면서 중복제거하는 거 예시 )⇒ { 1 , 1 , 2 , 2 , 3 , 3 } → uinque() → { 1 , 2 , 3 , 2 , 3 , 3 }

앞에서부터 중복 요소 제거하고 , 중복이 아닌 것들만 정렬함 , 나머지는 걍 고대로 둠

unique() 함수로 중복되지 않는 배열을 만들기 위해서는 sort() 정렬을 하고 해야됨

왜냐하면 얘는 앞에서부터 중복 검사를 하기 때문에 뒤에 같은게 있으면 제거 안해서 조금 그럼

unique() 함수는 자신이 정렬한 첫번째 이터레이터를 반환

```cpp
#include <bits/stdc++.h>
using namespace std;
int main(){
	
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	vector<int> s {4, 3, 3, 5, 1, 2, 3};
	s.erase(unique(s.begin(),s.end()),s.end()); // s.begin ~ s.end 까지 unique 정렬 시키고
	// unique() 함수는 자신이 정렬한 첫번째 이터레이터를 반환 그리고 end는 컨테이너 끝 다음의
	// 위치를 반환해서 됨
	for(int i : s) cout << i << " ";
	cout << '\n';
	vector<int> s2 {4, 3, 3, 5, 1, 2, 3};
	sort(s2.begin(), s2.end());
	s2.erase(unique(s2.begin(),s2.end()),s2.end());
	for(int i : s2) cout << i << " ";
	return 0;
}
/*
4 3 5 1 2 3
1 2 3 4 5
*/
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5b698731-9772-49cf-b676-ebdc58be1308/Untitled.png)

반드시 정렬된 배열에서 사용해야됨

예제 코드

```cpp
#include<bits/stdc++.h>
using namespace std;
typedef long long ll;
int main(){
	vector<int> a {1, 2, 3, 3, 3, 4};
	cout << lower_bound(a.begin(), a.end(), 3) - a.begin() <<
	"\n"; // 2
	cout << upper_bound(a.begin(), a.end(), 3) - a.begin() <<
	"\n"; // 5
	return 0;
	}
```

lower_bound() : 3을 찾는다면 , 3이 시작되는 최소 시작점

upper_bound() : 위와 같이 한다면 , 이를 초과하는 지점

둘다 이터레이터 즉 위치를 반환하기 때문에 어느 배열에 위치하고 있는지를 알려면 배열의 주소

자체의 원본의 주소를 빼야함

```cpp
#include<bits/stdc++.h>
using namespace std;
typedef long long ll;
int main(){
	vector<int> a {1, 2, 3, 3, 3, 4};
	cout << &*lower_bound(a.begin(), a.end(), 3)<< "\n"; // 0xd21518
	cout << &*a.begin()<< "\n"; // 0xd21510
	cout << &*(a.begin() + 1)<< "\n"; // 0xd21514
	return 0;
}
```

첫번째는 원본의 배열에서 8byte 차이남 , 그리고 세번째 줄은 원본의 배열에서 4byte 차이남

```cpp
#include<bits/stdc++.h>
using namespace std;
typedef long long ll;
vector<int> a {1, 2, 3, 3, 4, 100};
int main(){
	cout << *lower_bound(a.begin(), a.end(), 100)<< "\n";
	return 0;
}
/*
100
*/
```

이렇게 하면 요소를 출력할 수 있음
	
### cin 사용시 주의점
c++ 에서 여러 문자열을 동시에 받거나 , 혹은 정해지지 않은 입력값을 받을 때 cin 과 getline을 활용해서 입력을 많이 받는다. 이때 하다 보면 앞에 문자열 하나가 안 받아지는 그런 경우를 발견할 수가 있다. 그래서 이거 기록하기로 했다.
 
 ### 해결방법
 > 해결 방법은 cin.ignore() 를 사용하면 된다. ignore()란 간단하게 말해서 입력 버퍼를 지우는 것이다. 입력이 다음과 같이 들어온다면
5
R R R U D D 
```cpp
 int n;
 string plan;
 cin >> n;
 cin.ignore(); 
 getline(cin,plan);
```
이러한 코드를 통해서 입력을 받을 수 있다.

### ignore() 사용법
> #### 기본 형태
`istream& ignore (streamsize n = 1, int delim = EOF);
`
인자(argument) 는 2개로 첫번째 인자 n 은 <u>제거할 문자 수</u> 를 나타낸다.
두번째로는 <u>제거를 중단할 문자</u> 를 나타내며 기본값으로는 EOF 이다. 여기서 EOF 는 <u>End Of File</u> 의 약자로 말 그대로 파일의 끝을 나타낸다. 
> #### 사용예시
```cpp
cin.ignore(); // 하나만 삭제
cin.ignore(10); // 10개 삭제
cin.ignore(10,'\n'); // 10개를 삭제하는데 \n를 만나면 멈춤
cin.ignore(LLONG_MAX,'\n'); // 지울 수 있는거 다 지움 -> 실질적으로 한 줄 다 삭제 하는거
```
> #### 발생이유
cin 은 '\n' 를 처리하지 않고 입력버퍼에 남겨둔다. 그리고 getline이 실행되면 입력버퍼에서 \n을 가져와서 처리를 함. 그래서 입력 버퍼에 있는 개행문자와 겹처서 처리 에러가 나는 거임. \n을 입력 변수에 넣어버리고 입력 제대로 넣은 줄 알고 착각하고 입력을 종료 시켜서 맨 처음에 있는 문자열에 제대로 받아와지지 않는 것이 발생 이유이다.

### 비슷한 예제
> #### clear()
cin.clear() 하면 스트림이 좋지 않을 때 사용하면 스트림을 좋게 만듬

