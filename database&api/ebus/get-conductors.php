<?php
include 'conn.php'; 
$result=array();
try {
    
$queryResult=$connect->query("SELECT a.*,c.bus_plate_number FROM `tbl_conductor` a 
LEFT JOIN tbl_bus c ON a.con_bus_id = c.bus_id");

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
