<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<!-- iPhone, iPad and Android specific settings -->	
		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1;">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
		<title>Adminica | The Professional Admin Theme</title>
		<!-- Create an icon and splash screen for iPhone and iPad -->
		<link rel="apple-touch-icon" href="../../_images/iOS_icon.png">
		<link rel="apple-touch-startup-image" href="../../_images/iOS_startup.png"> 
		<link rel="stylesheet" type="text/css" href="../_css/all.css" media="screen">
		<link rel="stylesheet" type="text/css" href="../_css/theme/theme_base.css" media="screen">
		<link rel="stylesheet" type="text/css" href="../_css/header_slideout.css" media="screen">
		<link rel="stylesheet" type="text/css" href="../_css/theme/theme_navy.css" media="screen">
		<!--[if IE 6]><link rel="stylesheet" type="text/css" href="_css/ie6.css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" type="text/css" href="_css/ie.css" media="screen" /><![endif]-->
		<!-- Load JQuery -->		
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		<!-- Load JQuery UI -->
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
		<!-- this was original lib <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>--->
		<!-- Load Interface Plugins -->
		<script type="text/javascript" src="../_js/uniform/jquery.uniform.js"></script>
		<script type="text/javascript" src="../_js/iPhone/jquery.iphoneui.js"></script>
		<script type="text/javascript" src="../_js/uitotop/js/jquery.ui.totop.js"></script>
		<!-- This file configures the various jQuery plugins for Adminica. Contains links to help pages for each plugin. -->
		<script type="text/javascript" src="../_js/adminica/adminica_ui.js"></script>
        <script type="text/javascript" src="../_js/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="../_js/ckeditor/adapters/jquery.js"></script>
	</head>
	<body>
		<div id="wrapper">	
				
			<div id="sidebar">
				<div class="cog">+</div>
				
				<a href="index.php" class="logo"><span>Adminica Pro II</span></a>
			
				<div class="user_box round_all clearfix">
                    <img src="http://www.petro21.com/_files/client/Photo_20100920_32x23720.jpg"   width="55">
					<h2>Administrator</h2>
					<h3><a class="text_shadow" href="#">John Smith</a></h3>
					<ul>
						<li><a href="#">settings</a><span class="divider">|</span></li>
						<li><a href="login.php">logout</a></li>
					</ul>
				</div><!-- #user_box -->
			
				<ul id="accordion" class="round_all">
					<li><a href="index.php" class="top_level"><img src="../_images/icons/small/grey/home.png"/>Home</a>
						<ul class="drawer">
							<li><a href="#">Activity</a></li>
							<li><a href="#">Events</a></li>
							<li><a href="#">Tasks</a></li>
						</ul>
					</li>
					<li><a href="#" class="top_level"><img src="../_images/icons/small/grey/users.png"/>Members</a>
						<ul class="drawer">
							<li><a href="#">Add New</a></li>
							<li><a href="#">Edit/Delete</a></li>
							<li><a href="#">Search Profiles</a></li>
						</ul>
					</li>
					<li><a href="#" onClick="parent.location='http://www.tricycle.ie'" class="top_level"><img src="../_images/icons/small/grey/graph.png"/>Statistics</a></li>
					<li><a href="#" class="top_level"><img src="../_images/icons/small/grey/cog_2.png"/>Settings</a>
						<ul class="drawer">
							<li><a href="#">Account</a></li>
							<li><a href="#">System</a></li>
						</ul>
					</li>
				</ul>
				<form id="search_side"><input class="round_all" type="text" value="Search Users..." onclick="value=''"></form>                
			</div><!-- #sidebar -->
            
            <div id="main_container" class="main_container container_16 clearfix">
            
            	<!---<div id="nav_top" class="clearfix round_top">
				<ul class="clearfix round_all">
					<li class="current"><a href="dashboard_sorter.html"><img src="../_images/icons/small/white/laptop.png"/>Dashboard</a></li>
                    <li><a href="contacts.html"><img src="../_images/icons/small/grey/Users.png"/>Contacts</a></li>
				
					<li><a href="#"><img src="../_images/icons/small/grey/frames.png"/>Layout</a>
						<ul class="dropdown">
							<li><a href="layout.html">16 Grid - 960.gs</a></li>
							<li><a href="text.html">Text & Typography</a></li>
							<li><a class="has_slide" href="#">Layout Width</a>
								<ul class="slideout">						
									<li><a href="_css/theme/switcher1.php?style=../layout_fixed.css">Fixed</a></li>
									<li><a href="_css/theme/switcher1.php?style=switcher.css">Fluid</a></li>
								</ul>
							</li>
							<li><a class="has_slide" href="#">Layout Position</a>
								<ul class="slideout">
									<li><a href="_css/theme/switcher2.php?style=switcher.css">Side</a></li>
									<li><a href="_css/theme/switcher2.php?style=../layout_top.css">Top</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="#"><img src="../_images/icons/small/grey/coverflow.png"/>Boxes</a>
						<ul class="dropdown">
							<li><a class="has_slide" href="#">Tab Boxes</a>
								<ul class="slideout">
									<li><a href="tabs.html">Horizontal Tabs</a></li>
									<li><a href="tabs.html">Vertical Tabs</a></li>
								</ul>
							</li>
								<li><a href="accordions.html">Accordions Boxes</a></li>
								<li><a href="wizard.html">Step by Step Wizard</a></li>
							<li><a href="code.html">Code View</a></li>
						</ul>
					</li>	
					<li><a href="#"><img src="../_images/icons/small/grey/create_write.png"/>Forms</a>
						<ul class="dropdown">
							<li><a href="forms.html">Input & Validation</a></li>
							<li><a class="has_slide" href="#">Date</a>
								<ul class="slideout">
									<li><a href="forms.html">Date Field</a></li>
									<li><a href="forms.html">Inline Picker</a></li>
								</ul>
							</li>
							<li><a class="has_slide" href="#">Sliders</a>
								<ul class="slideout">
									<li><a href="forms.html">Horizontal Slider</a></li>
									<li><a href="forms.html">Vertical Slider</a></li>
									<li><a href="forms.html">Range Slider</a></li>
									<li><a href="forms.html">Progress Bar</a></li>
								</ul>
							</li>
							<li><a href="buttons.html">Buttons</a></li>
							<li><a href="editor.html">WYSIWYG Editor</a></li>
						</ul>
					</li>		
					<li><a href="#"><img src="../_images/icons/small/grey/images.png"/>Gallery</a>
						<ul class="dropdown">
							<li><a href="gallery.html">Fancybox Gallery</a></li>
							<li><a href="gallery_sortable.html">Sortable Gallery</a></li>
						</ul>
					</li>			
					<li><a href="#"><img src="../_images/icons/small/grey/blocks_images.png"/>Tables</a>
						<ul class="dropdown dropdown_left">
							<li><a href="tables.html">DataTables</a></li>
							<li><a href="tables_static.html">Regular Tables</a></li>
						</ul>			
					</li>
					<li><a href="#"><img src="../_images/icons/small/grey/plane_suitcase.png"/>Organize</a>
						<ul class="dropdown dropdown_left">
							<li><a href="files.html"><img src="../_images/icons/small/grey/Folder.png"/>Files</a></li>
							<li><a href="contacts.html"><img src="../_images/icons/small/grey/Users.png"/>Contacts</a></li>
						</ul>
					</li>
					<li><a href="calendar.html"><img src="../_images/icons/small/grey/month_calendar.png"/>Calendar</a></li>
					<li><a href="charts.html"><img src="../_images/icons/small/grey/graph.png"/>Charts</a></li>
					<li><a href="login.html"><img src="../_images/icons/small/grey/locked_2.png"/>Log Out</a></li>
				</ul>	
			</div>---><!-- #nav_top -->