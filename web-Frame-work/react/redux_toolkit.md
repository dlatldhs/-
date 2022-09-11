# 1. redux가 뭘까
> ### redux 사용 이유
> #### ```기본적으로 react에서 app.js로 상태를 관리함. 그리고 데이터를 넘길 때에는 부모 컴포넌트에서 모든 걸 관리해서 조금 불편함(유지보수도 힘들어짐)```
> #### 예시<br>![image](https://user-images.githubusercontent.com/80656700/189360726-77089f72-d92a-49fc-a1ae-01308a74756d.png)&#9;&#9;![image](https://user-images.githubusercontent.com/80656700/189360652-ea5988fa-362b-417c-ad5b-74fd452bb738.png)<br>예시를 보면 매우 불편하게 설계 되어있어서 불편함. 근데 이제 redux를 사용하면 이거를 그냥 한방에 해결한다.
> ### redux 하는 역할 ?
> #### 얘는 이제 밖에서 따로 관리를 할 수 있게 해줌 약간 은행같은 역할 <br>![image](https://user-images.githubusercontent.com/80656700/189363365-082d80bf-430f-476a-bda9-31ee85574f70.png) 기본적으로 구조가 이렇게 됨.<br>`component -> dispatch(action,state) -> redux store -> reducer -> state -> update( component )`<br> action : 액션 객체 , state : 현재 상태
> ### 예제 코드
> #### index.js
> ```
> /// index.js
> import { StrictMode } from "react";
> import { createRoot } from "react-dom/client";
> import { Provider } from "react-redux";
> import { createStore } from "redux";
> 
> const rooElement = document.getElementById("root");
> const root = createRoot(rootElement);
> const initValue = 100; // 아무것도 없을 때 초기값
> 
> function reducer( state = initValue, action ) { // dispatch
>   if ( action.type === "case1" ) return ++state; // 더하고 반환
>   else if ( action.type === "case2" ) return --state; // 빼고 반환
>   else return state;  // 걍 반환
> }
> 
> let store = createStore(reducer);
> .
> root.render(
>   <StrictMode>
>     <Provider store={store}>
>       <App />
>     </Provider>
>   </StrictMode>
> );
> // action -> reducer -> store -> ui -> action
> ```
> #### App.js
> ```
> import { useSelector , useDispatch } from "react-redux"; // reducer 꺼내올 때 useSelect를 사용함
> .
> export default function App() {
>   const value = useSelector( (state) -> state );  // 훅 형식으로
>   const dispatch = useDispatch(); // 훅
>   return (
>     <div>
>       <h1> { value } </h1>
>       <button onClick={ () => { dispatch( { type: "case1" } ) } }> + </button>
>       <button onClick={ () => { dispatch( { type: "case2" } ) } }> - </button>  
>     </div>
>   );
> }
> // component 에서 store한테 요청을 해야함 ( dispatch )
> ```

## 2. redux-toolkit
### 사용이유
> #### redux를 아무것도 없이 하면 actionType 정의 -> action 함수 정의 -> reducer 정의 이거를 해야함 => 너무많은 코드가 생성됨. 그래서 `redux-actions`( 코드 많아서 ) , `immer`( 불변성 원칙 ) , `reselect`( store 값 불필요 리렌더링 막고 핸들링 ) , `thunk` or `saga` ( 비동기 ) 위 4개 정도의 라이브러리를 사용함 근데 redux-toolkit은 redux가 공식적으로 만든거임. saga를 제외한 위 기능을 모두 지원함. TS도 지원함
### 지원하는 기능( redux-toolkit이 )
- #### 1. redux-action
- #### 2. reselect
- #### 3. immer( 안에 produce )
- #### 4. redux-thunk
- #### 5. Flux Standard Action 강제화
- #### 6. Type Definition ( TS )
### 1. redux-action
```
// createAction 사용
const increment = createAction("INCREMENT");
const decrement = createAction("DECREMENT");

function counter( state = 0, action ) {
  switch ( action.type ) {
    case increment.type:
      return ++state;
    case decrement.type:
      return --state;
    default:
      return state;
  }
}

const store = configureStore ( { reducer: counter } );
document.getElementById("increment").addEventListener("click",()=> {
  store.dispatch(increment());
});
```
### 2. createSlice
#### 이거 사용하면 createAction을 통해 자동으로 액션 타입을 정의하지 않아도 만들 수 있음
```
const name = "todo";
type stateType = {
  title: { name: string; content: number };
};

const initialState: stateType = {
  title: { name: "ttttt", content: 0 },
};

export const todoSlice = createSlice({
  name,
  initialState,
  reducers: {
    setTitle: (
      state,
      action: PayloadAction<{ name: string; content: string }>
    ) => {
      state.title.name = action.payload.name;
    },
  },
  extraReducers: {},
});
export const { setTitle } = todoSlice.actions;

export default todoSlice.reducer;

// 사용할 컴포넌트
export function Counter() {
  const dispatch = useDispatch();
  return (
    <button onClick={() => dispatch(setTitle({ name: 'hi' }, content: 'con' }))}>
      setTitle
    </button>
  );
}
예제 코드 출처 : https://kyounghwan01.github.io/blog/React/redux/redux-toolkit/#createslice
```
<a href="https://kyounghwan01.github.io/blog/React/redux/redux-toolkit/#redux-action">참고자료</a>
<a href="https://velopert.com/3528">참고자료2</a>
