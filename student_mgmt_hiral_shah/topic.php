<?php
include("lib/common.php");
include("model/topic.cls.php");

if($_SESSION['uname'] == ''){
	redirect("login.php");
}elseif($_SESSION['role'] != 'A'){
	redirect("index.php");
}

$clsTopic=new Topic();
if(isset($_POST['submit']) && $_POST['submit'] == 'Save'){
	if($clsTopic->save()){
		redirect("listtopic.php");
	}
}
if(isset($_GET['id']) && $_GET['id'] != "")
{
	$clsTopic->getTopicDetail();
}
if(isset($_GET['id']) && $_GET['id'] != ""){
	$smarty->assign('title',"Edit Topic");
}else{
	$smarty->assign('title',"Add Topic");
} 
$smarty->assign('clsTopic',$clsTopic);
$smarty->display('middle/topic.tpl');
?>