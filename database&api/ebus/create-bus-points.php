<?php
include 'conn.php'; 

	try {


	$p_address_name = $_POST['p_address_name'];
	$p_latitude = $_POST['p_latitude'];
	$p_longitude = $_POST['p_longitude'];

	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_bus_points`( `p_address_name`, `p_latitude`, `p_longitude`) 
										VALUES ('$p_address_name','$p_latitude','$p_longitude')");


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