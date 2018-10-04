
<!--- get events 
<cfquery datasource="#dsnP21#" name="staff">
SELECT id, name, email, tel FROM GPPusers
</cfquery>-------->


<!---<!--- get HoTELS  -------->
<cfif get.event_type EQ "event" OR get.event_type EQ "eb" OR get.event_type EQ "din" OR get.event_type EQ "bu_pr" >   
	<cfquery datasource="#gpp#" name="hotel" >
		SELECT *  FROM CRM_Venues WHERE venueID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.hotel#">
	</cfquery>
</cfif>
<!--- get functions  -------->
    <cfquery datasource="#dsnP21#" name="function">
        SELECT 
        		event_welcom.*, logos.company, logos.logofile 
        FROM 
        	event_welcom 
        RIGHT JOIN logos
        ON event_welcom.sponsor = logos.id
        WHERE 
        	event_welcom.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.webid#">
        ORDER 
        	BY functiondate , functionTime
    </cfquery>--->
<!--- get all events loop ----------------------->
<!---    <cfquery datasource="#gpp#" name="getall">
        SELECT 
        	webid, event_name, event_loc_hotel, event_year, event_days, event_month, event_type, event_loc_hotel AS hotel, groupby
        FROM 
        	 tblAnnual_Conf
        WHERE 
        	groupby = #get.groupby# AND YEAR(event_expire) =  <cfqueryparam cfsqltype="cf_sql_integer" value="#datepart('yyyy', get.event_expire)#"> AND (event_type = 'week' OR event_type = 'event' OR event_type = 'EB' OR event_type = 'DIN'  OR event_type = 'Bu_pr') 
        ORDER 
        	BY event_type desc, event_expire
    </cfquery>--->



    <cfset cleanFileName = replace(qryEvent.event_name,' ','_','All')>
    <cfset cleanFileName = replace(cleanFileName,'"','-','All')>
	<cfset twoWeekBefore = dateAdd("d", -14,  qryEvent.event_expire) /> 
