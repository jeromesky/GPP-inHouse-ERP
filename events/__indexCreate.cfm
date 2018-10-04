<cfinclude template="../Application.cfm">

<cfquery name=event datasource="#dsnP21#" >
   	SELECT id, event_name, event_type, event_days, event_month, event_year, last_updated,  Econf, event_expire, event_abbr, groupby
   	FROM events
	WHERE (event_type = 'event' or event_type  = 'EB' or event_type = 'DIN' or event_type = 'Week' or event_type = 'RE' or event_type = 'CLUB' or event_type = 'BOOK' or event_type = 'advis' or event_type = 'CM')
   	ORDER BY event_expire asc
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="javascript">
function confirmDelete(aURL) {if(confirm('Are you sure you want to delete this event?')) {location.href = aURL;}}
</script>
<link rel="stylesheet" href="../img/p21-gry.css" type="text/css" mcedia="screen" title="grey" />
<LINK REL=stylesheet TYPE="text/css" HREF=../ute_301/images/ute.css>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>
<style type="text/css">
<!--
.header{clear:both;border-bottom:1px solid #539ad2; font-weight:bold; height:20px; margin:17px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;}
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
	width:300px;
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
<div id="header">Current Events: -- <span class="header_title">Full List</span></div>
<div style="margin:10px 20px 0 20px; background-color:#EFEFEF; padding:10px 20px 10px 20px;">
	<div style="background-color:#fff; padding:25px 15px 15px 15px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#76787a;">
    	<div style="margin:8px; padding:8px; border:1px solid #336600; color:#336600; font-size:12px; "><a href="refreshpage.cfm"><img src="../img/reload_page.jpg" border="0"> </a>Refresh Page</div>
		<div class="header">Oil Week</div>
		<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new Oil Week</div> 
			</div>
		</div>
        			<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"></div> 
				<div class="abre" ><strong>Abb</strong></div>
  				<div class="name"><strong>Event</strong></div> 
				<div class="date" ><strong>End date</strong></div>
  				<div class="update"><strong>date</strong></div> 
				<div class="econf" style="width:50px;" ><strong>E-conf</strong></div>
                <div class="econf" style="width:50px;" ><strong>Copy</strong></div>
  				 
			</div>
		</div>
		<cfloop query="event"><cfoutput><cfif event.event_type EQ "Week" AND event.event_expire GT #datenow#>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
				<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
                <div class="econf" ><a href="eventCopy.cfm?id=#event.id#"><img src="../img/new_edit.gif" border="0" /></a></div>
			</div>
		</div>
		</cfif></cfoutput></cfloop>
<!--- next ------------------------------------------------------------------------------------------->
		<div class="header">Events</div>
		<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new event</div> 
			</div>
		</div>
		<cfloop query="event"><cfoutput><cfif event.event_type EQ "event" AND event.event_expire GT #datenow#>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
				<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
                <div class="econf" ><a href="eventCopy.cfm?id=#event.id#"><img src="../img/new_edit.gif" border="0" /></a></div>
			</div>
		</div>
		</cfif></cfoutput></cfloop>
<!--- next ------------------------------------------------------------------------------------------->
		<div class="header">Briefings</div>
		<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new Briefing</div> 
			</div>
		<cfloop query="event"><cfoutput><cfif event.event_type EQ "eb" AND event.event_expire GT #datenow#>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  <div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
                <div class="econf" ><a href="eventCopy.cfm?id=#event.id#"><img src="../img/new_edit.gif" border="0" /></a></div>
			</div>
		</div>
		</cfif></cfoutput></cfloop>
<!--- next -------------------------------------------------------------------------------------------->
		<div class="header">Dinners</div>
		<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new Dinner</div> 
			</div>
		<cfloop query="event"><cfoutput><cfif event.event_type EQ "DIN" AND event.event_expire GT #datenow#>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
                <div class="econf" ><a href="eventCopy.cfm?id=#event.id#"><img src="../img/new_edit.gif" border="0" /></a></div>
			</div>
		</div>
		</cfif></cfoutput></cfloop>
<!--- CLUBS next -------------------------------------------------------------------------------------------->
		<div class="header">Dinner Clubs</div>
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
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>
        <!--- BOOKS next -------------------------------------------------------------------------------------------->
		<div class="header">BOOKS</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new book</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "book">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
			</div>
		</div>
		</cfif></cfoutput></cfloop>
        <!--- BOOKS next -------------------------------------------------------------------------------------------->
		<div class="header">Advisory</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add new Advisory page</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "Advis">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
			</div>
		</div>
		</cfif></cfoutput></cfloop>
<!--- Content Management next -------------------------------------------------------------------------------------------->
		<div class="header">Content Management</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add new Content Management page</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "CM">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
			</div>
		</div>
		</cfif></cfoutput></cfloop>     
<!--- Research next -------------------------------------------------------------------------------------------->
		<div class="header">Research</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new resdearch page</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "RE">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 
				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a></div> 
			</div>
		</div>
		</cfif></cfoutput></cfloop>
<!--- Old Events next ------------------------------------------------------------------------------>
		<div class="header">Old Events</div>

		<cfloop query="event"><cfoutput><cfif event.event_expire LT #datenow# AND (event_type eq "EVENT" OR event_type eq "EB" OR event_type eq "din" OR event_type eq "week"  )>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  <div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
                <div class="econf" ><a href="eventCopy.cfm?id=#event.id#"><img src="../img/new_edit.gif" border="0" /></a></div>
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>
		<div style="clear:both"></div>
	</div>
</div>

<div class="highslide-html-content" id="highslide-html" style="width: 550px; height:440px">
	<div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
    <div class="highslide-body"></div>
</div>
</body>
</html>
