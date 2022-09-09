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
