<cfinclude template="../Application.cfm">
<cfquery datasource="stats" name="getUnique">
SELECT distinct company 
FROM counter
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/prototype.js"></script>
<script type="text/javascript" src="../javascript/eip.js"></script>
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>

<script type="text/javascript" src="../Javascript/Tiny_mce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
	 hs.preserveContent = false;
</script>
<!---
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    var options = { 
        target:        '#output',   // target element(s) to be updated with server response 
        clearForm: true        // clear all form fields after successful submit 
    };  
    $('#addbook').submit(function() { 
		
		$(this).ajaxSubmit(options); 
		$("#reviewarea").load("bookreview.cfm");
		return false; 
		
    }); 
});  
</script>
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    var options = { 
        target:        '#output',   // target element(s) to be updated with server response 
        clearForm: true        // clear all form fields after successful submit 
    };  
    $('#addreview').submit(function() { 
		 $('form').bind('form-pre-serialize', function(e) {
    		tinyMCE.triggerSave();
			}); 
		$(this).ajaxSubmit(options); 
		$("#reviewarea").load("bookreview.cfm");
		$("#listarea").load("booksList.cfm?id="+$("#bookid").val()+"");
		return false; 
		
    }); 
});  
</script>


    <script type="text/javascript">
		function reviewLoad(id) {
			$("#reviewarea").load("bookreview.cfm?id="+id+"");
		}
	</script>--->
    <script type="text/javascript">
		function statsLoad(company, eventid) {
			$("#statsarea").load("publicMailoutStats.cfm?company="+company+"&eventid="+eventid+"");
		}
	</script>
    <script type="text/javascript">
		function datesLoad(id) {
			$("#SelDates").load("publicMailoutDates.cfm?company="+id+"");
		}
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
<title>P21</title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">Petro21 Book Reviews:  -- <span class="header_title">Add a Edit Entries and books</span></div>
<div id="outer">
	<div id="iner">

<div style="clear:both; float:left; width:300px;">
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
<ul>
<cfloop query="getUnique">
<cfquery datasource="#dsnP21#" name="company">SELECT company FROM logos WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getUnique.company#"></cfquery>
	<li><cfoutput><a href="" ><img src="../img/new_delete.gif" /></a> <a href="javascript:datesLoad(#getUnique.company#);" >#company.company#</a> </cfoutput></li>
</cfloop>    
</ul>
</div>
<div id="SelDates" style="clear:right; float:left; width:400px;">

</div>
      <div class="sectionHeader" style=" clear:both;margin:30px 0 0 0 ;">Stats Results for event</div>
     <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div> 

     <div id="statsarea">

     </div>

</div>
</div>

</body>
</html>