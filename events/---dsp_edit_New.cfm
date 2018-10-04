<cfinclude template="../Application.cfm">

<cfquery name="qryEvent" datasource="#dsnP21#">
SELECT  *
FROM CRM_manage_events
WHERE     webid = #url.id#
</cfquery>

<!--- get HOTEL ---->
<cfparam name="get_venue.VenueName" default="">
<cfparam name="get_venue.venueID" default="">

<cfif qryEvent.hotel NEQ "">
<cfquery name="get_venue" datasource="#gpp#">
SELECT     VenueName, venueID
FROM         venues
WHERE 	venueID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.hotel#">
</cfquery>

</cfif>

<!--- get other events in this week to build top menu ---->
<cfquery name="getSelect" datasource="#gpp#">
SELECT      webid, event_name, event_type
FROM          	tblAnnual_Conf 
WHERE    ( groupby = <cfqueryparam  value="#qryEvent.groupby#"> 
AND YEAR(event_expire) = <cfqueryparam value="#datePart('yyyy', qryEvent.event_expire)#" >) 
AND (event_type <> 'spon' and event_type <> 'both') 
ORDER BY event_type desc
</cfquery>
<cfset pandetails = 540 >
<cfset pantitle = 130 >
<cfset tabs_Exhib =  "">

	<cfif qryEvent.event_type eq "event" >
		<cfset tabs_Exhib =  "Exhebition Blurb" >
    <cfelseif qryEvent.event_type eq "eb" >
    	<cfset tabs_Exhib = "Briefing extended Info" >
    <cfelseif qryEvent.event_type eq "cm" OR qryEvent.event_type eq "Advis" OR qryEvent.event_type eq "book" OR qryEvent.event_type eq "RE" OR qryEvent.event_type eq "RE"  OR qryEvent.event_type eq "club" >
    	<cfset tabs_Exhib = "extended Info" >
    </cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.corner.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jeditable.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.charcounter.js"  ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.jeditable.charcounter.js"  ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jquery.wysiwyg.js" ></script>
<link rel="stylesheet" href="http://www.petro21.com/my-office/Javascript/jquery.wysiwyg.css" >
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jquery.jeditable.wysiwyg.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/Tinymce_Clean/jscripts/tiny_mce/tiny_mce_src.js"></script>
<!---<script type='text/JavaScript' src='http://www.petro21.com/my-office/javascript/scw.js'></script>--->
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/interface.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/fileUpload.js"  ></script>
<link rel="stylesheet" type="text/css" href="http://www.petro21.com/my-office/javascript/jquerydatepicker/datePicker.css" media="screen" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquerydatepicker/jquery.datePicker.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquerydatepicker/jquery.jeditable.datepicker.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/date.js"></script>

<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>

