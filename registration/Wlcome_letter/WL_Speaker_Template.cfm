<cfset cleanFileName = replace(qryEvent.event_name,' ','_','All')>
    <cfset cleanFileName = replace(cleanFileName,'"','-','All')>
<cfset twoWeekBefore = dateAdd("d", -14, qryEvent.event_expire) > 
<cfset eventType = "" >
<cfdocument format="pdf"   pagetype="A4"  marginbottom="0.4" margintop="0.85" marginleft="0.01" marginright="0.01"   filename="#GetDirectoryFromPath(GetTemplatePath())#/Wlcome_letter/#cleanFileName#-#qryEvent.event_year#.pdf" overwrite="yes"  >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Petro21</title>

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
<cfoutput >
<cfdocumentitem type="header" >
        <table border="0" width="100%" cellpadding="0" cellspacing="0" height="80" bgcolor="###getGroup.ColorD#">
        	<tr>
           	  <td ><div style="height:23px; margin:0 0 0 35px; font-size:20pt; color:##FFFFFF; vertical-align:top; padding:0px;line-height:80%;font-family:Georgia, "Times New Roman", Times, serif;">#qryEvent.event_name# #qryEvent.event_year#</div>
				  <div style=" font-family:Arial, Helvetica, sans-serif;height:18px; margin:0 0 0 35px; font-size:10pt; color:##FFFFFF;line-height:95%;">#qry_eventDateFormatWeek#, #qryEvent.city#, #qryEvent.country# </div>
                
                </td>
           	  <td    ><img src="http://www.petro21.com/my-office/img/LogoGPP_WelcomeLetter2.png" width="56" height="55" /></td>
          </tr>
        </table>    
</cfdocumentitem>
<cfdocumentitem type="footer"> 	
        <table border="0" width="100%" cellpadding="8" cellspacing="0" bgcolor="###getGroup.ColorL#" height="30">
        	<tr>
            	<td style="color:##FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:11px;" >Page #cfdocument.currentpagenumber# of #cfdocument.totalpagecount#

                </td>
            </tr>
        </table>         
</cfdocumentitem >
<cfdocumentsection>

<table width="100%" border="0" cellspacing="4" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
    <tr>
    	<td colspan="2"  height="150" bgcolor="##F3F3F3">
        	<table border="0" cellpadding="10" cellspacing="0"  width="100%" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
            	<tr> 
            		<td   bgcolor="##F3F3F3" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:16px; border-bottom:4px solid ##ffffff; color:##666666" >Dear #order.name# #order.surname#  <!---<cfoutput>#order.name# #order.surname#</cfoutput>---></td>
				</tr>
                <tr> 
            		<td   height="15"></td>
				</tr>
        		<tr> 
            		<td ><p>
		  <cfif qryEvent.event_type EQ "event" ><cfset eventType = "conference" >
				We are honoured to have you as our Guest Speaker to the <strong>#qryEvent.event_name#</strong> <strong>#qry_eventDateFormatWeek#</strong>, and look forward to seeing you in  #qryEvent.city#, #qryEvent.country#. <br />Thank you for your support and commitment, it is much appreciated.<br /><br />
          </cfif>      
                  Please do not hesitate to contact Amanda Wellbeloved <br /><br />
					amanda@glopac-partners.com<br />
					Tel: + 27 11 880 7052 <br />
					mobile: + 27 82 888 1410<br />
					should you have any queries.
                  </p>
                  </td>
               </tr>
            </table>
        	
        </td>
   </tr>
 <cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" >   
   <tr>
   		<td bgcolor="##F9F5E1" valign="top" width="50%">
         
          <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td colspan="2" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Speaker Presentation  Details</td>
            </tr>
            <tr> 
            	<td colspan="2" height="15"></td>
            </tr>
  <tr>
    <td width="67" valign="top" align="right"><strong>Venue</strong></td>
    <td valign="top" >#hotel.VenueName#<br />
          #hotel.venueAddress#<br />#hotel.city#, #hotel.country#    </td>
    </tr>
  
  <tr>
    <td valign="top" align="right"><strong>Room</strong></td>
    <td valign="top"><cfif qryEvent.room NEQ "" >#qryEvent.room#<br /></cfif></td>
  </tr>
  <tr>
    <td valign="top" align="right"><strong> Event Date</strong></td>
    <td valign="top">#qry_eventDateFormatWeek#</td>
  </tr>
  <cfinclude template="../../Program/dsp_speakerTime.cfm">
