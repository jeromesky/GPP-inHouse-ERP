<cfinclude template="../Application.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>

<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
</script>
<style type="text/css">
* {
    font-family: Verdana, Helvetica;
    font-size: 10pt;
}
.highslide-html {
    background-color: white;
}
.highslide-html-content {
	position: absolute;
    display: none;
}
.highslide-loading {
    display: block;
	color: black;
	font-size: 8pt;
	font-family: sans-serif;
	font-weight: bold;
    text-decoration: none;
	padding: 2px;
	border: 1px solid black;
    background-color: white;
    
    /*padding-left: 22px;
    background-image: url(highslide/graphics/loader.white.gif);
    background-repeat: no-repeat;
    background-position: 3px 1px;*/   
}

.control {
	float: right;
    display: block;
    /*position: relative;*/
	margin: 0 5px;
	font-size: 9pt;
    font-weight: bold;
	text-decoration: none;
	text-transform: uppercase;
	color: #999;
}
.control:hover {
	color: black !important;
}
.highslide-move {
    cursor: move;
}

.highslide-display-block {
    display: block;
}
.highslide-display-none {
    display: none;
}
</style>
<script type="text/javascript">
<!--
function toggleLayer(whichLayer)
{
if (document.getElementById)
{
// this is the way the standards work
var style2 = document.getElementById(whichLayer).style;
style2.display = style2.display? "":"block";
}
else if (document.all)
{
// this is the way old msie versions work
var style2 = document.all[whichLayer].style;
style2.display = style2.display? "":"block";
}
else if (document.layers)
{
// this is the way nn4 works
var style2 = document.layers[whichLayer].style;
style2.display = style2.display? "":"block";
}
}
// -->
</script>
<style type="text/css">
<!-- 
#commentForm1
{
background-color:#FFFFFF;
padding:0px 0 0 0px;
width:740px;
display:none;

}
#commentForm2
{
background-color:#FFFFFF;
padding:0px 0 0 0px;
width:740px;
display:none;

}
-->
</style>
<style type="text/css">
<!--
.style2 {	font-size: 11px;	font-family: Arial, Helvetica, sans-serif;	color: ##CC0000;}
.style3 {	font-size: 11px;	font-family: Arial, Helvetica, sans-serif;	color: ##00CC33;}
.style4 {	font-family: Arial, Helvetica, sans-serif;	font-size: 12px;	color: ##333333;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: Arial, Helvetica, sans-serif;
	line-height:130%;
	font-size: 12px;
	color: #333333;
}#Layer1 {
	position: relative;


	width:132px;
	height:6px;
	z-index:1;
	visibility: hidden;
}

a {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #003366;
	text-decoration: underline;
}
.row{
	clear:both;
	overflow:hidden;
}
.row .box1 {
	float:left;
	clear:left;
	height:426px;
	width:297px;
	background-color:#d7d7d7;
	padding:15px 10px 10px 10px;
	margin:0 10px 0 0;
	border:1px solid #a9a9a9;
	border-right:1px solid #AAAAAA;
}

.row .box2 {
	float:left;
	clear:right;
	width:324px;
	height:426px;
	color: #335EA8;
	padding:4px;
	background-color:#fff;
	border:1px solid #a9a9a9;
}
.columntitle{width:77px;clear:both; float:left; }
.columntext{clear:right; float:left}

.columntag{ width:160px;clear:both; float:left;}
.columndescription{clear:right; float:left}
.break {clear:both}
.breakmargin{clear:both; margin-bottom:15px;}

strong{color:#388BCF}
#headlinks{border:1px solid #a9a9a9; width:631px; height:40px; padding:10px 10px 2px 20px; margin:0 0 10px 0;}
#head{border:1px solid #a9a9a9; width:636px; height:56px; padding:20px 10px 2px 15px; margin:0 0 10px 0;}
div.transOFF {width: 129px; clear:both; float:left; }
div.transON {width: 129px; opacity:.50;filter: alpha(opacity=50); -moz-opacity: 0.5; clear:both; float:left; }
div.transOFF2 {width: 129px; clear:right; float:left; }
div.transON2 {width: 129px; opacity:.50;filter: alpha(opacity=50); -moz-opacity: 0.5; clear:right; float:left; }
-->
</style>
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
</script>
<style type="text/css">
* {
    font-family: Verdana, Helvetica;
    font-size: 10pt;
}
.highslide-html {
    background-color: white;
}
.highslide-html-content {
	position: absolute;
    display: none;
}
.highslide-loading {
    display: block;
	color: black;
	font-size: 8pt;
	font-family: sans-serif;
	font-weight: bold;
    text-decoration: none;
	padding: 2px;
	border: 1px solid black;
    background-color: white;
    
    /*padding-left: 22px;
    background-image: url(highslide/graphics/loader.white.gif);
    background-repeat: no-repeat;
    background-position: 3px 1px;*/   
}

.control {
	float: right;
    display: block;
    /*position: relative;*/
	margin: 0 5px;
	font-size: 9pt;
    font-weight: bold;
	text-decoration: none;
	text-transform: uppercase;
	color: #999;
}
.control:hover {
	color: black !important;
}
.highslide-move {
    cursor: move;
}

.highslide-display-block {
    display: block;
}
.highslide-display-none {
    display: none;
}
</style>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Stats for Mailouts -- </div>
<div id="outer">
	<div id="iner">


<div id="headlinks">
	<div class="transOFF" onmouseover="this.className='transON'" onmouseout="this.className='transOFF'"><a href="index.cfm?incl=banners"><img src="../img/stats_banners.gif" border="0" /></a></div>
	<div class="transOFF2" onmouseover="this.className='transON2'" onmouseout="this.className='transOFF2'"><a href="index.cfm?incl=mail"><img src="../img/stats_mailout.gif" border="0" /></a></div>
	<div class="transOFF2" onmouseover="this.className='transON2'" onmouseout="this.className='transOFF2'"><a href="../stats.cfm" target="_blank"><img src="../img/stats_website.gif" border="0" /></a></div>
</div>
<cfif incl eq "mail">
	<cfinclude template="mailout.cfm">
</cfif>
<cfif incl eq "banners">
	<cfinclude template="banners.cfm">
</cfif>
	<div style="clear:both"></div>	
  </div>
</div>
</body>
</html>