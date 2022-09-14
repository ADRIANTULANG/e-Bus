<?php
include 'conn.php'; 
$result=array();
try {

$conductorID = $_POST['conductorID'];

$queryResult=$connect->query("SELECT a.trans_id,
                              a.trans_fare_amount,
                              b.p_address_name as origin, 
                              c.p_address_name as destination,
                              d.pas_name FROM `tbl_transactions` a 
                              LEFT JOIN tbl_bus_points b ON a.trans_origin_id = b.p_id 
                              LEFT JOIN tbl_bus_points c ON a.trans_destination_id = c.p_id 
                              LEFT JOIN tbl_passenger d ON a.trans_pass_id = d.pas_id 
                              WHERE a.trans_scannedBy_con_id = '$conductorID'");

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
