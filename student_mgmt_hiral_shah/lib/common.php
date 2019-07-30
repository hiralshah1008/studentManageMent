<?php
//error_reporting(E_ALL^E_NOTICE);
error_reporting(0);
session_start();
include("dbconnection.php");
require_once "functions.php";
require 'Smarty/libs/Smarty.class.php';
$smarty = new Smarty;
//$smarty->force_compile = true;
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120;

?>