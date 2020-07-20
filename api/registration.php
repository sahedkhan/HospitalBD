 <?php
	header('Content-Type: application/json');

   include("config.php");
   include("global.php");
      include("email_send.php");

  // $row=null; 
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      
		$phone = $_REQUEST['phone'];
		$email = $_REQUEST['email'];
		$name = $_REQUEST['name'];
 		$password = $_REQUEST['password']; 
 		$address = $_REQUEST['address']; 
		$hospital_id = $_REQUEST['hospital_id']; 
      

		function generateRandomString($length)
			{
			    return substr(sha1(rand()), 0, $length);
			}

		if (!empty($email) || !empty($phone)){
				
				if (!empty($email) && checkIfUserExist('email',$email)){
						 
							$data['status']="301";
							$data['msg']="Email is exist";
						 
				}
				else if(checkIfUserExist('phone',$phone)){
					$data['status']="301";
					$data['msg']="Phone nubmer is exist";
				}
					else{
						$secret_code = generateRandomString(52);
						$sql = "INSERT INTO users (name,email,phone,password,address,hospital_id,is_active,role,is_approved,secret_code) VALUES ('".$name."','".$email."','".$phone."','".$password."','".$password."','".$hospital_id."',1,1,0,'".$secret_code."')";	
					 	if (mysqli_query($conn, $sql)) {
					 		     
					 		    $last_id = mysqli_insert_id($conn);
						        $email_Send = send_mail_to_hospital_authority($hospital_id,$last_id);
					    		$data['status'] = "201";
						    	$data['msg']="success";
						    	$data['name']=$name;
						        $data['phone']=$phone;
						        $data['email']=$email;

							} else {
							    $data['status'] = "401";
						        $data['msg']=$conn->error;
						         
							}
								$conn->close();
						}
					
				 
		}
		
	else{
		$data['status']="302";
		$data['msg']="username or Phone Required";
	}
		 
}
else{
	$data['status'] = "501";
	$data['msg']="method is not allowed";
}
	echo json_encode($data);
?>