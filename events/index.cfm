<cfinclude template="../Application.cfm">

<cfquery name=event datasource="#gpp#" >
   	SELECT webID AS id, event_name, event_type, event_days, event_month, event_year,   Econf, event_expire, event_abbr, groupby, live
   	FROM tblAnnual_Conf
	WHERE ( event_type = 'Week' ) AND event_expire > #dateAdd("d", -10, now())#
   	ORDER BY  event_expire asc, groupby
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
<link rel="stylesheet" type="text/css" href="../javascript/jquerydatepicker/datePicker.css" media="screen" />
<script type="text/javascript" src="../javascript/jquerydatepicker/jquery.datePicker.js"></script>
<script type="text/javascript" src="../javascript/jquerydatepicker/jquery.jeditable.datepicker.js" ></script>
<script type="text/javascript" src="../javascript/date.js"></script>
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
 
<cfloop query="event">
<cfoutput>
<cfif event.event_type EQ "Week">
<div class="header">&nbsp;</div>
        <table width="100%" border="0" cellspacing="4" cellpadding="2" bgcolor="##F2F1FF">
  <tr>
  	<td width="20"><a href="dsp_edit_new.cfm?id=#id#" ><img src="../img/new_edit.gif" border="0" /></a></td>
    <td width="385"><span class="event_name#id#" id="#id#">#event_name#</span> #event_year#</td>
    <td width="100"><span class="event_expire#id#" id="#id#">#DATEformat(event_expire, 'dd mmm yyyy')#</span></td>
    <td width="150"><span class="event_days#id#" id="#id#">#event_days#</span> #event_month#</td>
    <td>#groupby#</td>
    <td style="font-size:9PX">http://www.petro21.com/events/index.cfm?id=#id#</td>
    <td width="60" align="center">program</td>
    <td width="40"><cfif event.live eq 0 OR event.live eq ""><span style="color:##CC0000"><span class="live#id#" id="#id#">Not Live</span><cfelseif event.live eq 1><span style="color:##00CC00"><span class="live#id#" id="#id#">Live</span></cfif></span></td>
    <cfif Session.staffName EQ "jerome">
    <td width="20"><a href="eventCopy.cfm?id=#id#"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'copy', objectType: 'iframe',		objectWidth: 300, objectHeight: 400} )" class="highslide"><img src="../img/new_edit.gif" border="0" /></a></td>
	<td width="20"><a href="delet.cfm?id=#id#"  ><img src="../img/new_delete.gif" border="0" /></a> </td>
	</cfif>
  </tr>
</table>
    <cfquery name="get" datasource="#gpp#" >
        SELECT webID AS id, event_name, event_type, event_days, event_month, event_year,   Econf, event_expire, event_abbr, groupby, event_cost_currency, event_cost_us, live
        FROM tblAnnual_Conf
        WHERE groupby = #event.groupby# AND event_type <> 'week' AND event_year = '#event.event_year#' AND event_expire > #dateAdd("d", -10, now())# AND  event_type <> 'spon' 
        ORDER BY  event_expire asc
    </cfquery>
    <table width="100%" border="0" cellspacing="4" cellpadding="2" >
		<cfloop query="get">

  <tr>
  	<td width="20"><a href="dsp_edit_new.cfm?id=#get.id#" ><img src="../img/new_edit.gif" border="0" /></a></td>
    <td width="50"><span class="event_abbr#get.id#" id="#get.id#">#get.event_abbr#</span></td>
    <td width="320"><span class="event_name#get.id#" id="#get.id#">#get.event_name#</span></td>
    <td width="90"><span class="event_expire#get.id#" id="#get.id#">#DATEformat(get.event_expire, 'dd mmm yyyy')#</span></td>
    <td  width="100"><span class="event_days#get.id#" id="#get.id#">#get.event_days#</span> #Left(get.event_month, 4)#</td>
    <td width="100"><span id="currency#get.id#">#event_cost_currency#</span> <span class="event_cost_us#get.id#" id="#get.id#">#NumberFormat(event_cost_us, "99999.99")#</span></td>
    
    <td style=" font-size:9PX">http://www.petro21.com/events/index.cfm?id=#get.id#&tc=#get.event_abbr#</td>
    <td width="60" align="center"><cfif get.event_type EQ "event"><a href="speakers_program.cfm?id=#get.id#&groupby=#get.groupby#&event_year=#get.event_year#" id="speakers" onClick="return hs.htmlExpand(this, { contentId: 'program', objectType: 'iframe',		objectWidth: 1020, objectHeight: 900} )" class="highslide">edit</a></cfif></td>
    <td width="40"><cfif get.live eq 0  OR get.live eq ""><span style="color:##CC0000"><span class="live#id#" id="#id#">Not Live</span><cfelseif get.live eq 1 ><span style="color:##00CC00"><span class="live#id#" id="#id#">Live</span></cfif></span></td>
    <cfif Session.staffName EQ "jerome">
    <td width="20"><a href="eventCopy.cfm?id=#get.id#"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'copy', objectType: 'iframe',		objectWidth: 300, objectHeight: 400} )" class="highslide"><img src="../img/new_edit.gif" border="0" /></a></td>
	<td width="20"><a href="delet.cfm?id=#get.id#"><img src="../img/new_delete.gif" border="0" /></a></td>
	</cfif>
  </tr></cfloop>
        </table>
