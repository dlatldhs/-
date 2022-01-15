# Encoding  과 Encryption

> Encoding 이란?
> - 정보 형태를 표준화,보안 등의 목적으로 다른 형태/형식 으로 변환/처리/처리방식을 뜻함
<br>

> Decoding
> - Encoding으로 변환된 형태를 원래 형태로 변환하는 것
<br>

> Encoding  과 Encryption의 차이점?<br>
> - Encoding - 알고리즘 모두 공개됨 key 와 같은 요소 X -> 원래 정보만 있다면 복원 가능!<br>
> - Encryption - 양방향 암호 알고리즘 key(유요한)가 없다면 복구 불가

> HTML Entity Encoding
> - HTML 문자열들이 태그로 인식 안되게 하려고 사용함<br>
> 입력된 문자를 Ascil Table에서 HEx(16진수) rkqt dkvdp &#x를 붙이거나 Entity name 사용<br>
> 여기서 Entity name 이란<br>ex) & = amp  amp 같은 name을 뜻함<br>
> & = &amp = &#x26<br>
> ? -> %3F        &->%26        #->%23        =->%3D
