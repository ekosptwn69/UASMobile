<?php
header("Access-Control-Allow-Origin:*");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include "../../database/database.php";

$select_sql = "SELECT * FROM buku";
$result = mysqli_query($connection,$select_sql);
$hasil["success"] = true;
$hasil["data"] = array();
while ($row = mysqli_fetch_assoc($result)){
    $array_berkas = array(
        "id" => $row["id"],
        "nama" => $row["nama"],
        "luas" => $row["luas"],
    );
    array_push($hasil["data"],$array_berkas);
}
echo json_encode($hasil);
?>