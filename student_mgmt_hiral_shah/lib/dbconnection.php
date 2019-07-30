<?php
class Connectdb{
	 
public function __construct(){
	 $conn = "";
	 /*$servername = "localhost";
	 $username = "root";
	 $password = "";
	 $dbname="schoolmanagement";*/
	 $servername = "localhost";
	 $username = "forwpffo_demo";
	 $password = "demo123";
	 $dbname="forwpffo_demo";
	 // Create connection
	$this->conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($this->conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
}
}
?>