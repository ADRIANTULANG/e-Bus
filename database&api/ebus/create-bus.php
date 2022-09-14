<?php
include 'conn.php'; 

	try {


	$bus_plate_number = $_POST['bus_plate_number'];
	$bus_driver_id = $_POST['bus_driver_id'];

	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_bus`( `bus_plate_number`, `bus_driver_id`) VALUES ('$bus_plate_number','$bus_driver_id')");


	$data = array(
	
		'success' => true, 'message' => 'Success'
	
	);
	} catch (Exception $e) {
		$data = array(
	
			'success' => false, 'message' => 'Error. Please try again. ' . $e
	
		);
	}
	echo json_encode($data);
?>