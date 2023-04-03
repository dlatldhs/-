<?php

$did = $_POST['did'];
$type = $_POST['type'];
$locate = $_POST['locate'];
date_default_timezone_set('Aisa/Seoul');
$date = date("Y-m-d H:i:s",time());

    $conn = mysqli_connect('localhost','root','','bssm3');
    $query = "insert into device values('".$did."' , '".$type."' , '".$locate."' , '".$date."');";

    $result = mysqli_query($conn,$query);

    if($result){ // 만약 $result가 true라면
    echo "입력에 성공했음"; // "입력에 성공했음" 출력
    } else { // 그렇지 않으면
    echo "입력에 실패했음"; // "입력에 실패했음" 출력
    }
?>

<meta http-equiv="refresh" content="0; url=device.php">