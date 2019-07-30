<!DOCTYPE html>
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
  <title>{if $title neq ''}{$title}{else}Dashboard{/if}</title>
  
  <!-- Favicon -->
  <link rel="icon" type="image/png" href="media/favicon.png">
 
  <link rel="stylesheet" type="text/css" href="css/style-min.css">
  <!-- WebFonts-->
  <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
  <!-- Font Awesome -->
  <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
  <!-- jQuery -->
  <script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
  <script src="js/jquery-migrate/jquery-migrate-1.0.0.js"></script>
  
  <!-- Acura JS -->
  <script src="js/acura.js"></script>
  <!-- Tipsy jQuery -->
  <script src="js/tipsy/jquery.tipsy.js"></script>
  <link href="js/tipsy/tipsy.css" rel="stylesheet">
  <!-- Masked Input -->
  <script src="js/maskedinput/jquery.maskedinput.min.js"></script>
  <!-- Textarea Autosize -->
  <script src="js/autosize/jquery.autosize.min.js"></script>
  <!-- Textarea Counter -->
  <script src="js/nobleCount/jquery.NobleCount.min.js"></script>
  <!-- Uniform -->
  <link rel="stylesheet" href="js/uniform/theme/css/uniform.default.min.css">
  <script src="js/uniform/jquery.uniform.min.js"></script>
  <!-- jQuery UI -->
  <script src="js/jquery-ui-1.10.3/js/jquery-ui-1.10.3.custom.min.js"></script>
  <link rel="stylesheet" href="js/jquery-ui-1.10.3/css/no-theme/jquery-ui-1.10.3.custom.css">
  <!-- CLEditor -->
  <script src="js/cleditor/jquery.cleditor.min.js"></script>
  <link rel="stylesheet" href="js/cleditor/jquery.cleditor.css">
  <!-- jQuery textext -->
  <script src="js/tagsinput/jquery.tagsinput.min.js"></script>
  <link rel="stylesheet" href="js/tagsinput/jquery.tagsinput.css">
  <!-- flot -->
  <script src="js/flot/jquery.flot.min.js"></script>
  <script src="js/flot/jquery.flot.resize.js"></script>
  <script src="js/flot/jquery.flot.time.js"></script>
  <script src="js/flot/jquery.flot.threshold.js"></script>
  <script src="js/flot/jquery.flot.pie.js"></script>
  <script src="js/flot/jquery.flot.stack.js"></script>
  <!-- colResizable -->
  <script src="js/colResizable/colResizable-1.3.js"></script>
  <script src="js/dataTables/jquery.dataTables.min.js"></script>
  <!-- Full Calendar -->
  <script src="js/fullcalendar/fullcalendar.min.js"></script>
  <link rel="stylesheet" href="js/fullcalendar/fullcalendar.css">
   <!-- jquery UI Map -->
  <script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
  <script src="js/jquery-ui-map/ui/jquery.ui.map.js" type="text/javascript"></script>
  <!-- jQuery Vector Map -->
  <script src="js/jqvmap-stable/jqvmap/jquery.vmap.js" type="text/javascript"></script>
  <script src="js/jqvmap-stable/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
  <script src="js/jqvmap-stable/jqvmap/maps/jquery.vmap.world.js"></script>
  <script src="js/jqvmap-stable/jqvmap/data/jquery.vmap.sampledata.js"></script>
  <!-- jQuery Knob -->
  <script src="js/jquery-knob/jquery.knob.js"></script>
  <!-- bxSlider -->
  <script src="js/bxSlider/jquery.bxslider.min.js"></script>
  <link href="js/bxSlider/jquery.bxslider.css" rel="stylesheet">
  <!-- Gritter -->
  <script src="js/gritter/js/jquery.gritter.min.js"></script>
  <link href="js/gritter/css/jquery.gritter.css" rel="stylesheet">
  <!-- Lightbox -->
  <script src="js/lightbox/js/lightbox-2.6.min.js"></script>
  <link href="js/lightbox/css/lightbox.css" rel="stylesheet">
  <!-- jGrowl-->
  <link rel="stylesheet" href="js/jGrowl/jquery.jgrowl.css" />
  <script src="js/jGrowl/jquery.jgrowl.min.js"></script>
  <!-- Circle Slider -->
  <link rel="stylesheet" href="js/circleSlider/css/website.css" />
  <script src="js/circleSlider/js/jquery.tinycircleslider.min.js"></script>
  <!-- Highlight.js -->
  <script src="js/highlight.js/highlight.pack.js"></script>
  <link rel="stylesheet" href="js/highlight.js/styles/github.css">
  <script>hljs.initHighlightingOnLoad();</script>
  <link href="http://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet" type="text/css">
  <!-- Color Picker -->
  <link rel="stylesheet" media="screen" type="text/css" href="js/colorpicker/css/colorpicker.css" />
  <script type="text/javascript" src="js/colorpicker/js/colorpicker.js"></script>
  <!-- Validation -->
<script type="text/javascript" src="js/validation/angvalidate-0.1.2.min.js" ></script> 
<link rel="Stylesheet" type="text/css" href="js/validation/angvalidate.css" />

</head>
<script type="text/javascript"> 
$(document).ready(function(){ 
$('.required').angvalidate(); 
}); 
</script>