<!---    <cfset twoWeekBefore = dateAdd("dd", -14,  createOdbcdate(get.event_expire-14) />--->
<cfset eventType = "" >
<cfdocument format="pdf"   pagetype="A4"  marginbottom="0.4" margintop="0.85" marginleft="0.01" marginright="0.01"   filename="#GetDirectoryFromPath(GetTemplatePath())#/Wlcome_letter/#cleanFileName#-#qryEvent.event_year#.pdf" overwrite="yes"  >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>

</head>
<!--- margintop="0" marginbottom="0" marginleft="0" marginright="0" --->
<body>
<style type="text/css">
<!--
body {font-family: Arial, Helvetica, sans-serif;	font-size: 12px; color:#3b3c3c;margin:0px; }

#title1{ height:16px; margin:0 0 0 135px; font-size:13pt; color:#FFFFFF; line-height:80%;}
#title2{ height:23px; margin:0 0 0 135px; font-size:16pt; color:#FFFFFF; vertical-align:top; padding:0px;line-height:80%;font-family:Georgia, "Times New Roman", Times, serif;}
#title3{height:16px; margin:0 0 0 135px; font-size:10pt; color:#FFFFFF;line-height:95%;}

.title{ font-weight:bolder;}
.green{ color:#0a8a1f;  }
fieldset{border:0px solid #ffffff; padding:25px 15px 10px 15px; margin:0 0 15px 0;border-top:1px solid #003399; }
legend{ color:#6388C5; font-weight:bold; font-family:Georgia, "Times New Roman", Times, serif; font-size:14px; text-decoration:overline}

.style1 {color: #003399}
.tel{color:#999999}
A.email{color:#598CE7}
-->
</style>
<cfoutput>
<cfdocumentitem type="header">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
<table border="0" width="100%" cellpadding="0" cellspacing="0" height="80" bgcolor="###ColorD#">
        	<tr>
           	  <td ><div style="height:23px; margin:0 0 0 35px; font-size:20pt; color:##FFFFFF; vertical-align:top; padding:0px;line-height:80%;font-family:Georgia, "Times New Roman", Times, serif;">#qryEvent.event_name# #qryEvent.event_year#</div>
				  <div style=" font-family:Arial, Helvetica, sans-serif;height:18px; margin:0 0 0 35px; font-size:10pt; color:##FFFFFF;line-height:95%;">#qry_eventDateFormatWeek#, #qryEvent.city#, #qryEvent.country# </div></td>
           	  <td><img src="http://www.petro21.com/my-office/img/LogoGPP_WelcomeLetter2.png" width="56" height="55" /></td>
          </tr>
        </table>    
</cfdocumentitem>
<cfdocumentitem type="footer"> 	
        <table border="0" width="100%" cellpadding="8" cellspacing="0" bgcolor="###ColorL#" height="30">
        	<tr>
            	<td style="color:##FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:11px;" >Page #cfdocument.currentpagenumber# of #cfdocument.totalpagecount#</td>
            </tr>
        </table>         
</cfdocumentitem >
<cfdocumentsection>

<table width="100%" border="0" cellspacing="4" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
    <tr>
    	<td colspan="2" height="150" bgcolor="##F3F3F3">
        	<table border="0" cellpadding="10" cellspacing="0" width="100%" style="font-family:Arial, Helvetica, sans-serif; font-size:11px">
            	<tr> 
            		<td bgcolor="##F3F3F3" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:16px; border-bottom:4px solid ##ffffff; color:##666666" >Dear #order.name# #order.surname#  <!---<cfoutput>#order.name# #order.surname#</cfoutput>---></td>
				</tr>
                <tr> 
            		<td height="15"></td>
				</tr>
        		<tr> 
            		<td ><p>
		  <cfif qryEvent.event_type EQ "event" ><cfset eventType = "conference" >
			    We  thank your registration/ request to the <strong>#qryEvent.event_name#</strong> on the <strong>#qry_eventDateFormatWeek#</strong>. Please find herewith details for the conference.
          <cfelseif qryEvent.event_type EQ "eb" ><cfset eventType = "Briefing" >
                We  thank your registration/ request to the <strong>#qryEvent.event_name#</strong> on the <strong>#qry_eventDateFormatWeek#</strong>. Please find herewith details for the Briefing.
          <cfelseif qryEvent.event_type EQ "din" ><cfset eventType = "Dinner" >
          		We  thank your registration/ request for <strong>#qryEvent.event_name#</strong> on the <strong>#qry_eventDateFormatWeek#</strong>. Please find herewith details for the Dinner.
          <cfelseif qryEvent.event_type EQ "Bu_Pr" ><cfset eventType = "Business Briefing" >
                We  thank your registration/ request to the <strong>#qryEvent.event_name#</strong> on the <strong>#qry_eventDateFormatWeek#</strong>. Please find herewith details for the Business Briefing.
          <cfelseif qryEvent.event_type EQ "club" ><cfset eventType = "Club Membership" >
          		We thank your  Membership request for <strong>#qryEvent.event_name#</strong> Please find herewith details for the Club Membership.
          <cfelseif qryEvent.event_type EQ "book" ><cfset eventType = "book" >
          		We thank you for the order of <strong>#qryEvent.event_name#</strong> on Petro21.com Please find herewith details for your Book(s) order/purchase .
          <cfelseif qryEvent.event_type EQ "Advis" ><cfset eventType = "advisory" >
          		We thank you for your  Order Request for <strong>#qryEvent.event_name#</strong> on Petro21.com. Please find herewith details for the Advisory order/ purchased.
          <cfelseif qryEvent.event_type EQ "WSO" ><cfset eventType = "World strategy online" >
          		We thank you for your order  request for <strong>#qryEvent.event_name#</strong> on Petro21.com. Please find herewith details for the World Strategy Online.
          <cfelseif qryEvent.event_type EQ "RE" ><cfset eventType = "research" >
          		We thank you for your order request for <strong>#qryEvent.event_name#</strong> on Petro21.com. Please find herewith details for your Research order/ purchase.
          </cfif>      
                  Please feel free to contact us should you have any queries.
                  </p>
                  </td>
               </tr>
            </table>
        	
        </td>
   </tr>
 <cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "Bu_Pr" OR qryEvent.event_type EQ "din" >   
   <tr>
   		<td bgcolor="##F9F5E1" valign="top" width="50%">
         
          <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td colspan="2" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Event Details</td>
            </tr>
            <tr> 
            	<td colspan="2" height="15"></td>
            </tr>
  <tr>
    <td width="67" valign="top" align="right"><strong>Venue</strong></td>
    <td valign="top" >#hotel.VenueName#<br />
          #hotel.venueAddress#<br />#hotel.CityNameEN#, #hotel.countryNameEN#    </td>
    </tr>
  
  <tr>
    <td valign="top" align="right"><strong>Room</strong></td>
    <td valign="top"><cfif qryEvent.room NEQ "" >#qryEvent.room#<br /></cfif></td>
  </tr>
  <tr>
    <td valign="top" align="right"><strong>Event Date</strong></td>
    <td valign="top">#qry_eventDateFormatWeek#</td>
  </tr>
  <tr>
  	<td valign="top" align="right"><strong>Registration Time</strong></td>
    <td valign="top">#qryEvent.timereg#</td>
 </tr>
  <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
</table>
<!--- STart show other events on the week ------------------------>
 		<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<cfloop query="get">
            <cfif get.event_type EQ "week">
            <tr> 
            	<td colspan="2" height="35"></td>
            </tr>
            <tr> 
            	<td colspan="2" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px;border-bottom:4px solid ##ffffff; color:##666666" >Scheduled  Events During<br /><span style=" color:###ColorD#;">#EventWeekName# #get.event_year#</span></td>
            </tr>
            <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
            </cfif>

            <cfif  get.event_type NEQ "week" >
            <tr>
                    <td>#get.event_name#</td>
                    <td><!---#get.event_days# #get.event_month#---></td>
            </tr>
            </cfif></cfloop>
            <tr>
                	<td  style=" font-size:10px; color:##666666">If you  have not registered, and would like to attend any of the above events please  send details to: email: <strong><cf_staff_Email contactTypeID="2" eventID="#EventWeekID#"></strong> Registrations fees apply.</td>
                    <td  style="font-size:11px; color:##666666">These events are all Separately Book-able</td>
                </tr>
                 <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
        </table>
        <!----- ----------------->
        
        </td>
   		<td  bgcolor="##F5F5F5" valign="top" width="50%"  >
          
          <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >General Contacts</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
              <td valign="bottom"  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:14px; color:##666666; " >Registration Enquiries</td>
           </tr>
           <tr> 
            	<td height="0"></td>
            </tr>
            <tr>
            	<td>	
               	<cf_staff_Type_List  contactTypeID="2" eventID="#EventWeekID#">

              
              </td>
           </tr>
  <cfif qryEvent.event_type EQ "event" > 
            <tr> 
            	<td height="10"></td>
            </tr>
            <tr>
              <td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:14px; color:##666666; " >Exhibition</td>
           </tr>
           <tr> 
            	<td height="0"></td>
            </tr>
            <tr>
            	<td>
                	<cf_staff_Type_List  contactTypeID="3" eventID="#EventWeekID#">
            
             </td>
            </tr>
 </cfif>
            <tr> 
            	<td height="10"></td>
            </tr>
             <tr>
              <td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:14px; color:##666666; " >To Sponsor</td>
           </tr>
           <tr> 
            	<td height="1"></td>
            </tr>
            <tr>
            	<td>
                	<cf_staff_Type_List  contactTypeID="4" eventID="#EventWeekID#">
         
              </td>
           </tr>
           <tr> 
            	<td height="10"></td>
            </tr>
           <tr>
              <td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:14px;  color:##666666; " >Accounts &amp; Payments</td>
           </tr>
           <tr> 
            	<td height="1"></td>
            </tr>
            <tr>
            	<td>
                <cf_staff_Type_List  contactTypeID="5" eventID="#EventWeekID#">

              </td>
            </tr>
             <tr> 
            	<td height="10"></td>
            </tr>
          </table>
          
       </td>
   </tr>
 </cfif> 
 <cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" OR qryEvent.event_type EQ "Bu_Pr" > 
   <tr>
   		<td colspan="2" valign="top" bgcolor="##F9F8ED">
        	<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >The Event</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                
          	<ol>
           		<li >Registration on #dateFormat(qryEvent.event_expire, "dddd, dd mmmm yyyy")# from <strong>#qryEvent.timereg#</strong> and #eventType# proceedings commences at <strong>#qryEvent.timestart#</strong></li>
          		<li>The #eventType# proceedings take place in The #qryEvent.room#</li>
          		<li>Business or traditional attire is acceptable throughout the #eventType# and scheduled functions</li>
          		<li style="color:##FF3300">The Event Area and all Functions are restricted to #eventType# Attendees only. The Organisers will not permit meetings on-site where visitors are not registered for the #eventType# and Reserve full Right of Admission</li>
          	</ol>
            
            	</td>
             </tr>
              <tr> 
            	<td height="10"></td>
            </tr>
             </table>
        </td>
   </tr>
</cfif>
</table>
<cfdocumentitem type = "pagebreak" />
<table width="100%" border="0" cellspacing="4" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >

<!--- function added manually ------------------------------------->
<cfloop query="function"><cfoutput>
   <tr>
   		<td colspan="2"  bgcolor="##F3F3F3">
        	<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >#function.title#</td>
            </tr>
            <tr> 
            	<td  height="15"></td>
            </tr>
  			<tr>
    			<td ><p>#function.content#</p>
                
              <b>Function starts</b> #function.functionTime# <br />
              <b>Function date</b> #Dateformat(function.functiondate, "dddd, dd mmm yyyy")#</td>
   			</tr>
             <tr>
    			<td >
	<!---			<cfif function.company NEQ "">
                <div style="margin:20px 0 0 0">
                	<table border="0" cellspacing="4" cellpadding="0" height="45" width="100%"  style="font-family:Arial, Helvetica, sans-serif; font-size:11px; color:##999999"><tr>
                    <td bgcolor="##ffffff"><span style="padding:0 0 0 15px;">#function.title# Sponsor: <strong></strong></span></td><td width="105"><img src="http://www.petro21.com/_files/business/#function.logofile#" width="105" height="45" /></td>
                    </tr></table>
                </div>
                </cfif>--->
                </td>
   			</tr>
		</table>
        </td>
  </tr>
</cfoutput></cfloop>   
<!--- default pannes ----------------------------------------------->
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" OR qryEvent.event_type EQ "Bu_Pr" > 
   <tr>
   		<td bgcolor="##F5F5F5" valign="top" width="50%">
       		<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Visa Permits</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p>
 Please Note: VISA&rsquo;S are <strong>not</strong> issued at the Airport.  Should you require a Visa, please contact your nearest Embassy.  If you require a letter for Visa purposes, please contact our office on <cf_staff_Type_tel  contactTypeID="9" eventID="#EventWeekID#">  at least <strong>one month prior to the event</strong>.  We are unable to issue Visas &amp; these are at the discretion of the relevant authorities. Visas will only be issued on Full payment being received for your participation.</p>
            <p>Yellow fever &amp; health certificates may be requested by some airport authorities &amp; should be checked in advance</p>
            
            	</td>
             </tr>
              <tr> 
            	<td height="10"></td>
            </tr>
             </table>
        </td>
        <td bgcolor="##F9F5E1" valign="top" width="50%">
        	       		<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Accommodation &amp; Travel</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p>
<cfif qryEvent.groupby eq 2 >            
            <strong>Please see the attached Hotel booking form or Contact Brigitte Lubbe from Wide Horizons on Tel: +27 21 447 0202 or email: Brigitte@widehorizons.co.za </strong><br />
            Delegates are required to make all their own travel and accommodation arrangements when attending this event.  These, and personal expenses are not included in the Registration Fees.
<cfelse>
			Delegates are required to make all their own travel and accommodation arrangements when attending this event.  These, and personal expenses are not included in the Registration Fees.<br />
            For hotel Booking rates &amp; terms, please see attached or contact <cf_staff_Type_tel  contactTypeID="8" eventID="#EventWeekID#">
	
</cfif></p>
            
            	</td>
             </tr>
              <tr> 
            	<td height="10"></td>
            </tr>
             </table>

        </td>
  </tr>
  <tr>
  		<td bgcolor="##F3FFFF" valign="top">
        <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Sponsor 
            	  <cfif qryEvent.event_type EQ "event" > &amp; Exhibition</cfif></td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p>
            Opportunities exist for Companies to Sponsor and/ or  exhibit/ display at this event. </p>
              <p> Please request further details for <strong>Sponsorship</strong> from <cf_staff_Type_tel  contactTypeID="4" eventID="#EventWeekID#">
			 <br />
 <cfif qryEvent.event_type EQ "event" >
              Please request further details for <strong>Exhibition</strong> from <cf_staff_Type_tel  contactTypeID="5" eventID="#EventWeekID#"> 
 </cfif></p>
            
            	</td>
             </tr>
              <tr> 
            	<td height="10"></td>
            </tr>
             </table>

        </td>
        <td bgcolor="##F4FFF5" valign="top">
                <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Payment Of Registration Fees / Booking Conditions & Contract Terms</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p>Payment of the registration fee is due upon receipt of invoice and must be made prior the #eventType#.  Payment can be made by Telegraphic Transfer, Credit Card or on the website: www.petro21.com   If payment is made by telegraphic transfer or direct deposit please fax the details to The Hague (31 70) 324 1741.</p>
                
                <p>
                Your booking is invoiced on registration by confirmation, with payment in full prior to any Conference
and/or Strategy Briefing or separately bookable Dinner event, in order to affirm your position, entry and/
or participation. In the case of any time-specific or other Discounts provided, the full sum of total fee/s
will become automatically due, and re-invoiced, if the period indicated for final payment is exceeded
and monies due have not been received. Following the date of closure of all event/s, in the case of any
outstanding fee/s unpaid, an automatic charge of an extra 10% will apply, and if still unpaid later than
30 days thereafter, another 10% charge will be due and levied.
                </p>
            
            	</td>
             </tr>
              <tr> 
            	<td height="10"></td>
            </tr>
             </table>

        </td>
  </tr>
</cfif>
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" OR qryEvent.event_type EQ "Bu_Pr"> 
  <tr>
   		<td colspan="2" valign="top" bgcolor="##CC3300">
        	<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px; color:##FFFFFF" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff" >Cancellation Policy & Replacements</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
<!---                <p>Your registration holds contractual obligation for payment/s due. However, any cancellation (in writing only) made  before the <strong>#dateformat(twoWeekBefore, "dd mmmm yyyy")#</strong> prior to start of the #eventType# will be refunded<!--- with a 20% administration charge--->. Thereafter, refunds will not apply<cfif qryEvent.event_type NEQ "din"> but delegates will receive online access to relevant Conference Presentations</cfif>. Replacements are welcome. All Delegates registered for any #eventType# will be liable for full payment due under this contract unless cancellation has been made and duly acknowledged.</p>--->
                
Your registration holds contractual obligation for payment/s due. However, any cancellation (in writing
only) made before the <strong>#dateformat(twoWeekBefore, "dd mmmm yyyy")#</strong> prior to start of #eventType# will be refunded. Thereafter, refunds will not apply<cfif qryEvent.event_type NEQ "din"> but delegates will receive online access to relevant Conference Presentations</cfif>. Replacements are welcome.<br />
On Receipt of registration form, delegates will be liable for full payment due under this contract unless
cancellation has been made and duly acknowledged.
            
            	</td>
             </tr>
                         <tr> 
            	<td height="10"></td>
            </tr>
             </table>
        </td>
 </tr>
</cfif>
</table>
<cfdocumentitem type = "pagebreak" />
<table width="100%" border="0" cellspacing="4" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
<cfif qryEvent.event_type EQ "book" OR qryEvent.event_type EQ "Advis" OR qryEvent.event_type EQ "re" > 
   <tr>
   		<td colspan="2" valign="top" bgcolor="##FFE9EC">
        <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Deliveries</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p>Please allow 5 –7 working days for deliveries, postage will only be made on receipt of payments </p>
            
            	</td>
             </tr>
              <tr> 
            	<td height="10"></td>
            </tr>
             </table>
        </td>
 </tr>
</cfif>
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" OR qryEvent.event_type EQ "Bu_Pr"> 
   <tr>
   		<td colspan="2" valign="top" bgcolor="##F3F3F3">
         <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Indemnity Clause</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p> <em>Where matters beyond the  reasonable control of Global Pacific &amp; Partners including: power failures, natural disasters, war,  terrorism, strikes or Acts of God prevent Global Pacific &amp; Partners being  able to perform its obligations under this agreement the Atendee releases  Global Pacific &amp; Partners from any liability or loss arising both pre-event &amp; onsite. Global  Pacific &amp; Partners reserves the Right to change the Programme as may be  required. &nbsp;</em><span class="style1">Disclaimer: Please  note that Global Pacific &amp; Partners cannot accept any responsibility (legal  or otherwise)&nbsp;for any Presentations made at our Events, or any  comments made by attendees . </span></p>
            <p><strong>Babette   van Gessel</strong><br />
Group Managing Director </p>
                  <p><strong>Jerry van Gessel</strong><br />
                    Marketing Manager<br />
                    Global Pacific &amp; Partners<br />
                  </p>
                              <table width="100%" border="0" cellspacing="4" cellpadding="3"  style="font-family:Arial, Helvetica, sans-serif; font-size:11px">
                    <tr>
                      <td width="240">The Hague Office: + 31 70 324 6154</td>
                      <td>Fax: + 31 70 324 1741</td>
                    </tr>
                    <tr>
                      <td>Johannesburg Office Tel: + 27.11.880.7052</td>
                      <td>Fax: + 27 11 880 1798 </td>
                    </tr>

                  </table>
            	</td>
             </tr>
             </table>       
        </td>
  </tr>
</cfif>
<cfif  qryEvent.event_type EQ "din" > 
    <tr>
   		<td colspan="2" valign="top" bgcolor="##9B894D" >
        <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px; color:##FFFFFF" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff" >PetroAfricanus Membership</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p>For further information on Individual or Corporate Membership at PetroAfricanus, please contact Duncan on duncan@glopac-partners.com</p>
            
            	</td>
             </tr>
             </table>
        </td>
   </tr>
</cfif>
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" OR qryEvent.event_type EQ "Bu_Pr"> 
  <tr>
   		<td colspan="2" valign="top" >
            <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px; color:##666666" >
          	<tr> 
            	<td colspan="2" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##666666; color:##666666" >Event Location</td>
            </tr>
            <tr> 
            	<td colspan="2" height="15"></td>
            </tr>
              <tr>
              <td valign="top"><!---#hotel.venueGoogleMap# --->             </td>
                <td valign="top" >#hotel.VenueName#<br />
                    <cfif qryEvent.room NEQ "" >
                      #qryEvent.room#<br />
                    </cfif>
                  #hotel.venueAddress#<br />
                  #hotel.CityNameEN#<br />
                  #hotel.countryNameEN# <br /><br />
                  <strong>tel</strong>: #hotel.venuePhone#<br />
                  <strong>fax</strong>: #hotel.venueFax#</td>
              </tr>
            </table>
        </td>
   </tr>
 </cfif>
</table> 
 
</cfdocumentsection>   
</cfoutput>
</body></html>
</cfdocument>
            <!---  <cfloop query="staff"><cfif listcontains(get.accpay, staff.id, ",") >
              	<strong>#trim(staff.name)#</strong>: 
                #trim(staff.email)#<br />
              </cfif></cfloop>--->
              <!---<cfloop query="staff"><cfif  listcontains(get.sponenq, staff.id, ",")   ><a href="#trim(staff.email)#" class="email">#trim(staff.email)#</a>, tel: <span class="tel">#trim(staff.tel)#</span>, </cfif></cfloop>--->
              <!---<cfloop query="staff"><cfif  listcontains(get.AcoCont, staff.id, ",")    ><a href="#trim(staff.email)#" class="email">#trim(staff.email)#</a>, tel: <span class="tel">#trim(staff.tel)#</span>, </cfif></cfloop>--->
			<!---<cfloop query="staff"><cfif  listcontains(get.sponenq, staff.id, "," )   ><a href="#trim(staff.email)#" class="email">#trim(staff.email)#</a>, tel: <span class="tel">#trim(staff.tel)#</span>, </cfif></cfloop>---><!---<cfloop query="staff"><cfif listcontains(get.VisCont, staff.id, ",") ><a href="#trim(staff.email)#" class="email">#trim(staff.email)#</a>, tel: <span class="tel">#trim(staff.tel)#</span>, </cfif></cfloop>--->
             <!---    <cfloop query="staff"><cfif listcontains(get.sponenq, staff.id, ",")  NEQ "0" >
              	<strong>#trim(staff.name)#</strong><br />
                <span class="tel">#trim(staff.tel)# or </span>
                #trim(staff.email)#<br />
              </cfif></cfloop> ---> 
              <!---  <cfloop query="staff"><cfif listcontains(get.exhenq, staff.id, ",") NEQ "0" >
              	<strong>#trim(staff.name)#</strong><br />
                <span class="tel">#trim(staff.tel)# or </span>
                
                #trim(staff.email)#<br />
             </cfif></cfloop>--->
             <!---              <cfloop query="staff"><cfif listcontains(get.Enquir, staff.id, ",") NEQ "0" >
              	<strong>#trim(staff.name)#</strong><br />
              	<span class="tel">#trim(staff.tel)# or </span>
                #trim(staff.email)#<!---<a href="#trim(staff.email)#" class="email"></a>---><br />
                </cfif></cfloop> --->