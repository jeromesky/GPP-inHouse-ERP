<cfinclude template="../Application.cfm">

<cfquery name=event datasource="#dsnP21#" >
   	SELECT id, event_name, event_type, event_days, event_month, event_year, last_updated,  Econf, event_expire, event_abbr, groupby, live
   	FROM events
	WHERE ( event_type = 'RE' or event_type = 'CLUB' or event_type = 'BOOK' or event_type = 'advis' or event_type = 'CM') 
   	ORDER BY  event_expire asc
</cfquery>
<cfset SetWeek = "AND event_expire > #now()#">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>www.petro21.com</title>
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
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
	 hs.preserveContent = false;
</script>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
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
		
		<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new Oil Week</div> 
			</div>
		</div>

		<div class="header">Dinner / Clubs</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new Club</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "CLUB">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 

				<div class="econf" ><span class="live" id="#id#"><cfif live EQ 1><span style="color:##00CC00">Yes</span><cfelse>No</cfif></span></div>
  				<div class="del"><!---<a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a>---></div> 
                <div class="name" style="width:430px; font-size:10PX">http://wwwpetro21.com/events/index.cfm?id=#id#</div>
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>

		<div class="header">Content Management</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add  new Content</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "CM">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 

				<div class="econf" ><span class="live" id="#id#"><cfif live EQ 1><span style="color:##00CC00">Yes</span><cfelse>No</cfif></span></div>
  				<div class="del"><!---<a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a>---></div> 
                <div class="name" style="width:430px; font-size:10PX">http://wwwpetro21.com/events/index.cfm?id=#id#</div>
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>
    
 	<div class="header">Research</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add  new Research page</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "RE">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 

				<div class="econf" ><span class="live" id="#id#"><cfif live EQ 1><span style="color:##00CC00">Yes</span><cfelse>No</cfif></span></div>
  				<div class="del"><!---<a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a>---></div> 
                <div class="name" style="width:430px; font-size:10PX">http://wwwpetro21.com/events/index.cfm?id=#id#</div>
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>


 	<div class="header">Books</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add  new Book</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "BOOK">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 

				<div class="econf" ><span class="live" id="#id#"><span class="live" id="#id#"><cfif live EQ 1><span style="color:##00CC00">Yes</span><cfelse>No</cfif></span></span></div>
  				<div class="del"><!---<a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a>---></div> 
                <div class="name" style="width:430px; font-size:10PX">http://wwwpetro21.com/events/index.cfm?id=#id#</div>
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>
        
    
  	<div class="header">Advisory</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add  new Advisory</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "advis">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 

				<div class="econf" ><span class="live" id="#id#"><cfif live EQ 1><span style="color:##00CC00">Yes</span><cfelse>No</cfif></span></div>
  				<div class="del"><!---<a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a>---></div> 
                <div class="name" style="width:430px; font-size:10PX">http://wwwpetro21.com/events/index.cfm?id=#id#</div>
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>

<!--  pop up  -->
	</div>
</div>

<!--  pop up  -->
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

<script type="text/javascript">
$(function() {
		$('.live').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'live',
			submit    : 'OK',
			width		: 30,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});	});
</script>
</body>
</html>