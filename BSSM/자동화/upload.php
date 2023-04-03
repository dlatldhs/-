<?php
// 데이터베이스 연결
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bssm3";

$conn = new mysqli($servername, $username, $password, $dbname);

// 연결 확인
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// GET 방식으로 받은 값 저장
$device_id = $_GET['did'];
$temperature = $_GET['temp'];
$humidity = $_GET['humi'];
date_default_timezone_set('Aisa/Seoul');
$date = date("Y-m-d H:i:s",time());
// sensor 테이블에 있는 모든 값을 불러오는 SQL 쿼리문 작성
$sql = "SELECT * FROM device where did='".$device_id."';";

// 쿼리 실행
$result2 = $conn->query($sql);
$count = mysqli_num_rows($result2);

if ( $count == 1 ) {
  // SQL 쿼리문 작성
  $sql = "INSERT INTO sensor (did, temp, humi , date)
  VALUES ('$device_id', '$temperature', '$humidity', '$date' )";

  // 쿼리 실행
  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
} else {
  echo "Error: 등록되지 않았습니다...";
}

// 데이터베이스 연결 종료
$conn->close();
?>
