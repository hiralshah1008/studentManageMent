<?php
include("lib/common.php");
include("model/student.cls.php");
$clsStudent = new Student();
if($_SESSION['uname'] == ''){
	redirect("login.php");
}
if($_SESSION['sid'] != 0 && $_SESSION['role'] == 'S' ){
	$clsStudent->getStudentDetail();
	$assigned_topic = $clsStudent->getAssignedTopic($clsStudent->id);
	$smarty->assign("assigned_topic",$assigned_topic);
}else{
	$submitted_topics = $clsStudent->getSubmittedTopic();
	$smarty->assign("submitted_topics",$submitted_topics);
}
$smarty->assign('clsStudent',$clsStudent);

$smarty->assign("title","Dashboard");
$smarty->display('middle/index.tpl');
?>