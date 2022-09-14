<?php
include 'conn.php'; 

	try {
	
	$adminName = $_POST['adminName'];
	$adminUsername = $_POST['adminUsername'];
	$adminPassword = $_POST['adminPassword'];
	$adminID = $_POST['adminID'];
	
	$queryResult=$connect->query("UPDATE `tbl_admin` SET `admin_name`='$adminName',`admin_username`='$adminUsername',
								`admin_password`='$adminPassword' WHERE admin_id = '$adminID'");

	$queryResultnew=$connect->query("UPDATE `tbl_useraccount` SET `username`='$adminUsername',
								`password`='$adminPassword'
								WHERE account_id = '$adminID' AND usertype = 'Admin'");


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