<!---<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>--->
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
.tabexOn	{ padding:15px 10px 3px 10px; margin-right:1px;  color:#ffffff;  font-size:11px; color:#333333; background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;font-family:Lucida Grande,Lucida Sans,Arial,sans-serif;line-height:1.3;  }
.tabexOff	{ padding:15px 10px 3px 10px; margin-right:1px; color:#2779AA;  font-size:11px; color:#333333; background:#D7EBF9 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_80_d7ebf9_1x400.png) repeat-x scroll 50% 50%;font-family:Lucida Grande,Lucida Sans,Arial,sans-serif;line-height:1.3;}
.infoText { font-size:10px; color:#990000 }
-->
</style>

<style type="text/css" media="all">
.groupWrapper{}
.serializer{	clear: both;}
.row{ clear:both; margin-bottom:1px;}
.row .col1{ position: relative;   float: left; background-color:#FFFFFF; cursor: move; width:104px; padding:0px; margin:0px; height:45px; border-bottom: 1px solid #CCCCCC; border-left:1px solid #CCCCCC; border-top:1px solid #CCCCCC}
.row .col2{ position: relative;   float: left;  width:184px; margin:0 0 0 0px; padding:10px 0 0 10px; height:35px; border-bottom: 1px solid #CCCCCC; border-right:1px solid #CCCCCC; border-top:1px solid #CCCCCC}
.sortHelper{	border: 2px solid #F2F2F2;	width: auto !important;}
.paneSeperator { border-right:1px dotted #CCCCCC }
.titlesection{ font-family:"Century Gothic", "Century Schoolbook", Georgia; color:#3366CC; margin:8px 0 20px 10px}
.columnPading {padding:20px}

 .ulLeft  {
list-style-type: none;
list-style-position: 0px; 
float:left;
margin:0px;
padding:15px 0px 0px 0px;
}

 .ulMidle  {
list-style-type: none;
list-style-position: 0px; 
float:left;
margin:0px;
padding:15px 10px 0px 0px;
}
  .ulLeft  li {
list-style-type: none;
height:20px;
border-bottom:1px solid #CCCCCC;
padding:4px 0 4px 10px;
width:190px;
margin:0px;
}
 .ulMidle  li {
list-style-type: none;
height:20px;
border-bottom:1px solid #CCCCCC;
padding:4px 0 4px 10px;
width:335px;
margin:0px;
}
.column1 { width:300px;    position: relative;   float: left; margin:0 10px 0 0}
.column2 { width:300px;    position: relative;   float: left;; margin:0 10px 0 0}
#tabs h4 { border-bottom:1px solid #aed0ea; font-family:Lucida Grande, Lucida Sans, Arial, sans-serif; color:#2779aa; font-size:1.1em; margin:20px 0 15px 0; font-size:1.2em}
#navigatEvents{text-decoration:none;
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
position:relative; float:right; width:150px;
}
#navigateContent{  width:88%}
.tabEventsOn { font-size:0.9em; color:#FFFFFF;background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%; padding:10px 10px 5px 10px}
.tabEventsOff { font-size:0.9em; background-color:#EBEBEB; color:#666666; padding:10px 10px 5px 10px}
.liFieldCont02 { height:45px;}
#eventTabs { float:right; margin:0 15px 0 0  }
#eventTabs UL {list-style:none; margin: 0; padding: 0; float: left; background-color:#EBEBEB; color:#666666;}
#eventTabs UL  LI { display: inline;font-size:0.9em; padding:10px 10px 5px 10px}
#eventTabs ul li a{text-decoration: none;color:#333333;  padding:10px 10px 5px 10px}
#eventTabs ul li a:hover{ color: #fff; background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;}
.eventTabs {padding:10px 10px 5px 10px}
.eventTabsOn{font-size:0.9em; color:#FFFFFF;background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%; padding:10px 10px 5px 10px}
.resultlabel{ color:#009900}
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
                        <li class="<cfif getSelect.webid eq url.id>eventTabsOn<cfelse>eventTabs</cfif>"><a href="dsp_edit_new.cfm?id=#getSelect.webid#"   >#getSelect.event_name# (#getSelect.event_type#)</a></li>
                        </cfloop>
                    </ul>
            </div>
 <div class="clear"></div>       
		<div id="tabs">
			<ul>
				<li><a href="##tabs-details">Details</a></li>
				<li><a href="##tabs-Uploads">Uploads</a></li>
        <li><a href="##tabs-EBlurb">Event Blurb</a></li>
<cfif qryEvent.event_type EQ "week" OR qryEvent.event_type EQ "RE"  or qryEvent.event_type eq 'CLUB' or qryEvent.event_type eq 'BOOK' or qryEvent.event_type eq 'advis' or qryEvent.event_type eq 'CM' OR qryEvent.event_type eq 'EB' >
                <li><a href="##tabs-Sponsor">Sponsorship Blurb</a></li>
                <li><a href="##tabs-Exhib">Exhibitons</a></li>
                <li><a href="##tabs-logo">Logos</a></li>
</cfif>
             <!--- <li><a href="##tabs-Speakers">Speakers/program</a></li>--->
               <!--- <li><a href="##tabs-Extras">Contacts/functions</a></li>--->
			</ul>
            
<div id="tabs-details">

<table border="0" cellspacing="8" cellpadding="0" id="table">
 <tr>
  <td valign="top">
  <ul id="userMenu">
    <li >Location</li>
    <li >Cost</li>
    <li>changes</li>
    <li><a href="javascript:OpenModal('../contacts2staff/dsp_contacts.cfm', #qryEvent.webID#, 0 ,0 , 700, 400, 'Staff contact list')" >Staff contact lists</a></li>
    <li><a href="../program/index.cfm?id=#qryEvent.webID#&groupby=#qryEvent.groupby#&event_year=#qryEvent.event_year#"rel="colorbox" > Load program</a> </li>
    <li><a href="../Meal_Preference/index.cfm?eventid=#qryEvent.webID#" rel="colorbox">Menu Options</a></li>
    <li><a href="../Counts/dinner_menu.cfm?id=#qryEvent.webID#" rel="colorbox">Menu Counts </a></li>
  	<li><a href="../functions/welcomeLetter.cfm?eventid=#qryEvent.webID#&groupby=#qryEvent.groupby#" rel="colorbox">Events functions</a></li>
    <li><a href="../counts/functions_attend.cfm?id=#qryEvent.webID#" rel="colorbox">functions Attendence List</a></li>
    <li><a href="floorplan.cfm?id=#qryEvent.groupby#&field=file_banner&for=FPImages" rel="colorbox">Event Floorplan</a></li>
    <li><a href="../contacts2staff/dsp_contacts.cfm?VALUE1=#qryEvent.webID#" rel="colorbox">Event contact lists </a></li>
    <li><a href="javascript:OpenModal('../eventPricing/dsp_pricing.cfm', #qryEvent.id_gpp#,0 ,0 , 700, 400, 'events Price Combination')">Event price</a></li>
    <li><a href="javascript:OpenModal('../eventPricing/dsp_combinationSet.cfm', #qryEvent.id_gpp#,0 ,0 , 700, 400, 'events Price Combination')">Event price combination </a></li>
    </ul>
  </td>
 
 <td valign="top">
	<fieldset  >
	<legend>Event Main Details</legend>
    <b>Event Live </b> 
    <i class="NoFormat" ><input type="checkbox" name="live" id="live" value="1" <cfif qryEvent.live eq 1>checked="checked"</cfif>  /></i>
    
    <b>Event Title </b>
    <i class="fl_text" id="event_name">#qryEvent.event_name#</i>
    <b>Sub Title</b>
    <i class="fl_area" id="Slogan" >#qryEvent.Slogan#</i>
    <b>Slogan </b>
    <i class="fl_area" id="briefingSlogan" >#qryEvent.briefingSlogan#</i>
    <b>sticky Note</b>
    <i class="fl_area" id="sloganSub">#qryEvent.sloganSub#</i>
    <b>Start Date</b>
    <i class="fl_date" id="event_expire">#dateformat(qryEvent.event_expire, 'dd mmmm yyyy')#</i>
    <b>End Date</b>
    <i class="fl_date" id="eventDateEnd">#dateformat(qryEvent.eventDateEnd, 'dd mmmm yyyy')#</i>
  
  </fieldset>  
    
<fieldset  >
	<legend>Event Costs</legend>

        <b> Currency</b>
        <i class="event_cost_currency fl_comboShort" style="display: inline">#qryEvent.event_cost_currency#</i>
        
        <b> Cost</b>
        <i class="fl_comboShort" title="event_cost_us" id="#qryEvent.webID#">#numberformat(qryEvent.event_cost_us, "_____.__")#</i>

        <b>Discount </b>
        <i class="fl_comboShort"  title="discountValue" id="#qryEvent.webID#"  >#numberFormat(qryEvent.discountValue, "9999")#</i>
        
        <b>Discount End </b>
		<i class="fl_date" id="discountDate">#dateformat(qryEvent.discountDate, "dd mmmm yyyy")#</i>

</fieldset>

 </td>
 <td valign="top">
 
 <fieldset  >
	<legend>Event Location</legend>
    
        <b> City</b>
        <i class="fl_text" id="event_loc_city">#qryEvent.event_loc_city#</i>
        
        <b> Country</b>
        <i class="event_loc_country fl_text" style="display: inline">#qryEvent.event_loc_country#</i>
        
        <b>Venue</b>
        <i class="hotel fl_text" style="display: inline">#get_venue.VenueName#</i> 
        
        <b>Event Room name</b>
        <i class="fl_text" id="venuRoom">#qryEvent.venuRoom#</i>
</fieldset>

 <fieldset  >
	<legend>Event Settings</legend>

<!---        <b>Event Group</b>
        <i class="eventgroup fl_comboPre">#qryEvent.eventgroup#</i>
        
        <b>Page Type</b>
        <i class="event_type fl_comboShort" >#qryEvent.event_type#</i>
        
        <b>Event code </b>
        <i  class="event_abbr fl_comboShort" id="#qryEvent.webID#">#qryEvent.event_abbr#</i>--->
        
        <b>bookable </b>
        <i  class="NoFormat" id="#qryEvent.webID#"><input type="checkbox"  id="singleEventNot" value="1" <cfif qryEvent.singleEventNot eq 1>checked="checked"</cfif>  /></i>
        
        <b>colorD</b>
        <i class="fl_comboShort" title="colorD">#qryEvent.colorD#</i>
        
        <b>colorL</b>
        <i class="fl_comboShort" title="colorL">#qryEvent.colorL#</i>

</fieldset>

 <fieldset  >
	<legend>Contact  Attendands</legend>
        
         <b>Fill Access</b>
        <i class="NoFormat"><a href=" qry_paswordUpdate.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#" rel="colorbox" class="button">Check Passwords</a></i>
        
        <b>Attence Form</b>
        <i class="NoFormat"><a href="act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=1&corespondence=1" rel="colorbox" class="button">send test</a></i>
        
        <b>Attence Form</b>
        <i class="NoFormat"><a href="act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=0&corespondence=1" rel="colorbox" class="button ">send final</a></i>   
    
    	<b>fill access</b>
        <i class="NoFormat"><a href="act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=1&corespondence=2" rel="colorbox" class="button ">send test</a></i>
        
        <b>Fill Access</b>
        <i class="NoFormat"><a href="act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=0&corespondence=2" rel="colorbox" class="button">send final</a></i>
       
 </fieldset>

</td>
<td valign="top">

 <fieldset  >
	<legend>Welcome Letter info</legend>
    
    
        <b>E-conference</b>
        <i class="Econf NoFormat" id="#qryEvent.webID#"><cfif qryEvent.Econf EQ 1> yes<cfelse>no</cfif></i>

		<b>registration Open time</b>
        <i  class="fl_text" id="timereg">#qryEvent.timereg#</i>
        
        <b>Event start time</b>
        <i class="fl_text" id="timestart">#qryEvent.timestart#</i>
        
        <b>pre regist place</b>
        <i class="fl_text" id="preRegistration">#qryEvent.preRegistration#</i>
        <b>pre regist date</b>
        <i class="fl_date" id="preRegistrationDate">#DateFormat(qryEvent.preRegistrationDate, "dd mmmm yyyy")#</i>
        <b>pre regist time</b>
        <i class="fl_text" id="preRegistrationTime">#qryEvent.preRegistrationTime#
        </i>
       
       <b>presentation Available</b>
       <i class="fl_date" id="filesAvailableDate">#dateFormat(qryEvent.filesAvailableDate, "dd mmm yyyy")#</i>
       
       <b>Attand form Submit date</b>
       <i class="fl_date" id="AttendFormDate">#dateFormat(qryEvent.AttendFormDate, "dd mmm yyyy")#</i>
<div class="clear"></div>
	 <fieldset  >
		<legend>Exibitions info</legend>
                <b>Booth setup time</b>
                <i class="fl_text" id="boothTimeSetup">#qryEvent.boothTimeSetup#</i>
                
                <b>Booth setup date</b>
                <i class="fl_date" id="boothDateSetup">#dateformat(qryEvent.boothDateSetup, "dd mmm yyyy")#</i>
                
                <b>Booth breakdown time</b>
                <i class="fl_text" id="boothTimeRemove">#qryEvent.boothTimeRemove#</i>
                
                <b>Booth breakdown date</b>
                <i class="fl_date" id="boothDateRemove">#dateformat(qryEvent.boothDateRemove, "dd mmm yyyy")#</i> 
   </fieldset>
</fieldset>
</td>
<td>

</td>
</tr>
</table>

</div>

<div id="tabs-Uploads">
	
    <h4>Event Page</h4>
<cfif qryEvent.event_type EQ "week" OR qryEvent.event_type EQ "cm" >        
        <b>Page header </b>
        <i class="colorL fl_comboShort"><cfif  qryEvent.file_image_pdf NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif> <div id="upload_banner" class="uploadButton" >Upload</div></i>
        
        <b>Brochure </b>
        <i class="colorL fl_comboShort"><cfif  qryEvent.file_update NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif> <div id="upload_brochure" class="uploadButton"  >Upload</div></i>
 
</cfif>
        <b>Hotel Form</b>
        <i class="colorL fl_comboShort"><cfif qryEvent.event_loc_weather NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif> <div id="upload_HotelFile" class="uploadButton" >Upload</div></i> 		
        

<cfif qryEvent.event_type EQ "week">
<div class="clear"></div>
    	<h4>Event Page</h4>    
    	<b>Home Page Banner 		</b>
        <i class="noFormat"> <cfif qryEvent.HomePageBanner NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif> <div id="upload_Homebanner" class="uploadButton" >Upload</div> </i>
        
        <b>Sponsors Oppertunities </b>
        <i class="noFormat"> <cfif  qryEvent.sponsorOppFile NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif> <div id="upload_SponsorOpFile" class="uploadButton"  >Upload</div></i>
        
        <b>S&E doc, GPP use only </b>
        <i class="noFormat"> <cfif  qryEvent.doc_SE_intern NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif><div id="upload_SponsorOp" class="uploadButton"  >Upload</div></i>

     	

</cfif>
<div class="clear"></div>
<h4>Upload images for email Template</h4>

    	<b>Header Image 		</b>
        <i class=""> <cfif qryEvent.newsletterBannerTop NEQ "" ><img src="../img/ok_tick-yellow.gif" />#qryEvent.newsletterBannerTop#<cfelse></cfif> <div id="upload_topBanner" class="uploadButton" >Upload </div></i>
        
        <b>Column 1 image 	</b>
        <i class=""><cfif qryEvent.newsletterBannerCol1 NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif> <div id="upload_colum1" class="uploadButton" >Upload</div></i>
        
        <b>Column 2 image 	</b>
        <i class=""><cfif qryEvent.newsletterBannerCol2 NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif><div id="upload_colum2" class="uploadButton" >Upload</div></i>
        
        <b>Top Image 600px	</b>
        <i class=""> <cfif qryEvent.newsletterBannerTop600 NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif> <div id="upload_topBanner600" class="uploadButton" >Upload</div></i>

</div>

<div id="tabs-EBlurb">
        <div class="column1" style="width:600px;">
        <h4>Main blurb <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb" rel="colorbox"><img src="../img/questionMark.gif"></a></h4>
                <form  name="BlurbForm" id="BlurbForm" method="post" action="update_TextArea.cfm">
                <textarea name="event_blurb"  id="event_blurb"  >#qryEvent.event_blurb#</textarea>
                <input type="hidden" name="id" value="#qryEvent.webID#" />
                <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb" rel="colorbox"><img src="../img/questionMark.gif"></a> <button>Save</button><span class="resultlabel" id="event_blurbResult"></span>
                </form>
        </div>
        <div class="column2" style="width:440px; padding:0 0 0 0; margin:0 0 0 5px;">
        		<h4>Focus On <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=focusOn" rel="colorbox"><img src="../img/questionMark.gif"></a></h4>
                	<form   method="post" id="BlurbFocus" action="update_TextArea.cfm">
                    <textarea name="focusOn" id="focusOn"   >#qryEvent.focusOn#</textarea>
                    <input type="hidden" name="id" value="#qryEvent.webID#" />
                    <button>Save</button><span class="resultlabel" id="focusOnResult"></span>
                    </form>
        </div>
		<div class="clear"></div>
</div>


<cfif qryEvent.event_type EQ "week" OR qryEvent.event_type EQ "RE"  or qryEvent.event_type eq 'CLUB' or qryEvent.event_type eq 'BOOK' or qryEvent.event_type eq 'advis' or qryEvent.event_type eq 'CM' or qryEvent.event_type eq 'EB'>
<div id="tabs-Sponsor">
        <form id="sponsorsBlurb" method="post" action="update_TextArea.cfm">
        <textarea name="event_blurb_sponsors"  id="event_blurb_sponsors"  >#qryEvent.event_blurb_sponsors#</textarea>
        <input type="hidden" name="id" value="#qryEvent.webID#" />
        <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb_sponsors" rel="colorbox"><img src="../img/questionMark.gif"></a> <button >Save</button><span class="resultlabel" id="event_blurb_sponsorsResult"></span>
        </form>
        <div class="clear"></div>
</div>
<div id="tabs-Exhib">
        <form id="exhibBlurb" method="post" action="update_TextArea.cfm">
        <textarea name="event_blurb_exhib"  id="event_blurb_exhib"  >#qryEvent.event_blurb_exhib#</textarea>
        <input type="hidden" name="id" value="#qryEvent.webID#" />
        <a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_blurb_exhib" rel="colorbox"><img src="../img/questionMark.gif"></a> <button >Save</button><span class="resultlabel" id="event_blurb_exhibResult"></span>
        </form>	
        <div class="clear"></div>
</div>

<div id="tabs-logo">
        <table width="100%" border="0" cellspacing="4" cellpadding="4" bgcolor="##F1FDFF" style="color:##FFFFFF">
          <tr>
            <td width="150" style="color:##003366">search companies</td>
            <td ><form id="formSearchCompany" method="post" action="company_list.cfm">
              <input type="text" name="company" id="company" />
              <input type="hidden" name="eventid" value="#qryEvent.webID#" />
              <input type="submit" name="button" id="button" value="Submit" /></form></td>
          </tr>
            <tr>
            <td colspan="2" bgcolor="##ffffff"><div id="AreaLoadCompanies">s</div>    </td>
          </tr>
        </table>
<div class="column1" >
	<h4>Other Sponsors  (<a href="##" onClick="serialize(); return false;" >Save Order</a>)</h4>
    <div id="logos_supporter" class="groupWrapper">
			 <cfif listLen(qryEvent.logos_supporter, ",") GT 0 >
                    <cfloop  index="i" list="#qryEvent.logos_supporter#">
                    <cfquery datasource="#dsnP21#" name="logosSponsor">		SELECT id, company, logofile FROM logos         WHERE id = #i#	</cfquery>
                    <div id="#logosSponsor.id#" class="row" >	 
                    <div class="col1" ><img src="../../_files/business/#logosSponsor.logofile#" /></div>
                    <div class="col2" >#logosSponsor.company# <a href="javascript:deleteLogo(#logosSponsor.id#, #qryEvent.webID#, 'logos_supporter');"><img src="../img/new_delete.gif" border="0" /></a></div>
                    </div>
                    </cfloop>
            </cfif>
     </div>
</div>
<div class="column1" >

    <h4>Lead Sponsors</h4>
    <div id="sponsor_lead" >
		<cfif listLen(qryEvent.sponsor_lead, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_lead">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_lead, ",") GT 1 >WHERE id IN (#qryEvent.sponsor_lead#)<cfelse>
                WHERE id = #qryEvent.sponsor_lead#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_lead">
                <div id="#sponsor_lead.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#sponsor_lead.logofile#" /></div>
                <div class="col2" >#sponsor_lead.company# <a href="javascript:deleteLogo(#sponsor_lead.id#, #qryEvent.webID#, 'sponsor_lead');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>


    <h4>Platinum Sponsors</h4>
    <div id="sponsor_platinum" >
		<cfif listLen(qryEvent.sponsor_platinum, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_platinum">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_platinum, ",") GT 1 >WHERE id IN (#qryEvent.sponsor_platinum#)<cfelse>
                WHERE id = #qryEvent.sponsor_platinum#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_platinum">
                <div id="#sponsor_platinum.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#sponsor_platinum.logofile#" /></div>
                <div class="col2" >#sponsor_platinum.company# <a href="javascript:deleteLogo(#sponsor_platinum.id#, #qryEvent.webID#, 'sponsor_platinum');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>

	<h4>Gold Sponsors</h4>
    <div id="sponsor_gold" >
			<cfif listLen(qryEvent.sponsor_gold, ",") GT 0 >
                    <cfquery datasource="#dsnP21#" name="sponsor_gold">
                    SELECT id, company, logofile FROM logos 
                    <cfif listLen(qryEvent.sponsor_gold, ",") GT 1 >WHERE id IN (#qryEvent.sponsor_gold#)<cfelse>
                    WHERE id = #qryEvent.sponsor_gold#
                    </cfif>
                    </cfquery>
                    <cfloop query="sponsor_gold">
                    <div id="#sponsor_gold.id#" class="row" >	 
                    <div class="col1" ><img src="../../_files/business/#sponsor_gold.logofile#" /></div>
                    <div class="col2" >#sponsor_gold.company# <a href="javascript:deleteLogo(#sponsor_gold.id#, #qryEvent.webID#, 'sponsor_gold');"><img src="../img/new_delete.gif" border="0" /></a></div>
                    </div>
                    </cfloop>
        </cfif>
    </div>
    <h4>Silver Sponsors</h4>
    <div id="sponsor_silver" >
        <cfif listLen(qryEvent.sponsor_silver, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_silver">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_silver, ",") GT 1 >WHERE id IN (#qryEvent.sponsor_silver#)<cfelse>
                WHERE id = #qryEvent.sponsor_silver#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_silver">
                <div id="#sponsor_silver.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#sponsor_silver.logofile#" /></div>
                <div class="col2" >#sponsor_silver.company# <a href="javascript:deleteLogo(#sponsor_silver.id#, #qryEvent.webID#, 'sponsor_silver');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
    	</cfif>
    </div>
    <h4>Bronze Sponsors</h4>
     <div id="sponsor_bronze" >
		 <cfif listLen(qryEvent.sponsor_bronze, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_bronze">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_bronze, ",") GT 1 >WHERE id IN (#qryEvent.sponsor_bronze#)<cfelse>
                WHERE id = #qryEvent.sponsor_bronze#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_bronze">
                <div id="#sponsor_bronze.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#sponsor_bronze.logofile#" /></div>
                <div class="col2" >#sponsor_bronze.company# <a href="javascript:deleteLogo(#sponsor_bronze.id#, #qryEvent.webID#, 'sponsor_bronze');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>

        <h4>Prefered Airline Sponsors</h4>
    <div id="sponsor_platinum" >
		<cfif listLen(qryEvent.sponsor_Airline, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_Airline">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.sponsor_Airline, ",") GT 1 >WHERE id IN (#qryEvent.sponsor_Airline#)<cfelse>
                WHERE id = #qryEvent.sponsor_Airline#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_Airline">
                <div id="#sponsor_Airline.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#sponsor_Airline.logofile#" /></div>
                <div class="col2" >#sponsor_Airline.company# <a href="javascript:deleteLogo(#sponsor_Airline.id#, #qryEvent.webID#, 'sponsor_Airline');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    
    
    <h4>Corporate Menmber Sponsor</h4>
    <div id="logo_corpMembers" >
		<cfif listLen(qryEvent.logo_corpMembers, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_corpMembers">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.logo_corpMembers, ",") GT 1 >WHERE id IN (#qryEvent.logo_corpMembers#)<cfelse>
                WHERE id = #qryEvent.logo_corpMembers#
                </cfif>
                </cfquery>
                <cfloop query="logo_corpMembers">
                <div id="#logo_corpMembers.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#logo_corpMembers.logofile#" /></div>
                <div class="col2" >#logo_corpMembers.company# <a href="javascript:deleteLogo(#logo_corpMembers.id#, #qryEvent.webID#, 'logo_corpMembers');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Corporate Sponsor</h4>
     <div id="logo_CorpSponsor" >
		 <cfif listLen(qryEvent.logo_CorpSponsor, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_CorpSponsor">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.logo_CorpSponsor, ",") GT 1 >WHERE id IN (#qryEvent.logo_CorpSponsor#)<cfelse>
                WHERE id = #qryEvent.logo_CorpSponsor#
                </cfif>
                </cfquery>
                <cfloop query="logo_CorpSponsor">
                <div id="#logo_CorpSponsor.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#logo_CorpSponsor.logofile#" /></div>
                <div class="col2" >#logo_CorpSponsor.company# <a href="javascript:deleteLogo(#logo_CorpSponsor.id#, #qryEvent.webID#, 'logo_CorpSponsor');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Supporting Sponsor</h4>
    <div id="supportedby" >
		<cfif listLen(qryEvent.supportedby, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="supportedby">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.supportedby, ",") GT 1 >WHERE id IN (#qryEvent.supportedby#)<cfelse>
                WHERE id = #qryEvent.supportedby#
                </cfif>
                </cfquery>
                <cfloop query="supportedby">
                <div id="#supportedby.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#supportedby.logofile#" /></div>
                <div class="col2" >#supportedby.company# <a href="javascript:deleteLogo(#supportedby.id#, #qryEvent.webID#, 'supportedby');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Corporate Patron</h4>
    <div id="logo_Patron" >
		<cfif listLen(qryEvent.logo_Patron, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_Patron">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.logo_Patron, ",") GT 1 >WHERE id IN (#qryEvent.logo_Patron#)<cfelse>
                WHERE id = #qryEvent.logo_Patron#
                </cfif>
                </cfquery>
                <cfloop query="logo_Patron">
                <div id="#logo_Patron.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#logo_Patron.logofile#" /></div>
                <div class="col2" >#logo_Patron.company# <a href="javascript:deleteLogo(#logo_Patron.id#, #qryEvent.webID#, 'logo_Patron');"><img src="../img/new_delete.gif" border="0" /></a></div></div>
                </cfloop>
        </cfif>
    </div>
    <h4>Contributing Sponsor</h4>
    <div id="logo_Contributing" >
		<cfif listLen(qryEvent.logo_Contributing, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_Contributing">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.logo_Contributing, ",") GT 1 >WHERE id IN (#qryEvent.logo_Contributing#)<cfelse>
                WHERE id = #qryEvent.logo_Contributing#
                </cfif>
                </cfquery>
                <cfloop query="logo_Contributing">
                <div id="#logo_Contributing.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#logo_Contributing.logofile#" /></div>
                <div class="col2" >#logo_Contributing.company# <a href="javascript:deleteLogo(#logo_Contributing.id#, #qryEvent.webID#, 'logo_Contributing');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
</div>
<div class="column2" >
    <h4>Media Sponsor</h4>
    <div id="logos_sponsore" >
		 <cfif listLen(qryEvent.logos_sponsore, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logos_sponsore">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(qryEvent.logos_sponsore, ",") GT 1 >WHERE id IN (#qryEvent.logos_sponsore#)<cfelse>
                WHERE id = #qryEvent.logos_sponsore#
                </cfif>
                </cfquery>
                <cfloop query="logos_sponsore">
                <div id="#logos_sponsore.id#" class="row" >	 
                <div class="col1" ><img src="../../_files/business/#logos_sponsore.logofile#" /></div>
                <div class="col2" >#logos_sponsore.company# <a href="javascript:deleteLogo(#logos_sponsore.id#, #qryEvent.webID#, 'logos_sponsore');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
</div>
<div class="clear"></div>
</div>
</cfif>
		</div>

<div class="clear"></div>


</cfoutput>        
        </div>
</div>

<div id="dialog" title="Inportant Message">
	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		If you see this message, click OK, and press save 2 more times, on the field you where updating..<br>
	There was an error saving, Pressing two more times will fix the problem..<br><br>In the process of solving issue..
    <br>
	</p>

</div>



<div id="modalPopUp"></div>
</body>
</html>


 <!---   
    <div id="tabOptions">
			<ul>
				<li><a href="##tabs-newSlot"> new slot</a></li>
                <li><a href="##tabs-newSpeaker">speakers</a></li>
                <li><a href="##tabs-addedit">add/edit</a></li>
            </ul>
                <div id="tabs-newSlot">
                	<form id="editSlot" name="editSlot" method="post" action="http://www.petro21.com/my-office/program/save_slot.cfm">  
                    <div id="areaNewSlot"></div>
                    </form>
                </div>
                <form action="http://www.petro21.com/my-office/program/speakers_list.cfm" method="post" id="formsearchSpeakers">
                <div id="tabs-newSpeaker"> 
                </div>
                </form>
                <form action="http://www.petro21.com/my-office/program/speakerSave.cfm" method="post" id="SpeakerNewSubmit" name="SpeakerNewSubmit"  >  
                <div id="tabs-addedit"> 
                </div>
                </form>
    </div>
    
    <a href="speakers.cfm?id=<cfoutput>#id#&groupby=#groupby#</cfoutput>" ><img src="../img/but_SpeakerAdd.jpg" border="0"/></a> <a href="PDFProgram.cfm?id=<cfoutput>#id#&groupby=#groupby#</cfoutput>" target="pdf" ><img src="../img/but_CreatPDF.jpg" border="0" /></a>    <a href="speakers_program.cfm?id=<cfoutput>#eventid#&groupby=#groupby#</cfoutput>" ><img src="../img/but_refreshP.jpg" border="0" /></a>--->
<!---
<!---        <li>Event Live<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=live" rel="colorbox"><img src="../img/questionMark.gif"></a></li>--->
      <!---  <li>Event Title<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_name" rel="colorbox"><img src="../img/questionMark.gif"></a></li>--->
        <!---<li style="height:50px">Sub Title<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=Slogan" rel="colorbox"><img src="../img/questionMark.gif"></a></li>--->
      <!---  <li style="height:60px">Slogan<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=briefingSlogan" rel="colorbox"><img src="../img/questionMark.gif"></a></li>--->
        
     <!---   <li style="height:40px">sticky Note<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=sloganSub" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>--->
    </ul>
    <ul class="ulMidle">
  <!---<!---      <li><input type="checkbox" name="live" id="live" value="1" <cfif qryEvent.live eq 1>checked="checked"</cfif>  /><!---<span style="color:##CC0000">Event not live on Front End<cfelse><span style="color:##00CC00">Event is live on Front End</span> <a href="edit_field.cfm?id=#qryEvent.webID#&field=live" rel="colorbox"><img src="../img/Edit_Key_14.gif" border="0" /></a>---></li>--->
<!---        <li><span class="event_name" id="#qryEvent.webID#">#qryEvent.event_name#</span></li>--->
        <li style="height:50px"><span class="Slogan" id="#qryEvent.webID#">#qryEvent.Slogan#</span></li>
        <li style="height:60px"><span class="briefingSlogan" id="#qryEvent.webID#">#qryEvent.briefingSlogan#</span></li>--->
<!---        
        <li style="height:40px"><span class="sloganSub" id="#qryEvent.webID#">#qryEvent.sloganSub#</span></li>--->
    </ul>--->

<!---<li>E-conference<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=Econf" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
       
        <li>registration Open time<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=timereg" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event start time<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=timestart" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>pre regist/ place/date/time<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=preRegistration" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Files Available/ Download<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=filesAvailableDate" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Attand form Submit date<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=AttendFormDate" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
    </cfif>    
    </ul>
    <ul class="ulMidle">

      <!---   <li><span class="event_abbr" id="#qryEvent.webID#">#qryEvent.event_year# </span></li> ---> 
         <li><span class="event_expire" id="#qryEvent.webID#">#dateformat(qryEvent.event_expire, 'dd mmmm yyyy')#</span> <span class="infoText">(First day of event::Format  14 july 2009 : )</span></li>
         <li><span class="eventDateEnd" id="#qryEvent.webID#">#dateformat(qryEvent.eventDateEnd, 'dd mmmm yyyy')#</span> <span class="infoText">(last day of event::Format  14 july 2009 : )</span></li>  
       <!---  <li><span class="event_days" id="#qryEvent.webID#"> #qryEvent.event_days#</span> <span class="infoText">(must be 14th - 16th format)</span></li>  
         <!--<li><span class="event_month"   style="display: inline">#qryEvent.event_month#</span></li>-->--->
    <cfif qryEvent.event_type EQ "week"><!--- Week discount area ------->
        <li><span class="discountValue"  id="#qryEvent.webID#" >#numberFormat(qryEvent.discountValue, "9999")#</span> / <span class="discountDate" id="#qryEvent.webID#">#dateformat(qryEvent.discountDate, "dd mm yyyy")#</span></li>
        
    </cfif>  
    <cfif qryEvent.event_type NEQ "week">
        <li><span class="event_cost_currency"   style="display: inline">#qryEvent.event_cost_currency#</span><span class="event_cost_us" id="#qryEvent.webID#">#numberformat(qryEvent.event_cost_us, "_____.__")#</span></li>
        <li><span class="event_cost_currency"   style="display: inline">#qryEvent.event_cost_currency#</span><span class="event_cost_uk" id="#qryEvent.webID#">#numberFormat(qryEvent.event_cost_uk, "_____.__")#</span></li>
        <li><span class="Econf" id="#qryEvent.webID#"><cfif qryEvent.Econf EQ 1> yes<cfelse>no</cfif></span> <span class="infoText">(type yes or 1 to make live / no or 0 to remove from live state)</span></li>
       <li><span class="timereg" id="#qryEvent.webID#">#qryEvent.timereg#</span></li>
        <li><span class="timestart" id="#qryEvent.webID#">#qryEvent.timestart#</span></li>
        <li><span class="preRegistration" id="#qryEvent.webID#">#qryEvent.preRegistration#</span>  / <span class="preRegistrationDate" id="#qryEvent.webID#">#qryEvent.preRegistrationDate#</span> / <span class="preRegistrationTime" id="#qryEvent.webID#">#qryEvent.preRegistrationTime#</span></li>
        <li><span class="filesAvailableDate" id="#qryEvent.webID#">#dateFormat(qryEvent.filesAvailableDate, "dd mmm yyyy")#</span></li>
    	<li><span class="AttendFormDate" id="#qryEvent.webID#">#dateFormat(qryEvent.AttendFormDate, "dd mmm yyyy")#</span></li>
    </cfif>
    </ul>--->
	
    <!---   <ul class="ulLeft">
    	<li>Event City<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_loc_city" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event Country<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_loc_country" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Select Hotel for Event<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=hotelname" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event Room name<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=venuRoom" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li></li>
        <li><a href="act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=1&corespondence=1" rel="colorbox" class="button uploadButton">send test Attence Form</a></li>
        <li><a href="act_events_attendence.cfm?gppID=#qryEvent.id_gpp#&eventid=#qryEvent.webID#&test=0&corespondence=1" rel="colorbox" class="button uploadButton">send Attence Form</a></li>
    </ul>
    <ul class="ulMidle">
    	<li><span class="event_loc_city" id="#qryEvent.webID#">#qryEvent.event_loc_city#</span></li>
        <li><span class="event_loc_country"   style="display: inline">#qryEvent.event_loc_country#</span> </li>
        <li><span class="hotelname"   style="display: inline">#get_venue.VenueName#</span></li>
        <li><span class="venuRoom" id="#qryEvent.webID#">#qryEvent.venuRoom#</span></li>
                <li></li>
        <li> </li>
        <li> </li>
    </ul>
    <!--- COLUMN 2 --------------->
        <ul class="ulLeft" style="border-left:1px dotted ##CCCCCC">
    		<li>Event Group<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=eventgroup" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
            <li>Page Type<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_type" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
        	<li>Event abrev<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=event_abbr" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
            <li>Event bookable by itself<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=singleEventNot" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
			<cfif qryEvent.event_type NEQ "week">
          <!---  <li><a href="selectGPP_id.cfm?id=#qryEvent.webID#&field=id_gpp"rel="colorbox" >Link Event to GPP database</a></li>--->
            <li>Clubs<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=clubname" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
            </cfif>
            <cfif qryEvent.event_type EQ "week">
            <li>Event dark color<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=colorD" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        	<li>Event light color<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=colorL" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
            
            <li>Booth setup time<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=boothTimeSetup" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        	<li>Booth setup date<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=boothDateSetup" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
            <li>Booth breakdown time<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=boothTimeRemove" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        	<li>Booth breakdown date<a href="fieldUpdateChecker.cfm?id=#qryEvent.webID#&field=boothDateRemove" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
            </cfif>
    </ul>
    <ul class="ulMidle">
    <li><span class="groupby" style="display: inline">#qryEvent.eventgroup#</span></li>
         <li><span class="event_type"   style="display: inline">
                                <cfif qryEvent.event_type eq "Event" >Conference<cfelseif qryEvent.event_type eq "eb" >Briefing<cfelseif qryEvent.event_type eq "DIN" >Dinner<cfelseif qryEvent.event_type eq "week" >Oil week<cfelseif qryEvent.event_type eq "book" >Book<cfelseif qryEvent.event_type eq "Club" >Club<cfelseif qryEvent.event_type eq "Advis" >Advisory<cfelseif qryEvent.event_type eq "CM" >Content Management<cfelseif qryEvent.event_type eq "RE" >Research</cfif>   
                                 </span></li>
         <li><span class="event_abbr" id="#qryEvent.webID#">#qryEvent.event_abbr#</span></li>                          
    	<li><span class="singleEventNot" id="#qryEvent.webID#"><cfif qryEvent.singleEventNot eq 1>True<cfelse>False</cfif></span></li>
		<cfif qryEvent.event_type NEQ "week">
        <!---<li><cfif qryEvent.webID_gpp NEQ "">id number: #qryEvent.webID_gpp#<cfelse>missing</cfif></li>--->
        <li><span class="club"   style="display: inline">#qryEvent.clubname#</span></li>
        </cfif>
        <cfif qryEvent.event_type EQ "week">
        <li style=" background-color:###qryEvent.colorD#"><span class="colorD" id="#qryEvent.webID#">#qryEvent.colorD#</span></li>
        <li style=" background-color:###qryEvent.colorL#"><span class="colorL" id="#qryEvent.webID#">#qryEvent.colorL#</span></li>
        <li ><span class="boothTimeSetup" id="#qryEvent.webID#">#qryEvent.boothTimeSetup#</span></li>
        <li ><span class="boothDateSetup" id="#qryEvent.webID#">#dateformat(qryEvent.boothDateSetup, "dd mmm yyyy")#</span></li>
        <li ><span class="boothTimeRemove" id="#qryEvent.webID#">#qryEvent.boothTimeRemove#</span></li>
        <li ><span class="boothDateRemove" id="#qryEvent.webID#">#dateformat(qryEvent.boothDateRemove, "dd mmm yyyy")#</span></li>
        </cfif>
    </ul>
    --->
	
    <!---<div id="tabs-Speakers">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td  width="350"   valign="top">

 	<ul style="margin:15px 0 45px 0;">
    	<li><a href="../program/index.cfm?id=#qryEvent.webID#&groupby=#qryEvent.groupby#&event_year=#qryEvent.event_year#"rel="colorbox" > Load program  </a></li>
        <li><a href="javascript:loadNewsFlashList('#qryEvent.webID#');">Load Speaker List </a> </li>
        <li><a href="javascript:loadFlashNews();">Create News Flash </a>    </li>
    </ul>

</td>
    <td   valign="top">
 <div id="flashnews" style="padding:0 0 0 20px"> </div>   </td>
  </tr>
</table>
<div id="areaSelectItem" style="border:1px solid ##B8D9FF; max-height:186px; overflow:auto "></div>
<div id="areaNewLoad"style="border:1px solid ##B8D9FF; max-height:186px; overflow:auto "></div> 
	<div class="clear"></div>
</div>--->

<!---<div id="tabs-Extras">
<cfquery datasource="#dsnP21#" name="getnames">SELECT id, name FROM gppusers</cfquery>
    <ul class="ulLeft">
<cfif qryEvent.event_type EQ "book" OR qryEvent.event_type EQ "re">
		<li>Extra Info / for books or reasearch only <a href="edit_field.cfm?id=#qryEvent.webID#&field=event_cost_details" rel="colorbox"><img src="../img/Edit_Key_14.gif" border="0" /></a></li>
</cfif>
<!---<cfif qryEvent.event_type NEQ "week">
    	<li> <a href="../functions/welcomeLetter.cfm?eventid=#qryEvent.webID#&groupby=#qryEvent.groupby#" rel="colorbox">Events functions</a></li>
        <li> <a href="../counts/functions_attend.cfm?id=#qryEvent.webID#"   rel="colorbox">functions Attendence List</a></li>
</cfif>--->
<!---<cfif qryEvent.event_type EQ "week">
    	
        <li>Event Floorplan <a href="floorplan.cfm?id=#qryEvent.groupby#&field=file_banner&for=FPImages" rel="colorbox"></a></li>
        <li><a href="javascript:loadFunction('../contacts2staff/dsp_contacts.cfm', 'areaFunctions', #qryEvent.webID#)" >Event contact lists </a></li>
         <li><a href="../contacts2staff/dsp_contacts.cfm?id=#qryEvent.webID#" rel="colorbox">Event contact lists </a></li>
</cfif>--->
<cfif qryEvent.event_type EQ "din">
<!---        <li><a href="../Meal_Preference/index.cfm?eventid=#qryEvent.webID#" rel="colorbox">Menu Options</a></li><!---javascript:loadMenuOptions()--->
        <li><a href="../Counts/dinner_menu.cfm?id=#qryEvent.webID#" rel="colorbox">Menu Counts </a></li>--->
</cfif>	
	
   </ul>
   <ul class="ulMidle">
<cfif qryEvent.event_type EQ "book" OR qryEvent.event_type EQ "re">
		<li>#qryEvent.event_cost_details# </li>
</cfif>
<cfif qryEvent.event_type NEQ "week">
   		<li></li>
</cfif>
 <cfif qryEvent.event_type EQ "week">
        <li></li>
        <li><span class="linkedIn" id="#qryEvent.webID#"></span></li>
 </cfif>
  <cfif qryEvent.event_type EQ "din">
        <li></li>
        <li></li>
 </cfif>	

  </ul>
  <!--- Column 2 start here ------------------------->
	<div id="areaFunctions" style="clear:right; float:left; width:550px; border:1px solid ##E7E7E7; margin:20px 0 0 0"> 
	
    </div>
   <div class="clear"></div>
</div>--->