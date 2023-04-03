<h2>device 에 insert 하는거</h2>
<form method="post" action="device_process.php" name="device_info">
    디바이스 아이디<input type="text" name="did">
    센서 종류<input type="text" name="type">
    설치장소<input type="text" name="locate">
    <input type="submit" value="su">
</form>
<h2>device list</h2>
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
$sql = "SELECT * FROM device";

// 쿼리 실행
$result = $conn->query($sql);

// 결과 출력
if ($result->num_rows > 0) {
  // 출력할 데이터가 있는 경우"
  echo "<table border='1' width='500'>";
  echo "<th>device id</th><th>type</th><th>locate</th><th>date</th>";
  while($row = $result->fetch_assoc()) {
    echo "<tr>";
    echo "<td>" . $row['did'] . "</td>";
    echo "<td>" . $row['type'] . "</td>";
    echo "<td>" . $row['locate'] . "</td>";
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