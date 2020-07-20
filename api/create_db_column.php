<?php
header('Content-Type: application/json');

include("config.php");

if($_SERVER["REQUEST_METHOD"] == "GET") {

//    $sql = "ALTER TABLE cabin_info ADD icu int(11) NOT NULL";
//    $result = mysqli_query($conn, $sql);
    $sql = "INSERT INTO cabin_info (hospital_id, cabin_type, normal, special, vip, icu)
VALUES (1, 2, 40, 30, 15, 5)";

    if ($conn->query($sql) === TRUE) {
        $data['status'] = "Table MyGuests created successfully";
    } else {
        $data['status'] = "Error creating table: " . $conn->error;
    }
    $conn->close();

}
else{
    $data['status'] = "501";
    $data['msg']="method is not allowed";
}
echo json_encode($data);


