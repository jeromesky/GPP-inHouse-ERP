
<!---<cfif get.event_type EQ "event" OR get.event_type EQ "eb" OR get.event_type EQ "din" >   
	<cfquery datasource="#dsnP21#" name="hotel">
		SELECT * 
		FROM hotels 
		where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.hotel#">
	</cfquery>
</cfif>--->
<!--- get functions  -------->
<!---<cfquery datasource="#dsnP21#" name="function">
SELECT event_welcom.*, logos.company, logos.logofile 
FROM event_welcom RIGHT JOIN logos
ON event_welcom.sponsor = logos.id
WHERE event_welcom.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.webid#">
ORDER BY functiondate , functionTime
</cfquery>--->
<!--- get all events loop ----------------------->
<!---<cfquery datasource="#gpp#" name="getall">
SELECT webid, event_name, event_loc_hotel, YEAR(event_expire) AS event_year, event_days, MONTH(event_expire) AS event_month, event_type, event_loc_hotel AS hotel, groupby, event_expire, ColorD, ColorL
			, boothDateSetup, boothTimeSetup, boothDateRemove, boothTimeRemove
FROM tblAnnual_Conf
WHERE 
	groupby = #get.groupby# AND 
    event_year = '#get.event_year#' AND
 	event_type IN ('week', 'event' , 'EB' , 'DIN', 'exh', 'spon') 
ORDER BY event_type desc, event_expire
</cfquery>--->
<!--- get colors ---->
<!---<cfquery  dbtype="query" name="getGroup">
			SELECT webid, ColorD, ColorL, event_year, event_days, event_month , boothDateSetup, boothTimeSetup, boothDateRemove, boothTimeRemove
			FROM getall 
            WHERE 
            groupby = #getall.groupby# AND 
            event_year = #datePart("yyyy", getall.event_expire)# AND 
            event_type = 'week'
</cfquery>--->


    <cfset cleanFileName = replace(get.event_name,' ','_','All')>
    <cfset cleanFileName = replace(cleanFileName,'"','-','All')>
<cfset twoWeekBefore = createOdbcdate(get.event_expire-14) /> 
<cfset eventType = "" >
<cfdocument format="pdf" pagetype="A4"  marginbottom="0.4" margintop="0.85" marginleft="0.01" marginright="0.01"   filename="#GetDirectoryFromPath(GetTemplatePath())#/Wlcome_letter/#cleanFileName#-#get.event_year#.pdf" overwrite="yes"  >
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
<cfoutput query="get">
<cfdocumentitem type="header" >
        <table border="0" width="100%" cellpadding="0" cellspacing="0" height="80" bgcolor="###ColorD#">
        	<tr>
           	  <td ><div style="height:23px; margin:0 0 0 35px; font-size:20pt; color:##FFFFFF; vertical-align:top; padding:0px;line-height:80%;font-family:Georgia, "Times New Roman", Times, serif;">#qryEvent.event_name# #qryEvent.event_year#</div>
				  <div style=" font-family:Arial, Helvetica, sans-serif;height:18px; margin:0 0 0 35px; font-size:10pt; color:##FFFFFF;line-height:95%;">#qry_eventDateFormatWeek#, #qryEvent.city#, #qryEvent.country# </div></td>
           	  <td><img src="http://www.petro21.com/my-office/img/LogoGPP_WelcomeLetter2.png" width="56" height="55" /></td>
          </tr>
        </table>   
</cfdocumentitem>
<cfdocumentitem type="footer"> 	
        <table border="0" width="100%" cellpadding="8" cellspacing="0" bgcolor="###getGroup.ColorL#" height="30">
        	<tr>
            	<td style="color:##FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:11px;">Page #cfdocument.currentpagenumber# of #cfdocument.totalpagecount#</td>
            </tr>
        </table>         
</cfdocumentitem >
<cfdocumentsection>

