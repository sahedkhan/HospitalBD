 <?php
	header('Content-Type: application/json');

   include("config.php");
 
   if($_SERVER["REQUEST_METHOD"] == "GET") {
   	
     $sql = "SELECT DISTINCT(location) FROM hospital_info WHERE is_active='1' ORDER BY location ASC";
	$result = mysqli_query($conn, $sql);
		 
		if (mysqli_num_rows($result) > 0) {
		    // output data of each row
		    $data['status'] = "201";
	    	$data['msg']="success";
		    while($row = $result->fetch_assoc()) {
 		 
		    	$data['location_list'][] = [
	 		        
			        'location'=>$row["location"],
		        ];
		         
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