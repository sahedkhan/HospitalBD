<?php
session_start(); // this must be first line
header('Content-Type: application/json');

include("config.php");

// $row=null;
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // username and password sent from form

    $email = $_POST['email'];
    $password = $_POST['password'];


    $sql = "SELECT * FROM users WHERE email = '$email' and password = '$password' and is_active = 1 and is_approved = 1";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        $data['status'] = "201";
        $data['msg'] = "success";
        $name = '';
        $hospital_id = '';
        $role = 1;
        while ($row = $result->fetch_assoc()) {
            $name = $row["name"];
            $hospital_id = $row["hospital_id"];
            $data['name'] = $row["name"];
            $data['user_id'] = $row["id"];
            $data['phone'] = $row["phone"];
            $data['email'] = $row["email"];
            $data['role'] = $row["role"];
            $role = $row["role"];

        }

        $_SESSION['User']['login'] = 'loggedIn';
        $_SESSION['User']['email'] = $email;
        $_SESSION['User']['name'] = $name;
        $_SESSION['User']['hospital_id'] = $hospital_id;
        $_SESSION['User']['role'] = $role;
    } else {
        $data['status'] = "401";
        $data['msg'] = "email or password is invalid";
    }
    $conn->close();

} else {
    $data['status'] = "501";
    $data['msg'] = "method is not allowed";
}
echo json_encode($data);


?>