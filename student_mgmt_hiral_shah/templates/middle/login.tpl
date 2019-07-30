<!doctype html>
<html lang="en">
<head>
<!-- Meta -->
<meta charset="UTF-8">
<meta name="author" content="Acura">
<meta name="description" content="Acura - A Real Admin Template">
<meta name="keywords" content="Acura, Admin Template, Admin, Premium, ThemeForest, Clean, Modern, Responsive">
<!-- Responsive viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- Title -->
<title>{$title|ucfirst}</title>
<!-- Favicon -->
<link rel="icon" type="image/png" href="media/favicon.png">
<!-- Pure CSS Style (minified) -->
<link rel="stylesheet" type="text/css" href="css/style-min.css">
<!-- WebFonts-->
<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
<!-- Font Awesome -->
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script src="js/jquery-migrate/jquery-migrate-1.0.0.js"></script>

<!-- Validation -->
<script type="text/javascript" src="js/validation/angvalidate-0.1.2.min.js" ></script> 
<link rel="Stylesheet" type="text/css" href="js/validation/angvalidate.css" />
<!-- Acura JS -->
<script src="js/acura.js"></script>

<!-- jQuery UI -->
<script src="js/jquery-ui-1.10.3/js/jquery-ui-1.10.3.custom.min.js"></script>
<link rel="stylesheet" href="js/jquery-ui-1.10.3/css/no-theme/jquery-ui-1.10.3.custom.css">

<!-- jQuery textext -->
<script src="js/tagsinput/jquery.tagsinput.min.js"></script>
<link rel="stylesheet" href="js/tagsinput/jquery.tagsinput.css">



<link href="http://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Login Widget -->
<div class="login-widget login-login">
<header class="login-header">
  <a href="#">
	<img src="media/acura-logo.png" alt="">
  </a>
</header>
<h4 class="typo login-title">Login</h4>
{$clsUser->GetMsg()}

<form id="login" action="login.php" method="POST">
  <div class="form-separator form-field">
	<div class="field-icon field-icon-left">
	  <i class="i">&#xf007;</i>
	  <input name="uname" type="text" class="form form-full required" placeholder="Username">
	</div>
  </div>
  <div class="form-separator form-field">
	<div class="field-icon field-icon-left">
	  <i class="i">&#xf023;</i>
	  <input name="password" type="password" class="form form-full required" placeholder="Password">
	</div>
  </div>
  <div class="login-submit">
	<button name="btn_sub" class="btn btn-submit">Login</button>
	<input type="hidden" name="submit" value="1">
  </div>
</form>
<footer class="login-footer">
Copyright Â© 2017-2018 Confidential@All rights Reserved!
</footer>
</div> 

</body>
</html>
