<!---<cfif parameterexists(form.publisher)>
	<cfquery datasource="#dsnP21#">
		INSERT INTO books(title, author, subtitle, publisher, publishdate)
  		VALUES('#form.title#', '#form.author#', '#form.subtitle#', '#form.publisher#', <cfqueryparam cfsqltype="cf_sql_date" value="#form.publishdate#">)
	</cfquery>
</cfif>

<cfif parameterexists(form.bookid)>
	<cfquery datasource="#dsnP21#">
		INSERT INTO bookreview(bookid, title, content, source)
		VALUES('#form.bookid#', '#form.title#', '#form.content#', '#form.source#')
	</cfquery>
</cfif>
<cfif parameterexists(url.del)>
	<cfquery datasource="#dsnP21#">
    	DELETE FROM bookreview WHERE id = #url.id#
    </cfquery>
</cfif>--->

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
<script language="javascript">
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    var options = { 
        target:        '#msgcategory',   // target element(s) to be updated with server response 
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
        target:        '#msgReview',   // target element(s) to be updated with server response 
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
	</script>
    <script type="text/javascript">
		function listLoad(id) {
			$("#listarea").load("booksList.cfm?id="+id+"");
		}
	</script>
    <script type="text/javascript">
		function listDelete(itemidid, id) {
			$("#listarea").load("booksList.cfm?delete="+itemidid+"&id="+id+"");
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

<body onload="javascript:reviewLoad(11);">
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Petro21 Book Reviews:  -- <span class="header_title">Add a Edit Entries and books</span></div>
<div id="outer">
	<div id="iner">
<div style="">
    <div class="sectionHeader">Add a New Media Category</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
    <form method="post" action="booksave.cfm" id="addbook">
	  <table width="800" border="0" cellspacing="4">
        <tr>
          <td colspan="4"><span id="msgcategory" style="color:#CC3300"></span><span id="msgReview" style="color:#CC3300"></span> </td>
        </tr>
        <tr>
          <td width="115">Media Type Title</td>
          <td width="228"><input type="text" name="title" maxlength="45" /></td>
          <td width="199" >Media text other</td>
          <td width="230" ><input type="text" name="author" maxlength="80" /></td>
        </tr>
        <tr>
          <td valign="top">Media explenation</td>
          <td><textarea  name="subtitle"  maxlength="500" /></textarea></td>
          <td>&nbsp;</td>
          <td valign="top"><input type="submit" name="button2" value="Submit" /> </td>
        </tr>
      </table>
    </form> 
      <div class="sectionHeader" style="margin:30px 0 0 0 ;">Add Media Review</div>
     <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div> 
    <form id="addreview" method="post" action="reviewSave.cfm">
     <div id="reviewarea">

     </div>
     </form>
</div>     
<div id="listarea"> 

</div>  
     <div style="clear:both"></div>
	</div>
    <div style="clear:both"></div>
</div>
</div>

<div class="highslide-html-content" id="highslide-html" style=" width:430px; height:150px;">
	<div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
    <div class="highslide-body"></div>
</div>

<div class="highslide-html-content" id="video" style=" width:630px; height:400px;">
	<div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
    <div class="highslide-body"></div>
</div>

<div class="highslide-html-content" id="videoEdit" style=" width:430px; height:250px;">
	<div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
    <div class="highslide-body"></div>
</div>
</body>
</html>
<!--- list AREA
<cfparam name="url.cat" default="#getboob.id#" >
<cfquery datasource="#dsnP21#" name="get">SELECT id, title, source FROM bookreview WHERE bookid = #url.cat# </cfquery>    
      <div class="sectionHeader">Current Books &amp; Reviews for 	<cfoutput query="getboob"><cfif getboob.id EQ url.cat>#getboob.title#</cfif></cfoutput>	</div>
     <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div> 

     <div  style="clear:right; float:left; width:800px; height:400px; overflow:auto">


<cfoutput query="get">
<div style="border-bottom:1px dotted ##CCCCCC; padding:3px">
	<div><a href="play.cfm?id=#get.id#" id="video#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'video', objectType: 'iframe',		objectWidth: 430, objectHeight: 380} )" class="highslide" style="text-decoration:none">#title#</a></div>
    <div style="clear:both; float:left; width:720px;">#source#</div>
    <div style="clear:right; float:left; width:24px"><a href="editVideo.cfm?id=#get.id#" id="videoEdit#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'videoEdit', objectType: 'iframe',		objectWidth: 430, objectHeight: 250} )" class="highslide"><img src="../img/new_edit.gif" /></a></div>
    <div style="clear:right; float:left; width:24px"><a href="index.cfm?del=1&cat=#url.cat#&id=#get.id#"><img src="../img/new_delete.gif" border="0" /></a></div>
        <div class="clear"></div>
</div>
</cfoutput>
        </div>
 --->
