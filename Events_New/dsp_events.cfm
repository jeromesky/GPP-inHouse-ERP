<cfinclude template="qry_events.cfm">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../javascript/Jeditable.js"  ></script>

<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery.jeditable.UIdatepicker.js"></script>
<link href="../styles/index.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	var eventID = <cfoutput>#eventid#</cfoutput>;
	$(function() {
		$("#tabs_events").tabs();
	});
	</script>
 
<style type="text/css">
#tabs_events .editGrid li{ clear:both;  margin:0px; padding:0px; list-style:none; border-bottom:1px solid #CCCCCC}
#tabs_events .editGrid ul{ margin:0px; padding:0px; list-style:none}
#tabs_events .editGrid .label{ clear:both; float:left; display:inline; width:250px; padding:0 10px 0 0; text-align:right; border-right:1px solid #CCCCCC }
#tabs_events .editGrid .data{ padding:0 0 0 10px;  display:inline; width:400px;   }
</style>

<title>P21</title>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">
<cfoutput>

<div id="tabs_events">
			<ul>
				<li><a href="##tabs-details">Details</a></li>
				<li><a href="##tabs-Uploads">Uploads</a></li>
                <li><a href="##tabs-EBlurb">Event Blurb</a></li>
                <li><a href="##tabs-Speakers">Speakers/program</a></li>
                <li><a href="##tabs-Extras">Contacts/functions</a></li>
           
			</ul>

		<div id="tabs-details">
        
        <div id="paneMenu">
                    <ul id="userMenu">
                        <li>Event Titles</li>
                        <li>Costs / Discounts</li>
                        <li>Venue / details</li>
                        <li>Conference Info</li>
                       	<li>sponsorship</li>
                        <li>Exhitions info</li>
                        <li>Event web configuration</li>
                    </ul>
       </div>
       <div id="PaneInfo">

            	<span>Event Live on Web</span> <i class="NoFormat" ><input type="checkbox" name="" id="" value="1" <cfif get.live EQ 1> checked="checked"</cfif> /></i>
              <span>Event Name</span> <i class="NoFormat" >#get.eventName#</i>
                <span>Slogan</span> <i class="NoFormat" >#get.briefingSlogan#</i>
                <span>Event Title</span> <i class="NoFormat" >#get.Slogan#</i>
                <span>Event Title</span> <i class="NoFormat" >#get.sloganSub#</i>
                

               <span>Start Date</span> <i class="NoFormat" >#dateformat(get.eventDateStart, 'dd mmmm yyyy')#</i>
               <span>End Date</span> <i class="NoFormat" >#dateformat(get.eventDateEnd, 'dd mmmm yyyy')#</i>

               <span> Enable e-conference</span> <i class="NoFormat" >
              <input type="checkbox" name="" id="" value="1" <cfif get.Econf EQ 1> checked="checked"</cfif> /></i>
               
              <span>Event registration open time</span> <i class="NoFormat" >#get.regOpenTime#</i>
               <span>Event start time</span> <i class="NoFormat" >#get.EventStartTime#</i>
               <span>Event preregistrater Location</span> <i class="NoFormat" >#get.preRegistration#</i>
               <span>Event preregister Date</span> <i class="NoFormat" >#get.preRegistrationDate#</i>
               <span>Event preregister Time</span> <i class="NoFormat" >#get.preRegistrationTime#</i>
               
               <span>Presentation Available for Download</span> <i class="NoFormat" >#dateFormat(get.filesAvailableDate, "dd mmm yyyy")#</i>
               <span>Client Attandence form Submit date</span> <i class="NoFormat" >#dateFormat(get.AttendFormDate, "dd mmm yyyy")#</i>


			<span>Event Room</span> <i class="NoFormat" >#get.venuRoom#</i>
            <span>Venue</span> <i class="NoFormat" >#get.VenueName#</i>
            <span>city</span> <i class="NoFormat" >#get.city#</i>
            <span>country</span> <i class="NoFormat" >#get.country#</i>
            
            <span>Event Group</span> <i class="NoFormat" >#get.eventGroupID#</i>
            <span>Event Type</span> <i class="NoFormat" >#get.eventType#</i>
            
             <span>Event bookable by itself</span> <i class="NoFormat" ><input type="checkbox" name="" id="" value="1" <cfif get.singleEventNot EQ 1> checked="checked"</cfif> /></i>
             
             <span>Event dark color</span> <i class="NoFormat"  style="background-color:###get.eventGroupColorPri#">Not Editable</i>
             <span>Event light color</span> <i class="NoFormat"  style="background-color:###get.eventGroupColor2nd#">Not Editable</i>
           
             
        <fieldset>
        	<legend>Exhibition information</legend>     
             
             <span>Booth setup time</span> <i class="NoFormat" >#get.boothTimeSetup#</i>
             <span>Booth setup date</span> <i class="NoFormat" >#dateformat(get.boothDateSetup, "dd mmm yyyy")#</i>
             <span>Booth breakdown time</span> <i class="NoFormat" >#get.boothTimeRemove#</i>
             <span>Booth breakdown date</span> <i class="NoFormat" >#dateformat(get.boothDateRemove, "dd mmm yyyy")#</i>
          
        </fieldset>
        
        <div class="clear"></div>
        </div>
        <div id="paneEdit">
        
        </div>
    </div>
        
    
<div id="tabs-Uploads">
        </div>
        
        <div id="tabs-EBlurb">
        </div>
        
        <div id="tabs-Speakers">
        </div>
        
        <div id="tabs-Extras">
        </div>
</div>
</cfoutput>
</body>
</html>