<table width="100%" border="0" cellspacing="4" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
    <tr>
    	<td colspan="2"  height="150" bgcolor="##F3F3F3">
        	<table border="0" cellpadding="10" cellspacing="0"  width="100%" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
            	<tr> 
            		<td   bgcolor="##F3F3F3" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:16px; border-bottom:4px solid ##ffffff; color:##666666">Dear #order.name# #order.surname#  <!---<cfoutput>#order.name# #order.surname#</cfoutput>---></td>
				</tr>
                <tr> 
            		<td height="15"></td>
				</tr>
        		<tr> 
            		<td ><p>
		  <cfif qryEvent.event_type EQ "event" ><cfset eventType = "conference" >
          		This Exhibitor Information document serves to confirm all details relating to your exhibition stand at the <strong>#get.event_name#  #get.event_year#</strong> #eventType#. We thank you for your commitment and look forward to welcoming you to  #city#, #country#.  
          		<br /><br />
          </cfif>      
                  Please do not hesitate to contact 
<!---                  <cfloop query="users">
				  	<cfif listcontains(get.exhenq, users.id, ",") NEQ "0" >
              	<strong>#trim(users.name)#</strong><br />
                <span class="tel">#trim(users.tel)# or </span><br />
                <span class="tel">#trim(users.mobile)# or </span><br />
                
                #trim(users.email)#<br />
                
             </cfif>
             	</cfloop>--->
                  <cf_staff_Type_List  contactTypeID="3" eventID="#EventWeekID#">
               <!---   Sonika Greyvenstein <br />
					sonika@glopac-partners.com<br />
					Tel: + 27 11 880 7052 <br />
					mobile: + 27 79 872 8331<br />
					should you have any queries.--->
                  </p>
                  </td>
               </tr>
            </table>
        	
        </td>
   </tr>
 <cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" >   
   <tr>
   		<td bgcolor="##F9F5E1" valign="top" width="50%">
         
          <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px">
          	<tr> 
            	<td colspan="2" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666">Event Details</td>
            </tr>
            <tr> 
            	<td colspan="2" height="15"></td>
            </tr>
  <tr>
    <td width="67" valign="top" align="right"><strong>Venue</strong></td>
    <td valign="top" >#hotel.VenueName#<br />
          #hotel.venueAddress#<br />#hotel.CityNameEN#, #hotel.countryNameEN#</td>
    </tr>
  <tr>
    <td valign="top" align="right"><strong>Room</strong></td>
    <td valign="top"><cfif get.room NEQ "">#get.room#<br /></cfif></td>
  </tr>
  <tr>
    <td valign="top" align="right"><strong>Event Date</strong></td>
    <td valign="top">#qry_eventDateFormatWeek#</td>
  </tr>
  <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
</table>
          <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
            <tr>
              <td style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Set-Up of Exhibition Stands</td>
            </tr>
            <tr>
              <td height="15"></td>
            </tr>
            <tr>
              <td  valign="top"><ul>
              							<li>Exhibitors may set-up their booths on <strong>#dateformat(boothDateSetup, "dddd, dd mmm yyyy")#</strong> from <strong>#boothTimeSetup#</strong> at the <strong>#hotel.VenueName#</strong>. </li>
										<li>Please note: No Exhibitors will be allowed to set-up before the above mentioned set-up times. Booths must be completed by the exhibition start date. </li>
	
                                        <li>Exhibition Breakdown: &nbsp;To take place <strong>#dateformat(boothDateRemove, "dddd, dd mmm yyyy")#</strong> from <strong>#boothTimeRemove#</strong> onwards.</li>
                                        </ul>
</td>
              </tr>

            <tr>
              <td height="10"></td>
            </tr>
          </table>
          <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
            <tr>
              <td style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Exhibition Booth Includes</td>
            </tr>
            <tr>
              <td height="15"></td>
            </tr>
            <tr>
              <td  valign="top"><ul>
                  <li>1 x Electrical plug point (South Africa) 240volts</li>
                  <li> 2 x Spotlights                    </li>
                  <li>White fascia board with company name in black vinyl lettering (See size under booth dimensions)                    </li>
                  <li>1 x Table (Standard trestle table size: 1.8m length x 045m width) and 2 x chairs </li>
              </ul></td>
            </tr>
            <tr>
              <td height="10"></td>
            </tr>
          </table>
          <!--- STart show other events on the week ---------------->
