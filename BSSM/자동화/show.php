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

// sensor 테이블에 있는 모든 값을 불러오는 SQL 쿼리문 작성
$sql = "SELECT * FROM sensor";

// 쿼리 실행
$result = $conn->query($sql);

// 결과 출력
if ($result->num_rows > 0) {
  // 출력할 데이터가 있는 경우"
  echo "<table border='1' width='500'>";
  echo "<th>id</th><th>device id</th><th>temp</th><th>humi</th><th>date</th>";
  while($row = $result->fetch_assoc()) {
    echo "<tr>";
    echo "<td>" . $row['num'] . "</td>";
    echo "<td>" . $row['did'] . "</td>";
    echo "<td>" . $row['temp'] . "</td>";
    echo "<td>" . $row['humi'] . "</td>";
    echo "<td>" . $row['date'] . "</td>";
    echo "</tr>";
  }
  echo "</table>";
} else {
  // 출력할 데이터가 없는 경우
  echo "0 results";
}

// 데이터베이스 연결 종료
$conn->close();
?>