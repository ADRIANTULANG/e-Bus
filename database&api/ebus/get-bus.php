<?php
include 'conn.php'; 
$result=array();
try {
    
$queryResult=$connect->query("SELECT a.*,b.driver_name FROM `tbl_bus` a LEFT JOIN tbl_driver b ON a.bus_driver_id = b.driver_id");

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
