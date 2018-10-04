<!---<cfinclude template="../Application.cfm">--->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>p21</title>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<style type="text/css">

div.trigger {
	padding: 0 0 0 50px;
	margin: 0 0 5px 0;
	background: url(http://www.sohtanaka.com/web-design/examples/toggle/h2_trigger_a.gif) no-repeat;
	height: 46px;
	line-height: 46px;
	width: 450px;
	font-size: 2em;
	font-weight: normal;
	float: left;
}
div.trigger a {
	color: #fff;
	text-decoration: none;
	display: block;
}
div.trigger a:hover {
	color: #ccc;
}
div.active {background-position: left bottom;}
.toggle_container {
	margin: 0 0 5px;
	padding: 0;
	border-top: 1px solid #d6d6d6;
	background: #f0f0f0 url(http://www.sohtanaka.com/web-design/examples/toggle/toggle_block_stretch.gif) repeat-y left top;
	overflow: hidden;
	font-size: 1.2em;
	width: 500px;
	clear: both;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	var url 	= "changeIMGupdate.cfm" ;
	//var getId 	= "";
	var getId = $("div").attr("id");


	$("div.trigger").toggle(function(){
		$(this).addClass("active");
		$("#showState").html($(this).attr("id"););
		//var getId = $(this).addClass("active"); 
		//$.post(url, {id: id, value: 1 }, function(){ $("#showState").html("1"); });
				//
		}, function () {
		$(this).removeClass("active");
		$("#showState").html($(this).attr("id"););
		//$.post(url, {id: id, value: 1 }, function(){ $("#showState").html("0"); });
	});

});
</script>
</head>

<body>
<div class="trigger" id="254"><!---<a href="#">Web Design &amp; Development</a>---></div>
<div class="trigger" id="729"><!---<a href="#">Web Design &amp; Development</a>---></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="showState"></div>
</body>
</html>