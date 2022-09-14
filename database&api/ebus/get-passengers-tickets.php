<?php
include 'conn.php'; 
$result=array();
try {
$passengerID = $_POST['passengerID'];

$queryResult=$connect->query("SELECT a.trans_id,b.p_address_name as origin,c.p_address_name as destination ,a.trans_status,a.trans_fare_amount FROM `tbl_transactions` a 
LEFT JOIN tbl_bus_points b ON a.trans_origin_id = b.p_id
LEFT JOIN tbl_bus_points c ON a.trans_destination_id = c.p_id
WHERE a.trans_pass_id = '$passengerID'");

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
