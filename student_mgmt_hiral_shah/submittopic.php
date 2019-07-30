<?php
include("lib/common.php");
include("model/student.cls.php");
include("model/topic.cls.php");

if($_SESSION['uname'] == ''){
	redirect("login.php");
}
$clsStudent=new Student();
$clsTopic = new Topic();

if(isset($_POST['submit']) && $_POST['submit'] == 'Save'){
	if($clsStudent->saveHomework()){
		redirect("index.php");
	}
}
if(isset($_GET['tid']) && $_GET['tid'] != "")
{
	$clsStudent->getHomeworkDetail();
}
$showSubmitButton = true;
$today_date = date('Y-m-d');

if($_SESSION['role'] == 'S'){
if($today_date == date('Y-m-d',strtotime($clsStudent->date_submitted))){
	$showSubmitButton = false;
}
}
$smarty->assign('showSubmitButton',$showSubmitButton);
if(isset($_GET['tid']) && $_GET['tid'] != ""){
	$smarty->assign('title',"Edit Homework");
}else{
	$smarty->assign('title',"Submit Homework");
}
//_D($clsStudent);
$smarty->assign('clsStudent',$clsStudent);
$smarty->display('middle/submittopic.tpl');
?>