<?php
include 'conn.php'; 
$result=array();
try {


$queryResult=$connect->query("SELECT a.trans_id,a.trans_fare_amount,a.trans_status,b.pas_name,c.p_address_name as origin ,d.p_address_name  as destination FROM `tbl_transactions` a 
                              LEFT JOIN tbl_passenger b ON a.trans_pass_id = b.pas_id 
                              LEFT JOIN tbl_bus_points c ON a.trans_origin_id = c.p_id 
                              LEFT JOIN tbl_bus_points d ON a.trans_destination_id = d.p_id;");

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
