<?php
include 'conn.php'; 

	try {
	
	$percentage = $_POST['percentage'];
	$fare = $_POST['fare'];
	
	$queryResult=$connect->query("UPDATE `tbl_monetization_percentage` SET `percentage_value`='$percentage' WHERE precentage_id = 1");

	$queryResult=$connect->query("UPDATE `tbl_fare_per_kilometers` SET `fare_amount`='$fare'");

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