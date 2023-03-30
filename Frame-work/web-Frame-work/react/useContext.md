## useContext 사용법( hooks )( 공부한거 정리해놓은 공간입니당 )

### 1. createContext(initValue)
```
역할
- Context 객체 생성
- return Provider , Consumer 반환
- initValue는 초기값 (Provider 사용안했을 때 )
```
### 예시
```
// app.js
import React , { createContext } from 'react';
import AppContext from "./component/AppContext";

expor const AppContext = createContext();
...
...
...
<AppContext.Provider vlaue={{ value1,setValue }}>
  <header />
  <MainContents />
</AppContext.Provider vlaue={{ value1,setValue }}>
이렇게 하면 header나 아님 Main Contents 에서 사용가능
```
```
// header.js
import React , { useContext } from 'react';
import { AppContext } from "./app";

const { value1, setValue } = useContext(AppContext);
...
...
...
<div id={value1}>
  <div></div>
</div>
```
### 2. Context.Provider
```
생성한 Context를 하위 component로 전달해주는 역할을 함
```
### 예시
```
<AppContext.Provider value={{ val , setValue }}>
</AppContext.Provider>
이렇게 넘겨줌
```
### 3. Context.Consumer
```
- Context의 변화를 감시하는 컴포넌트
- 설정한 상태를 불러올 때 사용
```

#### 참고한 사이트
- ##### https://cocoon1787.tistory.com/801
- 
