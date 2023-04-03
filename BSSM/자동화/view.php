<form method='post' action='view.php'>
    <?php
        // DB 연결
        // 데이터베이스 연결
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "bssm3";

        $conn = new mysqli($servername, $username, $password, $dbname);

        // 쿼리문 작성
        $sql = "SELECT did FROM device";

        // 쿼리 실행
        $result = mysqli_query($conn, $sql);

        // 콤보 박스 시작 태그 출력
        echo "<select name='device_id'>";

        // 결과값이 존재하는 동안 반복
        while ($row = mysqli_fetch_assoc($result)) {
            // 콤보 박스 옵션 태그 출력
            echo "<option value='" . $row['did'] . "'>" . $row['did'] . "</option>";
        }

        // 콤보 박스 종료 태그 출력
        echo "</select>";

        // DB 연결 종료
        mysqli_close($conn);
    ?>
    <input type="radio" name="limit" value=10 checked>10개 씩 보기
    <input type="radio" name="limit" value=20>20개 씩 보기
    <input type="radio" name="limit" value=30>30개 씩 보기

    <select name="order_type">
        <option value='desc'></option>
        <option value='asc'></option>
    </select>
    <input type='submit' value='조회하기'>
</form>
<?php

    @$device_id = $_POST['device_id'];
    @$device_limit = $_POST['limit'];
    @$order_type = $_POST['order_type'];
    if ($device_id != '' ) {
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
        $sql = "SELECT * FROM sensor where did='".$device_id."' limit ".$device_limit." order by ".$order_type."";

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
        echo "데이터가 없어요...";
        }

        // 데이터베이스 연결 종료
        $conn->close();
    }
    else {
        echo "디바이스를 선택하여 조회하여 주세용 ^^ 7";   
    }
?>