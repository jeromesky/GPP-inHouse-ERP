<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<title>Attendee Form</title>

<style type="text/css">
<!--
body {
	background-color: #FFF;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}
p{ margin:0;
padding:6px;}
-->
</style></head>

<body><cfoutput>
<table width="702" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" bgcolor="##4388c8" style="padding:40px 10px 20px 10px;;"><table width="100%" border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td valign="top"><span style="font: 1.6em normal Georgia, Times New Roman, Times, serif;color: ##fff;">Attendee Form & Events Information<br />
        </span></td>
        <td valign="top"><span style="font: 1.6em normal Georgia, Times New Roman, Times, serif;color: ##fff;">
          <cfloop query="weekMenu"><cfif weekMenu.event_type EQ "week" >#geteventidGPP.event_name# #weekMenu.year#</cfif></cfloop></span></td>
        <td><img src="http://www.petro21.com/docs/GPP_logo_econ_accEmail.gif" width="213" height="46" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" style="padding:30px 15px; border-bottom:1px solid ##CCC;">
    
    <table width="100%" border="0" cellspacing="10" cellpadding="4">
      <tr>
        <td colspan="2">  <p style="color:##C30"> <!---Please note venue is the #geteventidGPP.hotelname# Hotel</p>---><p>Dear<strong> #qryAttendenceList.title# #qryAttendenceList.name# #qryAttendenceList.surname#</strong></p>
       
      <p > You are registered for <strong>#geteventidGPP.event_name#</strong> held on the #qry_eventDateFormatWeek#, #geteventidGPP.hotelname#, #geteventidGPP.city#, #geteventidGPP.country#.  </p>
      <p >Please submit form by the <strong>#dateFormat(qrySubmitDate.eventInfoDateStart, "dd mmmm yyyy")#.</strong></p> </td>
      </tr>
	  <!--- INVOICE BOX --->
      <tr>
        <td colspan="2" style="border:1px solid  ##999999; padding:25px; margin:10px 0px; background-color:##FFFFFF">      
         <table width="100%" border="0" cellspacing="1" cellpadding="8">
  <tr>
    <td colspan="2"><h4 style="color:##4388c8">Your badge and attendee listing information at #geteventidGPP.event_name# #geteventidGPP.event_year# appears as </h4></td>
    </tr>
<!---  <tr>
    <td>&nbsp;</td>
    <td><table  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3" height="35" width="309"><img src="http://www.petro21.com/_img/2011/reg_cardtop.jpg" width="309" height="35"></td>
        </tr>
      <tr>
        <td width="19"><img src="http://www.petro21.com/_img/2011/reg_cardLeft.jpg" width="19" height="141"></td>
        <td bgcolor="##f5f5f5" width="270" style="padding:10px 0px" valign="top" align="center">
        	<div style="font-size:20px" >#Ucase(qryAttendenceList.name)# #Ucase(qryAttendenceList.surname)#</div>
            <div style="margin-top:20px; font-size:16px; color:##666" >#Ucase(qryAttendenceList.company)#</div>
        </td>
        <td width="20"><img src="http://www.petro21.com/_img/2011/reg_cardRight.jpg" width="20" height="141"></td>
      </tr>
      <tr>
        <td colspan="3" headers="18" ><img src="http://www.petro21.com/_img/2011/reg_cardbottom.jpg" width="309" height="18"></td>
        </tr>
    </table></td>
  </tr>--->
  <tr>
    <td width="95">&nbsp;</td>
    <td><strong>#qryAttendenceList.title# #qryAttendenceList.name# #qryAttendenceList.surname#</strong></td>
  </tr>

  <tr>
    <td valign="top">Position<br />
Company</td>
    <td valign="top">  #qryAttendenceList.possition#<br />
           #qryAttendenceList.company#  </td>
  </tr>
  <tr>
    <td valign="top">Email<br />
Alternative email<br />
Secretary email</td>
    <td valign="top">#qryAttendenceList.email#<br />
         #qryAttendenceList.emailSecond#<br />
         #qryAttendenceList.emailSecretary#</p>
         <p style="color:##990000; font-size:11px"> Your email address will not be visible on any public lists <br />
 <cfif geteventidGPP.event_type EQ "event" or geteventidGPP.event_type EQ "eb">
	<cfif qryAttendenceList.chkDelegate EQ 1   OR  qryAttendenceList.chkModerator EQ 1    OR  qryAttendenceList.chkSpeaker EQ 1 >
		 Email verification is strictly for access to the e-Conference site for post conference presentation downloads  
	</cfif>	 
</cfif> </p></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><a href="http://www.petro21.com/Components/attendee_form.cfm?userid=#qryAttendenceList.id#&eventID=#url.eventID#" style="background-color:##ffcc00; display:inline-block; border-right: 1px solid ##7a5a20; border-bottom: 1px solid ##7a5a20; padding:10px; text-decoration: none; color: ##000; text-align: center; white-space:none; font-weight: bold;">UPDATE / CONFIRM DETAILS ONLINE</a> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

  <table width="100%" border="0" cellspacing="1" cellpadding="4">
<!---<cfif geteventidGPP.preRegistration NEQ "" AND geteventidGPP.preRegistrationDate NEQ "" AND geteventidGPP.preRegistrationTime NEQ "">
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Pre-Register</td>
      <td>on #dateformat(geteventidGPP.preRegistrationDate, "dddd, dd mmm yyyy")# at #geteventidGPP.preRegistrationTime#,  #geteventidGPP.preRegistration#  </td>
    </tr> 
</cfif>--->
    <tr>
      <td>Registration</td>
      <td><!---#geteventidGPP.timereg#, ---><!---#timeFormat(qryCheckInDate.eventInfoDateStart, "hh:mm")#, --->#dateformat(qryCheckInDate.eventInfoDateStart, "dd mmm yyyy")#  </td>
    </tr>
    <tr>
      <td>Event start time</td>
      <td>#geteventidGPP.timestart#</td>
    </tr>
    <tr>
      <td width="110">Venue</td>
      <td>#geteventidGPP.venuRoom#  <strong>#geteventidGPP.hotelname#</strong>, #geteventidGPP.address#, #geteventidGPP.city#, #geteventidGPP.country# <br /> #geteventidGPP.tel#</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>#geteventidGPP.venuRoom#</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>You will receive a separate Attendee Form for each Event during #weekName# for which you are registered.<br>
Please contact us by #dateFormat(qrySubmitDate.eventInfoDateStart, "dd mmmm yyyy")# should you not have received all confirmations. </td>
    </tr>
    <tr>
      <td>Special Note</td>
      <td>#geteventidGPP.specialNote#</td>
    </tr>
<!---<cfif geteventidGPP.event_type EQ "din" >
    <tr>
      <td>Speaker</td>
      <td>#geteventidGPP.name#  #geteventidGPP.delegation#</td>
    </tr>
</cfif>--->
  </table>
      	  
 </td>
      </tr>
      <!--- PAY BOX --->
 <cfif geteventidGPP.event_type NEQ  "DIN" >     
      
<cfif qryAttendenceList.chkDelegate EQ 1 OR qryAttendenceList.chkExhibitor EQ 1 AND qryAttendenceList.companyGuest eq 1 AND geteventidGPP.event_type NEQ  "Bu_Pr" >
      <tr>
        <td colspan="2" style="border:1px solid ##999999; padding:15px 15px 15px 15px; margin:10px 0px"><h4 style="color:##4388c8">Payments</h4>
     <strong>Event Name</strong>: #geteventidGPP.event_name# #geteventidGPP.event_year#<br />
	<cfif qryAttendenceList.companyGuest Neq 1>
    		<strong>Invoice</strong>: #qryAttendenceList.invoice#<br />
	</cfif>
	<strong>Payment Status</strong>:  <cfif qryAttendenceList.companyGuest eq 1 >No Payment Required<cfelseif qryAttendenceList.paid EQ 1>Paid<cfelse>Unpaid</cfif>		
        <cfif qryAttendenceList.paid EQ 0>
    	<cfif qryAttendenceList.dicount EQ 1>
        		 <div style="margin:10px 0; border:1px solid ##CC6633; background-color:##FFEAE1; padding:10px"> 
                 		<p>Please ensure payment is received prior event. Should payment have been made or be in progress, please supply receipt of transaction to <a href="mailto:jolanda@glopac-partners.com">jolanda@glopac-partners.com</a> or <a href="mailto:tanya@glopac-partners.com">tanya@glopac-partners.com</a> to verify status and confirm payment of registration. </p>
          <p>Payments not completed prior Event ( <cfif   dayofWeek(dateFormat(dateadd("d", -3, geteventidGPP.event_expire), "dddd, dd mmmm yyyy")) eq 1 > #dateFormat(dateadd("d", -2, geteventidGPP.event_expire), "dddd, dd mmmm yyyy")#
                        <cfelseif   dayofWeek(dateFormat(dateadd("d", -3, geteventidGPP.event_expire), "dddd, dd mmmm yyyy")) eq 7 > #dateFormat(dateadd("d", -1, geteventidGPP.event_expire), "dddd, dd mmmm yyyy")#
                        <cfelse> #dateFormat(dateadd("d", -3, geteventidGPP.event_expire), "dddd, dd mmmm yyyy")#  
                      </cfif> ) will be re-invoiced post event on the full standard registration fee and any discounted rates will be adjusted automatically. </p>
				</div>
       <cfelse>
        <div style="margin:10px 0; border:1px solid ##CC6633; background-color:##FFEAE1; padding:10px">
          Please ensure payment is received prior event. Should payment have been made or be in progress, please supply receipt of transaction to <a href="mailto:jolanda@glopac-partners.com">jolanda@glopac-partners.com</a> or <a href="mailto:tanya@glopac-partners.com">tanya@glopac-partners.com</a> to verify status and confirm payment of registration.    
        </div>
     </cfif>
    </cfif>   
    </cfif>
     </td>
      </tr>
</cfif>
<!--- Register BOX --->
	
<!--- MEAL BOX --->
<cfif meals.recordcount GT 0>
      <tr>
        <td colspan="2" style="border:1px solid ##999999; padding:15px 15px 15px 15px; margin:10px 0px">
             <h4 style="color:##4388c8">Meal Preference</h4>
     		<table border="0" cellpadding="4" cellspacing="1" style="margin:0 0 20px 0">
            	<cfloop query="meals"><tr>
                	<td>#meals.meal#</td>
                </tr></cfloop>
             </table>
             <a href="http://www.petro21.com/Components/attendee_form.cfm?userid=#qryAttendenceList.id#&eventID=#url.eventID#"  style="background-color:##ffcc00; display:inline-block; border-right: 1px solid ##7a5a20; border-bottom: 1px solid ##7a5a20; padding:10px; text-decoration: none; color: ##000; text-align: center; white-space:none; font-weight: bold;">CHOOSE MEAL ONLINE</a>        </td>
      </tr>
 </cfif>
  <!--- INFO BOX ---->
  <cfif qryAttendenceList.chkExhibitor EQ 1 OR  qryAttendenceList.chkModerator EQ 1  OR  qryAttendenceList.chkPress EQ 1  OR  qryAttendenceList.chkSpeaker EQ 1   > 
      <tr>
      	<td colspan="2" style="border:1px solid ##999999; background-color:##FFFFFF; padding:15px 15px 15px 15px; margin:10px 0px">
             <h4 style="color:##4388c8">General information</h4>
 <cfif qryAttendenceList.chkModerator EQ 1  OR   qryAttendenceList.chkSpeaker EQ 1 >
             <ul>
               <li>An updated program listing scheduled times and presentations can be viewed at <a href="http://www.petro21.com/events/index.cfm?id=#weekID#">www.petro21.com</a> </li>
               <li>You have been <strong>allocated 20 minutes maximum for your presentation</strong>. &nbsp;&nbsp;Please keep within the allocated time frame as a courtesy to delegates and other Speakers. &nbsp;We have a full speaker line up and wish to remain on schedule. </li>
               <li><strong>Presentations</strong>: Presentation files can be loaded on our FTP Server (<U><a href="http://www.petro21.com/ftp">http://www.petro21.com/ftp</a></U> in PowerPoint format  no later then 3 days prior to the event   or provide a copy of your presentation in PowerPoint format at the event on a USB  </li>
               <li>Please ensure we have your <strong>CV &amp; Headshot photo</strong> ahead of the event for Moderator introductions </li>
               <li>We ask that you arrive at the Speakers table at the front stage 5-10 minutes prior start of your session. You are requested to be at the Speakers Table throughout the Session. </li>
               <li>There is a technician on-site throughout the session. &nbsp;Your presentation will be loaded in advance of your talk. &nbsp;You will be able to control the slides directly from the podium and will have technical back-up throughout the presentation. </li>
               <li>There is no Q&amp;A following the session </li>
               <li>You are automatically registered for the conference and related functions. &nbsp;Should you wish to attend other Events during #weekName#, please register in advance separately.</li>
             </ul>
 <cfelseif qryAttendenceList.chkPress EQ 1  >

   <ul>
     <li>An updated program listing schedule times and presentations can be viewed at <a href="http://www.petro21.com/docs/#weekID#">www.petro21.com</a> </li>
     <li><strong>Conference presentation online are not available to the media </strong><br />
     </li>
   </ul>
   <p>Your media pass entitles you access to the main conferences, namely the #geteventidGPP.event_name# on the #qry_eventDateFormatWeek#.&nbsp;&nbsp;There is no media access to the Briefings or to the Dinners. </p>
   <p>
     Due to &nbsp;past experience, we request that all press report on the event accurately, to avoid any untoward repercussions and Press misrepresentations of speaker presentations in print will with regret lead to refusal of future registrations. </p>
    <p> While the media are invited to the main conference, we request that the privacy of all our attendees be duly respected throughout on such occasions, including and especially at all social networking events. </p>
 <cfelseif qryAttendenceList.chkExhibitor EQ 1  >

   <ul>
     <li>An updated program listing schedule times and presentations can be viewed at <a href="http://www.petro21.com/docs/#theBrochure#">www.petro21.com</a> </li>
     <li>Exhibitors may set up their booths on  #dateformat(setUpboothDate, "dddd, dd mmm yyyy")# from #setUpboothTime# at the #geteventidGPP.hotelname# </li>
     <li>Exhibitors will not be allowed to set-up before this time. &nbsp;Booths must be completed by the exhibition start date. </li>
     <li>Exhibition Breakdown: &nbsp;To take place #dateformat(BreakDownboothDate, "dddd, dd mmm yyyy")# from #BreakDownboothTime# onwards.</li>
     <li>Please ensure full payment of your booth in advance of the event to ensure booth is built and exhibitors are allowed entry. </li>
     <li>Electrical points: &nbsp;240 Volts. Plug points: #geteventidGPP.country# </li>
     <li>Exhibitors may attend the luncheons and coffee breaks. &nbsp;Only one Exhibitor per booth may attend the related Functions and Dinners, unless where registered also as Delegates.</li>
   </ul>
 
 </cfif></td>
      </tr>
      </cfif>
 <!--- INFO BOX ---->
      <tr>
        <td colspan="2" style="border:1px solid ##999999; padding:15px 15px 15px 5px; margin:10px 0px; background-color:##FFECE0">
         <cfif qryAttendenceList.chkDelegate EQ 1 or qryAttendenceList.chkGuest EQ 1   > 
        <ul>
          <li>Please provide a <strong>Business card or ID at registration</strong></li>
          <li>Registrants will only be allowed access &nbsp;to the  events and related functions for which they have registered <cfif geteventidGPP.event_type NEQ  "Bu_Pr" >and paid. &nbsp;The Event area and all Functions are restricted to registered attendees only. Meetings on-site where visitors are not registered for the Event is not permitted.</cfif><br />
            Right of Admission is reserved<cfif geteventidGPP.event_type NEQ  "Bu_Pr" >
              and unauthorised attendance will be charged for. &nbsp;<strong>Cancellation &amp; No-Shows</strong>: Your registration holds contractual obligation for payments due 
            </cfif>
            . Replacements are welcome.</li>
          <cfif geteventidGPP.event_type NEQ  "Bu_Pr" ><li>The organisers reserve the right to deny entry where payment has not been received prior the event. A 10% penalty administration charge will be levied on all outstanding payments immediately post-event.</li></cfif>
          <li><strong>Badges</strong> should be worn throughout the day and at all functions for security clearance and entry.</li>
          <li><strong>Conference Attire</strong>: &nbsp;Business or Traditional</li>
          <li><strong>Social Functions & Dinners</strong>: &nbsp;Business, Traditional or Casual Attire</li>
          <li><strong>Visas</strong>: &nbsp;Please ensure you have the necessary visas and health certificates required for entry into Switzerland.  <!--- #geteventidGPP.country#. UK, EU, US, Canadian and Australian passport holders may obtain visas on arrival at the airport in Nairobi.  Please however check in advance with your Embassy. --->
            <!---as they are not provided on entry at the airport and must be obtained in advance---></li>
          <cfif geteventidGPP.event_type NEQ "din" >
          <li><strong>Meals</strong>: &nbsp;Vegetarian is catered for throughout all functions at  #weekName# #weekMenu.year# <!---<cfif weekMenu.groupby eq 2>and Halaal is available during at the Conference </cfif>---> </li>
          </cfif>
          <cfif geteventidGPP.event_type EQ "event" or geteventidGPP.event_type EQ "eb">
          <li><strong>Program</strong>: An updated program can be viewed at <a href="http://www.petro21.com/docs/#theBrochure#">www.petro21.com</a></li>
          <li>Conference Presentations will be available for download from our website from <strong>#dateFormat(qryPresentationDate.eventInfoDateStart, " dd mmmm yyyy")#</strong></li>
          </cfif>
        </ul>    
         <cfelseif qryAttendenceList.chkModerator EQ 1 OR qryAttendenceList.chkSpeaker EQ 1 >

           <ul>
             <li>Please provide a <strong>Business card or ID at registration </strong></li>
             <li>The Event area and all Functions are restricted to registered attendees only. Meetings on-site where visitors are not registered for the Event is not permitted. Right of Admission is reserved<cfif geteventidGPP.event_type NEQ  "Bu_Pr" > and unauthorised attendance will be charged for. &nbsp;</cfif> </li>
             <li><strong>Badges</strong> should be worn throughout the day and at all functions for security clearance and entry. &nbsp;&nbsp; </li>
             <li><strong>Conference Attire</strong>: &nbsp;Business or Traditional</li>
          <li><strong>Social Functions & Dinners</strong>: &nbsp;Business, Traditional or Casual Attire</li>
             <li><strong>Visas</strong>: &nbsp;Please ensure you have the necessary visas and health certificates required for entry into Switzerland.   <!---#geteventidGPP.country#. UK, EU, US, Canadian and Australian passport holders may obtain visas on arrival at the airport in Nairobi.  Please however check in advance with your Embassy. --->
               <!---as they are not provided on entry at the airport and must be obtained in advance---></li>
             <cfif geteventidGPP.event_type NEQ "din" >
             </cfif>
             <cfif geteventidGPP.event_type NEQ "din" ><li><strong>Meals</strong>: &nbsp;Vegetarian is catered for throughout all functions  #weekName# #weekMenu.year# <!---<cfif weekMenu.groupby eq 2>and Halaal is available during at the Conference </cfif>---> </li>
             </cfif>
             <cfif geteventidGPP.event_type EQ "event" or geteventidGPP.event_type EQ "eb">
          <li><strong>Program</strong>: An updated program can be viewed at <a href="http://www.petro21.com/events/index.cfm?id=#theBrochure#">www.petro21.com</a></li>
          <li>Conference Presentations will be available for download from our website from #dateFormat(qryPresentationDate.eventInfoDateStart, " dd mmmm yyyy")#</li>
          </cfif>
           </ul>

         <cfelseif qryAttendenceList.chkPress EQ 1  >

           <ul>
             <li>Please provide a <strong>Business card or ID at registration </strong></li>
             <li>The Event area and all Functions are restricted to registered attendees only. Meetings on-site where visitors are not registered for the Event is not permitted. 
               <cfif geteventidGPP.event_type NEQ  "Bu_Pr" >
                 Right of Admission is reserved and unauthorised attendance will be charged for. &nbsp;
               </cfif> </li>
             <li><strong>Badges</strong> should be worn throughout the day and at all functions for security clearance and entry. &nbsp;&nbsp; </li>
             <li><strong>Conference Attire</strong>: &nbsp;Business or Traditional</li>
          <li><strong>Social Functions & Dinners</strong>: &nbsp;Business, Traditional or Casual Attire</li>
             <li><strong>Visas</strong>: &nbsp;Please ensure you have the necessary visas and health certificates required for entry into Switzerland.  <!---Please ensure you have the necessary visas and health certificates required for entry into #geteventidGPP.country#. UK, EU, US, Canadian and Australian passport holders may obtain visas on arrival at the airport in Nairobi.  Please however check in advance with your Embassy.--->
               <!---as they are not provided on entry at the airport and must be obtained in advance---></li>
             </ul>

         <cfelseif qryAttendenceList.chkExhibitor EQ 1 >

          <ul>
            <li>Please provide a <strong>Business card or ID at registration </strong></li>
            <li>The Event area is restricted to registered attendees only. Meetings on-site where visitors are not registered for the Event is not permitted.
              <cfif geteventidGPP.event_type NEQ  "Bu_Pr" >
                 Right of Admission is reserved and unauthorised attendance will be charged for. &nbsp;
              </cfif></li>
            <li><strong>Badges</strong> should be worn throughout the day and at all functions for security clearance and entry. &nbsp;&nbsp; </li>
            <li><strong>Conference Attire</strong>: &nbsp;Business or Traditional</li>
          <li><strong>Social Functions & Dinners</strong>: &nbsp;Business, Traditional or Casual </li>
            <li><strong>Visas</strong>: &nbsp;Please ensure you have the necessary visas and health certificates required for entry into Switzerland.  <!---Please ensure you have the necessary visas and health certificates required for entry into #geteventidGPP.country#. UK, EU, US, Canadian and Australian passport holders may obtain visas on arrival at the airport in Nairobi.  Please however check in advance with your Embassy. --->
              <!---as they are not provided on entry at the airport and must be obtained in advance---></li>
            <li><strong>Meals</strong>: &nbsp;Vegetarian is catered for throughout all functions  #weekName# #weekMenu.year# <cfif weekMenu.groupby eq 2>and Halaal is available during at the Conference </cfif></li>
          </ul>
         </cfif>          </td>
      </tr>
 <!--- FUNCTIONS BOX ----> 
 <cfif qryFunction.recordcount GT 0 >
      <tr>
        <td colspan="2" style="border:1px solid ##999999; padding:15px 15px 15px 15px; margin:10px 0px">
             <h4 style="color:##4388c8">Functions at #geteventidGPP.event_name# #geteventidGPP.event_year#</h4>
    <p> As an attendee to #geteventidGPP.event_name# #qry_eventDateFormatWeek# you may attend all the related scheduled functions. 
      <!---<cfif geteventidGPP.event_type NEQ "din">
    Dinner spaces are limited and are on a first-come basis.  
    </cfif>--->
    </p>
    <p>To inform us of your intended participation at selected highlighted events indicated below: </p>

    <table width="100%" border="0" cellspacing="1" cellpadding="7">
           <tr >
           <td  valign="bottom">&nbsp;</td>
           <td  valign="bottom"><a href="http://www.petro21.com/Components/attendee_form.cfm?userid=#qryAttendenceList.id#&eventID=#url.eventID#"  style="background-color:##ffcc00; display:inline-block; border-right: 1px solid ##7a5a20; border-bottom: 1px solid ##7a5a20; padding:10px; text-decoration: none; color: ##000; text-align: center; white-space:none; font-weight: bold;">COMPLETE FORM ONLINE</a>   (Name badge to be worn at all times)</td>
         </tr>
         <tr >
           <td colspan="2">&nbsp;</td>
         </tr>
         <cfloop query="qryFunction">
         <tr <cfif qryFunction.functionTrack EQ 1 >style=" background-color:##d1ffc0"</cfif>>
           <td colspan="2" style="border-top:1px solid ##CCCCCC; " valign="bottom"><strong>#qryFunction.functionTitle#</strong></td>
           </tr>
         <tr >
           <td width="100" valign="top">Date:&nbsp;#dateFormat(qryFunction.functiondate, "dd.mmm.yyyy")#<br />Time:&nbsp;#qryFunction.functionTime#</td>
           <td valign="top">#qryFunction.functionDetails#</td>
         </tr>
          </cfloop>
       </table>        </td>
      </tr>
</cfif>
<!--- MAP OF VNA WATERFRON FOR AU 
	<tr>
		<td colspan="2"><h4 style="color:##4388c8">V&A Waterfront</h4></td>
    </tr>
	<tr>
    	<td valign="top">
        <ol>
        	<li>Two&nbsp;Oceans&nbsp;Aquarium</li>
            <li>Commodore&nbsp;Hotel</li>
            <li>BMW Pavilion</li>
            <li>221 Restaurant&nbsp;1<sup>st</sup>&nbsp;Floor</li>
            <li>BAIA Restaurant&nbsp;1<sup>st</sup>&nbsp;floor</li>
            <li>Table Bay Hotel</li>
            <li>Radisson Hotel</li>
            <li>Taxi Rank</li>
         </ol>        </td>
        <td><img src="http://www.petro21.com/post/templates/V&amp;A-Map.jpg" width="400" height="232" /></td>
	</tr>--->
<!---<cfif weekMenu.recordcount GT 0 >
      <tr>
        <td colspan="2" style="border:1px solid ##999999; padding:15px 15px 15px 15px; margin:10px 0px"><h4 style="color:##4388c8">Separately Bookable</h4> 
<p>If you have not already registered and would like to attend any of the events listed below, you may still register on www.petro21.com</p>
<p>Alternatively contact <a href="mailto:tanya@glopac-partners.com">tanya@glopac-partners.com</a></p>
<table width="100%" border="0" cellspacing="1" cellpadding="4" style="margin:15px 0">
         <cfloop query="weekMenu"><cfif weekmenu.event_type EQ "event" OR weekmenu.event_type EQ "eb" OR weekmenu.event_type EQ "Bu_Pr" OR weekmenu.event_type EQ "DIN" >
         <tr style="border-bottom:1px solid ##CCCCCC">
           <td width="250">#weekMenu.name#</td>
           <td ><!---#dateFormat(weekMenu.event_days, "dd")# #dateformat(weekMenu.event_month, "mmmm")#---></td>
           <td width="45" ><a href="http://www.petro21.com/events/index.cfm?id=#weekMenu.id#">register</a></td>
         </tr>
          </cfif></cfloop>
       </table>
** Discounted Rates Apply where you have registered for multiple events.</div>    
</td>
      </tr>
</cfif>--->
<!--- Onsite logistics --->
	<tr>
    	<td colspan="2"><h4 style="color:##4388c8">On-Site Logistics</h4>
          <table width="100%" border="0" cellspacing="1" cellpadding="4">
            <cfloop query="qryStaff"><tr>
              <td>#qryStaff.staffname#</td>
              <td>#qryStaff.mobile#</td>
              <td>#qryStaff.staffEmail#</td>
            </tr></cfloop>
          </table>
            </td>
	</tr>
    </table>

</td>
  </tr>
  <tr bgcolor="##999999">
    <td width="50%" valign="top" bgcolor="##333333" style="padding:20px 20px 20px 60px; color:##FFF"><p><strong style="color:##4388c8">The Hague Office<br />
</strong>Denneweg 124,<br />
2514 CL, &nbsp;Den Haag, The Netherlands<br />
Tel: + 31 70 324 6154 <br />
Fax: + 31 70 324 1741<br />
e-mail:  <a href="mailto:babette@glopac-partners.com" style="color:##FFFFFF">babette@glopac-partners.com</a><br />
<a href="http://www.petro21.com/" style="color:##FFFFFF">www.petro21.com</a></U>
&nbsp;<br />
    </p></td>
    <td width="50%" valign="top" bgcolor="##333333" style="padding:20px 60px 20px 20px; color:##FFF;  border-left:1px solid ##fff;"><p><strong style="color:##4388c8">Johannesburg Office<br />
</strong>Tel: + 27 11 880 7052<br />
Fax: + 27 11 880 1798<br />
<a href="mailto:amanda@glopac-partners.com" style="color:##FFFFFF">amanda@glopac-partners.com</a> or <a href="mailto:sonika@glopac-partners.com" style="color:##FFFFFF">sonika@glopac-partners.com</a><br />
  </p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</cfoutput>
</body>
</html>