<!--- 		<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<cfloop query="getall"><cfoutput>
            <cfif getall.event_type EQ "week">
            <tr> 
            	<td colspan="2" height="35"></td>
            </tr>
            <tr> 
            	<td colspan="2" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px;border-bottom:4px solid ##ffffff; color:##666666" >Scheduled  Events During<br /><span style=" color:###getGroup.ColorD#;">#getall.event_name# #getall.event_year#</span></td>
            </tr>
            <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
            </cfif>

            <cfif getall.id NEQ get.id AND getall.event_type NEQ "week" >
            <tr>
                    <td>#getall.event_name#</td>
                    <td>#getall.event_days# #getall.event_month#</td>
            </tr>
            </cfif></cfoutput></cfloop>
            <tr>
                	<td  style=" font-size:10px; color:##666666">Please note, whilst you are automatically registered to attend <strong>#get.event_name#</strong>  as our Guest Speaker, all other events listed are separately bookable, in advance; and are listed above.<br />
To Secure your registration at any of the events listed, please email:<br />
<strong>babette@glopac-partners.com<br />
tanya@glopac-partners.com </strong></td>
                    <td  style="font-size:11px; color:##666666"></td>
                </tr>
                 <tr> 
            	<td colspan="2" height="10"></td>
            </tr>
        </table>--->
        
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
            	<td><cf_staff_Type_List  contactTypeID="2" eventID="#EventWeekID#">
              
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
 <cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
   <tr>
   		<td height="338" colspan="2" valign="top" bgcolor="##F9F8ED">
        	<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td colspan="2"  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Booth Dimensions</td>
                <td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Fascia Company Signage Board</td>
          	</tr>
            <tr> 
            	<td height="15" colspan="3"></td>
            </tr>
            <tr>
            	<td width="140"><img src="http://www.petro21.com/my-office/img/ConferneceBoothPicture.png"  /></td>
                <td width="467"  valign="bottom">Example: a 3x1m booth has three back panels and one panel on each side of the booth with a fascia board at the top to read the company name. 
                  <br />
                  <strong>Size of each panel</strong>: 2 meters or 240 cm or 2400mm (Height) and (Width) 96 cm or 960 mm.</td>
                <td width="1190"  valign="top"><img src="http://www.petro21.com/my-office/img/ConferneceBoothSignage.png"  /></td>
            </tr>
              <tr> 
            	<td height="10" colspan="3"></td>
            </tr>
             </table>
            <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
              <tr>
                <td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Do’s and Don’ts for Exhibition Booths</td>
              </tr>
              <tr>
                <td height="15"></td>
              </tr>
              <tr>
                <td ><ul>
<li>No painting is allowed</li>
<li> no usage of nails or screws.</li>
<li>Double sided tape or prestik/blue tak can be used to affix lightweight items. </li>
                <li>The 
                  Contractors will provide special hooks to support heavy products.</li>
                <li>It is 
                  Advisable to provide fishing line (nylon) to hang pictures etc.</li>
                </ul>
</td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
              <tr>
                <td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Exhibition / Freighting Company for Exhibit Logistics:</td>
              </tr>
              <tr>
                <td height="15"></td>
              </tr>
              <tr>
                <td >We recommend you use Exhibition Freighting G.S.M. to freight your exhibition material/posters/banners etc to the Conference venue. They will arrange with their agents to collect from you, and will keep track of your freight and ensure it arrives at the conference venue in due time. 
