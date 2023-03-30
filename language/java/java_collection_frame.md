### Collection Framework 란 ?
> 데이터를 쉽게 , 효과적으로 처리 할 수 있는 표준화 된 방법을 제공하는 클래쓰의 집합이다.

#### 컬렉션 프레임 워크를 사용하는 이유
> ##### 기본적으로 배열은 불변성을 띄고 있다. 배열을 활용하여 데이터의 추가 , 삭제 시 새 배열을 만든 뒤 arraycopy 등의 매서드로 배열을 복사하는 작업이 진행되어야 한다. 이러한 과정에서 메모리 공간이 낭비가 될 수 있다. 그래서 Collection Framework 를 통해서 데이터를 잘 다룰 수 있는 작업 틀을 제공한다. 프레임 워크는 배열 시 자주 구현하는 기능을 미리 만들어 놓아 시간을 절약할 수 있기 때문에 사용한다.

#### 컬렉션 프레임 워크의 이점
> - ##### 가변적인 저장 공간 제공( 배열의 크기가 부족하면 원래 크기를 x2 해서 새로운 배열을 만듬 , 시작 주소가 바뀜 -> 가변적인 저장공간을 제공함 )
> - ##### 구현된 컬렉션 클래스를 목적게 맞게 사용하면 됨
> - ##### 최적화되어 있음
> - ##### 일관된 API 사용 가능

#### 컬렉션 프레임의 구성 요소
> ##### 1. 인터페이스( 각 컬렉션을 나타내는 추상 데이터에 대한 인터페이스 List , set , map 등 )
> ##### 2. 클래스( 같은 컬렉션이라도 목적에 따라 변경 가능 ) 
> ##### 3. 알고리즘 ( 컬렉션이 제공하는 메소드 )
#### 주요 인터페이스
> 데이터를 저장하는 자료 구조에 따라 핵심이 되는 주요 인터페이스를 정의한다.
> 1. List
> 2. Set
> 3. Map
> List 와 Set은 Collection 인터페이스를 상속 받지만 map은 별도로 정의됨
> ![](https://velog.velcdn.com/images/dlatldhs/post/a449e478-b652-40eb-a733-f9007a208d06/image.png)
#### 주요 인터페이스의 특징
> ![](https://velog.velcdn.com/images/dlatldhs/post/d24d49aa-7e6a-4b93-890c-9979253826f8/image.png)

#### Collection FrameWork의 종류
> ##### List : index 순서로 요소를 저장함 , 중복된 데이터 저장할 수 있음
> ##### queue : FIFO , 선형 자료구조
> ##### Set : 순서 X , 데이터 중복 안됨 , 집합 연산( 합집합 ,교지합 등)을 지원
> ##### Map : key : value 를 한 쌍으로 데이터를 저장함 , 순서 X , key 는 중복이 될 수 없다.

#### Collection FrameWork 계층
> ![](https://velog.velcdn.com/images/dlatldhs/post/e995af43-0c4a-4289-b691-752aca3655ee/image.png) Map은 구조상으로 인하여 Collection 인터페이스를 상속 받지 않는다. 실선 화살표는 상속이고 , 점선 화살표는 구현을 의미한다. 예시로 ArrayDeque 와 LinkedList 는 Deque를 구현을 하고 있다는 것을 알 수 있다.

#### HashMap
> ![](https://velog.velcdn.com/images/dlatldhs/post/23e15e88-1f98-4c7d-a533-3e6ea71a769a/image.png) HashMap은 Map 인터페이스를 구현한 대표적인 map 컬렉션이다. Map을 상속받고 있어서 Map의 성질을 그대로 가지고 있다. 값은 중복저장되지만 키는 중복저장이 되지 않는다. 이름 그대로 hashing 을 사용하기 때문에 많은 양의 데이터 검색에 성능이 뛰어나다.
> ### 선언
> ```HashMap<Integer,String> map = new HashMap<>()``` <br>기본적으로 이런 형태로 선언할 수 있다.
> ### 메소드
```java
map.put( key , value ); // 값을 넣음
map.remove( key ) // key 에 해당하는 값을 제거
map.clear(); // 모든 값 제거
for(Integer i : map.keySet()){ // 맵의 key 를 i로 돌아가면서 값을 출력함
    System.out.println("[Key]:" + i + " [Value]:" + map.get(i)); // key를 주고 값을 받아옴
}
```

#### ArrayList
> List에서 상속 받으며 용량이 초과하면 자동으로 부족한 크기 만큼 용량이 늘어남
> 선언하는 코드
```java
ArrayList arylist = new ArrayList(); // 기본 생성 골격
arylist.add("value"); // 추가
arylist.set(index,"value2"); // index 1의 값을 value2로 변경
arylist.remove("value"); // 해당하는 값 제거 만약 값이 2개가 같다면 첫번째꺼 제거
arylist.remove(1); // 해당하는 index 제거
arylist.clear(); // 전부 삭제
arylist.size(); // arylist의 크기
```
> 값 출력하는 코드
```java
Iterator iter = arylist.iterator(); // 이터레이터(가르키는 객체)
        while(iter.hasNext()){
            System.out.print(iter.next() + " "); // 값을 출력함
        }
 ```

#### 자료 출처
> - https://hudi.blog/java-collection-framework-1/
> - http://www.tcpschool.com/java/java_collectionFramework_concept
> - https://whitewing4139.tistory.com/240?category=1286519
> - https://velog.io/@suyyeon/JAVA-Collection-Framework%EC%BB%AC%EB%A0%89%EC%85%98-%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC
> - https://www.interviewcake.com/concept/java/hash-map
> - https://crazykim2.tistory.com/558
