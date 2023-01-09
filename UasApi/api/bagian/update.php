<?php
header("Access-Control-Allow-Origin:*");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include "../../database/database.php";

$data = json_decode(file_get_contents("php://input"));
$id = $data->id;
$nama = $data->nama;
$luas = $data->luas;

$hasil["success"] = false;
$hasil["data"] = array();

$update_sql = "UPDATE tabel_kabupaten set nama = '$id', nama = '$nama', luas = '$luas',' WHERE id = '$id'";
$result = mysqli_query($connection,$update_sql);
if($result){
    $hasil["success"] = true;
    $hasil["data"] = $data;
}

echo json_encode($hasil);
?>