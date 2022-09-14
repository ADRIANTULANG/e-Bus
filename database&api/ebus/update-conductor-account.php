<?php
include 'conn.php'; 

	try {
	
	$con_name = $_POST['con_name'];
	$con_username = $_POST['con_username'];
	$con_pass = $_POST['con_pass'];
	$con_id = $_POST['con_id'];
	
	$queryResult=$connect->query("UPDATE `tbl_conductor` SET 
										`con_name`='$con_name',
										`con_username`='$con_username',
										`con_pass`='$con_pass' WHERE con_id = '$con_id'");

	$queryResultnew=$connect->query("UPDATE `tbl_useraccount` SET `username`='$con_username',
								`password`='$con_pass'
								WHERE account_id = '$con_id' AND usertype = 'Conductor'");


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