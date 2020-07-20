 <?php
	header('Content-Type: application/json');

   include("config.php");
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      	$hospital_id = $_REQUEST['hospital_id'];
      	$cabin_type = $_REQUEST['cabin_type'];
      	$normal = $_REQUEST['normal'];
      	$special = $_REQUEST['special'];
      	$vip = $_REQUEST['vip'];
      	$icu = $_REQUEST['icu'];


		$sql = "SELECT * FROM cabin_info WHERE hospital_id = '$hospital_id' AND cabin_type = '$cabin_type'";
		$result = mysqli_query($conn, $sql);
		//$row = mysqli_fetch_array($result);
		
		if(mysqli_num_rows($result) > 0){
			while($row = $result->fetch_assoc()) {
				$sql = "UPDATE cabin_info SET normal = '".$normal."', special = '".$special."', vip = '".$vip."', icu = '".$icu."' WHERE hospital_id = '$hospital_id' AND cabin_type = '$cabin_type'";
				if (mysqli_query($conn, $sql)) {
	 		    $data['status'] = "201";
		    	$data['msg']="successfully updated";
				} else {
				    $data['status'] = "401";
			         $data['msg']=$conn->error;
			          
				}
				$conn->close();
			}
		}
		else{
 			$sql = "INSERT INTO cabin_info (normal,special,vip,hospital_id,cabin_type) VALUES ('".$normal."','".$special."','".$vip."','".$hospital_id."','".$cabin_type."')";	
		 	if (mysqli_query($conn, $sql)) {
		 		    $data['status'] = "201";
			    	$data['msg']="successfully added";
			    	
				} else {
				    $data['status'] = "401";
			        $data['msg']=$conn->error;
			         
				}
					$conn->close();
			}
		 

	//	$sql = "UPDATE cabin_info SET cabin_type = '".$cabin_type."', normal = '".$normal."', special = '".$special."', vip = '".$vip."' WHERE id ='".$id."'";
}
	   else{
		$data['status'] = "501";
		$data['msg']="method is not allowed";
		}
	echo json_encode($data);
		
?>