<?php
include 'conn.php'; 

	try {
	
	$pas_name = $_POST['pas_name'];
	$pas_username = $_POST['pas_username'];
	$pas_password = $_POST['pas_password'];

	
	$queryResult=$connect->query("INSERT INTO `tbl_passenger`
								( `pas_name`, `pas_username`, `pas_password`, `pas_balance`) 
						 VALUES ('$pas_name','$pas_username','$pas_password','0.0')");

	$last_id =$connect->insert_id;

	$queryResultnewwer=$connect->query("INSERT INTO `tbl_useraccount`
									  ( `username`, `password`, `usertype`, `account_id`) 
							   VALUES ('$pas_username','$pas_password','Passenger','$last_id')");


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