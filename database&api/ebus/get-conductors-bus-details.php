<?php
include 'conn.php'; 
$result=array();
try {
$conductorID = $_POST['conductorID'];

$queryResult=$connect->query("SELECT b.bus_plate_number as busplatenumber, c.driver_name as driver,a.con_name as conductor 
                              FROM tbl_conductor a 
                              LEFT JOIN tbl_bus b ON a.con_bus_id = b.bus_id 
                              LEFT JOIN tbl_driver c ON b.bus_driver_id = c.driver_id 
                              where a.con_id = '$conductorID'");

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
