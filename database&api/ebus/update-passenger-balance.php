<?php
include 'conn.php'; 

	try {
	
	$newBalance = $_POST['newBalance'];
	$passengerID = $_POST['passengerID'];
	
	
	$queryResult=$connect->query("UPDATE `tbl_passenger` SET `pas_balance`='$newBalance' WHERE pas_id = '$passengerID'");

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