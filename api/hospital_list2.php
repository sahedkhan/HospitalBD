 <?php
	header('Content-Type: application/json');

   include("config.php");
   //include("get_data_by_field.php");
    
  // $row=null; 
   if($_SERVER["REQUEST_METHOD"] == "GET") {
    

   	function get_cabin_detials($hospital_id){
   		$cabin_detials = array();
		include("config.php");
		$sql2 = "SELECT * FROM cabin_info WHERE hospital_id='".$hospital_id."'";
		$result2 = mysqli_query($conn,$sql2);
		//$row2=mysqli_fetch_array($result2);
		$j=0;
		if (mysqli_num_rows($result2) > 0) {
		while($row2 = $result2->fetch_assoc()) {

				if ($row2['cabin_type'] ==1 ){
			    	$cabin_type="Normal";
			    }
			    if ($row2['cabin_type'] ==2 ) {
					$cabin_type="Covid";
			    }
	    		 
	    		$cabin_detials[]= array(
	 		        'cabin_id'=>$row2["id"],
			        'cabin_type'=>$cabin_type,
			        'normal'=>$row2["normal"],
			        'special'=>$row2["special"],
			        'vip'=>$row2["vip"],
			        'total'=>$row2["normal"] + $row2["special"] + $row2["vip"]
			        //'hospital_id'=>$row2["hospital_id"],
		        );
			}
		}
		else{
			$cabin_detials= "";
		}
 		return $cabin_detials;
   	}
   	
//print_r(get_cabin_detials(1);
    $sql = "SELECT * FROM hospital_info WHERE is_active='1' ORDER BY id ASC";
	$result = mysqli_query($conn, $sql);

		$i=0;
		if (mysqli_num_rows($result) > 0) {
		    // output data of each row
		    $data['status'] = "201";
	    	$data['msg']="success";
		    while($row = $result->fetch_assoc()) {

					if ($row['type'] ==1 ){
				    	$hospital_type="Govt";
				    }
				    if ($row['type'] ==2 ) {
						$hospital_type="Private";
				    }
			    	$data['hospital_list'][] = [
		 		        'id'=>$row["id"],
				        'name'=>$row["name"],
				        'type'=>$row["type"],
				        'hospital_type'=>$hospital_type,
				        'location'=>$row["location"],
				        'email'=>$row["email"],
				        'phone'=>$row["phone"],
				        'address'=>$row["address"],
				        'is_covid_treatment'=>$row["is_covid_treatment"],
				       'cabin_detials'=>get_cabin_detials($row["id"])
			        ];
			        $i++;
  			    }
			} else {
			 $data['status'] = "401";
	         $data['msg']="failed";
			}
			$conn->close();

}
else{
	$data['status'] = "501";
	$data['msg']="method is not allowed";
}
	echo json_encode($data);
		
 
?>