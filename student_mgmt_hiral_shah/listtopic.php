<?php
include("lib/common.php");
include("model/topic.cls.php");

if($_SESSION['uname'] == ''){
	redirect("login.php");
}elseif($_SESSION['role'] != 'A'){
	redirect("index.php");
}

$clsTopic=new Topic();
if(isset($_GET['mode']) && $_GET['mode'] == 'del'){
	if($clsTopic->delete()){
		redirect("listtopic.php");
	}
}
$topics = $clsTopic->getallTopics();

$smarty->assign("title","List Topics");
$smarty->assign("topics",$topics);
$smarty->display('middle/listtopic.tpl');
?>