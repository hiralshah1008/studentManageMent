<?php
include("lib/common.php");
unset($_SESSION['uid']);
session_destroy();
redirect("login.php");
?>