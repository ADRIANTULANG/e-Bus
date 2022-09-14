<?php
include 'conn.php'; 

	try {


	$con_name = $_POST['con_name'];
	$con_username = $_POST['con_username'];
	$con_pass = $_POST['con_pass'];
	$con_bus_id = $_POST['con_bus_id'];

	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_conductor`( `con_name`, `con_username`, `con_pass`, `con_bus_id`) 
									VALUES ('$con_name','$con_username','$con_pass','$con_bus_id')");
	
	$last_id =$connect->insert_id;

	$queryResultnewwer=$connect->query("INSERT INTO `tbl_useraccount`( `username`, `password`, `usertype`, `account_id`)
															 VALUES ('$con_username','$con_pass','Conductor','$last_id')");
	

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