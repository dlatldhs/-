# cache memory
> ```주기억장치에서 자주 사용하는 프로그램과 데이터 혹은 우선순위순 저장해두어 속도를 빠르게 하는 메모리```
> main memory 에서 cache 로 저장된 데이터를 옮기는 것을 매핑(mapping) 혹은 사상이라고 함
> 매핑은 종류가 3가지임
> `직접 매핑(Direct Mapping)` | `연관 매핑(Associate Mapping)` | `집합 연관 매핑(Set Associate Mapping)`

## 왜 존재하는가?
> cpu와 main memory 가 속도 차이가 너무 많이 나서 이 속도 차이를 줄이고 싶어서 만들게 됨
> 속도로는
> CPU > register > cache > ram > rom
> 이렇게 됨
> 이 cpu 하고 ram 하고 차이를 줄이고 싶어서 만들게 된거임
> 정확한 뜻 : `속도가 빠른 장치와 느린 장치간의 속도 차에 따른 병목현상을 줄이기 위한 범용 메모리`
