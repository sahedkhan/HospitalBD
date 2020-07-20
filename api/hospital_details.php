 <?php
	header('Content-Type: application/json');

   include("config.php");
   //include("get_data_by_field.php");
    
  // $row=null; 
   if($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $hospital_id = $_REQUEST['hospital_id']; 

   	function get_cabin_detials($hospital_id){
   		$cabin_detials = array();
		include("config.php");
		//$sql2 = "SELECT * FROM cabin_info, WHERE hospital_id='".$hospital_id."'";
		$sql2 = "SELECT cabin_info.id as cabin_id,cabin_type,cabin_info.normal as normal_cabin,cabin_info.special as special_cabin, cabin_info.vip as vip_cabin,cabin_info.icu as icu_cabin,current_cabin_space.normal as space_normal, current_cabin_space.special as space_special, current_cabin_space.vip as space_vip,current_cabin_space.icu as space_icu FROM cabin_info,current_cabin_space WHERE cabin_info.id=current_cabin_space.cabin_id AND hospital_id='".$hospital_id."' GROUP BY cabin_info.id";
		
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
	    		 
	    		$total_no_cabin = $row2["normal_cabin"]+$row2["special_cabin"]+$row2["vip_cabin"]+$row2["icu_cabin"];
	    		$total_no_space_cabin = $row2["space_normal"]+$row2["space_special"]+$row2["space_vip"]+$row2["space_icu"];
	    		$total_no_admitted_cabin = $total_no_cabin - $total_no_space_cabin;

	    		$cabin_detials[]= array(
	 		        'cabin_id'=>$row2["cabin_id"],
			        'cabin_type'=>$cabin_type,
			        'no_normal_cabin'=>$row2["normal_cabin"],
			        'no_special_cabin'=>$row2["special_cabin"],
			        'no_vip_cabin'=>$row2["vip_cabin"],
                    'no_icu_cabin'=>$row2["icu_cabin"],
			        'current_space_normal'=>$row2["space_normal"],
			        'current_space_special'=>$row2["space_special"],
			        'current_space_vip'=>$row2["space_vip"],
                    'current_space_icu'=>$row2["space_icu"],
			        'total_no_cabin'=>$total_no_cabin,
			        'total_no_space_cabin'=>$total_no_space_cabin,
			        'total_no_admitted_cabin'=>$total_no_admitted_cabin

			        
		        );
			}
		}
		else{
			$cabin_detials= "";
		}
 		return $cabin_detials;
   	}
   	
   	if (!empty($hospital_id)){
   		    $sql = "SELECT * FROM hospital_info WHERE id='".$hospital_id."' AND is_active='1'";
	//print_r(get_cabin_detials(1);
   // $sql = "SELECT hospital_info.id as id,name,type,location,email,phone,address,is_covid_treatment,cabin_info.id as cabin_id,cabin_type,cabin_info.normal as cabin_normal,cabin_info.special as cabin_special, cabin_info.vip as cabin_vip,current_cabin_space.nomral as space_normal, current_cabin_space.special as space_special, current_cabin_space.vip as current_cabin_space.vip FROM hospital_info,cabin_info,current_cabin_space WHERE hospital_info.id=cabin_info.hospital_id AND cabin_info.id=current_cabin_space.cabin_id AND hospital_info.id='".$hospital_id."' AND is_active='1'";
	
	//$sql ="SELECT hospital_info.id as id,name,type,location,email,phone,address,is_covid_treatment,cabin_info.id as cabin_id,cabin_type,cabin_info.normal as cabin_normal,cabin_info.special as cabin_special, cabin_info.vip as cabin_vip,current_cabin_space.normal as space_normal, current_cabin_space.special as space_special, current_cabin_space.vip as space_vip FROM hospital_info,cabin_info,current_cabin_space WHERE hospital_info.id=cabin_info.hospital_id AND cabin_info.id=current_cabin_space.cabin_id AND hospital_info.id='".$hospital_id."' AND is_active='1'"
	$result = mysqli_query($conn, $sql);
 
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

				    

		    	$data['hospital_detials'] = [
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
		       
  			    }
			} else {
			 $data['status'] = "401";
	         $data['msg']="failed";
			}
			$conn->close();
		}else{
			$data['status'] = "401";
	         $data['msg']="failed";
		}

}
else{
	$data['status'] = "501";
	$data['msg']="method is not allowed";
}
	echo json_encode($data);
		
 
?>