<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
      <!-- .sidebar-mobile .sidebar-reduce -->
      <!-- Logo and Reduce Sidebar -->
      <div class="logo-reduce-sidebar">
        <div class="logo">
          <a href="index.php">
            <img class="logo-sidebar-big" src="media/acura-logo.png" alt="acura-logo">
            <img class="logo-sidebar-small" src="media/acura-logo-small.png" alt="acura-logo">
          </a>
        </div>
        <div class="reduce-sidebar">&#xf0c9;</div>
      </div>
      <!-- Sidebar Nav -->
      <nav class="nav-sidebar">
        <ul>
          <li>
            <a title="{if $smarty.session.role eq 'A'}HW Submission{else}HW ASSIGNMENT{/if}" href="index.php" class="on sidebar-small tipsy-w">
              <span class="icon">&#xf132;</span>
            </a>
            <a href="index.php" class="on sidebar-big">
              <span class="icon">&#xf132;</span>
              {if $smarty.session.role eq 'A'}HW Submission{else}HW ASSIGNMENT{/if}
            </a>
          </li>
		  {if $smarty.session.role eq 'A'}
          <li>
            <a href="#" class="sidebar-small">
              <span class="icon">&#xf0b1;</span>
            </a>
            <a href="#" class="sidebar-big">
              <span class="icon">&#xf007;</span>
              Student
              <i class="sub-menu-caret">&#xf0dd;</i>
            </a>
            <!-- Sub Menu -->
            <ul class="sub-sidebar">
              <li>
                <a href="liststudent.php">
                  <span class="icon">&#xf00a;</span>
                   List Students
                </a>
              </li>
              <li>
                <a href="student.php">
                  <span class="icon">&#xf0fe;</span>
					Add Students
                </a>
              </li>
            </ul>
          </li>
		  <li>
            <a href="#" class="sidebar-small">
              <span class="icon">&#xf0b1;</span>
            </a>
            <a href="#" class="sidebar-big">
              <span class="icon">&#xf007;</span>
              Topics
              <i class="sub-menu-caret">&#xf0dd;</i>
            </a>
            <!-- Sub Menu -->
            <ul class="sub-sidebar">
              <li>
                <a href="listtopic.php">
                  <span class="icon">&#xf00a;</span>
                   List Topics
                </a>
              </li>
              <li>
                <a href="topic.php">
                  <span class="icon">&#xf0fe;</span>
					Add Topic
                </a>
              </li>
            </ul>
          </li>
		 {/if}
	</ul>
</nav>
    </aside>
    <!-- Contents -->
    <div class="contents">
      <!-- Header -->
      <header class="header grid-12">
        <!-- Mobide Header -->
        <div class="grid-12 mobile-header">
          <!-- Logo -->
          <div class="logo-mh">
            <a href="index.php">
              <img src="media/acura-logo-small.png" alt="acura-logo">
            </a>
          </div>
          <!-- Reduce -->
          <div class="reduce-sidebar-mh">&#xf0c9;</div>
        </div>       
        
        <!-- Hidden Stats -->
        <div class="grid-12 hidden-top-stats">
          <!-- Multiple Axis -->
          <div class="grid-12">
            <div class="widget widget-no-border">
              <div class="widget-body no-padding">
                <div class="h-m-s"></div>
              </div>
            </div>
          </div>
        </div>
        <!-- Popular Page -->
        <div class="top-buttons grid-12">
          <div class="grid-4">
		  <a href="topic.php">
              <div class="data-icon" style="color: #00A8C6;">&#xf0f6;</div>
              <div class="data-info">
                <h4>Add</h4>
                <h5><span class="i-stars">&#xf007;</span> New Topic</h5>
              </div>
            </a>            
          </div>
          <div class="grid-4">
             <a href="student.php">
              <div class="data-icon" style="color: #00A8C6;">&#xf0f6;</div>
              <div class="data-info">
                <h4>Add</h4>
                <h5><span class="i-stars">&#xf007;</span> New Student</h5>
              </div>
            </a>
          </div>          
         
         <!-- User -->
        <div class="top-user grid-4">
          <!-- User Avatar -->
          <div class="user-avatar">
			{if $smarty.session.profilephoto neq ''}
			<img height="60" width="60" src="images/{$smarty.session.profilephoto}" alt="">
			
            {else}
			<img src="media/top-avatar.png" alt="avatar">
			
			{/if}
          </div>
          <!-- User Data -->
          <div class="user-data">
            <h4>{$smarty.session.first_name} {$smarty.session.last_name}</h4>
			<h6>{$smarty.session.rno}</h6>
            <!-- User Options -->
            <ul class="user-options">
              <li>
                <div id="u-s-icon" class="btn btn-menu btn-small btn-transparent btn-o-icon"><i>&#xf013;</i>
                  <!-- Menu -->
                  <div class="menu menu-bottom-right">
                    <ul>
                      <li>
                        <a href="#">
                          <div class="menu-icon"><!-- Empty --></div>
                          <div class="menu-title">
                            Edit Profile
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="logout.php">
                          <div class="menu-icon"><!-- Empty --></div>
                          <div class="menu-title">
                            Logout
                          </div>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </li>
            </ul>
          </div>          
        </div>
    </div>
	
	<script type="text/javascript">	
		/*$('.sidebar-big').click(function(e){
			e.preventDefault();
			$(this).closest('li').find('.sub-sidebar').toggle();
		})*/
	</script>