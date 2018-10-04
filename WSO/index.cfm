<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get">
	SELECT id, wso_name, wso_currency, wso_cost, wso_descr 
	FROM events 
	WHERE event_type = 'wso' ORDER BY event_expire
</cfquery>    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
	 hs.preserveContent = false;
</script>
<style type="text/css">
* {    font-family: Verdana, Helvetica;    font-size: 10pt;}
.highslide-html {    background-color: white;}
.highslide-html-content {	position: absolute;    display: none;}
.highslide-loading {    display: block;	color: black;	font-size: 8pt;	font-family: sans-serif;	font-weight: bold;    text-decoration: none;	padding: 2px;	border: 1px solid black;    background-color: white; 
}
.control {	float: right;    display: block;    /*position: relative;*/	margin: 0 5px;	font-size: 9pt;    font-weight: bold;	text-decoration: none;	text-transform: uppercase;	color: #999;}
.control:hover {	color: black !important;}
.highslide-move {    cursor: move;}
.highslide-display-block {    display: block;}
.highslide-display-none {    display: none;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>

<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Petro21 World Strategy Online:  -- <span class="header_title">Edit Entries </span></div>
<div id="outer">
	<div id="iner">
    	<div class="sectionHeader">World Strategy Online</div>
    	<div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>

			<cfoutput query="get">
            <div style="border-left:6px solid ##990000; padding:0 0 0 10px; height:auto" >
            	<div style="border-bottom:1px dotted ##CCCCCC; font-size:15px; padding:8px 0 0 0"><a href="editWso.cfm?id=#get.id#" id="wso#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 460, objectHeight: 500} )" class="highslide">#wso_name#</a></div>
                	<div style="clear:both; float:left; width:80px;">#wso_currency# #numberformat(wso_cost, "999999.99")#</div><div style="clear:right; float:left">#wso_descr#</div>
            
            </div>
            <div class="clear">
            </cfoutput>
            <div class="clear">
          
    </div>
</div>

<div class="highslide-html-content" id="highslide-html" style=" width:460px; height:500px;">
	<div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
    <div class="highslide-body"></div>
</div>
</body>
</html>