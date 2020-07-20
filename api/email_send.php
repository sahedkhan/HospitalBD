<?php
function send_mail_to_hospital_authority($hospital_id,$user_id){
 		include("config.php");
		$sql2 = "SELECT id,name,email FROM hospital_info WHERE id='".$hospital_id."'";
		$result2 = mysqli_query($conn,$sql2);
		//$row2=mysqli_fetch_array($result2);

 		if (mysqli_num_rows($result2) > 0) {
	 		$row2 = mysqli_fetch_array($result2);
				
	 			$sql3 = "SELECT * FROM users WHERE id='".$user_id."'";
				$result3 = mysqli_query($conn,$sql3);
				$row3 = mysqli_fetch_array($result3);

				$to = $row2['email'];
          		//$to = "ruhulmus@gmail.com";

				$subject = 'New User Registered under your Hospital. Need your Approval !!';
				$from = "care@covidhospital.com";
				$user_validate_url = $base_url."api/validate_user.php";
				$hospital_name = $row2['name'];
				
 				$user_name = $row3["name"];
				$user_email = $row3["email"];
				$user_phone = $row3["phone"];
				$user_address= $row3["address"];
				$secret_code = $row3["secret_code"];
				$activation_url = $user_validate_url."?user_email=".$user_email."&access_key=".$secret_code;
				
          		$headers .= "Content-Type: text/html; charset=iso-8859-1\r\n";
          		$headers .= "From: Covid Hospital <care@covidhospital.com>\r\n";


          
				// Compose a simple HTML email message
				
          		$message = '</html><body>';
				$message .= '<h2 style="color:#000;font-size:14px;">Hi, '.$hospital_name.'</h2>';
				$message .= '<p style="color:#000;font-size:12px;">'.$user_name.', is registered under your hospital to manage your content. Please check the below information : </p>';
				$message .= '<p style="color:#000;font-size:12px;">Name : '.$user_name.'</p>';
				$message .= '<p style="color:#000;font-size:12px;">Email : '.$user_email.'</p>';
				$message .= '<p style="color:#000;font-size:12px;">Phone : '.$user_phone.'</p>';
				$message .= '<p style="color:#000;font-size:12px;">Address : '.$user_address.'</p>';
				$message .= '<p style="color:#000;font-size:12px;">Please active the user from this link <a href="'.$activation_url.'" style="color:red;font-size:13px;font-weight:bold;">Activation Link</a></p>';
				$message .= '</body></html>';
				 
          		/*
          		$message .= "Hi, ".$hospital_name. ",\r\n\r\n";
				$message .= $user_name.", is registered under your hospital to manage your content. Please check the below information : \r\n\r\n";
				$message .= "Name : ".$user_name."\r\n";
				$message .= "Email : ".$user_email."\r\n";
				$message .= "Phone : ".$user_phone."\r\n";
				$message .= "Address : ".$user_address."\r\n";
				$message .= "Please active the user from this link : ".$activation_url."\r\n";
			*/
          		//mail($to, $subject, "custom message", $headers);
          		//mail($to, $subject, $message, "nai");

 				if(mail($to, $subject, $message, $headers)){
					return "success";
				 }else{
				 	$status= "failed";
				 }
          	echo "$message";
		}
		else{
			$status= "failed";
          echo "nai";
		}
 		return $status;
}

function send_mail_to_confirm_user($hospital_id,$user_id){
 		include("config.php");
		$sql2 = "SELECT id,name,email FROM hospital_info WHERE id='".$hospital_id."'";
		$result2 = mysqli_query($conn,$sql2);
		//$row2=mysqli_fetch_array($result2);

 		if (mysqli_num_rows($result2) > 0) {
	 		$row2 = mysqli_fetch_array($result2);
				
	 			$sql3 = "SELECT * FROM users WHERE id='".$user_id."'";
				$result3 = mysqli_query($conn,$sql3);
				$row3 = mysqli_fetch_array($result3);

				$to = $row2['email'];
				$subject = "congratulation ".$row3["name"]." !! Admin approved you as a admin user.";
				$from = "admin@covdi19hospital.com";
				 
				$hospital_name = $row2['name'];
 				$user_name = $row3["name"];
				$user_email = $row3["email"];
				$user_phone = $row3["phone"];
				$user_address= $row3["address"];
				 
          		$headers .= "Content-Type: text/html; charset=iso-8859-1\r\n";
          		$headers .= "From: Covid Hospital <care@covidhospital.com>\r\n";

				 
				// Compose a simple HTML email message
				$message = '<html><body>';
				$message .= '<h2 style="color:#000;font-size:14px;">Hi, '.$user_name.' Your account is approved from '.$hospital_name.' Authority.</h2>';
				$message .= '<p style="color:#000;font-size:12px;">'.$user_name.', . Please check the below information : </p>';
				$message .= '<p style="color:#000;font-size:12px;">Name : '.$user_name.'</p>';
				$message .= '<p style="color:#000;font-size:12px;">Email : '.$user_email.'</p>';
 				$message .= '<p style="color:#000;font-size:12px;">Phone : '.$user_phone.'</p>';
				$message .= '<p style="color:#000;font-size:12px;">Address : '.$user_address.'</p>';
				$message .= '<p style="color:#000;font-size:12px;">Hospital Name : '.$hospital_name.'</p>';

				//$message .= '<p style="color:#000;font-size:12px;">Please active the user from this link <a href="'.$activation_url.'" style="color:red;font-size:13px;font-weight:bold;">Activation Link</a></p>';

				$message .= '</body></html>';
				 
				if(mail($to, $subject, $message, $headers)){
					return "success";
				 }else{
				 	$status= "failed";
				 }
		}
		else{
			$status= "failed";
		}
 		return $status;
}
?>