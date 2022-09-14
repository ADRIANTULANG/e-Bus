<?php
include 'conn.php'; 

	try {


	$trans_scannedBy_con_id = $_POST['trans_scannedBy_con_id'];
	$trans_origin_id = $_POST['trans_origin_id'];
	$trans_destination_id = $_POST['trans_destination_id'];
	$trans_fare_amount = $_POST['trans_fare_amount'];
	$trans_date_created = $_POST['trans_date_created'];
	$trans_pass_id = $_POST['trans_pass_id'];
	$trans_status = $_POST['trans_status'];
	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_transactions`( `trans_pass_id`, `trans_scannedBy_con_id`, `trans_origin_id`, `trans_destination_id`, `trans_fare_amount`, `trans_date_created`, `trans_status`)
									 VALUES ('$trans_pass_id','$trans_scannedBy_con_id','$trans_origin_id','$trans_destination_id','$trans_fare_amount','$trans_date_created','$trans_status')");


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