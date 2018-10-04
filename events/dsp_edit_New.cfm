<cfinclude template="../Application.cfm">
<cfquery name="qryEvent" datasource="#gpp#">
SELECT  
	*
FROM 
	[CRM_manage_events] 
WHERE 
	webid = #url.id#
</cfquery>

<!--- get HOTEL --->
<cfparam name="get_venue.VenueName" default="">
<cfparam name="get_venue.venueID" default="">
<!---<cfif qryEvent.hotel NEQ "">
  <cfquery name="get_venue" datasource="#gpp#">
SELECT     VenueName, venueID
FROM         venues
WHERE 	venueID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.hotel#">
</cfquery>
</cfif>--->
 <!---groupby = <cfqueryparam  value="#qryEvent.groupby#"> AND 
     YEAR(event_expire) = <cfqueryparam value="#datePart('yyyy', qryEvent.event_expire)#">) AND --->
<!--- get other events in this week to build top menu --->
<cfquery name="getSelect" datasource="#gpp#">
SELECT   
	eventID,   
	webid, 
    event_name, 
    event_type
FROM          	
	[CRM_events] 
WHERE   
     <cfif qryEvent.parentID EQ 0>
     	(parentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.eventID#"> OR
        eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.eventID#">)
     <cfelse>
     	(parentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.parentID#"> OR
        eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.parentID#">)
     </cfif>
     AND
     event_type IN ('event', 'eb', 'din', 'bu_pr' , 'week')
ORDER 
	BY event_type desc
</cfquery>
<cfset tabs_Exhib =  "">
<cfif qryEvent.event_type eq "event">
  <cfset tabs_Exhib =  "Exhebition Blurb">
  <cfelseif qryEvent.event_type eq "eb">
  <cfset tabs_Exhib = "Briefing extended Info">
  <cfelseif qryEvent.event_type eq "cm" OR qryEvent.event_type eq "Advis" OR qryEvent.event_type eq "book" OR qryEvent.event_type eq "RE" OR qryEvent.event_type eq "RE"  OR qryEvent.event_type eq "club">
  <cfset tabs_Exhib = "extended Info">
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.corner.js"></script><!---???--->
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.form.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jeditable.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/interface.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/fileUpload.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/_js/json.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquerydatepicker/jquery.jeditable.datepicker.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/date.js"></script><!---???--->
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.pnotify.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.CRM.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery.jeditable.UIdatepicker.js"></script>
<link type="text/css" rel="stylesheet" href="http://www.petro21.com/my-office/javascript/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/colorbox/jquery.colorbox.js"></script>
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<cfinclude template="include_functions.cfm">
<style type="text/css">
<!--
/*  drag layer styles*/
ul.sortableList {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
}
ul.sortableList li {
	cursor: move;
}
ul.sortableList li:HOVER {
	cursor: move;
	background-color: #F4F4F4;
}
.tabexOn {
	padding:15px 10px 3px 10px;
	margin-right:1px;
	color:#ffffff;
	font-size:11px;
	color:#333333;
	background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;
	font-family:Lucida Grande, Lucida Sans, Arial, sans-serif;
	line-height:1.3;
}
.tabexOff {
	padding:15px 10px 3px 10px;
	margin-right:1px;
	color:#2779AA;
	font-size:11px;
	color:#333333;
	background:#D7EBF9 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_80_d7ebf9_1x400.png) repeat-x scroll 50% 50%;
	font-family:Lucida Grande, Lucida Sans, Arial, sans-serif;
	line-height:1.3;
}
.infoText {
	font-size:10px;
	color:#990000
}
-->
</style>
<style type="text/css" media="all">
.groupWrapper {
}
.serializer {
	clear: both;
}
<!--
-.row {
 clear:both;
 margin-bottom:1px;
}
.row .col1 {
	position: relative;
	float: left;
	background-color:#FFFFFF;
	cursor: move;
	width:104px;
	padding:0px;
	margin:0px;
	height:45px;
	border-bottom: 1px solid #CCCCCC;
	border-left:1px solid #CCCCCC;
	border-top:1px solid #CCCCCC
}
.row .col2 {
	position: relative;
	float: left;
	width:184px;
	margin:0 0 0 0px;
	padding:10px 0 0 10px;
	height:35px;
	border-bottom: 1px solid #CCCCCC;
	border-right:1px solid #CCCCCC;
	border-top:1px solid #CCCCCC
}
.sortHelper {
	border: 2px solid #F2F2F2;
	width: auto !important;
}
.paneSeperator {
	border-right:1px dotted #CCCCCC
}
.titlesection {
	font-family:"Century Gothic", "Century Schoolbook", Georgia;
	color:#3366CC;
	margin:8px 0 20px 10px
}
.columnPading {
	padding:20px
}
.ulLeft {
	list-style-type: none;
	list-style-position: 0px;
	float:left;
	margin:0px;
	padding:15px 0px 0px 0px;
}
.ulMidle {
	list-style-type: none;
	list-style-position: 0px;
	float:left;
	margin:0px;
	padding:15px 10px 0px 0px;
}
.ulLeft li {
	list-style-type: none;
	height:20px;
	border-bottom:1px solid #CCCCCC;
	padding:4px 0 4px 10px;
	width:190px;
	margin:0px;
}
.ulMidle li {
	list-style-type: none;
	height:20px;
	border-bottom:1px solid #CCCCCC;
	padding:4px 0 4px 10px;
	width:335px;
	margin:0px;
}
.column1 {
	width:300px;
	position: relative;
	float: left;
	margin:0 10px 0 0
}
.column2 {
	width:300px;
	position: relative;
	float: left;
	;
	margin:0 10px 0 0
}
#tabs h4 {
	border-bottom:1px solid #aed0ea;
	font-family:Lucida Grande, Lucida Sans, Arial, sans-serif;
	color:#2779aa;
	font-size:1.1em;
	margin:20px 0 15px 0;
	font-size:1.2em
}
#navigatEvents {
	text-decoration:none;
	outline-color:-moz-use-text-color !important;
	outline-style:none !important;
	outline-width:0 !important;
	-moz-border-radius-bottomleft:4px;
	-moz-border-radius-bottomright:4px;
	-moz-border-radius-topleft:4px;
	-moz-border-radius-topright:4px;
	-moz-background-clip:border;
	-moz-background-inline-policy:continuous;
	-moz-background-origin:padding;
	position:relative;
	float:right;
	width:150px;
}
#navigateContent {
	width:88%
}
--->
.tabEventsOn {
 font-size:0.9em;
 color:#FFFFFF;
 background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;
 padding:3px 10px 5px 10px
}
.tabEventsOff {
	font-size:0.9em;
	background-color:#EBEBEB;
	color:#666666;
	padding:3px 10px 5px 10px
}
.liFieldCont02 {
	height:45px;
}
#eventTabs {
	float:right;
	margin:0 15px 0 0
}
#eventTabs UL {
	list-style:none;
	margin: 0;
	padding: 0;
	float: left;
	background-color:#EBEBEB;
	color:#666666;
}
#eventTabs UL LI {
	display: inline;
	font-size:0.9em;
	padding:10px 10px 5px 10px
}
#eventTabs ul li a {
	text-decoration: none;
	color:#333333;
	padding:10px 10px 5px 10px
}
#eventTabs ul li a:hover {
	color: #fff;
	background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;
}
.eventTabs {
	padding:10px 10px 5px 10px
}
.eventTabsOn {
	font-size:0.9em;
	color:#FFFFFF;
	background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;
	padding:10px 10px 5px 10px
}
.resultlabel {
	color:#009900
}
.labelOff {
	color: #F00
}
.warningText{ color:#FF0000}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>P21</title>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<cfoutput>
  <div id="outer">
  <div id="iner">
  <div id="eventTabs">
    <ul><cfloop query="getSelect">
        <li class="<cfif getSelect.webid eq url.id>eventTabsOn<cfelse>eventTabs</cfif>"><a href="dsp_edit_new.cfm?id=#getSelect.webid#">#getSelect.event_name# (#getSelect.event_type#)</a></li>
      </cfloop>
    </ul>
  </div>
  <div class="clear"></div>
  <div id="tabs">
    <ul>
      <li><a href="##tabs-details">Details</a></li>
      <li><a href="##tabs-Uploads">Uploads</a></li>
      <li><a href="##tabs-EBlurb">Event Blurb</a></li>
      <cfif qryEvent.event_type EQ "week" OR qryEvent.event_type EQ "RE" or qryEvent.event_type eq 'CLUB' or qryEvent.event_type eq 'BOOK' or qryEvent.event_type eq 'advis' or qryEvent.event_type eq 'CM' >
        <!---<li><a href="##tabs-Sponsor">Sponsorship Blurb</a></li>
        <li><a href="##tabs-Exhib">Exhibitons</a></li>
        <li><a href="##tabs-logo">Logos</a></li>--->
      </cfif>
      <!--- <li><a href="##tabs-Speakers">Speakers/program</a></li>---> 
      <!--- <li><a href="##tabs-Extras">Contacts/functions</a></li>--->
    </ul>
    <div id="tabs-details"> 
      <!--- <li><a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'tblIndividual', 'fileTableID': #form.id#}, Args:{  title : 'Manage files', height:500, width:850, modal:false}});">Client Files</a></li>--->
      <table border="0" cellspacing="8" cellpadding="0" id="table">
        <tr>
          <td valign="top"><ul id="userMenu">
              <li><a href="javascript:openEventLocationWindow(#qryEvent.eventID#);">Location</a></li>
              <li>changes</li>
              <li ><a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'tblAnnual_Conf', 'fileTableID': #qryEvent.eventID#}, Args:{  title : 'Manage files', height:500, width:900, modal:false}});">Event Files</a></li>
              <li ><a href="javascript:openWindow({ url:'../Venues/index.cfm', param: {'eventID': #qryEvent.webID#}, Args:{  title : 'Manage Venues', height:655, width:660, modal:false}});">Venues/Hotels</a></li>
              <li ><a href="../../my-officex/program/?fa=home">Program (new system)</a></li>
              <li ><a href="javascript:openWindow({ url:'../program/index.cfm', param: {'eventID': #qryEvent.webID#}, Args:{  title : 'Program', height:650, width:705, modal:false}});">Program (Old system)</a></li>
              
              <!---<li><a href="javascript:openWindow({ url:'../events/dsp_modal_manageInfo.cfm', param: {'eventID': #qryEvent.webID#, 'parentID': #qryEvent.parentID#}, Args:{  title : 'Manage Booking information', height:700, width:600, modal:false}});">Event Information</a></li>--->
<cfif qryEvent.event_type Neq "week">
               <!--- <li><a href="../__program/index.cfm?id=#qryEvent.webID#&groupby=#qryEvent.groupby#&event_year=#qryEvent.event_year#"rel="colorbox"> Old program</a> </li>
                <li ><a href="javascript:openWindow({ url:'../program/indexV2.cfm', param: {'eventID': #qryEvent.webID#}, Args:{  title : 'Manage Program', height:650, width:790, modal:false}});">New program</a></li>--->
                
               <li><a href="../../my-officex/conferences/?fa=layout-eventInfo&eventID=#qryEvent.eventId#&parentID=#qryEvent.parentID#" target="_blank">Event Information</a></li>
<!---                <li><a href="javascript:openWindow({ url:'../../my-officex/functions/dsp_modal_functions.cfm', param: {'eventid': #qryEvent.eventID#, 'parentID': #qryEvent.parentID#}, Args:{  title : 'events functions', height:410, width:690, modal:false}});">Event functions</a></li>--->
                <li><a href="javascript:openWindow({ url:'../functions/index.cfm', param: {'eventid': #qryEvent.eventID#, 'parentID': #qryEvent.parentID#}, Args:{  title : 'events functions', height:550, width:690, modal:false}});">Events functions</a></li>
                <li><a href="javascript:openWindow({ url:'../counts/functions_attend.cfm?id=#qryEvent.webID#', param: {'id': #qryEvent.webID#}, Args:{  title : 'Functions Attendence list', height:400, width:690, modal:false}});">functions Attendence List</a></li>
                <li ><a href="javascript:openWindow({ url:'../Meal_Preference/index.cfm?eventid=#qryEvent.webID#', param: {'param1': #qryEvent.parentID#}, Args:{  title : 'Menu Options', height:400, width:800, modal:false}});">Menu Options</a></li>
                <li ><a href="javascript:openWindow({ url:'../Counts/dinner_menu.cfm?id=#qryEvent.eventID#', param: {'id': #qryEvent.eventID#}, Args:{  title : 'Menu Counts', height:400, width:800, modal:false}});">Menu Counts</a></li>
                
</cfif>
              <cfif qryEvent.event_type eq "week">
				<li><a href="../../my-officex/conferences/?fa=layout-eventInfo&eventID=#qryEvent.webID#&parentID=#qryEvent.eventId#" target="_blank">Event Information</a></li>
                <li ><a href="javascript:openWindow({ url:'../contacts2staff/dsp_contacts.cfm', param: {'param1' : #qryEvent.eventId#, 'param2' : 0, 'param3' : 0}, Args:{  title : 'Staff contact list', height:400, width:850, modal:false}});">Staff contact lists</a></li>
                <li ><a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'tblAnnual_Conf', 'fileTableID': #qryEvent.eventID#}, Args:{  title : 'Manage files', height:500, width:900, modal:false}});">Event Files</a></li>

<!---  <li><a href="javascript:openWindow({ url:'../eventPricing/dsp_pricing.cfm', param: {'param1': #qryEvent.parentID#}, Args:{  title : 'events Price Combination', height:400, width:820, modal:false}});" class="labelOff">Event price</a></li>--->
 
  <li><a href="javascript:openWindow({ url:'../eventPricing/dsp_pricing.cfm', param: {'parentID': #qryEvent.eventID#}, Args:{  title : 'events Prices', height:500, width:900, modal:false}});">Event prices</a></li>
  
  
                <!---<li class="labelOff"><a href="javascript:openWindow({ url:'../eventPricing/dsp_combinationSet.cfm', param: {'param1': #qryEvent.eventID#, 'param2' : 0, 'param3': 0}, Args:{  title : 'events Price Combination', height:800, width:700, modal:false}});" class="labelOff">Event price combination </a></li>--->
                <li><a href="javascript:openWindow({ url:'../eventPricing/dsp_combinationSet.cfm', param: {'parentID': #qryEvent.eventID#}, Args:{  title : 'manage Price combinations', height:720, width:665, modal:false}});">Event price combination </a></li>

              </cfif>
              <li><a href="javascript:openWindow({ url:'../discounts/index.cfm', param: {'eventID': #qryEvent.eventID#, 'parentID' : #qryEvent.parentID#}, Args:{  title : 'Manage Discounts', height:210, width:580, modal:false}});" class="labelOff">Event Discount</a></li>
            </ul></td>
          <td valign="top"><fieldset>
              <legend>Event Main Details</legend>
              <b>Event Live </b> 
              <i class="NoFormat"><input type="checkbox" class="ckeckbox" id="live" value="1" <cfif qryEvent.live eq 1>checked="checked"</cfif> /></i> 
              
              <b>seperately bookable </b>
              <i class="fl_text" id="standalone"><cfif qryEvent.standalone eq 0>yes<cfelse>no linked to eventID (#qryEvent.standalone#) </cfif></i>
                
              
              <b>Event Title </b> 
              <i class="fl_text" id="event_name">#qryEvent.event_name#</i> 
              <b>Sub Title</b> 
              <i class="fl_area" id="Slogan">#qryEvent.Slogan#</i> 
              <b>Slogan </b> 
              <i class="fl_area" id="briefingSlogan">#qryEvent.briefingSlogan#</i> 
<!---              <b>sticky Note</b> 
              <i class="fl_area" id="sloganSub">#qryEvent.sloganSub#</i> --->
              <b>Start Date</b> 
              <i class="fl_date" id="event_expire">#dateformat(qryEvent.event_expire, 'dd mmmm yyyy')#</i> 
              <b>End Date</b> 
              <i class="fl_date" id="eventDateEnd">#dateformat(qryEvent.eventDateEnd, 'dd mmmm yyyy')#</i>
            </fieldset>
            <fieldset>
            	<legend>Day start time</legend>
                	<b>must be 00:00 format </b> <i class="fl_text" id="timereg">#qryEvent.timereg#</i>
             </fieldset>
             
            <fieldset>
              <cfif qryEvent.event_type Neq "week">
                <legend>Event Costs & Discount</legend>
                <b  >Cost</b> <i class="NoFormat">#qryEvent.eventPrice#</i> 
                <!---<b>Currency</b> <i class="event_cost_currency fl_comboShort" style="display: inline" id="event_cost_currency">#qryEvent.event_cost_currency#</i> <!---fl_comboShort---> 
                <b>Cost</b> <i class="fl_comboShort" title="event_cost_us" id="#qryEvent.webID#">#numberformat(qryEvent.event_cost_us, "_____.__")#</i>---> <!---fl_comboShort--->
<!---                <b>seperately bookable </b> <i class="NoFormat" id="#qryEvent.webID#">
                <input type="checkbox" class="ckeckbox" id="singleEventNot" value="1" <cfif qryEvent.singleEventNot eq 1>checked="checked"</cfif>  />
                </i>--->
              </cfif>
              <b class="labelOff">Discount</b><i class="NoFormat">#qryEvent.eventDiscount#</i>
              <!---<cfif qryEvent.event_type eq "week">
                <b>Discount</b> <i class="fl_comboShort"  title="discountValue" id="discountValue">#numberFormat(qryEvent.discountValue, "9999")#</i> <b>Discount End </b> <i  class="fl_date" id="discountDate">#dateformat(qryEvent.discountDate, "dd mmmm yyyy")#</i>
              </cfif>--->
            </fieldset></td>
          <td valign="top">
          <fieldset id="location">
              <legend>Event Location</legend>
<!---              <b>City</b> <i class="fl_text" id="event_loc_city">#qryEvent.event_loc_city#</i> 
              <b>Country</b> <i class="event_loc_country fl_text" style="display: inline">#qryEvent.event_loc_country#</i> 
              
              <b>Room name</b> <i class="fl_text" id="venuRoom">#qryEvent.venuRoom#</i>--->
              
              <b>Country</b> <i class="NoFormat" id="countryName">#qryEvent.countryName#</i> 
              <b>City</b> <i class="NoFormat" id="cityName">#qryEvent.cityName#</i> 
              <b>Venue</b> <i class="NoFormat" style="display: inline">#qryEvent.VenueName#</i> 
              <b>Room name</b> <i class="NoFormat" id="venuRoom">#qryEvent.venuRoom#</i>
            </fieldset>
           <!--- <fieldset>
              <legend>Event Settings</legend>
              
              <cfif qryEvent.event_type eq "week">
                <b>colorD</b><i class="fl_comboShort" title="colorD">#qryEvent.colorD#</i> <b>colorL</b> <i class="fl_comboShort" title="colorL">#qryEvent.colorL#</i>
              </cfif>
            </fieldset>--->
            <cfif qryEvent.event_type Neq "week">
              <div class="ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" style="padding:15px">
                <fieldset>
                  <legend>Contact Attendees</legend>
                  <ul id="userMenu">
                  	<li>
                  <a href="javascript:openWindow({ url:'../../my-officex/conferences/?fa=feedback-modal', param: { 'parentID': #qryEvent.parentID#}, Args:{  title : 'attendee feedback functions', height:410, width:690, modal:false}});">contact delegate functions</a></li>
                  </ul>
                 
                  <b>Fill Access</b> <i class="NoFormat"><a href="javascript:openWindow({ url:'qry_paswordUpdate.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#', param: {'eventID': #qryEvent.id_gpp#}, Args:{  title : 'Updaye Passwords', height:450, width:470, modal:false}});">Check Passwords</a></i><!--- <b>Attence Form</b> <i class="NoFormat"> <a href="javascript:openWindow({ url:'act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=1&corespondence=1', param: {'eventID': #qryEvent.eventID#}, Args:{  title : 'Updaye Passwords', height:450, width:470, modal:false}});">send test</a></i> ---->
                  
                  <!---<a href="javascript:openWindow('act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=1&corespondence=1', #qryEvent.id_gpp#, #qryEvent.webID# ,1 , 470, 450, 'Send test', 'false');" class="button">send test</a></i> ---> 
                  
                 <!--- <b>Attence Form</b> <i class="NoFormat"> <a href="javascript:openWindow({ url:'act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=0&corespondence=1', param: {'eventID': #qryEvent.eventID#}, Args:{  title : 'Attendence Form final', height:450, width:470, modal:false}});"> 
                  <!--- <a href="javascript:openWindow('act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=0&corespondence=1', #qryEvent.id_gpp#, #qryEvent.webID# ,1 , 470, 450, 'Send test', 'false');" class="button "--->send final</a> </i> --->
                  <b>fill access</b> <i class="NoFormat"> <a href="javascript:openWindow({ url:'act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=1&corespondence=2', param: {'eventID': #qryEvent.eventID#}, Args:{  title : 'Updaye Passwords', height:450, width:470, modal:false}});">send test</a></i> 
                  
                  <!--- <i class="NoFormat"><a href="javascript:openWindow('act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=1&corespondence=2', #qryEvent.id_gpp#, #qryEvent.webID# ,1 , 470, 450, 'Send form test', 'false');"  class="button ">send test</a></i> ---> 
                  
                  <b>Fill Access</b> <i class="NoFormat"> <a href="javascript:openWindow({ url:'act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=0&corespondence=2', param: {'eventID': #qryEvent.eventID#}, Args:{  title : 'send file access email', height:450, width:470, modal:false}});">send final</a> 
                  <!--- <a href="javascript:openWindow('act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=0&corespondence=2', #qryEvent.id_gpp#, #qryEvent.webID# ,0 , 470, 450, 'Send form', 'false')"  class="button">send final</a>---> 
                  </i>
                </fieldset>
              </div>
            </cfif></td>
          <td valign="top">
          <!---
		  <cfif qryEvent.event_type Neq "week">
              <fieldset class="eventInfo">
                <legend>Welcome Letter info</legend>
                <b>Booking Package Info</b>
                <i  class="NoFormat"><a href="../../my-officex/conferences/?fa=layout-eventInfo&eventID=#qryEvent.eventId#&parentID=#qryEvent.parentID#" target="_blank">Set package information for mailing</a></i>
                <b>E-conference</b> <i class="Econf NoFormat" id="#qryEvent.webID#">
                <cfif qryEvent.Econf EQ 1>yes
                  <cfelse>no
                </cfif>
                </i> <!----<b>reg Open time/must be 00:00 format </b> <i class="fl_text" id="timereg">#qryEvent.timereg#</i>---> <b>Event start time</b> <i class="NoFormat" id="timestart">#qryEvent.timestart#</i> <b>pre regist place</b> <i class="NoFormat" id="preRegistration">#qryEvent.preRegistration#</i> <b>pre regist date</b> <i class="NoFormat" id="preRegistrationDate">#DateFormat(qryEvent.preRegistrationDate, "dd mmmm yyyy")#</i> <b>pre regist time</b> <i class="NoFormat" id="preRegistrationTime">#qryEvent.preRegistrationTime# </i> <b>presentation Available</b> <i class="NoFormat" id="filesAvailableDate">#dateFormat(qryEvent.filesAvailableDate, "dd mmm yyyy")#</i> <b>Attand form Submit date</b> <i class="NoFormat" id="AttendFormDate">#dateFormat(qryEvent.AttendFormDate, "dd mmm yyyy")#</i> <b>Secial Note</b><i class="NoFormat" id="specialNote">#qryEvent.specialNote#</i>
                <div class="clear"></div>
                </fieldset><fieldset class="eventInfo">
                  <legend>Exibitions info</legend>
                  <b>Booth setup time</b> <i class="NoFormat" id="boothTimeSetup">#qryEvent.boothTimeSetup#</i> <b>Booth setup date</b> <i class="NoFormat" id="boothDateSetup">#dateformat(qryEvent.boothDateSetup, "dd mmm yyyy")#</i> <b>Booth breakdown time</b> <i class="NoFormat" id="boothTimeRemove">#qryEvent.boothTimeRemove#</i> <b>Booth breakdown date</b> <i class="NoFormat" id="boothDateRemove">#dateformat(qryEvent.boothDateRemove, "dd mmm yyyy")#</i>
                </fieldset>
              
            </cfif>---></td>
          <td></td>
        </tr>
      </table>
    </div>
    <div id="tabs-Uploads">
      <h4>Event Page</h4>
      <cfif qryEvent.event_type EQ "week" OR qryEvent.event_type EQ "cm">
        <b>Page header </b> <i class="NoFormat">
        <cfif  qryEvent.file_image_pdf NEQ "">
          <img src="../img/ok_tick-yellow.gif" />
          <cfelse>
        </cfif>
        <div id="upload_banner" class="uploadButton">Upload</div>
        </i> <b>Brochure </b> <i class="NoFormat">
        <cfif  qryEvent.file_update NEQ "">
          <img src="../img/ok_tick-yellow.gif" />
          <cfelse>
        </cfif>
        <div id="upload_brochure" class="uploadButton">Upload</div>
        </i>
      </cfif>
      <b>Hotel Form</b> <i class="NoFormat">
      <cfif qryEvent.event_loc_weather NEQ "">
        <img src="../img/ok_tick-yellow.gif" />
        <cfelse>
      </cfif>
      <div id="upload_HotelFile" class="uploadButton">Upload</div>
      </i>
      <cfif qryEvent.event_type EQ "week">
        <div class="clear"></div>
        <h4>Event Page</h4>
        <b>Home Page Banner </b> <i class="noFormat">
        <cfif qryEvent.HomePageBanner NEQ "">
          <img src="../img/ok_tick-yellow.gif" />
          <cfelse>
        </cfif>
        <div id="upload_Homebanner" class="uploadButton">Upload</div>
        </i> <b>Sponsors Oppertunities </b> <i class="noFormat">
        <cfif  qryEvent.sponsorOppFile NEQ "">
          <img src="../img/ok_tick-yellow.gif" />
          <cfelse>
        </cfif>
        <div id="upload_SponsorOpFile" class="uploadButton">Upload</div>
        </i> <b>S&E doc, GPP use only </b> <i class="noFormat">
        <cfif  qryEvent.doc_SE_intern NEQ "">
          <img src="../img/ok_tick-yellow.gif" />
          <cfelse>
        </cfif>
        <div id="upload_SponsorOp" class="uploadButton">Upload</div>
        </i>
      </cfif>
      <div class="clear"></div>
      <h4>Upload images for email Template</h4>
      <b>Header Image </b> <i class="">
      <cfif qryEvent.newsletterBannerTop NEQ "">
        <img src="../img/ok_tick-yellow.gif" />#qryEvent.newsletterBannerTop#
        <cfelse>
      </cfif>
      <div id="upload_topBanner" class="uploadButton">Upload </div>
      </i> <b>Column 1 image </b> <i class="">
      <cfif qryEvent.newsletterBannerCol1 NEQ "">
        <img src="../img/ok_tick-yellow.gif" />
        <cfelse>
      </cfif>
      <div id="upload_colum1" class="uploadButton">Upload</div>
      </i> <b>Column 2 image </b> <i class="">
      <cfif qryEvent.newsletterBannerCol2 NEQ "">
        <img src="../img/ok_tick-yellow.gif" />
        <cfelse>
      </cfif>
      <div id="upload_colum2" class="uploadButton">Upload</div>
      </i> <b>Top Image 600px </b> <i class="">
      <cfif qryEvent.newsletterBannerTop600 NEQ "">
        <img src="../img/ok_tick-yellow.gif" />
        <cfelse>
      </cfif>
      <div id="upload_topBanner600" class="uploadButton">Upload</div>
      </i> </div>
    <div id="tabs-EBlurb">
      <div class="column1" style="width:600px;">
        <h4>Main blurb <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb" rel="colorbox"><img src="../img/questionMark.gif"></a></h4>
        <form name="BlurbForm" id="BlurbForm" method="post" action="update_TextArea.cfm">
          <textarea name="event_blurb" id="event_blurb">#qryEvent.event_blurb#</textarea>
          <input type="hidden" name="id" value="#qryEvent.webID#" />
          <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb" rel="colorbox"><img src="../img/questionMark.gif"></a>
          <button>Save</button>
          <span class="resultlabel" id="event_blurbResult"></span>
        </form>
      </div>
      <div class="column2" style="width:440px; padding:0 0 0 0; margin:0 0 0 5px;">
        <h4>Focus On <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=focusOn" rel="colorbox"><img src="../img/questionMark.gif"></a></h4>
        <form method="post" id="BlurbFocus" action="update_TextArea.cfm">
          <textarea name="focusOn" id="focusOn">#qryEvent.focusOn#</textarea>
          <input type="hidden" name="id" value="#qryEvent.webID#" />
          <button>Save</button>
          <span class="resultlabel" id="focusOnResult"></span>
        </form>
      </div>
      <div class="clear"></div>
    </div>
    <cfif qryEvent.event_type EQ "week" OR qryEvent.event_type EQ "RE"  or qryEvent.event_type eq 'CLUB' or qryEvent.event_type eq 'BOOK' or qryEvent.event_type eq 'advis' or qryEvent.event_type eq 'CM' >
  <!---    <div id="tabs-Sponsor">
        <form id="sponsorsBlurb" method="post" action="update_TextArea.cfm">
          <textarea name="event_blurb_sponsors" id="event_blurb_sponsors">#qryEvent.event_blurb_sponsors#</textarea>
          <input type="hidden" name="id" value="#qryEvent.webID#" />
          <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb_sponsors" rel="colorbox"><img src="../img/questionMark.gif"></a>
          <button>Save</button>
          <span class="resultlabel" id="event_blurb_sponsorsResult"></span>
        </form>
        <div class="clear"></div>
      </div>
      <div id="tabs-Exhib">
        <form id="exhibBlurb" method="post" action="update_TextArea.cfm">
          <textarea name="event_blurb_exhib"  id="event_blurb_exhib">#qryEvent.event_blurb_exhib#</textarea>
          <input type="hidden" name="id" value="#qryEvent.webID#" />
          <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb_exhib" rel="colorbox"><img src="../img/questionMark.gif"></a>
          <button>Save</button>
          <span class="resultlabel" id="event_blurb_exhibResult"></span>
        </form>
        <div class="clear"></div>
      </div>--->

<!---        <div class="clear"></div>
      </div>--->
    </cfif>
  </div>
  <div class="clear"></div>
</cfoutput>
</div>
</div>
<div id="dialog" title="Inportant Message"> </div>
<!---<div id="modalPopUp"></div>--->
<cfinclude template="../_display/dsp_footer.cfm">

<!---      <div id="tabs-logo">
        <table width="100%" border="0" cellspacing="4" cellpadding="4" bgcolor="##F1FDFF" style="color:##FFFFFF">
          <tr>
            <td width="150" style="color:##003366">search companies</td>
            <td><form id="formSearchCompany"  method="post" action="company_list.cfm">
                <input type="text" name="company" id="company" />
                <input type="hidden" name="eventid" value="#qryEvent.webID#" />
                <input type="submit" name="button" id="button" value="Submit" />
              </form></td>
          </tr>
          <tr>
            <td colspan="2" bgcolor="##ffffff"><div id="AreaLoadCompanies">s</div></td>
          </tr>
        </table>
        <div class="column1">
          <h4>Other Sponsors  (<a href="##" onClick="serialize(); return false;">Save Order</a>)</h4>
          <div id="logos_supporter" class="groupWrapper">
            <cfif listLen(qryEvent.logos_supporter, ",") GT 0>
              <cfloop  index="i" list="#qryEvent.logos_supporter#">
                <cfquery datasource="#dsnP21#" name="logosSponsor">		
SELECT id, company, logofile 
FROM logos         
WHERE id = #i#	
</cfquery>
                <div id="#logosSponsor.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#logosSponsor.logofile#" /></div>
                  <div class="col2">#logosSponsor.company# <a href="javascript:deleteLogo(#logosSponsor.id#, #qryEvent.webID#, 'logos_supporter');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
        </div>
        <div class="column1">
          <h4>Lead Sponsors</h4>
          <div id="sponsor_lead">
            <cfif listLen(qryEvent.sponsor_lead, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="sponsor_lead">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_lead, ",") GT 1>WHERE id IN (#qryEvent.sponsor_lead#)<cfelse>
                WHERE id = #qryEvent.sponsor_lead#
                </cfif>
                </cfquery>
              <cfloop query="sponsor_lead">
                <div id="#sponsor_lead.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#sponsor_lead.logofile#" /></div>
                  <div class="col2">#sponsor_lead.company# <a href="javascript:deleteLogo(#sponsor_lead.id#, #qryEvent.webID#, 'sponsor_lead');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Platinum Sponsors</h4>
          <div id="sponsor_platinum">
            <cfif listLen(qryEvent.sponsor_platinum, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="sponsor_platinum">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_platinum, ",") GT 1>WHERE id IN (#qryEvent.sponsor_platinum#)<cfelse>
                WHERE id = #qryEvent.sponsor_platinum#
                </cfif>
                </cfquery>
              <cfloop query="sponsor_platinum">
                <div id="#sponsor_platinum.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#sponsor_platinum.logofile#" /></div>
                  <div class="col2">#sponsor_platinum.company# <a href="javascript:deleteLogo(#sponsor_platinum.id#, #qryEvent.webID#, 'sponsor_platinum');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Gold Sponsors</h4>
          <div id="sponsor_gold">
            <cfif listLen(qryEvent.sponsor_gold, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="sponsor_gold">
                    SELECT id, company, logofile FROM logos 
                    <cfif listLen(qryEvent.sponsor_gold, ",") GT 1>WHERE id IN (#qryEvent.sponsor_gold#)<cfelse>
                    WHERE id = #qryEvent.sponsor_gold#
                    </cfif>
                    </cfquery>
              <cfloop query="sponsor_gold">
                <div id="#sponsor_gold.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#trim(sponsor_gold.logofile)#" /></div>
                  <div class="col2">#sponsor_gold.company# <a href="javascript:deleteLogo(#sponsor_gold.id#, #qryEvent.webID#, 'sponsor_gold');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Silver Sponsors</h4>
          <div id="sponsor_silver">
            <cfif listLen(qryEvent.sponsor_silver, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="sponsor_silver">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_silver, ",") GT 1>WHERE id IN (#qryEvent.sponsor_silver#)<cfelse>
                WHERE id = #qryEvent.sponsor_silver#
                </cfif>
                </cfquery>
              <cfloop query="sponsor_silver">
                <div id="#sponsor_silver.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#sponsor_silver.logofile#" /></div>
                  <div class="col2">#sponsor_silver.company# <a href="javascript:deleteLogo(#sponsor_silver.id#, #qryEvent.webID#, 'sponsor_silver');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Bronze Sponsors</h4>
          <div id="sponsor_bronze">
            <cfif listLen(qryEvent.sponsor_bronze, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="sponsor_bronze">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_bronze, ",") GT 1>WHERE id IN (#qryEvent.sponsor_bronze#)<cfelse>
                WHERE id = #qryEvent.sponsor_bronze#
                </cfif>
                </cfquery>
              <cfloop query="sponsor_bronze">
                <div id="#sponsor_bronze.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#sponsor_bronze.logofile#" /></div>
                  <div class="col2">#sponsor_bronze.company# <a href="javascript:deleteLogo(#sponsor_bronze.id#, #qryEvent.webID#, 'sponsor_bronze');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Prefered Airline Sponsors</h4>
          <div id="sponsor_platinum">
            <cfif listLen(qryEvent.sponsor_Airline, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="sponsor_Airline">
                SELECT id, company, logofile 
                FROM logos 
                <cfif listLen(qryEvent.sponsor_Airline, ",") GT 1>WHERE id IN (#qryEvent.sponsor_Airline#)<cfelse>
                WHERE id = #qryEvent.sponsor_Airline#
                </cfif>
                </cfquery>
              <cfloop query="sponsor_Airline">
                <div id="#sponsor_Airline.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#sponsor_Airline.logofile#" /></div>
                  <div class="col2">#sponsor_Airline.company# <a href="javascript:deleteLogo(#sponsor_Airline.id#, #qryEvent.webID#, 'sponsor_Airline');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Corporate Menmber Sponsor</h4>
          <div id="logo_corpMembers">
            <cfif listLen(qryEvent.logo_corpMembers, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="logo_corpMembers">
                SELECT id, company, logofile 
                FROM logos 
                <cfif listLen(qryEvent.logo_corpMembers, ",") GT 1>WHERE id IN (#qryEvent.logo_corpMembers#)<cfelse>
                WHERE id = #qryEvent.logo_corpMembers#
                </cfif>
                </cfquery>
              <cfloop query="logo_corpMembers">
                <div id="#logo_corpMembers.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#logo_corpMembers.logofile#" /></div>
                  <div class="col2">#logo_corpMembers.company# <a href="javascript:deleteLogo(#logo_corpMembers.id#, #qryEvent.webID#, 'logo_corpMembers');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Corporate Sponsor</h4>
          <div id="logo_CorpSponsor">
            <cfif listLen(qryEvent.logo_CorpSponsor, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="logo_CorpSponsor">
                SELECT id, company, logofile 
                FROM logos 
                <cfif listLen(qryEvent.logo_CorpSponsor, ",") GT 1>WHERE id IN (#qryEvent.logo_CorpSponsor#)<cfelse>
                WHERE id = #qryEvent.logo_CorpSponsor#
                </cfif>
                </cfquery>
              <cfloop query="logo_CorpSponsor">
                <div id="#logo_CorpSponsor.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#logo_CorpSponsor.logofile#" /></div>
                  <div class="col2">#logo_CorpSponsor.company# <a href="javascript:deleteLogo(#logo_CorpSponsor.id#, #qryEvent.webID#, 'logo_CorpSponsor');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Supporting Sponsor</h4>
          <div id="supportedby">
            <cfif listLen(qryEvent.supportedby, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="supportedby">
                SELECT id, company, logofile 
                FROM logos 
                <cfif listLen(qryEvent.supportedby, ",") GT 1>WHERE id IN (#qryEvent.supportedby#)<cfelse>
                WHERE id = #qryEvent.supportedby#
                </cfif>
                </cfquery>
              <cfloop query="supportedby">
                <div id="#supportedby.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#supportedby.logofile#" /></div>
                  <div class="col2">#supportedby.company# <a href="javascript:deleteLogo(#supportedby.id#, #qryEvent.webID#, 'supportedby');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Corporate Patron</h4>
          <div id="logo_Patron">
            <cfif listLen(qryEvent.logo_Patron, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="logo_Patron">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.logo_Patron, ",") GT 1>WHERE id IN (#qryEvent.logo_Patron#)<cfelse>
                WHERE id = #qryEvent.logo_Patron#
                </cfif>
                </cfquery>
              <cfloop query="logo_Patron">
                <div id="#logo_Patron.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#logo_Patron.logofile#" /></div>
                  <div class="col2">#logo_Patron.company# <a href="javascript:deleteLogo(#logo_Patron.id#, #qryEvent.webID#, 'logo_Patron');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
          <h4>Contributing Sponsor</h4>
          <div id="logo_Contributing">
            <cfif listLen(qryEvent.logo_Contributing, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="logo_Contributing">
                SELECT id, company, logofile 
                FROM logos 
                <cfif listLen(qryEvent.logo_Contributing, ",") GT 1>WHERE id IN (#qryEvent.logo_Contributing#)<cfelse>
                WHERE id = #qryEvent.logo_Contributing#
                </cfif>
                </cfquery>
              <cfloop query="logo_Contributing">
                <div id="#logo_Contributing.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#logo_Contributing.logofile#" /></div>
                  <div class="col2">#logo_Contributing.company# <a href="javascript:deleteLogo(#logo_Contributing.id#, #qryEvent.webID#, 'logo_Contributing');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div> 
        </div>--->
<!---        <div class="column2">
          <h4>Media Sponsor</h4>
          <div id="logos_sponsore">
            <cfif listLen(qryEvent.logos_sponsore, ",") GT 0>
              <cfquery datasource="#dsnP21#" name="logos_sponsore">
                SELECT id, company, logofile 
                FROM logos 
                <cfif listLen(qryEvent.logos_sponsore, ",") GT 1>WHERE id IN (#qryEvent.logos_sponsore#)<cfelse>
                WHERE id = #qryEvent.logos_sponsore#
                </cfif>
                </cfquery>
              <cfloop query="logos_sponsore">
                <div id="#logos_sponsore.id#" class="row">
                  <div class="col1"><img src="../../_files/business/#logos_sponsore.logofile#" /></div>
                  <div class="col2">#logos_sponsore.company# <a href="javascript:deleteLogo(#logos_sponsore.id#, #qryEvent.webID#, 'logos_sponsore');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
              </cfloop>
            </cfif>
          </div>
        </div>--->