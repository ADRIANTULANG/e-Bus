<?php
include 'conn.php'; 
$result=array();
try {
$accountID = $_POST['accountID'];

$queryResult=$connect->query("SELECT * FROM `tbl_conductor` a WHERE a.con_id = '$accountID'");

while($fetchData=$queryResult->fetch_assoc()){
$result[]=$fetchData;
}
$data = array(

	'success' => true, 'data'=> $result, 'message' => 'Success'

);
} catch (Exception $e) {
	$data = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($data);
?>
