<?php
include("lib/common.php");
include("model/student.cls.php");

if($_SESSION['uname'] == ''){
	redirect("login.php");
}elseif($_SESSION['role'] != 'A'){
	redirect("index.php");
}

$clsStudent=new Student();

 if(isset($_GET['action']) && $_GET['action'] == 'checkrno'){
	
	$res = $clsStudent->checkRno($_GET['rno']);
	echo $res[0]['count(*)'];
	exit;
} 

if(isset($_GET['action']) && $_GET['action'] == 'uname'){
	
	$res = $clsStudent->checkUname($_GET['uname']);
	
	echo $res[0]['count(*)'];
	exit;
}

if(isset($_POST['submit']) && $_POST['submit'] == 'Save'){
	if($clsStudent->save()){
		redirect("liststudent.php");
	}
}

if(isset($_GET['action'])&&$_GET['action'] == 'getTopics' && isset($_GET['grade'])&& is_numeric($_GET['grade'])){
	
	$topic_arr=$clsStudent->getGradeTopics($_GET['grade']);
	$sel_topic_list=$_GET['student_topic'];
	
	if($sel_topic_list!=""){
		$sel_topic_arr=explode(",",$sel_topic_list);
	}
	if(!empty($topic_arr)){
		$str='<select class="form form-big" name="topics[]" style="height:150px;" multiple>';
	
		foreach($topic_arr as $k=>$v){
			if(isset($sel_topic_arr) && !empty($sel_topic_arr)){
				if(in_array($v['id'],$sel_topic_arr)){
					$selected="selected=selected";
				}
			}
			$str.='<option value="'.$v['id'].'"' .$selected.'>'.$v['title'].'</option>';
			$selected="";
		}
		$str.="</select>";
	}else{
		$str = '<h5 class="typo">No Topic addeded for Grade '.$_GET['grade'].'</h5>';
	}
	echo $str;
	exit;
}

if(isset($_GET['id']) && $_GET['id'] != "")
{
	$clsStudent->getStudentDetail();
}

if(isset($_GET['id']) && $_GET['id'] != ""){
$smarty->assign('title',"Edit Student");
}
else{
$smarty->assign('title',"Add Student");
}


$smarty->assign('clsStudent',$clsStudent);
$smarty->display('middle/student.tpl');
?>