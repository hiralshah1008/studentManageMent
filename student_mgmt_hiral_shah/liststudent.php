<?php
include("lib/common.php");
include("model/student.cls.php");

if($_SESSION['uname'] == ''){
	redirect("login.php");
}elseif($_SESSION['role'] != 'A'){
	redirect("index.php");
}

$clsStudent=new Student();
if(isset($_GET['mode']) && $_GET['mode'] == 'del'){
	if($clsStudent->delete()){
		redirect("liststudent.php");
	}
}
$students = $clsStudent->getallStudents();

$smarty->assign("title","List Student");
$smarty->assign("students",$students);
$smarty->display('middle/liststudent.tpl');
?>