</cfif>
</cfoutput>
</cfloop>

		<div class="header">Dinner Clubs</div>
	<div class="row" >	 
			<div>
  				<div class="icon"><a href="add_event.cfm"  id="event" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',		objectWidth: 550, objectHeight: 440} )" class="highslide"><img src="../img/new_add.gif" width="16" height="16" border="0" /></a></div>
  				<div class="name">Add a new Club</div> 
			</div> 

		<cfloop query="event"><cfoutput><cfif event.event_type EQ "CLUB">
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href="dsp_edit_new.cfm?id=#id#"><img src="../img/new_edit.gif"  border="0" /></a></div> 
			  	<div class="abre" >#event_abbr#</div>
  				<div class="name"><a href="dsp_edit_new.cfm?id=#id#" style="color:##333399">#event_name#</a></div> 
				<div class="date" >#DATEformat(event_expire, 'dd mmm yy')#</div>
  				<div class="update">#event_days# #event_month#</div> 

				<div class="econf" ><cfif Econf EQ 1>Yes<cfelse>No</cfif></div>
  				<div class="del"><!---<a href="javascript:confirmDelete('delet.cfm?id=#id#')"><img src="../img/new_delete.gif" width="16" height="16" border="0" /></a>---></div> 
                <div class="name" style="width:430px; font-size:10PX">http://www.petro21.com/events/index.cfm?id=#id#</div>
                
			</div>
		</div>
		</cfif></cfoutput></cfloop>

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

<script type="text/javascript">
$(function() {
<cfloop query="event">
<cfif event.event_type EQ "Week"> <cfoutput > 
    $('.event_expire#id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_expire',
			submit    : 'OK',
			width		: 60,
         	indicator : '<img src="../img/indicator.gif">',
			type      : 'datepicker',
         	tooltip   : 'Click to edit...'

     		});
	    $('.event_name#id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_name',
			submit    : 'OK',
			width		: 300,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			$('.event_days#id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_days',
			submit    : 'OK',
			width		: 80,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			$('.live#id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'live',
			submit    : 'OK',
			width		: 30,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
	</cfoutput>
    <cfquery name="get" datasource="#gpp#" >
        SELECT webID AS id, event_name, event_type, event_days, event_month, event_year,   Econf, event_expire, event_abbr, groupby
        FROM tblAnnual_Conf
        WHERE groupby = #event.groupby# AND event_type <> 'week' AND event_year = '#event.event_year#' AND event_expire > #now()#
        ORDER BY  event_expire asc
    </cfquery>
	<cfoutput query="get"> 
  $("##currency#get.id#").editable("IndexUpdate.cfm", { 
    id   : 'id',
    name : 'event_cost_eu',
	indicator : '<img src="../img/indicator.gif">',
    data   : "{'$':'USD - $','£':'UK - &pound;','EUR':'EU - &euro;','ZAR':'SA - ZAR'}",
    type   : "select",
    submit : "OK",
    style  : "inherit",
    submitdata : function() {
      return {id : #get.id#};
    }
  });
  
     $('.live#get.id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'live',
			submit    : 'OK',
			width		: 30,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
	$('.event_expire#get.id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_expire',
			submit    : 'OK',
			width		: 60,
         	indicator : '<img src="../img/indicator.gif">',
			type      : 'datepicker',
         	tooltip   : 'Click to edit...'

     		});
	    $('.event_name#get.id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_name',
			submit    : 'OK',
			width		: 300,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			$('.event_days#get.id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_days',
			submit    : 'OK',
			width		: 80,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			$('.event_cost_us#get.id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_cost_us',
			submit    : 'OK',
			width		: 40,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			$('.event_abbr#get.id#').editable('IndexUpdate.cfm', { 
        	id   : 'id',
			name : 'event_abbr',
			submit    : 'OK',
			width		: 40,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
</cfoutput>	
</cfif>			
</cfloop>	
			  });
			
</script>
</body>
</html>
