<cfinclude template="../Application.cfm" >
<cfquery DATASOURCE="#dsnP21#" name="weekMenu" cachedwithin="#CreateTimeSpan(1,0,0,0)#">
Select id, event_name AS name, event_year AS year, event_type , file_image_pdf AS banner, event_loc_city AS city, event_loc_country AS country, groupby, event_abbr
FROM events 
WHERE  event_expire > #DateAdd("d", -3, datenow)# AND (event_type = 'week')  and (LIVE = 1) Order by event_expire
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
<script type="text/javascript" src="../js/jquery.js" ></script>
<style type="text/css">
<!--
body {
	background: #1d1d1d;
	margin: 0; padding: 0;
	font: 10px normal Arial, Helvetica, sans-serif;
}
* {margin: 0; padding: 0; outline: none;}
img {border: none;}

.main_image {
	width: 618px;
	height: 316px;
	float: left;
	background: #333;
	position: relative;
	overflow: hidden; /*--Overflow hidden allows the description to toggle/tuck away as it slides down--*/
	color: #fff;
	background-repeat:no-repeat;
	background-image:url(../docs/<cfoutput>#weekMenu.banner#</cfoutput>)
}
.main_image h2 {
	font-size: 2em;
	font-weight: normal;
	margin: 0 0 5px;
	padding: 10px;
}
.main_image p {
	font-size: 1.2em;
	line-height: 1.6em;
	padding: 10px;
	margin: 0;
}
.block small { /*--We'll be using this same style on our thumbnail list--*/
	font-size: 1em;
	padding: 0 0 0 20px;
	
}
.main_image .block small {margin-left: 10px;}
.main_image .desc{
	position: absolute;
	bottom: 0;
	left: 0; /*--Stick the desc class to the bottom of our main image container--*/
	width: 100%;
	display: none; /*--Hide description by default, if js is enabled, we will show this--*/
}
.main_image .block{
	width: 100%;
	background: #111;
	border-top: 1px solid #000;
}
.main_image a.collapse { /*--This is our hide/show tab--*/
	background: url(../img/btn_collapse.gif) no-repeat left top;
	height: 27px;
	width: 93px;
	text-indent: -99999px;
	position: absolute;
	top: -27px;
	right: 20px;
}
.main_image a.show {background-position: left bottom;}
.main_image .desc .block .left1{
	clear:both;
   position: relative;
   float: left;
   left: 5px;
   width: 200px;
   height: 416px;
}
.main_image .desc .block .left2{
   position: relative;
   float: left;
   left: 15px;
   width: 100px;
   height: 416px;
}
.main_image .desc .block .right{
   position: relative;
   float: right;
   right: 5px;
   width: 200px;
   height: 416px;
}
.image_thumb {
	float: left;
	width: 390px;
	background: #f0f0f0;
	border-right: 1px solid #fff;
	border-top: 1px solid #ccc;
}
.image_thumb img {
	border: 1px solid #ccc;
	padding: 5px;
	background: #fff;
	float: left;
}
.image_thumb ul {
	margin: 0;
	padding: 0;
	list-style: none;
}
.image_thumb ul li{
	margin: 0;
	padding: 12px 10px;
	background: #f0f0f0 url(nav_a.gif) repeat-x;
	width: 370px;
	float: left;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-right: 1px solid #ccc;
}
.image_thumb ul li.hover { /*--Hover State--*/
	background: #ddd;
	cursor: pointer;
}
.image_thumb ul li.active { /*--Active State--*/
	background: #fff;
	cursor: default;
}
html .image_thumb ul li h2 {
	font-size: 1.2em;
	margin: 5px 0;
	padding: 0;
}
.image_thumb ul li .block {
	float: left;
	margin-left: 10px;
	padding: 0;
	width: 290px;
}
.image_thumb ul li p{display: none;}/*--Hide the description on the list items--*/

a{ font-size: 1.0em; color:#FFFFFF; text-decoration:none}
a:hover{text-decoration:underline}
a:visited{color:#FFFFFF; text-decoration:none}
-->
</style>
<script type="text/javascript">
$(document).ready(function() {	

	//Show Banner
	$(".main_image .desc").show(); //Show Banner
	$(".main_image .block").animate({ opacity: 0.85 }, 1 ); //Set Opacity

	//Click and Hover events for thumbnail list
	$(".image_thumb ul li:first").addClass('active'); 
	$(".image_thumb ul li").click(function(){ 
			var imgTitle = $(this).find('.img_').attr("id");
				
		if ($(this).is(".active")) {  //If it's already active, then...
			return false; // Don't click through
		} else {
			//Animate the Teaser
			$(".main_image img").attr({ src: imgTitle });
		}
		
		$(".image_thumb ul li").removeClass('active'); //Remove class of 'active' on all lists
		$(this).addClass('active');  //add class of 'active' on this list only
		return false;
		
	}) .hover(function(){
		$(this).addClass('hover');
		}, function() {
		$(this).removeClass('hover');
	});
			
	//Toggle Teaser
	$("a.collapse").click(function(){
		$(".main_image .block").slideToggle();
		$("a.collapse").toggleClass("show");
	});
	
});//Close Function
</script>
</head>

<body>
<cfoutput>
<div class="main_image" style="background-image:url(../img/Button_likeJoin.jpg)">
	<img src="../docs/#weekMenu.banner#" alt="" />
	<div class="desc">
		<a href="##" class="collapse">Close Me!</a>
		<div class="block">
			<h2>#weekMenu.name# #weekMenu.year#</h2>
			<small>Date</small>
			<p>Copy</p>
		</div>
	</div>
</div>
</cfoutput>
<div class="image_thumb">
	<ul>
<cfoutput query="weekMenu">
		<li>
			<a href="../docs/#weekMenu.banner#" ></a>
				<h2>#weekMenu.name# #weekMenu.year#</h2>
				<div class="img_" id="../docs/#weekMenu.banner#"></div>
                <div class="Desc_" id="#weekMenu.id#"></div>
		</li>
 </cfoutput>
	</ul>
</div>
</body>
</html>