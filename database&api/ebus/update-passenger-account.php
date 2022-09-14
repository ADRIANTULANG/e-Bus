<?php
include 'conn.php'; 

	try {
	
	$pas_name = $_POST['pas_name'];
	$pas_username = $_POST['pas_username'];
	$pas_password = $_POST['pas_password'];
	$pas_id = $_POST['pas_id'];
	
	$queryResult=$connect->query("UPDATE `tbl_passenger` SET 
								`pas_name`='$pas_name',
								`pas_username`='$pas_username',
								`pas_password`='$pas_password' 
								WHERE pas_id = '$pas_id'");

	$queryResultnew=$connect->query("UPDATE `tbl_useraccount` SET `username`='$pas_username',
								`password`='$pas_password'
								WHERE account_id = '$pas_id' AND usertype = 'Passenger'");


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