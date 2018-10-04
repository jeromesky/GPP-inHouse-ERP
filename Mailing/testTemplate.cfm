<cfinclude template="../Application.cfm">
<!--- get the template details ---->
<cfquery datasource="petro21" name="getjob">
	SELECT * FROM MailOut_configuration WHERE id = #url.id#
</cfquery>
<cfquery name="get_event" DATASOURCE="#dsnP21#"  >
   	SELECT id, event_days, event_month, event_year, groupby, event_type,  event_loc_hotel AS venue, event_loc_city AS city, event_loc_country AS country
	FROM events
	WHERE  id =  #getjob.eventid# 
</cfquery>

<cfquery name="get_group" DATASOURCE="#dsnP21#"  >
   	SELECT events.id, events.id_gpp, events.event_abbr, events.event_name, events.event_days, events.event_month, events.event_year, events.event_type, events.event_blurb,  events.event_loc_hotel AS venue, events.event_loc_city AS city, events.event_loc_country AS country, events.event_blurb, events.ColorD, events.ColorL, events.logos_supporter, events.supportedby,	events.logo_CorpSponsor,	events.logo_corpMembers,	events.sponsor_gold,	events.sponsor_platinum,	events.sponsor_silver,	events.sponsor_bronze,	events.FocusOn,  events.Enquir,	events.exhEnq,	events.sponEnq,	events.PaCont,	 events.file_update, events.file_image_pdf, events.event_blurb_exhib, events.briefingSlogan,  events.newsletterBannerTop, events.newsletterBannerCol1, events.newsletterBannerCol2, events.newsletterBannerTop600, events.logo_Contributing,  events.sponsor_Airline, events.sponsor_lead, 
    hotels.hotelname, events.discountValue, events.discountDate
	FROM events
    LEFT JOIN hotels ON events.hotel = hotels.id
	WHERE  groupby = #get_event.groupby# AND event_year = #get_event.event_year# AND  LIVE = 1 AND ( event_type = 'event' OR event_type = 'eb' OR event_type = 'din' OR event_type = 'week' ) 
    ORDER BY event_type desc
</cfquery>

<cfset  logos = "">
<cfset MainEventLink = "" >
<cfset  network = "">
<cfset  exibition = 0 >
<cfset  i = 0>
<cfset  functioncounter = 0>
<cfset flashNews = 0 >
<cfset  IsBriefing		= 0  >
<cfset logocounter =  14  >
<cfset Briefingid = 0 >

<!---<cfset contactsGroups = "events.Enquir, events.sponEnq, events.PaCont, events.exhEnq" >
<cfset contactsGroupsName = "Registration Enquiries, Sponsorship Enquiries, PetroAfricanus Contacts, Exhibition Enquiries" >--->


<!--- get functions ---->
<cfquery datasource="#dsnP21#" name="function">
SELECT event_welcom.*, logos.company, logos.logofile 
FROM event_welcom RIGHT JOIN logos
ON event_welcom.sponsor = logos.id
WHERE <cfloop query="get_group"><cfif functioncounter NEQ 0 >OR</cfif> event_welcom.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_group.id#"><cfset functioncounter = functioncounter + 1 ></cfloop>
ORDER BY functiondate , functionTime
</cfquery>

<!--- get the speakers --->
<cfquery name="get_speakers" datasource="#dsnP21#"  >
	SELECT DISTINCT  speakers_program.eventid, speakers.name, speakers.delegation, speakers_program.pos
	FROM speakers 
	LEFT outer JOIN speakers_program
	ON speakers_program.clientid = speakers.id
	WHERE <cfloop query="get_group"><cfif i NEQ 0 >OR</cfif> speakers_program.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_group.id#"><cfset i = i + 1 ></cfloop>
	ORDER BY speakers_program.pos
</cfquery>
<cfset speakerCount = #get_speakers.recordcount# >
<cfset NetWithCount = speakerCount * 2  >