Attached is the freight form should you wish to make use of Exhibition Freighting G.S.M.
<p>Exhibition Freighting is able to supply the following services to exhibitors:
International transport; customs clearance; warehousing; removal; storage; return of empty cases; re-export formalities and return transport of goods. 
</p></td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
            </table>
            <p>&nbsp;</p>
          <p>&nbsp;</p></td>
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
<cfif get.groupby eq 2 >            
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
        <!---<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px" >
          	<tr> 
            	<td  style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##ffffff; color:##666666" >Sponsor 
            	  <cfif get.event_type EQ "event" > &amp; Exhibition</cfif></td>
            </tr>
            <tr> 
            	<td height="15"></td>
            </tr>
            <tr>
            	<td>
                <p>
            Become involved as a Sponsor, to maximize your profile and generate awareness of involvement in the region.  Please note that Packages can be tailored, depending on your marketing requirements, and I look forward to discussing the possibilities with you. Sponsors receive exposure in our #getall.event_name# Catalogue/ShowGuide - in Colour, glossy print - provided to all participants during the Week, which includes Editorial by leading authorities in oil, gas-LNG, the Conference agenda, articles on the latest corporate news, and Advertisements placed by Governments and corporate players in the industry, plus many other benefits.  For further information please contact me on Amanda@glopac-partners.com</p>
            
              <p> Please request further details for <strong>Sponsorship</strong> from <cfloop query="users"><cfif  listcontains(get.sponenq, users.id, ",")   ><a href="#trim(users.email)#" class="email">#trim(users.email)#</a>, tel: <span class="tel">#trim(users.tel)#</span>, </cfif></cfloop><br />
 <cfif get.event_type EQ "event" >
              Please request further details for <strong>Exhibition</strong> from <cfloop query="users"><cfif  listcontains(get.AcoCont, users.id, ",")    ><a href="#trim(users.email)#" class="email">#trim(users.email)#</a>, tel: <span class="tel">#trim(users.tel)#</span>, </cfif></cfloop>
 </cfif></p>
            
            	</td>
             </tr>
              <tr> 
            	<td height="10"></td>
            </tr>
             </table>--->

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
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
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
                <p>Your registration holds contractual obligation for payment/s due. However, any cancellation (in writing only) made  before the <strong>#dateformat(twoWeekBefore, "dd mmmm yyyy")#</strong> prior to start of the #eventType# will be refunded with a 20% administration charge. Thereafter, refunds will not apply<cfif qryEvent.event_type NEQ "din"> but delegates will receive online access to relevant Conference Presentations</cfif>. Replacements are welcome. All Delegates registered for any #eventType# will be liable for full payment due under this contract unless cancellation has been made and duly acknowledged.</p>
                
               <!--- <p>Payments are due before the  #eventType#. Where payments have not been  received before the event, delegates are required to provide credit card  guarantee of payment in order to gain access to the event.&nbsp; Cancellations received before close of day GMT <strong> #dateformat(twoWeekBefore, "dd mmmm yyyy")#</strong>, will be refunded in full.&nbsp;  Cancellations received after close of day GMT <strong>#dateformat(twoWeekBefore, "dd mmmm yyyy")#</strong>, will receive a 50% refund and will receive conference presentation access  on <strong>www.petro21.com</strong>. </p><p><strong>Cancellations must be submitted on writing and acknowledged by Global  Pacific &amp; Partners.</strong> Replacements are welcome.</p>--->
            
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

<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
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
                <p> <em>Where matters beyond the  reasonable control of Global Pacific &amp; Partners including: power failures, natural disasters, war,  terrorism, strikes or Acts of God prevent Global Pacific &amp; Partners being  able to perform its obligations under this agreement the Speaker releases  Global Pacific &amp; Partners from any liability or loss arising both pre-event &amp; onsite. Global  Pacific &amp; Partners reserves the Right to change the Programme as may be  required. &nbsp;</em><span class="style1">Disclaimer: Please  note that Global Pacific &amp; Partners cannot accept any responsibility (legal  or otherwise)&nbsp;for any Presentations made at our Events, or any  comments made by attendees . </span></p>
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

                  </table>
            	</td>
             </tr>
             </table>       
        </td>
  </tr>
</cfif>
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" > 
  <tr>
   		<td colspan="2" valign="top" >
            <!---<table width="100%" border="0" cellspacing="3" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif; font-size:11px; color:##666666" >
          	<tr> 
            	<td colspan="2" style="font-family:Georgia, 'Times New Roman', Times, serif; font-size:18px; border-bottom:4px solid ##666666; color:##666666" >Event Location</td>
            </tr>
            <tr> 
            	<td colspan="2" height="15"></td>
            </tr>
              <tr>
              <td valign="top">#hotel.google#              </td>
                <td valign="top" >#hotel.hotelname#<br />
                    <cfif get.room NEQ "" >
                      #get.room#<br />
                    </cfif>
                  #hotel.address#<br />
                  #hotel.city#<br />
                  #hotel.country# <br /><br />
                  <strong>tel</strong>: #hotel.tel#<br />
                  <strong>fax</strong>: #hotel.fax#</td>
              </tr>
            </table>--->
        </td>
   </tr>
 </cfif>
</table> 
 
</cfdocumentsection>   
</cfoutput>
</body></html>
</cfdocument>
