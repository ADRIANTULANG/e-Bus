<?php
include 'conn.php'; 

	try {


	$drivername = $_POST['drivername'];


	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_driver`( `driver_name`) VALUES ('$drivername')");


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