<cfloop query="get_group">
				<cfset  network = #listAppend(network, get_group.id_gpp, ",")#>
		<!--- GET ID OF THE MAIN CONFERENCE ---->
		<cfif get_group.event_type EQ "event" >
        		<cfset MainEventLink = #get_group.id#  >
        </cfif>
		<cfif get_group.event_type EQ "week" >
        		<cfset  WeekID 			= #get_group.id#  >
				<cfset  eventID 			= #get_group.id#  >
                <cfset  EventAbbre	= #get_group.event_abbr# >
                <cfset eventName		= #get_group.event_name# >
                 <cfset eventYear		= #get_group.event_year# >
				<cfset  city 				= #get_group.city#  >
                <cfset  country 			= #get_group.country# >
				<cfset focusOn 			= #get_group.FocusOn# >
				<cfset  lightColor 		= #get_group.ColorL#  >
                <cfset  DarkColor 		= #get_group.ColorD# >
                <cfset  downloadfile 	= #get_group.file_update# >	
                <cfset  banner 			= #get_group.file_image_pdf# >
                <cfset Enquir				= #get_group.Enquir# >
                <cfset sponEnq			= #get_group.sponEnq# >
                <cfset exhEnq			= #get_group.exhEnq# >
                <cfset PaCont			= #get_group.PaCont# >
                	
					<cfif len(get_group.event_blurb_exhib) GT 10>
                		<cfset  exibition = 1 >
                   </cfif>
                
                
                <!--- set the template images ---->
                		<cfif getjob.templateSize EQ 1 >
                        	<cfset  bannertop 		= #get_group.newsletterBannerTop600#  >
                            <cfset logocounter =  4  >
                        <cfelse>
                        	<cfset  bannertop 		= #get_group.newsletterBannerTop#  >	
                        </cfif>
				<cfset  collum1 			= #get_group.newsletterBannerCol1#  >	
				<cfset  collum2 			= #get_group.newsletterBannerCol2# >	
			
                <!--- SElect sponsors --->
				<cfset  logos 			= ListPrepend(logos, supportedby, ",")  >	
                <cfset  logos 			= ListPrepend(logos, logo_CorpSponsor, ",")  >
                <cfset  logos				= ListPrepend(logos, logo_corpMembers, ",")  >	
                <cfset  logos 			= ListPrepend(logos, logos_supporter, ",")  >		
                <cfset  logos 			= ListPrepend(logos, sponsor_bronze, ",")  >
                <cfset  logos 			= ListPrepend(logos, sponsor_silver, ",")  >
                <cfset  logos 			= ListPrepend(logos, sponsor_gold, ",")  >	
                <cfset  logos 			= ListPrepend(logos, sponsor_platinum, ",")  >	
               <cfset  logos 				= ListPrepend(logos, logo_Contributing, ",")  >	 
                <cfset  logos 			= ListToArray(logos, ",")  >	
                <cfset  logos 			= ArrayToList(logos, ",")  >	
        </cfif>
        
        
        <cfif get_group.event_type EQ "EB" >
				<cfset  Briefingid		= #get_group.id#  >
                <cfset  Briefingname	= #get_group.event_name#  >
                <cfset  Briefingslogan	= #get_group.briefingSlogan#  >
        		
								<cfif  getjob.eventid EQ Briefingid  AND getjob.eventExact EQ 1 >
                                        <cfset  IsBriefing		= 1  >
                                </cfif>
        </cfif>
        
		<!--- SET the template to use exact selected event --->
        <cfif  get_group.id EQ getjob.eventid  AND getjob.eventExact EQ 1 >
				    <!--- set the template images ------>
					    	<cfif getjob.templateSize EQ 1 >
                        			<cfset  bannertop 		= #get_group.newsletterBannerTop600#  >	
                                    <cfset logocounter =  4  >
                        	<cfelse>
                        			<cfset  bannertop 		= #get_group.newsletterBannerTop#  >	
                        	</cfif>
						
					<cfset  collum1 			= #get_group.newsletterBannerCol1#  >	
					<cfset  collum2 			= #get_group.newsletterBannerCol2# >	
                    
					<cfif getjob.eventExact EQ 1	>	
							<cfset  eventID 			= #get_group.id#&"&tc="&#get_group.event_abbr#  >
                            <cfset  EventAbbre	= #get_group.event_abbr#  >
                    </cfif>
					
                	<cfset  eventName		= #get_group.event_name#  >
                    <cfset focusOn 			= #get_group.FocusOn# >
                    <cfset Enquir				= #get_group.Enquir# >
                	<cfset sponEnq			= #get_group.sponEnq# >
                	<cfset exhEnq			= #get_group.exhEnq# >
                	<cfset PaCont			= #get_group.PaCont# >
        
        </cfif>
</cfloop>  
				<cfset  network = ListToArray(network, ",")  >	
                <cfset  network = ArrayToList(network, ",")  >
                

<!--- get the speakers ----
<cfquery name="get_speakers" datasource="#dsnP21#"  >
	SELECT speakers_program.eventid
	FROM speakers_program 
	WHERE <cfloop query="get_group"><cfif i NEQ 0 >OR</cfif> speakers_program.eventid = #get_group.id#<cfset i = i + 1 ></cfloop>
	ORDER BY speakers_program.pos
</cfquery>------->

<!--- get the speakers ---->
<cfif Briefingid NEQ 0 >
        <cfquery name="get_briefing" datasource="#dsnP21#"  >
            SELECT speakers_program.decription, speakers_program.comment, speakers_program.speakersession, speakers_program.speakertime, speakers_program.eventid
            FROM speakers_program 
            WHERE speakers_program.eventid = #Briefingid#  AND (speakers_program.speaker = 0 OR speakers_program.speaker = 1)
            ORDER BY speakers_program.speakersession , speakers_program.speakertime
        </cfquery>
</cfif>

