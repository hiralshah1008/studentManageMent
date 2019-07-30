<?php
include("lib/common.php");
include("model/user.cls.php");

if(isset($_SESSION['uid']) && $_SESSION['uid'] != '' ){
	redirect("index.php");
}

$clsUser=new User();
if(isset($_POST['submit']) && $_POST['submit'] == '1'){
	if($clsUser->checkLogin()){
		redirect("index.php");		
	}
}
$smarty->assign('title',"Login");
$smarty->assign('clsUser',$clsUser);
$smarty->display('middle/login.tpl');
?>