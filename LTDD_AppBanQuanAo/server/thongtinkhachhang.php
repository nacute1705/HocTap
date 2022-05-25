<?php
 include "connect.php";
 $TenKH=$_POST['TenKH'];
 $Sdt=$_POST['Sdt'];
 $Email=$_POST['Email'];
 $Diachigiaohang=$_POST['Diachigiaohang'];
 if(strlen($TenKH)>0 &&strlen($Sdt)>0 &&strlen($Email)>0 )
 {
    $query="INSERT INTO donhang(Id,TenKH,Sdt,Email,Diachigiaohang) VALUES (null,'$TenKH','$Sdt','$Email','$Diachigiaohang')";
    if(mysqli_query ($conn,$query))
    {
        $iddonhang=$conn->insert_id;
        echo $iddonhang;

    }else
    {
        echo"Thất bại";
    }
 }else
 {
    echo "Bạn hãy kiểm tra lại dữ liệu";
 }

?>