<!--- get the FLASH NEWS ---->            
<cfif getjob.flashnews NEQ "" >
        <cfquery datasource="#dsnP21#" name="showFlashNews"    >
           SELECT title, content, link, img, brochure, speaker, displayIMG
           FROM newsletter_FlashNews
           WHERE   id IN (#getjob.flashnews#) AND duedate > #now()#
           ORDER BY duedate
        </cfquery>
					<cfif showFlashNews.recordcount  GT 0 >
                        <cfset flashNews = 1 >
                   </cfif>
</cfif>
       
                
<!--- get the speakers ---->
<cfquery name="get_Network" datasource="#gpp#"  >
	SELECT DISTINCT CompanyName, country
	FROM VIEWNetworkWith 
	
	WHERE ID IN (#network#)
    GROUP BY  country, CompanyName
    ORDER BY CompanyName
</cfquery>
<!--- get the CONTACTS  ---->
    <cfquery datasource="#dsnP21#" name="getnames">
            SELECT id, name, email, tel
            FROM gppusers
    </cfquery> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>
<body>
<cfoutput>
<!---  600wide  ------>
<cfif getjob.templateSize EQ 1 >
  <table border="0" cellpadding="0" cellspacing="0" align="center" >
  	<tr>
    		<td colspan="2">
                      <table width="100%" border="0" cellspacing="0" cellpadding="4">
                      <tr>
                      <td  width="165" valign="bottom"><img src="http://petro21.com/post/templates/AOW09_logo.jpg" width="165" height="108" /></td>
                      <td valign="top">
<cfif listlen(logos, ",")  GT 0>
<cfquery datasource="#dsnP21#" name="getLogo" >
	SELECT logofile, link
    FROM logos
    WHERE id IN (#logos#)
</cfquery>
<cfif getLogo.recordcount GT logocounter >
		<cfset  logowidth = 63  >
        <cfset  logoheight = 26 >
 <cfelse>
 		<cfset  logowidth = 95  >
        <cfset  logoheight = 40 >
 </cfif>
<cfloop query="getLogo">
<a href="#getLogo.link#"><img src="http://www.petro21.com/_files/business/#trim(logofile)#"  border="0"  width="#logowidth#" height="#logoheight#" hspace="4" vspace="4"  /></a>
</cfloop> 
</cfif>
                     </td>
                      </tr>
                      </table>            </td>
    </tr>
  	<tr>
    		<td colspan="2"><a href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#"><img src="http://www.petro21.com/post/templates/#bannertop#" border="0"  /></a></td>
    </tr>
  	<tr>
    	<td width="300" valign="top"  bgcolor="###getjob.col1color#" height="300"  background="http://www.petro21.com/post/templates/#collum1#"  style="color:##ffffff; font-size:11px; background-image:url(http://www.petro21.com/post/templates/#collum1#); background-repeat:no-repeat">

<cfif  IsBriefing EQ 1   AND Briefingid NEQ 0 >
<!--- POD Briefings -------------->
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="color:##333 ; font-size:12px;font-family:Arial, Helvetica, sans-serif;">
                                <tr>
                                <td rowspan="5" width="10"></td>
                                <td  height="35"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333; font-size:16px; padding:15px 0 0 0">#Briefingname#&nbsp;</td>
                                <td rowspan="5" width="10">&nbsp;</td>
                                </tr>
                                <tr>
                                <td height="1" bgcolor="###lightColor#"></td>
                                </tr>
                                <tr>
                                <td height="25">&nbsp;</td>
                                </tr>
                                <tr>
                                <td><!--- DUNCAN TABLE ------>
                                           <table border="0" cellpadding="0" cellspacing="4">
                                                <tr>
                                                    <td valign="top" width="245"><span style="font-family:Georgia, 'Times New Roman', Times, serif; color:##222222; font-size:12px">Presentations By: </span><span style="color:##324d96">Dr Duncan Clarke</span><br>
                                                <span style="font-family:Georgia, 'Times New Roman', Times, serif; color:##222222; font-size:12px">Chairman:</span> <span style="color:##324d96">Global Pacific &amp; Partners</span><br>
                                                <span style="font-family:Georgia, 'Times New Roman', Times, serif; color:##222222; font-size:12px">Author:</span><span style="color:##324d96"> Empires Of Oil,
                                                 Crude Continent </span>and<span style="color:##324d96"> The Battle For Barrels </span></td>
                                                    <td width="67" valign="top"><img src="http://www.petro21.com/post/templates/DuncanBriefing.jpg" alt="s"></td>
                                                </tr>
                                              </table>
                                               
                                                
                                                <cfloop query="get_briefing" >
                                              
                                              <div style="color:###DarkColor#;">#get_briefing.decription#</div>
                                                            <cfif  IsBriefing EQ 1  >
                                                            #get_briefing.comment#<br />
                                                            </cfif>
                                                </cfloop>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td  height="15"></td>
                                    </tr>
                                    </table>
<cfelse>
<!--- Confirmed Speakers  -------------->
                                <table border="0" cellpadding="0" cellspacing="0" background="http://www.petro21.com/post/templates/#collum1#" width="100%"  style=" font-family:Arial, Helvetica, sans-serif;  color:##333; font-size:11px; background-image:url(http://www.petro21.com/post/templates/#collum1#); background-repeat:no-repeat">
                                <tr>
                                <td width="10"  rowspan="5"></td>
                                <td  height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">#get_speakers.recordcount# Confirmed Speakers</td>
                                <td width="10" rowspan="5"></td>
                                </tr>
                                <tr><td  height="25"></td></tr>
                                <tr>
                                <td >
                                <cfloop query="get_speakers">
                                <strong style="color:###DarkColor#; font-size:13px; line-height:18px">#get_speakers.name#</strong><br />#get_speakers.delegation#<br /> 
                                </cfloop>
                                <p><a  href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#"   style="color:###DarkColor#">Download Brochure </a> // <a  href="http://www.petro21.com/events/index.cfm?id=#eventid#"   style="color:###DarkColor#">Register Online </a></p>        				</td>
                                
                                </tr>
                                <tr><td  height="20"></td></tr>
                                </table>
</cfif>
       </td>
        <td width="300" valign="top"  bgcolor="###getjob.col2color#">

            		<table border="0" cellpadding="0" cellspacing="0" width="100%"  style=" background-color:##ffffff; font-size:12px;font-family:Arial, Helvetica, sans-serif; color:##333333" background="http://www.petro21.com/post/templates//#collum2#">
                     <tr>
                        <td width="5" rowspan="5"></td>
                        <td height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Focus On</td>
                        <td width="10" rowspan="5"></td>
                        </tr>
                        <tr>
                          <td  height="1" bgcolor="###lightColor#"></td>
                        </tr>
                    <tr><td  height="20" ></td></tr>
                    <tr>
                    <td >#focusOn#</td>
                    </tr>
                    <tr>
                    <td height="15" ></td>
                    </tr>
            		</table>
                    <!---  flash news Container --------->
					<cfif flashNews EQ 1 >
                    <table border="0" cellpadding="0" cellspacing="0"  style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="100%" >
                    <tr>
                    <td width="10" rowspan="4"></td>
                    <td  height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">News Flash</td>
                    <td width="10" rowspan="4"></td>
                    </tr>
                    <tr>
                    <td  height="1" bgcolor="###lightColor#"></td>
                    </tr>
                    <tr>
                   <td  height="25"></td>
                    </tr>
                    <tr>
					<td >
                	<!---  flash news here --------->
                            <table cellpadding="0" cellspacing="0" border="0" width="100%" >
								<cfloop query="showFlashNews">
							<tr>
                            <td   valign="top" style="padding:0 0 0 5px; font-family:Arial, Helvetica, sans-serif;"><div style="font-size:13px; color:##444343; text-decoration:none; font-weight:bold">#showFlashNews.title#</div>
    								<cfif showFlashNews.speaker NEQ "">
   									<cfquery datasource="#dsnP21#" name="Speaker">SELECT name, delegation, photo FROM speakers WHERE id = #showFlashNews.speaker# </cfquery>

									<table border="0" cellpadding="0" cellspacing="2">
									<tr>
									<td  valign="top" height="69" width="57"><img src="http://www.petro21.com/Speakers/photos/#Speaker.photo#"  width="47" height="59" ></td>
									<td valign="top">
									<span style="color:##2175bb; font-size:12px"> #Speaker.name#</span><br>
									<span style=" font-size:12px;">#Speaker.delegation#</span>									</td>
									</tr>
									</table>
									</cfif>
                                    <cfif showFlashNews.displayIMG EQ 1>
                                    <table border="0" cellpadding="0" cellspacing="2">
                                    <tr>
                                    <td  valign="top" height="69" width="57">
                                    <img src="http://www.petro21.com/advertising/#showFlashNews.img#" width="47" height="59"  />                                    </td>
                                    <td valign="top">
                                    <span style="font-size:12PX; color:##2a2828; " >#showFlashNews.content#</span>                                    </td>
                                    </tr>
                                    </table>
                                    <cfelse>
                                    <span style="font-size:12PX; color:##2a2828; " ><cfif showFlashNews.img NEQ ""  ><a href="http://www.petro21.com/advertising/#showFlashNews.img#" style="text-decoration:none">#showFlashNews.content#</a><cfelse>#showFlashNews.content#</cfif></span>
                                    </cfif>                    	</td>
						</tr>
                		<tr>
                		<td height="15"></td>
               			</tr>
						</cfloop>
						</table>
                <!--- end flash news ----------->				</td>
       			</tr>
				</table>
				</cfif>
                <cfif  IsBriefing NEQ 1  >
        <!--- Netwrk With Pod ---->                          
                      <table border="0" cellpadding="0" cellspacing="0"  style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="100%" >
                        <tr>
                        <td width="10" rowspan="4"></td>
                        <td height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Network with</td>
                        <td width="10" rowspan="4"></td>
                        </tr>
                        <tr>
                          <td  height="1" bgcolor="###lightColor#"></td>
                        </tr>
                        <tr>
                          <td height="25"></td>
                        </tr>
                        <tr>
                          <td >
                          <cfloop query="get_Network"  startrow="1" endrow="#NetWithCount#">
                          		<cfif len(get_Network.companyname) GT 44>#left(rereplace(Lcase(get_Network.companyname), '^\w', '\u\0'), 44)#...<cfelse>#trim(rereplace(Lcase(get_Network.companyname), '^\w', '\u\0'))#</cfif><cfif get_Network.companyname contains get_Network.country ><cfelse><cfif len(get_Network.companyname) LT 44 >, <span style="color:##666666">#left(trim(rereplace(Lcase(get_Network.country), '^\w', '\u\0')), 50 - len(get_Network.companyname) )#</span>
                                      </cfif></cfif><br />
                          </cfloop>
                          <cfif NetWithCount LT get_Network.recordCount ><a  href="http://www.petro21.com/events/index.cfm?id=#eventid#"   style="color:###DarkColor#">more here..</a></cfif>                     </td>
                        </tr>
                      </table>
</cfif>
<!--- END Netwrk With Pod ---->

				<!--- end flash news Container -----------> 
                <table border="0" cellpadding="0" cellspacing="0"  style="  color:##333333; font-size:12px" width="100%">
           		<tr>
                <td width="10" rowspan="5"></td>
                <td  height="35" style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Details <!---#eventName# #eventYear#---></td>
                <td width="10" rowspan="5"></td>
                </tr>
                <tr><td  height="1" bgcolor="###lightColor#"></td></tr>
                <tr><td height="25"></td></tr>
                <tr>
                <td >
                                <table cellpadding="0" cellspacing="0" border="0" width="100%"  style="font-family:Arial, Helvetica, sans-serif">
                	<tr>
                    	<td>#get_group.event_blurb#</td>
                    </tr>
                    <tr>
                    	<td height="20"></td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" border="0" width="100%"  style="font-family:Arial, Helvetica, sans-serif">
						<cfloop query="get_group">
						<cfif getjob.eventExact EQ 1 >
						<cfif get_group.id EQ getjob.eventid  >
						<tr>
						<td ><div style=" padding:6px 0 13px 13px; background-image:url(http://www.petro21.com/post/templates/arrow_eventMen.gif); background-repeat:no-repeat; background-position:0px 11px; color:##7a7b7c; font-size:11px" > <a href="http://wwwpetro21.com/events/index.cfm?id=#get_group.id#&tc=#get_group.event_abbr#" class="eventLink" style="color:##222222; font-size:14px; text-decoration:none">#get_group.event_name#</a><br />
								<span style="color:##23408f; font-size:12px">#get_group.event_days# #get_group.event_month# #get_group.event_year#</span><br />
                                                  #get_group.hotelname#, #get_group.city#, #get_group.country# </div></td>
						</tr>
						</cfif>
						<cfelse>
                        <cfif get_group.event_type NEQ "week" >  
                        <tr>
                        <td <cfif get_group.currentrow NEQ 2 >style="background-image:url(http://www.petro21.com/post/templates/separetor_event.gif); background-repeat:repeat-x"</cfif>><div style=" padding:6px 0 13px 13px; background-image:url(http://www.petro21.com/post/templates/arrow_eventMen.gif); background-repeat:no-repeat; background-position:0px 11px; color:##7a7b7c; font-size:11px" > <a href="http://wwwpetro21.com/events/index.cfm?id=#get_group.id#&tc=#get_group.event_abbr#" class="eventLink" style="color:##222222; font-size:14px; text-decoration:none">#get_group.event_name#</a><br />
                        <span style="color:##23408f; font-size:12px">#get_group.event_days# #get_group.event_month# #get_group.event_year#</span><br />
                                                                          #get_group.hotelname#, #get_group.city#, #get_group.country# </div></td>
                        </tr>
                        </cfif>
                        </cfif>
                        </cfloop>
                        </table>
<div style="margin:15px 0 3px 0"><a  href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#" ><img src="http://www.petro21.com/post/templates/TEMPBut_brochure.jpg" border="0"></a><a  href="http://www.petro21.com/events/index.cfm?id=#eventid#"><img src="http://www.petro21.com/post/templates/TEMPBut_Reister.jpg" border="0"></a></div>
				</td>
                </tr>
                <tr>
                <td height="15"></td>
				</tr>
            </table>
<cfif  IsBriefing NEQ 1  AND Briefingid NEQ 0 >
<!--- POD Briefings -------------->
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="color:##333 ; font-size:12px;font-family:Arial, Helvetica, sans-serif;">
                                <tr>
                                <td rowspan="5" width="10"></td>
                                <td  height="35"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333; font-size:16px; padding:15px 0 0 0">#Briefingname#&nbsp;</td>
                                <td rowspan="5" width="10">&nbsp;</td>
                                </tr>
                                <tr>
                                <td height="1" bgcolor="###lightColor#"></td>
                                </tr>
                                <tr>
                                <td height="25">&nbsp;</td>
                                </tr>
                                <tr>
                                <td><!--- DUNCAN TABLE ------>
                                           <table border="0" cellpadding="0" cellspacing="4">
                                                <tr>
                                                    <td valign="top" width="245"><span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Presentations By: </span><span style="color:##324d96">Dr Duncan Clarke</span><br>
                                                <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Chairman:</span> <span style="color:##324d96">Global Pacific &amp; Partners</span><br>
                                                <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Author:</span><span style="color:##324d96"> Empires Of Oil,
                                                 Crude Continent </span>and<span style="color:##324d96"> The Battle For Barrels </span></td>
                                                    <td width="67" valign="top"><img src="http://www.petro21.com/post/templates/DuncanBriefing.jpg" alt="s"></td>
                                                </tr>
                                              </table>
                                             
                                                
                                                <cfloop query="get_briefing" >
                                               
                                               <div style="color:###DarkColor#; ">#get_briefing.decription#</div>
                                                            <cfif  IsBriefing EQ 1  >
                                                            #get_briefing.comment#<br />
                                                            </cfif>
                                                </cfloop>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td  height="15"></td>
                                    </tr>
                                    </table>
</cfif>
<!--- END Netwrk With Pod // START FUNCTION AT THE EVENT---->
<cfif  function.recordcount GT 0   >
        <!--- Function  Pod ---->                          
                      <table border="0" cellpadding="0" cellspacing="0"  style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="100%" >
                        <tr>
                        <td width="10" rowspan="4"></td>
                        <td height="34"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Functions at the Event</td>
                        <td width="10" rowspan="4"></td>
                        </tr>
                        <tr>
                          <td  height="1" bgcolor="###lightColor#"></td>
                        </tr>
                        <tr>
                          <td height="25"></td>
                        </tr>
                        <tr>
                          <td >
                          <cfloop query="function"  >
                          		#function.title#, <span style=" font-size:11px;color:##666666">#DateFormat(function.functiondate, "dd.mm.yy")#</span><br />
                          </cfloop>
                          
                                                   </td>
                        </tr>
                      </table>
</cfif>
<!--- END FUNCTION AT THE EVENT ---->
                    <table border="0" cellpadding="0" width="100%" cellspacing="0" style="padding:0 0 14px 0; color:##333333; font-size:12px;font-family:Arial, Helvetica, sans-serif;"  >
                    <tr>
                    <td width="10" rowspan="5"></td>
                    <td height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Contact</td>
                    <td width="10" rowspan="5"></td>
                    </tr>
                    <tr>
                    <td height="1" bgcolor="###lightColor#"></td>
                    </tr>
                    <tr>
                    <td height="25"></td>
                    </tr>
                    <tr>
                    <td valign="top" >
                    <cfif Enquir NEQ "" >
                    <p><span style=" font-size:14px;">Registration Enquiries</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(Enquir, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif>
                    <cfif len(sponEnq) GT 1 >
                    <p><span style=" font-size:14px;">Sponsorship Enquiries</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(sponEnq, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif>
                    <cfif exibition EQ 1 >
                    <cfif exhEnq NEQ "" >
                    <p><span style=" font-size:14px;">Exhibition Enquiries</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(exhEnq, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif>
                    </cfif>
                    <cfif len(exhEnq) GT 1 >
                    <p><span style=" font-size:14px;">Dinner Contacts</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(PaCont, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif></td>
                    </tr>
                    <tr>
                    <td height="15"></td>
                    </tr>
                    </table> 
       </td>

  </tr>
  <tr><td colspan="2">
    <!--- FUNCTION ON CREATING FILE FOR MEDIA PARTNERS ---->
  <cfif getjob.contraJob_id NEQ 0 ><img src="http://www.petro21.com/post/templates/counter.cfm?id=#getjob.contraJob_id#&eid=652"></cfif>
  <!--- FUNCTION TO ADD REMOVE LING FROM EMAIL ---->
  <cfif parameterexists(unsubscribe)><a style="font-size:11px; color:##666666" href="http://petro21.com/post/Unsubscrib.cfm?field=chkWebIntAf&id=#sendlist.id#" >click here to unsubscribe</a> </cfif>
  </td></tr>
</table>
<!---  600wide  ------>
<cfelse>
  <table border="0" cellpadding="0" cellspacing="0" align="center">
  	<tr>
    		<td colspan="3">
                      <table width="100%" border="0" cellspacing="0" cellpadding="4">
                      <tr>
                      <td  width="165" valign="bottom"><img src="http://petro21.com/post/templates/AOW09_logo.jpg" width="165" height="108" /></td>
                      <td valign="top">
<cfif listlen(logos, ",")  GT 0>
<cfquery datasource="#dsnP21#" name="getLogo" >
	SELECT logofile, link
    FROM logos
    WHERE id IN (#logos#)
</cfquery>
<cfif getLogo.recordcount GT logocounter >
		<cfset  logowidth = 63  >
        <cfset  logoheight = 26 >
 <cfelse>
 		<cfset  logowidth = 95  >
        <cfset  logoheight = 40 >
 </cfif>
<cfloop query="getLogo">
<a href="#getLogo.link#"><img src="http://www.petro21.com/_files/business/#trim(logofile)#"  border="0"  width="#logowidth#" height="#logoheight#" hspace="4" vspace="4"  /></a>
</cfloop>
</cfif>                      </td>
                      </tr>
                      </table>            </td>
    </tr>
  	<tr>
    		<td colspan="3"><a href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#"><img src="http://www.petro21.com/post/templates/#bannertop#" border="0"  /></a></td>
    </tr>
  	<tr>
    	<td width="300" valign="top"  bgcolor="###getjob.col1color#" height="300"  background="http://www.petro21.com/post/templates/#collum1#"  style="color:##ffffff; font-size:11px; background-image:url(http://www.petro21.com/post/templates/#collum1#); background-repeat:no-repeat">

<cfif  IsBriefing EQ 1  AND Briefingid NEQ 0 >
<!--- POD Briefings -------------->
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="color:##333 ; font-size:12px;font-family:Arial, Helvetica, sans-serif;">
                                <tr>
                                <td rowspan="5" width="10"></td>
                                <td  height="35"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333; font-size:16px; padding:15px 0 0 0">#Briefingname#&nbsp;</td>
                                <td rowspan="5" width="10">&nbsp;</td>
                                </tr>
                                <tr>
                                <td height="1" bgcolor="###lightColor#"></td>
                                </tr>
                                <tr>
                                <td height="25">&nbsp;</td>
                                </tr>
                                <tr>
                                <td><!--- DUNCAN TABLE ------>
                                           <table border="0" cellpadding="0" cellspacing="4">
                                                <tr>
                                                  <td valign="top" ><span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Presentations By: </span><span style="color:##324d96">Dr Duncan Clarke</span><br>
                                                <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Chairman:</span> <span style="color:##324d96">Global Pacific &amp; Partners</span><br>
                                                <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Author:</span><span style="color:##324d96"> Empires Of Oil,
                                                 Crude Continent </span>and<span style="color:##324d96"> The Battle For Barrels </span></td>
                                                    <td width="67" valign="top"><img src="http://www.petro21.com/post/templates/DuncanBriefing.jpg" alt="s"></td>
                                                </tr>
                                              </table>
                                                <cfloop query="get_briefing" >
                                               <!---<strong>#Insert("</strong>",get_briefing.decription, 1)#<br />Worldwide Strategies, Scenarios, Paradigms: Companies, State Players, Critical Future Questions---> 
                                              <div style="color:###DarkColor#; ">#get_briefing.decription#</div>
                                                            <cfif  IsBriefing EQ 1  >
                                                            #get_briefing.comment#<br />
                                                            </cfif>
                                                </cfloop>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td  height="15"></td>
                                    </tr>
                                    </table>
<cfelse>
<!--- Confirmed Speakers  -------------->
                                <table border="0" cellpadding="0" cellspacing="0" background="http://www.petro21.com/post/templates/#collum1#" width="100%"  style=" font-family:Arial, Helvetica, sans-serif;  color:##333; font-size:11px; background-image:url(http://www.petro21.com/post/templates/#collum1#); background-repeat:no-repeat">
                                <tr>
                                <td width="10"  rowspan="5"></td>
                                <td  height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">#get_speakers.recordcount# Confirmed Speakers</td>
                                <td width="10" rowspan="5"></td>
                                </tr>
                                <tr>
                    			<td  height="1" bgcolor="###lightColor#"></td>
                   				</tr>
                                <tr><td  height="25"></td></tr>
                                <tr>
                                <td >
                                <cfloop query="get_speakers">
                                <strong style="color:###DarkColor#; font-size:13px; line-height:18px">#get_speakers.name#</strong><br />#get_speakers.delegation#<br /> 
                                </cfloop>
                                <p><a  href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#"   style="color:###DarkColor#">Download Brochure </a> // <a  href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#"   style="color:###DarkColor#">Register Online </a></p>        				</td>
                                
                                </tr>
                                <tr><td  height="20"></td></tr>
                                </table>
</cfif>
        </td>
        <td width="300" valign="top"  bgcolor="###getjob.col2color#">

            		<table border="0" cellpadding="0" cellspacing="0" width="100%"  style=" background-color:##ffffff; font-size:12px;font-family:Arial, Helvetica, sans-serif; color:##333333" background="http://www.petro21.com/post/templates//#collum2#">
                     <tr>
                        <td width="5" rowspan="5"></td>
                        <td height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Focus On</td>
                        <td width="10" rowspan="5"></td>
                        </tr>
                        <tr>
                          <td  height="1" bgcolor="###lightColor#"></td>
                        </tr>
                    <tr><td  height="20" ></td></tr>
                    <tr>
                    <td >#focusOn#</td>
                    </tr>
                    <tr>
                    <td height="15" ></td>
                    </tr>
            		</table>
                    <!---  flash news Container --------->
					<cfif flashNews EQ 1 >
                    <table border="0" cellpadding="0" cellspacing="0"  style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="100%" >
                    <tr>
                    <td width="10" rowspan="4"></td>
                    <td  height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">News Flash</td>
                    <td width="10" rowspan="4"></td>
                    </tr>
                    <tr>
                    <td  height="1" bgcolor="###lightColor#"></td>
                    </tr>
                    <tr>
                   <td  height="25"></td>
                    </tr>
                    <tr>
					<td >
                	<!---  flash news here --------->
                            <table cellpadding="0" cellspacing="0" border="0" width="100%" >
								<cfloop query="showFlashNews">
							<tr>
                            <td   valign="top" style="padding:0 0 0 5px; font-family:Arial, Helvetica, sans-serif;"><div style="font-size:13px; color:##444343; text-decoration:none; font-weight:bold">#showFlashNews.title#</div>
    								<cfif showFlashNews.speaker NEQ "">
   									<cfquery datasource="#dsnP21#" name="Speaker">SELECT name, delegation, photo FROM speakers WHERE id = #showFlashNews.speaker# </cfquery>

									<table border="0" cellpadding="0" cellspacing="2">
									<tr>
									<td  valign="top" height="69" width="57"><img src="http://www.petro21.com/Speakers/photos/#Speaker.photo#"  width="47" height="59" ></td>
									<td valign="top">
									<span style="color:##2175bb; font-size:12px"> #Speaker.name#</span><br>
									<span style=" font-size:12px;">#Speaker.delegation#</span>									</td>
									</tr>
									</table>
									</cfif>
                                    <cfif showFlashNews.displayIMG EQ 1>
                                    <table border="0" cellpadding="0" cellspacing="2">
                                    <tr>
                                    <td  valign="top" height="69" width="57">
                                    <img src="http://www.petro21.com/advertising/#showFlashNews.img#" width="47" height="59"  />                                    </td>
                                    <td valign="top">
                                    <span style="font-size:12PX; color:##2a2828; " >#showFlashNews.content#</span>                                    </td>
                                    </tr>
                                    </table>
                                    <cfelse>
                                    <span style="font-size:12PX; color:##2a2828; " ><cfif showFlashNews.img NEQ ""  ><a href="http://www.petro21.com/advertising/#showFlashNews.img#" style="text-decoration:none">#showFlashNews.content#</a><cfelse>#showFlashNews.content#</cfif></span>
                                    </cfif>                    	</td>
						</tr>
                		<tr>
                		<td height="15"></td>
               			</tr>
						</cfloop>
						</table>
                <!--- end flash news ----------->				</td>
       			</tr>
				</table>
				</cfif>
				<!--- end flash news Container -----------> 
                <table border="0" cellpadding="0" cellspacing="0"  style="  color:##333333; font-size:12px" width="100%">
           		<tr>
                <td width="10" rowspan="5"></td>
                <td  height="35" style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Details <!---#eventName# #eventYear#---></td>
                <td width="10" rowspan="5"></td>
                </tr>
                <tr><td  height="1" bgcolor="###lightColor#"></td></tr>
                <tr><td height="25"></td></tr>
                <tr>
                <td >
                <table cellpadding="0" cellspacing="0" border="0" width="100%"  style="font-family:Arial, Helvetica, sans-serif">
                	<tr>
                    	<td>#get_group.event_blurb#</td>
                    </tr>
                    <tr>
                    	<td height="20"></td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" border="0" width="100%"  style="font-family:Arial, Helvetica, sans-serif">
						<cfloop query="get_group">
						<cfif getjob.eventExact EQ 1 >
						<cfif get_group.id EQ getjob.eventid  >
						<tr>
						<td ><div style=" padding:6px 0 13px 13px; background-image:url(http://www.petro21.com/post/templates/arrow_eventMen.gif); background-repeat:no-repeat; background-position:0px 11px; color:##7a7b7c; font-size:11px" > <a href="http://www.petro21.com/events/index.cfm?id=#get_group.id#&tc=#get_group.event_abbr#" class="eventLink" style="color:##222222; font-size:14px; text-decoration:none">#get_group.event_name#</a><br />
								<span style="color:##23408f; font-size:12px">#get_group.event_days# #get_group.event_month# #get_group.event_year#</span><br />
                                                  #get_group.hotelname#, #get_group.city#, #get_group.country# </div></td>
						</tr>
						</cfif>
						<cfelse>
                        <cfif get_group.event_type NEQ "week" >  
                        <tr>
                        <td <cfif get_group.currentrow NEQ 2 >style="background-image:url(http://www.petro21.com/post/templates/separetor_event.gif); background-repeat:repeat-x"</cfif>><div style=" padding:6px 0 13px 13px; background-image:url(http://www.petro21.com/post/templates/arrow_eventMen.gif); background-repeat:no-repeat; background-position:0px 11px; color:##7a7b7c; font-size:11px" > <a href="http://www.petro21.com/events/index.cfm?id=#get_group.id#&tc=#get_group.event_abbr#" class="eventLink" style="color:##222222; font-size:14px; text-decoration:none">#get_group.event_name#</a><br />
                        <span style="color:##23408f; font-size:12px">#get_group.event_days# #get_group.event_month# #get_group.event_year#</span><br />
                                                                          #get_group.hotelname#, #get_group.city#, #get_group.country# </div></td>
                        </tr>
                        </cfif>
                        </cfif>
                        </cfloop>
                        </table>
<div style="margin:15px 0 3px 0"><a  href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#" ><img src="http://www.petro21.com/post/templates/TEMPBut_brochure.jpg" border="0"></a><a  href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#"><img src="http://www.petro21.com/post/templates/TEMPBut_Reister.jpg" border="0"></a></div>
				</td>
                </tr>
                <tr>
                <td height="15"></td>
				</tr>
            </table>
<cfif  IsBriefing NEQ 1  AND Briefingid NEQ 0 >
<!--- POD Briefings -------------->
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="color:##333 ; font-size:12px;font-family:Arial, Helvetica, sans-serif;">
                                <tr>
                                <td rowspan="5" width="10"></td>
                                <td  height="35"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333; font-size:16px; padding:15px 0 0 0">#Briefingname#&nbsp;</td>
                                <td rowspan="5" width="10">&nbsp;</td>
                                </tr>
                                <tr>
                                <td height="1" bgcolor="###lightColor#"></td>
                                </tr>
                                <tr>
                                <td height="25">&nbsp;</td>
                                </tr>
                                <tr>
                                <td><!--- DUNCAN TABLE ------>
                                           <table border="0" cellpadding="0" cellspacing="4">
                                                <tr>
                                                    <td valign="top" width="245"><span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Presentations By: </span><span style="color:##324d96">Dr Duncan Clarke</span><br>
                                                <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Chairman:</span> <span style="color:##324d96">Global Pacific &amp; Partners</span><br>
                                                <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Author:</span><span style="color:##324d96"> Empires Of Oil,
                                                 Crude Continent </span>and<span style="color:##324d96"> The Battle For Barrels </span></td>
                                                    <td width="67" valign="top"><img src="http://www.petro21.com/post/templates/DuncanBriefing.jpg" alt="s"></td>
                                                </tr>
                                              </table>
                                                
                                                <cfloop query="get_briefing" >
                                               <!---<strong>#Insert("</strong>",get_briefing.decription, 1)#<br />Worldwide Strategies, Scenarios, Paradigms: Companies, State Players, Critical Future Questions---> 
                                              <div style="color:###DarkColor#;"> #get_briefing.decription#</div>
                                                            <cfif  IsBriefing EQ 1  >
                                                            #get_briefing.comment#<br />
                                                            </cfif>
                                                </cfloop>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td  height="15"></td>
                                    </tr>
                                    </table>
 <!--- START CONTACT POD --->
                     <table border="0" cellpadding="0" width="100%" cellspacing="0" style="padding:0 0 14px 0; color:##333333; font-size:12px;font-family:Arial, Helvetica, sans-serif;"  >
                    <tr>
                    <td width="10" rowspan="5"></td>
                    <td height="35"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Contact</td>
                    <td width="10" rowspan="5"></td>
                    </tr>
                    <tr>
                    <td height="1" bgcolor="###lightColor#"></td>
                    </tr>
                    <tr>
                    <td height="25"></td>
                    </tr>
                    <tr>
                    <td valign="top" >
                    <cfif Enquir NEQ "" >
                    <p><span style=" font-size:14px;">Registration Enquiries</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(Enquir, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif>
                    <cfif len(sponEnq) GT 1 >
                    <p><span style=" font-size:14px;">Sponsorship Enquiries</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(sponEnq, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif>
                    <cfif exibition EQ 1 >
                    <cfif exhEnq NEQ "" >
                    <p><span style=" font-size:14px;">Exhibition Enquiries</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(exhEnq, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif>
                    </cfif>
                    <cfif len(exhEnq) GT 1 >
                    <p><span style=" font-size:14px;">Dinner Contacts</span><br />
                    <cfloop query="getnames" >
                    <cfif  listcontains(PaCont, getnames.id, "," ) NEQ "0"  >
                    #getnames.name#: <a href="mailto:#getnames.email#"  style="color:###DarkColor#">#getnames.email#</a><br />
                    Tel: #getnames.tel#<br /><br />
                    </cfif>
                    </cfloop>
                    </p>
                    </cfif></td>
                    </tr>
                    <tr>
                    <td height="15"></td>
                    </tr>
                    </table> 
</cfif>
<!-- END collum 2 start here ---->        </td>
        <td width="300" valign="top"  bgcolor="###getjob.col3color#">
<!-- collum 3 start here ---->        
<cfif  IsBriefing NEQ 1  >
        <!--- Netwrk With Pod ---->                          
                      <table border="0" cellpadding="0" cellspacing="0"  style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="100%" >
                        <tr>
                        <td width="10" rowspan="4"></td>
                        <td height="34"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Network with</td>
                        <td width="10" rowspan="4"></td>
                        </tr>
                        <tr>
                          <td  height="1" bgcolor="###lightColor#"></td>
                        </tr>
                        <tr>
                          <td height="25"></td>
                        </tr>
                        <tr>
                          <td >
                          <cfloop query="get_Network"  startrow="1" endrow="#NetWithCount#"><cfif get_Network.companyname NEQ "" >
                          			<cfif len(get_Network.companyname) GT 44>#left(rereplace(Lcase(get_Network.companyname), '^\w', '\u\0'), 44)#...<cfelse>#trim(rereplace(Lcase(get_Network.companyname), '^\w', '\u\0'))#</cfif>
									<cfif get_Network.companyname contains get_Network.country ><cfelse>
											<cfif len(get_Network.companyname) LT 44 >, <span style="color:##666666">#left(trim(rereplace(Lcase(get_Network.country), '^\w', '\u\0')), 50 - len(get_Network.companyname) )#</span></cfif>
									</cfif><br />
                          </cfif></cfloop>
                          <cfif NetWithCount LT get_Network.recordCount ><a  href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#"   style="color:###DarkColor#">more here..</a></cfif>
                                                   </td>
                        </tr>
                      </table>
</cfif>
<!--- END Netwrk With Pod // START FUNCTION AT THE EVENT---->
<cfif  function.recordcount GT 0   >
        <!--- Function  Pod ---->                          
                      <table border="0" cellpadding="0" cellspacing="0"  style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="100%" >
                        <tr>
                        <td width="10" rowspan="4"></td>
                        <td height="34"    style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Functions at the Event</td>
                        <td width="10" rowspan="4"></td>
                        </tr>
                        <tr>
                          <td  height="1" bgcolor="###lightColor#"></td>
                        </tr>
                        <tr>
                          <td height="25"></td>
                        </tr>
                        <tr>
                          <td >
                          <cfloop query="function"  >
                          		#function.title#, <span style=" font-size:11px;color:##666666">#DateFormat(function.functiondate, "dd.mm.yy")#</span><br />
                          </cfloop>
                          
                                                   </td>
                        </tr>
                      </table>
</cfif>
<!--- END FUNCTION AT THE EVENT ---->

       </td>
  </tr>
  <tr><td colspan="3">
  <!--- FUNCTION ON CREATING FILE FOR MEDIA PARTNERS ---->
  <cfif getjob.contraJob_id NEQ 0 ><img src="http://www.petro21.com/post/templates/counter.cfm?id=#getjob.contraJob_id#&eid=652"></cfif>
  <!--- FUNCTION TO ADD REMOVE LING FROM EMAIL ---->
  <cfif parameterexists(unsubscribe)><a style="font-size:11px; color:##666666" href="http://petro21.com/post/Unsubscrib.cfm?field=chkWebIntAf&id=#sendlist.id#" >click here to unsubscribe</a> </cfif>
  </td></tr>
</table>



</cfif>
</cfoutput>

</body>
</html>
