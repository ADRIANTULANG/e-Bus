<?php
include 'conn.php'; 

	try {
	
	$ticketID = $_POST['ticketID'];
	$conductorID = $_POST['conductorID'];
	
	
	$queryResult=$connect->query("UPDATE `tbl_transactions` 
	SET `trans_scannedBy_con_id`='$conductorID',`trans_status`='Invalid' WHERE trans_id = '$ticketID'");

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