<!---  <tr>
    <td valign="top" align="right"><strong>Presentation Date</strong></td>
    <td valign="top"><cfinclude template="../../Program/dsp_speakerTime.cfm"></td>
  </tr>
    <tr>
    <td valign="top" align="right"><strong>Presentation Time</strong></td>
    <td valign="top"><cfinclude template="../../Program/dsp_speakerTime.cfm"></td>
  </tr>
  <tr>
    <td valign="top" align="right"><strong>Session</strong></td>
    <td valign="top"><cfinclude template="../../Program/dsp_speakerTime.cfm"></td>
  </tr>--->
<!---  <tr>
  	<td valign="top" align="right"><strong>Presentation Time</strong></td>
    <td valign="top"> #speakerTime.presentationTime# in session #speakerTime.session#   // #user_id# AND eventid = #getwebid.id#    </td>
 </tr>--->

  <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
</table>
<!--- STart show other events on the week ---->
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
                    <td  style="font-size:11px; color:##666666"></td>
                </tr>
                 <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
        </table>
        <!--- --->
        
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
          </table>
          
       </td>
   </tr>
 </cfif> 
 <cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
   <tr>
   		<td colspan="2" valign="top" bgcolor="##F9F8ED">
        	<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Speaker Presentation Requirements</td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                
          	<ol>
           		<li ><span style="color:##FF3300">20 minutes have been allocated for your presentation</span>, and you are requested to please keep within the allotted time frame due to the tight schedule.  Speakers are requested to please be on stage 10 minutes prior the start of their session, and to stay for the full duration of the session. </li>
          		<li>The official language for the conference is English and all presentations should be made in English. No translation is available. </li>
          		<li>All Presentations to be made in PowerPoint. A laptop with PowerPoint will be supplied at the venue for all Presentations. We recommend that all Speakers use the computer supplied, for ease of transition between presentations.  A USB port and CD Rom Drive are supplied, as well as Acrobat and WINZIP. </li>
          		<li >A technician will be on-site throughout the event to assist.  Should you require any additional equipment, please advise Global Pacific & Partners in due time.  </li>
                <li>Please send a <span style="color:##FF3300">copy of your presentation</span> and a <span style="color:##FF3300">brief resume</span> of yourself to <a href="mailto:amanda@glopac-partners.com">amanda@glopac-partners.com</a>  <br />
<span style="font-size:11px">For large presentations, please upload the file to the following link: http://www.petro21.com/ftp/</span></li>
                <li><span style="color:##000066">You are automatically registered to attend the <i>#qryEvent.event_name#,  #qryEvent.event_year#</i></span>, as a Speaker, and your participation is gratis. You are not required to submit any registration forms or fees. </li>
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

<!--- function added manually ------->
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
				<cfif function.company NEQ "">
                <div style="margin:20px 0 0 0">
                	<table border="0" cellspacing="4" cellpadding="0" height="45" width="100%"  style="font-family:Arial, Helvetica, sans-serif; font-size:11px; color:##999999"><tr>
                    <td bgcolor="##ffffff"><span style="padding:0 0 0 15px;">#function.title# Sponsor: <strong></strong></span></td><td width="105"><img src="http://www.petro21.com/_files/business/#function.logofile#" width="105" height="45" /></td>
                    </tr></table>
                </div>
                </cfif>
                </td>
   			</tr>
		</table>
        </td>
  </tr>
