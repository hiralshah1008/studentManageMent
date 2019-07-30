	<?php
	class Student extends Connectdb
	{
	public $sid;
		
	public function __construct(){
		
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
		}elseif(isset($_SESSION['sid']) && $_SESSION['sid']!= 0){
			$this->id = $_SESSION['sid'];
		}
		if(isset($_GET['tid']) && $_GET['tid']!= 0){
			$this->tid = $_GET['tid'];
		}
		if(isset($_GET['hid']) && $_GET['hid']!= 0){
			$this->hid = $_GET['hid'];
		}
	}
	public function getallStudents(){
		$sql="select * from students WHERE status != 'D' ";
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);
		return $result;
	}
	public function save(){
		if ($this->checkError()){
			if(isset($this->id) && $this->id!=""){
				$this->update();
			}else{
				$this->insert();
			}
			return true;
		}else{	
			$this->setMessage();
			return false;
		}
	}
	public function checkError(){
		if(!($this->first_name) || $this->first_name == ''){
			$this->msg[] = "Please enter firstname";
		}elseif(!$this->isValidText($this->first_name)){
			$this->msg[] = "Please enter valid firstname";
		}
		if(!($this->last_name) || $this->last_name == ''){
			$this->msg[] = "Please enter lastname";
		}elseif(!$this->isValidText($this->last_name)){
			$this->msg[] = "Please enter valid lastname";
		}
		if($_GET['mode'] != 'edit'){
			if(!($this->uname) || $this->uname == ''){
				$this->msg[] = "Please enter user name";
			}elseif(!$this->isValidText($this->uname)){
				$this->msg[] = "Please enter valid user name";
			}
			if(!($this->rno) || $this->rno == ''){
				$this->msg[] = "Please enter roll number";
			}elseif(!is_numeric($this->rno)){
				$this->msg[] = "Please enter valid roll number";
			}
		}
		if(isset($this->msg) && !empty($this->msg)){
			return false;
		}
		return true;
	}
	public function isValidText($val){
		$search_script_arr = array('<script','< script','</script','</ script','<?','?>','<iframe');
		foreach($search_script_arr as $k=>$v){
			if(stristr($v,$val)){				
				return false;
			}
		}
		return true;		
	}
	public function insert(){
		if(isset($_FILES) && !empty($_FILES)){
			$img_arr=array(0=>'profilephoto');
			$target_dir = "images/";
			foreach($img_arr as $k=>$v){
				$file_name[$v]=basename($_FILES[$v]["name"]);
				$target_file[$v] = $target_dir . basename($_FILES[$v]["name"]);
				$imageFileType = pathinfo(basename($_FILES[$v]["name"]),PATHINFO_EXTENSION);
				$uploadOk = 1;
				// Check if $uploadOk is set to 0 by an error
				// Allow certain file formats
				if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
				&& $imageFileType != "gif" ) {
					$this->msg = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
					$uploadOk = 0;
				}
				if ($uploadOk == 0) {
					$this->msg = "Sorry, your file was not uploaded.";
				// if everything is ok, try to upload file
				} else {		
					if (move_uploaded_file($_FILES[$v]['tmp_name'],$target_file[$v])) {
					
					} else {			
						$this->msg = "Sorry, there was an error uploading your file.";				
					}
				}
			}
		}
		else{
			$file_name['profilephoto']="";
		}
		if(!empty($this->topics)){
			$topics = implode(",",$this->topics);
		}
		$ins_sql="insert into students 
		(first_name,last_name,address,gender,rno,profilephoto,email,grade,topics,status) 
		VALUES 
		('".mysqli_real_escape_string($this->conn,$this->first_name)."','$this->last_name','$this->address','$this->gender','$this->rno','".$file_name['profilephoto']."','$this->email','$this->grade','$topics','$this->status')";
		$this->conn->query($ins_sql);
		$sid = mysqli_insert_id($this->conn);
		$ins_user_sql="insert into user 
		(sid,uname,password,first_name,last_name,role,status) 
		VALUES 
		($sid,'$this->uname','$this->password','$this->first_name','$this->last_name','S','$this->status')";
		
		$this->conn->query($ins_user_sql);
		return true;
	}
	public function getStudentDetail(){
		$sql = "SELECT s.* , u.* FROM students as s , user as u WHERE s.id = u.sid AND s.id=$this->id";
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);
		foreach($result[0] as $k=>$v){
			$this->$k=$v;
		}
	}
	public function checkRno($rno){
		$sql="SELECT count(*) FROM students WHERE rno = '".$rno."'";
		$res=$this->conn->query($sql);		
		$result = $this->getArray($res);
		return $result;
	}
	public function checkUname($uname){
		$sql="SELECT count(*) FROM user WHERE uname = '".$uname."'";
		//_D($sql);
		$res=$this->conn->query($sql);		
		$result = $this->getArray($res);
		return $result;
	}
	public function update(){
		$img_arr=array(0=>'profilephoto');
		$target_dir = "images/";
		foreach($img_arr as $k=>$v){
			if(isset($_FILES[$v]) && $_FILES[$v]['name'] != ""){
			$file_name[$v]=basename($_FILES[$v]["name"]);
			$target_file[$v] = $target_dir . basename($_FILES[$v]["name"]);
			$imageFileType = pathinfo(basename($_FILES[$v]["name"]),PATHINFO_EXTENSION);
			$uploadOk = 1;
			
			// Check if $uploadOk is set to 0 by an error
			// Allow certain file formats
			if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
			&& $imageFileType != "gif" ) {
				$this->msg = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
				$uploadOk = 0;
			}
			
			if ($uploadOk == 0) {
				$this->msg = "Sorry, your file was not uploaded."; 
			// if everything is ok, try to upload file
			} else {		
				if (move_uploaded_file($_FILES[$v]['tmp_name'],$target_file[$v])) {
				
				} else {			
					$this->msg = "Sorry, there was an error uploading your file.";				
				}
			}
		}
		}
		if($file_name){
			if($file_name['idproof'] != ""){
			$this->idproof = $file_name['idproof'];
			}
			if($file_name['profilephoto'] != ""){
			$this->profilephoto = $file_name['profilephoto'];
			}		
		}
		if(!empty($this->topics)){
			$topics = implode(",",$this->topics);
		}
		$upd_sql="update students SET 
		first_name = '$this->first_name' , last_name = '$this->last_name', email = '$this->email' , grade = '$this->grade' ,topics = '".$topics."', gender = '$this->gender' , address = '$this->address' , status = '$this->status' ,profilephoto = '$this->profilephoto' WHERE id = $this->id";  
		//_DX($upd_sql);
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
		$sql =	"UPDATE students 
				SET status='D' WHERE id=".$id;
		$this->conn->query($sql);
		return true;
	}
	
	public function getMessage(){
		if(isset($_SESSION['msg'])){
			$this->msg = implode("<br/>",$_SESSION['msg']);
			unset($_SESSION['msg']);
			return "<span class='error_msg'>".$this->msg."</span>";
		}
	}
	public function setMessage(){
		if(isset($this->msg)){
			$_SESSION['msg'] = $this->msg;
		}
	}
	public function getGradeTopics($gid){
		if(!$gid || !is_numeric($gid))
			return false;
		$sql = "SELECT * 
				From topics 
				WHERE grade = $gid";
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);
		
		return $result;
	}
	public function getAssignedTopic(){
		$sql  = "SELECT t.*
				 FROM topics as t 
				 WHERE t.id IN (".$this->topics.")";
		
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);		
		
		$sql = "SELECT hw.* FROM homework as hw
				WHERE hw.sid = $this->sid  AND hw.tid IN (".$this->topics.")";
		$res=$this->conn->query($sql);
		$result_h = $this->getArray($res);
		
		if(!empty($result_h)){
			foreach($result_h as $kh=>$vh){
				foreach($result as $kt=>$vt){
					if($vh['tid'] == $vt['id']){
						foreach($vh as $kh1=>$vh1)
						$result[$kt][$kh1] = $vh1;
						break;
					}
				}
			}
		}
		return $result;
	}
	public function getHomeworkDetail(){
		if(isset($this->hid) && $this->hid != '')
			$sql= "SELECT t.* , hw.* FROM topics as t LEFT JOIN homework as hw ON t.id = hw.tid WHERE t.id  = ".$this->tid." AND hw.hid=".$this->hid;
		else
			$sql= "SELECT t.* FROM topics as t WHERE t.id  = ".$this->tid;
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);
		foreach($result[0] as $k=>$v){
			$this->$k=$v;
		}
		return $result;
	}
	public function saveHomework(){
		if($this->hid != "" && isset($this->hid)){
			$this->updateHomework();
		}else{
			$this->insertHomework();
		}
		return true;
	}
	public function updateHomework(){
		if($_SESSION['role'] == 'S')
			$upd_sql="update homework SET 
			answer = '$this->answer' , date_submitted = '".date('Y-m-d H:i:s')."' WHERE hid = $this->hid";  
		else
			$upd_sql="update homework SET  comment = '$this->comment', h_status = '$this->h_status' , date_review = '".date('Y-m-d H:i:s')."' WHERE hid = $this->hid";
		$this->conn->query($upd_sql);
		return true;
	}
	public function insertHomework(){
		$ins_sql="insert into homework 
		(tid,sid,answer,date_submitted) 
		VALUES 
		('$this->tid','$this->id','$this->answer','".date('Y-m-d H:i:s')."')";
		$this->conn->query($ins_sql);
		return true;		
	}
	public function getSubmittedTopic(){
		$sql="SELECT hw.* , t.* ,s.* FROM homework as hw , topics as t , students as s WHERE hw.tid = t.id AND hw.sid = s.id ORDER BY hw.date_submitted ASC , hw.h_status DESC";
		
		$res=$this->conn->query($sql);
		$result = $this->getArray($res);
		return $result;
	}
	}
	?>