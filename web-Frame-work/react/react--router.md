## 라우팅 ( routing )
#### - 요청한 URL 에 따라 URL에 맞는 페이지를 보여주는 것
#### - 라우팅 관련 라이브러리 많은데 , 리액트 라우터 (react router)가 가장 많이 쓰임

### react router에서 지원하는 컴포넌트( 중 가장 많이 쓰이는 것 )

#### `<BrowserRouter>`
##### HTML5를 지원하는 브라우저의 주소를 감지
#### `<HashRouter>`
##### 해시주소 `http://~~~~~~~~/#hash` 를 감지함

### 사용방법
##### 1. `<BrowserRouter>` 태그로 감싸기
##### 2. `<Routes>` 태그로 한번 더 감싸기
##### 3. `<Route path="원하는 path" element={ <MainContents /> } ></Route>` 이런 식으로 Route 사용하기

## 예시

### `App.js` or `index.js`
```
import { BrowserRouter , Routes, Route } from 'react-router-dom'; // 필수

export default function App() {
return (
    <div className="App">
      <BrowserRouter>
        <Header pwd={position} />
        <Routes>
          <Route path="/a" element={<MainContents />}></Route>
          <Route path="/a" element={<Footer />}></Route>
          <Route path="/b" element={<GucciItems />}></Route>
          <Route path="*" element={<NotFound />}></Route>
        </Routes>
      </BrowserRouter>
    </div>
    );
}
```
### 예시 화면( URL )
![image](https://user-images.githubusercontent.com/80656700/178146876-05cf3e39-e68b-44df-b86d-5f29ff72dbf1.png)
![image](https://user-images.githubusercontent.com/80656700/178146895-a5b3c87d-214c-4f97-8a06-da6a301fd75e.png)
![image](https://user-images.githubusercontent.com/80656700/178146929-bd32c7f1-73f7-4ac5-9e68-d3dcc672669e.png)
