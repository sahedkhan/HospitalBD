 <?php
	header('Content-Type: application/json');

   include("config.php");
   //include("get_data_by_field.php");
    
  // $row=null; 
   if($_SERVER["REQUEST_METHOD"] == "GET") {
    

   	function get_cabin_detials($hospital_id){
   		$cabin_detials = array();
		include("config.php");
		//$sql2 = "SELECT * FROM cabin_info,current_cabin_space WHERE cabin_info.id = current_cabin_space.cabin_id AND hospital_id='".$hospital_id."'";
		$sql2 = "SELECT cabin_info.id as cabin_id,cabin_type,cabin_info.normal as normal,cabin_info.special as special, cabin_info.vip as vip,cabin_info.icu as icu,current_cabin_space.normal as space_normal, current_cabin_space.special as space_special, current_cabin_space.vip as space_vip, current_cabin_space.icu as space_icu, current_cabin_space.updated_at as last_updated FROM cabin_info,current_cabin_space WHERE cabin_info.id=current_cabin_space.cabin_id AND hospital_id='".$hospital_id."' GROUP BY cabin_info.id";

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
	 		        'cabin_id'=>$row2["cabin_id"],
			        'cabin_type'=>$cabin_type,
			        'normal'=>$row2["normal"],
			        'special'=>$row2["special"],
			        'vip'=>$row2["vip"],
                    'icu'=>$row2["icu"],

			        'space_normal'=>$row2["space_normal"],
			        'space_special'=>$row2["space_special"],
			        'space_vip'=>$row2["space_vip"],
                    'space_icu'=>$row2["space_icu"],
                    'last_updated'=>$row2["last_updated"],

			        'total'=>$row2["normal"] + $row2["special"] + $row2["vip"]+ $row2["icu"],
			        'space_total'=>$row2["space_normal"] + $row2["space_special"] + $row2["space_vip"]+ $row2["space_icu"]
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