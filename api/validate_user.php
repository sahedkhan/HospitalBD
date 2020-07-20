 <?php
	header('Content-Type: application/json');

   include("config.php");
   include("email_send.php");

  // $row=null; 
   if($_SERVER["REQUEST_METHOD"] == "GET") {
      // username and password sent from form 
       $access_key = $_REQUEST['access_key'];
      $user_email = $_REQUEST['user_email'];
       
       
       if (!empty($access_key) || !empty($user_email)){

	    $sql = "SELECT id,name,email,phone,hospital_id FROM users WHERE email = '$user_email' AND secret_code = '$access_key' AND is_active =1 AND is_approved = 0";
		$result = $conn->query($sql);
 		if ($result->num_rows > 0) {
		    // output data of each row
 					
	    			$sql2 = "UPDATE users SET is_approved = 1 WHERE email = '$user_email' AND secret_code = '$access_key' ";
					if (mysqli_query($conn, $sql2)) {
			 		    
				    	while($row = $result->fetch_assoc()) {
					        //send email to user for confirmation

					    	$email_Send = send_mail_to_confirm_user($row["hospital_id"],$row["id"]);
					    	$data['status'] = "201";
				    		$data['msg']="success !! Confirmation email has been send to the user";
					    }
				    }
			} 
			else {
			 $data['status'] = "401";
	         $data['msg']="User already Approved or invalid";
			}
			$conn->close();

	}
	else{
	$data['status']="401";
	$data['msg']="Authentication error !!";
	}
}	
else{
	$data['status'] = "501";
	$data['msg']="method is not allowed";
}
echo json_encode($data);
		
 
?>