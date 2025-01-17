let submit = document.getElementById('submitButton');
submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

function showImage() {
    let newImage = document.getElementById('image-show').lastElementChild;
    newImage.style.visibility = "visible";
    
    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}


function loadFile(input) {
    let file = input.files[0];

    // 이름 넣는거
    let name = document.getElementById('fileName');
    name.textContent = file.name;

    let newImage = document.createElement("img");  // img bulid 
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);   // img src file

    // newImage.style.width = "70%";
    // newImage.style.height = "70%";
    // newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
    // newImage.style.objectFit = "contain";
    
    let imgsrc = newImage.src;
    document.getElementById('imgsrc').value = imgsrc;

    let container = document.getElementById('image-show');
    container.appendChild(newImage);
};