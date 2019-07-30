	<?php
	class Topic extends Connectdb
	{		
	public function __construct(){
		
		//$clscon = new Connectdb();
		//$this->conn = $clscon->conn;
		parent::__construct();
		$this->setpostvars();
		$this->setgetvars();
	}

	public function setpostvars(){
		foreach($_POST as $k=>$v){
			$this->$k=$v;
		}	
	}
	public function setgetvars(){
		if(isset($_GET['id']) && $_GET['id']!= NULL){
			$this->id = $_GET['id'];
		}
	}
	public function getallTopics(){
		$sql="select * from topics WHERE status != 'D' ";
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);
		return $result;
	}
	public function save(){
		if(isset($this->id) && $this->id!=""){
			$this->update();
		}else{
			$this->insert();
		}
		return true;
	}
	public function insert(){
		$ins_sql="insert into topics 
		(title,description,grade,status,date_added) 
		VALUES 
		('".mysqli_real_escape_string($this->conn,$this->title)."','".mysqli_real_escape_string($this->conn,$this->description)."','$this->grade','$this->status','".date('Y-m-d H:i:s')."')";
		
		$this->conn->query($ins_sql);
		return true;
	}
	public function getTopicDetail(){
		$sql = "SELECT * FROM topics WHERE id=$this->id";
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);
		foreach($result[0] as $k=>$v){
			$this->$k=$v;
		}
	}
	public function update(){
		$upd_sql="update topics SET 
		title = '".mysqli_real_escape_string($this->conn,$this->title)."' , description = '".mysqli_real_escape_string($this->conn,$this->description)."' , grade = '$this->grade' , status = '$this->status' WHERE id = $this->id "; 
		$this->conn->query($upd_sql);
		return true;
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
	
	public function delete(){
		$id=$_GET['id'];
		$sql="UPDATE topic SET status='D' WHERE id=".$id;
		$this->conn->query($sql);
		return true;
	}
	
	public function getMessage(){

	}
	public function setMessage(){
		if(isset($this->msg)){
			
		}
	}

	}
	?>