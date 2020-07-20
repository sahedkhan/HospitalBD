<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_hospital";
$base_url = "http://192.168.64.2/covid-hospital/";
//$base_url = "http://help4helpless.org/covid-hospital/";



// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>