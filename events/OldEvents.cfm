<cfinclude template="../Application.cfm">

<cfquery name=event datasource="#gpp#">
   	SELECT 
    	webID AS id, 
        	id_gpp, 
            event_name, 
            event_type, 
            DAY(event_expire) AS event_days, 
            MONTH(event_expire) AS event_month, 
            YEAR(event_expire) AS event_year,  
            Econf, 
            event_expire, 
            event_abbr, 
            groupby, 
            live
   	FROM 
    		tblAnnual_Conf
	WHERE 
    		( event_type = 'Week' OR event_type = 'CLUB' OR event_type = 'EB' OR event_type = 'EVENT' OR event_type = 'DIN' ) 
            AND event_expire < #now()#
   	ORDER BY  
    		event_expire desc, groupby
</cfquery>
<cfset SetWeek = "">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>
<style type="text/css">
<!--
.header{clear:both;border-bottom:1px solid #539ad2; font-weight:bold; height:20px; margin:25px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;}
.row{
	clear:both;
	overflow:hidden;
	margin:0px;
}
.row .icon {
	float:left;
	clear:left;
	width:20px;
	padding:2px;
	margin:0px;	
}

.row .abre {
	float:left;
	clear:right;
	width:54px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;
}
.row .name {
	float:left;
	clear:right;
	width:350px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;
}
.row .date {
	float:left;
	clear:right;
	width:84px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;
}
.row .update {
	float:left;
	clear:right;
	width:160px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;
}
.row .econf {
	float:left;
	clear:right;
	width:31px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;
}
.row .del {
	float:left;
	clear:right;
	width:20px;
	padding:2px;
	margin:0px;
}
-->
</style>
<!---<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
	 hs.preserveContent = false;
</script>--->
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
        <link type="text/css"  rel="stylesheet" href="http://www.petro21.com/my-office/javascript/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/colorbox/jquery.colorbox.js"></script>
<script type="text/javascript" >
$(document).ready(function(){
$("a[rel*='colorbox']").colorbox({iframe:true, width: "100%", height: "97%"});
});
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
</style></head>

<body>

<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Current Events: -- <span class="header_title">Full List</span></div>
<div id="outer">
	<div id="iner">

        <table width="100%" border="0" cellspacing="4" cellpadding="2" bgcolor="#F2F1FF">
<cfoutput query="event">
  <tr <cfif event.event_type EQ "week"> bgcolor="##FFFFCC"</cfif>>
  	<td width="20"><a href="dsp_edit_New.cfm?id=#id#" ><img src="../img/new_edit.gif" border="0" /></a></td>
    <td width="385"><span class="event_name#id#" id="#id#">#event_name#</span> #event_year#</td>
    <td width="20"><cfif event.id_gpp NEQ ""><img src="../img/contract_type.gif" width="15" height="16" /><cfelse><a href="selectGPP_id.cfm?id=#event.id#&field=id_gpp"rel="colorbox" ><img src="../img/contract_add.gif" border="0" /></a></cfif></td>
    <td width="100"><span class="event_expire#id#" id="#id#">#DATEformat(event_expire, 'dd mmm yyyy')#</span></td>
    <td width="150"><span class="event_days#id#" id="#id#">#event_days#</span> #event_month#</td>
    <td>#groupby#</td>
    <td style="font-size:9PX">http://wwwpetro21.com/events/index.cfm?id=#id#</td>
<!---    <cfif Session.username EQ "jerome"></cfif>
--->    <td width="20"><a href="eventCopy.cfm?id=#id#"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'copy', objectType: 'iframe', objectWidth: 300, objectHeight: 400} )" class="highslide"><img src="../img/new_edit.gif" border="0" /></a></td>
	
  </tr>
</cfoutput>
</table>

	</div>
</div>

<div class="highslide-html-content" id="highslide-html" style="width: 550px; height:440px">
	<div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
    <div class="highslide-body"></div>
</div>

<div class="highslide-html-content" id="copy" style="width: 300px; height:400px">
	<div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
    <div class="highslide-body"></div>
</div>

</div>
</div>
<div class="highslide-html-content" id="program" style="width: 1020px; height:900px">
	<div class="highslide-move" style="border: 0; height: 18px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
	<div class="highslide-body"></div>
</div>

</body>
</html>