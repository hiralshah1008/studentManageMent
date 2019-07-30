<?php
class User extends Connectdb
{
	public function __construct(){
		
		$clscon = new Connectdb();
		$this->conn = $clscon->conn;
		
		$this->setpostvars();
		$this->setgetvars();
	}
	public function setpostvars(){
		foreach($_POST as $k=>$v){
			$this->$k=$v;
		}	
	}
	public function setgetvars(){
			
	}
public function checkLogin(){
	$sql="SELECT u.* , s.profilephoto FROM user  as u LEFT JOIN students as s ON u.sid = s.id WHERE u.uname='$this->uname' AND u.password='$this->password' AND u.status='Y'";
	$res=$this->conn->query($sql);	
	$result = $this->getArray($res);
	
	$cnt=count($result);	
	if($cnt == 1){
		foreach($result[0] as $k=>$v){			
			if($k!="password"){
				
				$_SESSION[$k]=$v;
				
			}
			$_SESSION['uid']=$_SESSION['id'];
		}
		return true;
	}else{
		$val_msg="Please enter correct Username / Password !!";
		$this->SetMsg($val_msg);
	}	
}
public function getArray($result){
	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			foreach($row as $k=>$v){
			$row[$k]	= stripslashes($v);	
			}
			$records[] = $row; 
		}
		return $records;
	}
}
	function SetMsg($msg)
    {
        if($msg)
        {
            $_SESSION['msg'] = $msg;
        }
    }


    function GetMsg()
    {
		if($_SESSION['msg'])
        {
            $msg = "<h5 class = 'typo typo login-title' style='color:red'>".$_SESSION['msg']."</h5>";
            $_SESSION['msg'] = null;
			
            return $msg;
        }
    }
}
?>