</cfoutput></cfloop>   
<!--- default pannes --------->
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
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
 Please Note: VISA&rsquo;S are <strong>not</strong> issued at the Airport.  Should you require a Visa, please contact your nearest Embassy.  If you require a letter for Visa purposes, please contact our office on <cf_staff_Type_tel  contactTypeID="9" eventID="#EventWeekID#">
 at least <strong>one month prior to the event</strong>.  We are unable to issue Visas &amp; these are at the discretion of the relevant authorities.</p>
           <p>For any visa enquiries please visit <u>www.visahq.com/visas.php</u></p>
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
            Wide Horizons is the dedicated Conference Travel Agency, available to assist you with Travel, Accommodation and Tour / Safari bookings, special discounted rates and packages; and can be contacted on; <br /><br />
            Tel: + 27 11 447 0202 Fax: + 27 21 447 0203<br />
			Email: Brigitte@widehorizons.co.za <br /> 
			Website: www.widehorizons.co.za <br />

<cfelse>
			Speakers are required to make all their own travel and accommodation arrangements when attending this event.  These, and personal expenses are not included in the Registration Fees.<br />
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
<!---                <p>
            Become involved as a Sponsor, to maximize your profile and generate awareness of involvement in the region.  Please note that Packages can be tailored, depending on your marketing requirements, and I look forward to discussing the possibilities with you. Sponsors receive exposure in our #getall.event_name# Catalogue/ShowGuide - in Colour, glossy print - provided to all participants during the Week, which includes Editorial by leading authorities in oil, gas-LNG, the Conference agenda, articles on the latest corporate news, and Advertisements placed by Governments and corporate players in the industry, plus many other benefits.  For further information please contact me on Amanda@glopac-partners.com</p>
            
              <p> Please request further details for <strong>Sponsorship</strong> from <cf_staff_Type_tel  contactTypeID="4" eventID="#EventWeekID#"><br />
 <cfif qryEvent.event_type EQ "event" >
              Please request further details for <strong>Exhibition</strong> from <cf_staff_Type_tel  contactTypeID="5" eventID="#EventWeekID#"> 
 </cfif></p>--->
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
        <td bgcolor="##F4FFF5" valign="top"><table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          <tr>
            <td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >General</td>
          </tr>
          <tr>
            <td height="15"></td>
          </tr>
          <tr>
            <td><ul>
            			<li>The conference brochure is attached in PDF format. We would appreciate if you would forward it to colleagues/ clients whom may be interested in attending this event.</li>
                        <li>An up to date copy of the program is kept on our website <a href="http://www.petro21.com">www.petro21.com</a>. We will ensure to send you an updated copy 1-week prior the Conference.</li>
                   </ul>
                </td>
          </tr>
          <tr>
            <td height="10"></td>
          </tr>
        </table></td>
  </tr>
</cfif>

</table>
<cfdocumentitem type = "pagebreak" />
<table width="100%" border="0" cellspacing="4" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >

<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
   <tr>
   		<td colspan="2" valign="top" bgcolor="##F3F3F3">
         <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	
            <tr>
            	<td>
                <p><strong>Babette   van Gessel</strong><br />
Group Managing Director </p>
            <p><strong>Amanda Wellbeloved  </strong><br />
                    Senior Executive, International Events <br />
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
                  </table>            	</td>
             </tr>
             </table>       
        </td>
  </tr>
</cfif>
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
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
              <td valign="top"><!---#hotel.google#  --->            </td>
                <td valign="top" >#hotel.VenueName#<br />
                    <cfif qryEvent.room NEQ "" >
                      #qryEvent.room#<br />
                    </cfif>
                  #hotel.venueAddress#<br />
                  #hotel.city#<br />
                  #hotel.country# <br /><br />
                  <strong>tel</strong>: #hotel.venuePhone#<br />
                  <strong>fax</strong>: #hotel.venuefax#</td>
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