 <?php
	header('Content-Type: application/json');

   include("config.php");
   if($_SERVER["REQUEST_METHOD"] == "POST") {
       date_default_timezone_set('Asia/Dhaka');
      	$cabin_id = $_REQUEST['cabin_id'];
      	$normal = $_REQUEST['normal'];
      	$special = $_REQUEST['special'];
      	$vip = $_REQUEST['vip'];
      	$icu = $_REQUEST['icu'];
       $updated_at = date("Y-m-d ") . date("H:i");


		$sql = "SELECT * FROM cabin_info WHERE id = '$cabin_id'";
		$result = mysqli_query($conn, $sql);
		//$row = mysqli_fetch_array($result);
 		if(mysqli_num_rows($result) > 0){
			while($row = $result->fetch_assoc()) {

				$sql4 = "SELECT * FROM current_cabin_space WHERE cabin_id = '$cabin_id'";

				$result4 = mysqli_query($conn, $sql4);

				if(mysqli_num_rows($result4) > 0){
					while($row4 = $result4->fetch_assoc()) {

 						$sql2 = "UPDATE current_cabin_space SET normal = '".trim($normal)."', special = '".trim($special)."', vip = '".trim($vip)."', icu = '".trim($icu)."', updated_at = '".trim($updated_at)."' WHERE cabin_id = '$cabin_id' ";
						if (mysqli_query($conn, $sql2)) {
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
					$sql3 = "INSERT INTO current_cabin_space(normal,special,vip,cabin_id) VALUES ('".trim($normal)."','".trim($special)."','".trim($vip)."','".$cabin_id."')";	
				 	if (mysqli_query($conn, $sql3)) {
				 		    $data['status'] = "201";
					    	$data['msg']="successfully added";
					    	
						} else {
						    $data['status'] = "401";
					        $data['msg']=$conn->error;
					         
						}
							$conn->close();
						}
						
			}
		}
		else{
 			$data['status'] = "401";
			$data['msg']="Wrong cabin in";
			}
		 

	//	$sql = "UPDATE cabin_info SET cabin_type = '".$cabin_type."', normal = '".$normal."', special = '".$special."', vip = '".$vip."' WHERE id ='".$id."'";
}
	   else{
		$data['status'] = "501";
		$data['msg']="method is not allowed";
		}
	echo json_encode($data);
		
?>