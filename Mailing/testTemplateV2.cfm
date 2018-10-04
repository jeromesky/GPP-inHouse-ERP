<cfinclude template="../Application.cfm">
<!---get the template details --->
<cfparam name="GPPSERVER" default="gppdata">
<cfparam name="dsnP21" default="petro21">
<cfquery datasource="petro21" name="getjob">
	SELECT * FROM MailOut_configuration WHERE id = #url.id#
</cfquery>
<!---<cftry>--->
<cfquery name="get_event" DATASOURCE="#gpp#">
  	SELECT 
    eventID AS webid,
    parentID
	FROM 
  	CRM_events
	WHERE 
  	eventID = #getjob.eventid# 
</cfquery>
<cfquery name="get_group" DATASOURCE="#gpp#" >
SELECT 
    CRM_events.webid AS id, 
    CRM_events.IngConference_ID AS id_gpp, 
    CRM_events.event_abbr, 
    CRM_events.event_name, 
    CRM_events.event_days, 
    CRM_events.event_month, 
    CRM_events.event_year, 
    CRM_events.event_type, 
    CRM_events.event_blurb, 
    CRM_events.event_loc_hotel AS venue, 
    CRM_events.event_loc_city AS city, 
    CRM_events.event_loc_country AS country, 
    CRM_events.event_blurb, 
    CRM_events.ColorD, 
    CRM_events.ColorL, 
    CRM_events.logos_supporter, 
    CRM_events.supportedby,	
    CRM_events.logo_CorpSponsor,	
    CRM_events.logo_corpMembers,	
    CRM_events.sponsor_gold,
    CRM_events.sponsor_platinum,	
    CRM_events.sponsor_silver,	
    CRM_events.sponsor_bronze,	
    CRM_events.FocusOn, 
    CRM_events.Enquir,	
    CRM_events.exhEnq,	
    CRM_events.sponEnq,	
    CRM_events.PaCont,	 
    CRM_events.file_update, 
    CRM_events.file_image_pdf, 
    CRM_events.event_blurb_exhib, 
    CRM_events.briefingSlogan, 
    CRM_events.newsletterBannerTop, 
    CRM_events.newsletterBannerCol1, 
    CRM_events.newsletterBannerCol2, 
    CRM_events.newsletterBannerTop600, 
    CRM_events.logo_Contributing, 
    CRM_events.sponsor_Airline, 
    CRM_events.sponsor_lead, 
    CRM_events.discountValue, 
    CRM_events.discountDate, 
    venues.VenueName AS hotelname
  FROM 
  	CRM_events
  LEFT JOIN venues 
  	ON CRM_events.hotel = venues.venueID
  WHERE 
  	(
    CRM_events.parentID = #get_event.parentID# OR
    CRM_events.eventID = #get_event.parentID#
    )
		AND
    ( CRM_events.event_type = 'event' OR CRM_events.event_type = 'eb' OR CRM_events.event_type = 'din' OR CRM_events.event_type = 'week' OR CRM_events.event_type = 'Bu_Pr' ) 
  
  ORDER BY 
  	event_type desc
</cfquery>
<cfset logos = "">
<cfset mainlogos = "">
<cfset MainEventLink = "" >
<cfset network = "">
<cfset exibition = 0 >
<cfseti = 0>
<cfset functioncounter = 0>
<cfset flashNews = 0 >
<cfset IsBriefing	= 0 >
<cfset logocounterLevel2 = 6 >
<cfset logocounter = 6 >
<cfset Briefingid = 0 >

<!--- get functions --->
<cfquery datasource="#dsnP21#" name="function">
SELECT event_welcom.*, logos.company, logos.logofile 
FROM event_welcom RIGHT JOIN logos
ON event_welcom.sponsor = logos.id
WHERE <cfloop query="get_group"><cfif functioncounter NEQ 0 >OR</cfif> event_welcom.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_group.id#"><cfset functioncounter = functioncounter + 1 ></cfloop>
ORDER BY functiondate , functionTime
</cfquery>

<!--- get the speakers -------------
<cfquery name="get_speakers" datasource="#dsnP21#" >
	SELECT DISTINCT speakers_program.eventid, speakers.name, speakers.delegation, speakers_program.pos, speakers.photo, speakers_program.keyNote 
	FROM speakers 
	LEFT outer JOIN speakers_program
	ON speakers_program.clientid = speakers.id
	WHERE 
  	<cfloop query="get_group">
			<cfif get_group.currentrow NEQ 1 >OR</cfif> speakers_program.eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_group.id#"></cfloop>
	ORDER BY speakers_program.pos, speakers_program.keyNote, speakers.photo DESC
</cfquery>
<cfset speakerCount = #get_speakers.recordcount# >
<cfset NetWithCount = speakerCount * 2 >---->

<cfloop query="get_group">
<cfset network = #listAppend(network, get_group.id_gpp, ",")#>
<!--- GET ID OF THE MAIN CONFERENCE ---->
<cfif get_group.event_type EQ "event" >
 <cfset MainEventLink = #get_group.id# >
</cfif>
<cfif get_group.event_type EQ "week" >
 <cfset WeekID 			= #get_group.id# >
 <cfset eventID 			= #get_group.id# >
 <cfset EventAbbre		= #get_group.event_abbr#  >
 <cfset eventName		= #get_group.event_name# >
 <cfset eventYear		= #get_group.event_year# >
 <cfset city 					= #get_group.city# >
 <cfset country 			= #get_group.country# >
 <cfset focusOn 			= #get_group.FocusOn# >
 <cfset lightColor 			= #get_group.ColorL# >
 <cfset DarkColor 		= #get_group.ColorD# >
 <cfset downloadfile 	= #get_group.file_update# >
 <cfset banner 				= #get_group.file_image_pdf# >
 <cfset Enquir				= #get_group.Enquir# >
 <cfset sponEnq			= #get_group.sponEnq# >
 <cfset exhEnq				= #get_group.exhEnq# >
 <cfset PaCont				= #get_group.PaCont# >
 <cfif len(get_group.event_blurb_exhib) GT 10>
  <cfset exibition = 1 >
 </cfif>
 
 <!--- set the template images ---------->
 
 <cfif getjob.templateSize EQ 1 >
  <cfset bannertop 		= #get_group.newsletterBannerTop600# >
  <cfset logocounter = 4 >
  <cfelse>
  <cfset bannertop 		= #get_group.newsletterBannerTop# >
 </cfif>
 <cfset collum1 			= #trim(get_group.newsletterBannerCol1)# >
 <cfset collum2 			= #trim(get_group.newsletterBannerCol2)# >
 
 <!--- SElect sponsors -------------------------------------->
 <cfset mainlogos 	= ListPrepend(mainlogos, get_group.sponsor_platinum, ",") >
 <cfset mainlogos 	= ListPrepend(mainlogos, get_group.sponsor_gold, ",") >
 <cfset mainlogos 	= ListPrepend(mainlogos, get_group.sponsor_silver, ",") >
 <cfset mainlogos 	= ListPrepend(mainlogos, get_group.sponsor_bronze, ",") >
 <cfset logos 		= ListPrepend(logos, get_group.sponsor_Airline, ",") >
 <cfset logos 		= ListPrepend(logos, get_group.logos_supporter, ",") >
 <cfset logos 		= ListPrepend(logos, get_group.supportedby, ",") >
 <cfset logos 		= ListPrepend(logos, get_group.logo_CorpSponsor, ",") >
 <cfset logos			= ListPrepend(logos, get_group.logo_corpMembers, ",") >
 <cfset logos 			= ListPrepend(logos, get_group.logo_Contributing, ",") >
 <cfset mainlogos 	= ListToArray(mainlogos, ",") >
 <cfset mainlogos 	= ArrayToList(mainlogos, ",") >
 <cfset logos 			= ListToArray(logos, ",") >
 <cfset logos 			= ArrayToList(logos, ",") >
</cfif>
<cfif get_group.event_type EQ "EB" >
 <cfset Briefingid		= #get_group.id# >
 <cfset Briefingname	= #get_group.event_name# >
 <cfset Briefingslogan	= #get_group.briefingSlogan# >
 <cfif getjob.eventid EQ Briefingid AND getjob.eventExact EQ 1 >
  <cfset IsBriefing		= 1 >
 </cfif>
</cfif>

<!--- SET the template to use exact selected event ------>
<cfif get_group.id EQ getjob.eventid AND getjob.eventExact EQ 1 >
 <!--- set the template images -------------------------------------->
 <cfif getjob.templateSize EQ 1 >
  <cfset bannertop 		= #get_group.newsletterBannerTop600# >
  <cfset logocounter = 4 >
  <cfelse>
  <cfset bannertop 		= #get_group.newsletterBannerTop# >
 </cfif>
 <cfset collum1 			= #trim(get_group.newsletterBannerCol1)# >
 <cfset collum2 			= #trim(get_group.newsletterBannerCol2)# >
 <cfif getjob.eventExact EQ 1	>
  <cfset eventID 			= #get_group.id#&"&tc="&#get_group.event_abbr# >
  <cfset EventAbbre	= #get_group.event_abbr# >
 </cfif>
 <cfset eventName		= #get_group.event_name# >
 <cfset focusOn 			= #get_group.FocusOn# >
 <cfset Enquir				= #get_group.Enquir# >
 <cfset sponEnq			= #get_group.sponEnq# >
 <cfset exhEnq			= #get_group.exhEnq# >
 <cfset PaCont			= #get_group.PaCont# >
</cfif>
</cfloop>
<cfparam default="#network#" name="url.weekGroupId">
<cfset network = ListToArray(network, ",") >
<cfset network = ArrayToList(network, ",") >

<cfquery datasource="#gpp#" name="qryMedia">
SELECT DISTINCT
   [branchName]
   ,[companyName]
   ,[branchURL]
   ,[mediaLogo]
   ,[branchBios]
 FROM 
 		[PM_events_page_media]
 WHERE
 		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#WeekID#">
 AND 
 		[mediaLogo] != ''
</cfquery>

<!--- <cfquery datasource="#gpp#" name="qrySponsors">
 SELECT 
 	  [mediaLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
   ,[sponsorTypeID]
   ,[typeOrder]
   ,[leadSponsorLogo]
 FROM 
 		[PM_events_page_sponsors]
 WHERE 
 		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#WeekID#">
    AND 
    [mediaLogo] != ''
 </cfquery>--->
 <cfinclude template="inc_qrySponsors.cfm">
 
  <cfquery datasource="#gpp#" name="qryExhibitors">
SELECT
	  [mediaLogo]
   ,[companyName]
   ,[url]
   ,[bios]
 FROM 
 		[CRM_logos_exhibitors]
 WHERE 
 		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#WeekID#">
 </cfquery>

<!--- get the speakers --------------------->
<cfif Briefingid NEQ 0 >
 <cfquery name="get_briefing" datasource="#dsnP21#">
   SELECT speakers_program.decription, speakers_program.comment, speakers_program.speakersession, speakers_program.speakertime, speakers_program.eventid
   FROM speakers_program 
   WHERE speakers_program.eventid = #Briefingid# AND (speakers_program.speaker = 0 OR speakers_program.speaker = 1)
   ORDER BY speakers_program.speakersession , speakers_program.speakertime
 </cfquery>
</cfif>

<!--- get the CONTACTS ------------->
<cfquery datasource="#dsnP21#" name="getnames">
      SELECT id, name, email, tel
      FROM gppusers
  </cfquery>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<style type="text/css">
#focus ul {padding:0 0 0 10px; margin:0px }
table {font-family:Arial, Helvetica, sans-serif; font-size:12px ; color:#333}
</style>
<cfoutput>
<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" >
 <tr>
  <td colspan="6" align="center" bgcolor="##ededed" style="border-bottom:1px solid ##d7d7d7"><table border="0" cellspacing="0" cellpadding="0" bgcolor="##ffffff">
    <tr>
     <td width="165" valign="bottom"><img src="http://petro21.com/post/templates/AOW09_logo.jpg" width="165" height="108" /></td>
     <td valign="top"><!--- get the logos --------->
      
    </td>
    </tr>
    <tr>
     <td colspan="3"><a href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#"><img src="http://www.petro21.com/post/templates/#bannertop#" border="0" title="" alt="#get_group.event_name# #get_group.event_year#" /></a></td>
    </tr>
   </table></td>
 </tr>
 <tr>
  <td>&nbsp;</td>
  <td width="900"><table border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td width="300" valign="top" <cfif len(trim(getjob.col1color)) GT 2> bgcolor="###getjob.col1color#" </cfif> height="300" <cfif len(trim(collum1)) GT 5>background="http://www.petro21.com/post/templates/#trim(collum1)#"</cfif> style="color:##ffffff; font-size:11px; <cfif trim(collum1) NEQ "">background-image:url(http://www.petro21.com/post/templates/#trim(collum1)#); background-repeat:no-repeat</cfif>"><cfif IsBriefing EQ 1 AND Briefingid NEQ 0 >
       <!--- POD Briefings ------->
       <table width="300" border="0" cellspacing="0" cellpadding="0" style="color:##333 ; font-size:12px;font-family:Arial, Helvetica, sans-serif;">
        <tr>
         <td rowspan="5" width="10"></td>
         <td height="35" style="font-family:Georgia, Times New Roman, Times, serif; color:##333; font-size:16px; padding:15px 0 0 0">#Briefingname#&nbsp;</td>
         <td rowspan="5" width="10">&nbsp;</td>
        </tr>
        <tr>
         <td height="1" bgcolor="###lightColor#"></td>
        </tr>
        <tr>
         <td height="25">&nbsp;</td>
        </tr>
        <tr>
         <td><!--- DUNCAN TABLE ------->
          
          <table border="0" cellpadding="0" cellspacing="4">
           <tr>
            <td valign="top" ><span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Presentations By: </span><span style="color:##324d96">Dr Duncan Clarke</span><br>
             <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Chairman:</span> <span style="color:##324d96">Global Pacific &amp; Partners</span><br>
             <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Author:</span><span style="color:##324d96"> Empires Of Oil,
             Crude Continent </span>and<span style="color:##324d96"> The Battle For Barrels </span></td>
            <td width="67" valign="top"><img src="http://www.petro21.com/post/templates/DuncanBriefing.jpg" alt="s" width="66" height="68"></td>
           </tr>
          </table>
          <cfloop query="get_briefing" > 
          <!---<strong>#Insert("</strong>",get_briefing.decription, 1)#<br />Worldwide Strategies, Scenarios, Paradigms: Companies, State Players, Critical Future Questions--->
          <div style="color:###DarkColor#; ">#get_briefing.decription#</div>
          <cfif IsBriefing EQ 1 >
           #get_briefing.comment#<br />
          </cfif>
          </cfloop></td>
        </tr>
        <tr>
         <td height="15"></td>
        </tr>
       </table>
       <cfelse>
       <!--- Confirmed Speakers ----->
       <table border="0" cellpadding="0" cellspacing="0" width="300">
        <tr>
         <td ><cfinclude template="../Speakers/dsp_emailTemplate_speakers.cfm">
          <p><a href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#" style="color:###DarkColor#">Download Brochure </a> // <a href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#"  style="color:###DarkColor#">Register Online </a></p></td>
        </tr>
        <tr>
         <td height="20"></td>
        </tr>
       </table>
      </cfif></td>
     <td width="300" valign="top" <cfif len(trim(getjob.col2color)) GT 2>bgcolor="###getjob.col2color#" </cfif> <cfif trim(collum2) NEQ "">style="background-image:url(http://www.petro21.com/post/templates/#collum2#); background-repeat:no-repeat"</cfif>><div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">FOCUS ON</span> </div>
      #focusOn#
      <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">EVENT DETAILS</span> </div>
      #get_group.event_blurb#
      <table cellpadding="0" cellspacing="0" border="0" width="300" style="font-family:Arial, Helvetica, sans-serif">
       <cfloop query="get_group">
       <cfif getjob.eventExact EQ 1 >
        <cfif get_group.id EQ getjob.eventid >
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
      <div style="margin:15px 0 3px 0"><a href="http://www.petro21.com/events/downloadfile.cfm?file=bro&id=#WeekID#" ><img src="http://www.petro21.com/post/templates/TEMPBut_brochure.jpg" border="0" width="141" height="34"></a><a href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#"><img src="http://www.petro21.com/post/templates/TEMPBut_Reister.jpg" border="0" width="138" height="34"></a></div></td>
    </tr>
    <tr>
     <td height="15"></td>
    </tr>
   </table>
   <cfif IsBriefing NEQ 1 AND Briefingid NEQ 0 >
    <!--- POD Briefings ----------------------------->
    <table width="300" border="0" cellspacing="0" cellpadding="0" style="color:##333 ; font-size:12px;font-family:Arial, Helvetica, sans-serif;">
     <tr>
      <td rowspan="5" width="10"></td>
      <td height="35" style="font-family:Georgia, Times New Roman, Times, serif; color:##333; font-size:16px; padding:15px 0 0 0">#Briefingname#&nbsp;</td>
      <td rowspan="5" width="10">&nbsp;</td>
     </tr>
     <tr>
      <td height="1" bgcolor="###lightColor#"></td>
     </tr>
     <tr>
      <td height="25">&nbsp;</td>
     </tr>
     <tr>
      <td><!--- DUNCAN TABLE -------------->
       
       <table border="0" cellpadding="0" cellspacing="4">
        <tr>
         <td valign="top" width="245"><span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Presentations By: </span><span style="color:##324d96">Dr Duncan Clarke</span><br>
          <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Chairman:</span> <span style="color:##324d96">Global Pacific &amp; Partners</span><br>
          <span style="font-family:Georgia, "Times New Roman", Times, serif; color:##222222; font-size:12px">Author:</span><span style="color:##324d96"> Empires Of Oil,
          Crude Continent </span>and<span style="color:##324d96"> The Battle For Barrels </span></td>
         <td width="67" valign="top"><img src="http://www.petro21.com/post/templates/DuncanBriefing.jpg" alt="s" width="66" height="68"></td>
        </tr>
       </table>
       <cfloop query="get_briefing" > 
       <!---<strong>#Insert("</strong>",get_briefing.decription, 1)#<br />Worldwide Strategies, Scenarios, Paradigms: Companies, State Players, Critical Future Questions--->
       <div style="color:###DarkColor#;"> #get_briefing.decription#</div>
       <cfif IsBriefing EQ 1 >
        #get_briefing.comment#<br />
       </cfif>
       </cfloop></td>
     </tr>
     <tr>
      <td height="15"></td>
     </tr>
    </table>
    <!--- START CONTACT POD -------------------------------------------------------------------->
    <table border="0" cellpadding="0" width="300" cellspacing="0" style="padding:0 0 14px 0; color:##333333; font-size:12px;font-family:Arial, Helvetica, sans-serif;" >
     <tr>
      <td width="10" rowspan="5"></td>
      <td height="35"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Contact</td>
      <td width="10" rowspan="5"></td>
     </tr>
     <tr>
      <td height="1" bgcolor="###lightColor#"></td>
     </tr>
     <tr>
      <td height="25"></td>
     </tr>
     <tr>
      <td valign="top" ><cfif Enquir NEQ "" >
        <p><span style=" font-size:14px;">Registration Enquiries</span><br />
         <cfloop query="getnames" >
         <cfif listcontains(Enquir, getnames.id, "," ) NEQ "0" >
          #getnames.name#: <a href="mailto:#getnames.email#" style="color:###DarkColor#">#getnames.email#</a><br />
          Tel: #getnames.tel#<br />
          <br />
         </cfif>
         </cfloop>
        </p>
       </cfif>
       <cfif len(sponEnq) GT 1 >
        <p><span style=" font-size:14px;">Sponsorship Enquiries</span><br />
         <cfloop query="getnames" >
         <cfif listcontains(sponEnq, getnames.id, "," ) NEQ "0" >
          #getnames.name#: <a href="mailto:#getnames.email#" style="color:###DarkColor#">#getnames.email#</a><br />
          Tel: #getnames.tel#<br />
          <br />
         </cfif>
         </cfloop>
        </p>
       </cfif>
       <cfif exibition EQ 1 >
        <cfif len(exhEnq) GT 1 >
         <p><span style=" font-size:14px;">Exhibition Enquiries</span><br />
          <cfloop query="getnames" >
          <cfif listcontains(exhEnq, getnames.id, "," ) NEQ "0" >
           #getnames.name#: <a href="mailto:#getnames.email#" style="color:###DarkColor#">#getnames.email#</a><br />
           Tel: #getnames.tel#<br />
           <br />
          </cfif>
          </cfloop>
         </p>
        </cfif>
       </cfif>
       <cfif len(PaCont) GT 1 >
        <p><span style=" font-size:14px;">Dinner Contacts</span><br />
         <cfloop query="getnames" >
         <cfif listcontains(PaCont, getnames.id, "," ) NEQ "0" >
          #getnames.name#: <a href="mailto:#getnames.email#" style="color:###DarkColor#">#getnames.email#</a><br />
          Tel: #getnames.tel#<br />
          <br />
         </cfif>
         </cfloop>
        </p>
       </cfif></td>
     </tr>
     <tr>
      <td height="15"></td>
     </tr>
    </table>
   </cfif></td>
  <td valign="top">
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">MEDIA </span> </div>
	<cfloop query="qryMedia">   
  <a href="#qryMedia.branchURL#" target="_blank"><img src="http://www.petro21.com/_files/business/#qryMedia.mediaLogo#" border="0" width="89" height="37" hspace="2" vspace="2" /></a> <!---#qryMedia.branchName#---> <br></cfloop>
  
  </td>
  <td valign="top">
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsLead.typeLabel# </span> </div>
	<cfloop query="qrySponsorsLead">   
  <a href="#qrySponsorsLead.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsLead.leadSponsorLogo#" border="0" width="136" height="60" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsTitanium.typeLabel# </span> </div>
	<cfloop query="qrySponsorsTitanium">   
  <a href="#qrySponsorsTitanium.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsTitanium.leadSponsorLogo#" border="0" width="136" height="60" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsDiamond.typeLabel# </span> </div>
	<cfloop query="qrySponsorsDiamond">   
  <a href="#qrySponsorsDiamond.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsDiamond.leadSponsorLogo#" border="0" width="136" height="60" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsPlatinum.typeLabel# </span> </div>
	<cfloop query="qrySponsorsPlatinum">   
  <a href="#qrySponsorsPlatinum.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsPlatinum.leadSponsorLogo#" border="0" width="136" height="60" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  
   <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsRhodium.typeLabel# </span> </div>
	<cfloop query="qrySponsorsRhodium">   
  <a href="#qrySponsorsRhodium.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsRhodium.leadSponsorLogo#" border="0" width="136" height="60" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsSilver.typeLabel# </span> </div>
	<cfloop query="qrySponsorsSilver">   
  <a href="#qrySponsorsSilver.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsSilver.leadSponsorLogo#" border="0" width="136" height="60" hspace="4" vspace="4" /></a><br></cfloop>
  
  
<!---   <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsSilver.typeLabel# </span> </div>
	<cfloop query="qrySponsorsSilver">   
  <a href="#qrySponsorsSilver.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsSilver.leadSponsorLogo#" border="0" width="92" height="38" hspace="4" vspace="4" /></a><br></cfloop>--->
  
  
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsBronze.typeLabel# </span> </div>
	<cfloop query="qrySponsorsGold">   
  <a href="#qrySponsorsBronze.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsBronze.leadSponsorLogo#" border="0" width="136" height="60" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  
  
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">#qrySponsorsExentendable.packageLabel# </span> </div>
	<cfloop query="qrySponsorsExentendable">   
  <a href="#qrySponsorsExentendable.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsExentendable.leadSponsorLogo#" border="0" width="98" height="39" hspace="4" vspace="4" /></a><br></cfloop>
  
  
   <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">Sponsors </span> </div>
	<cfloop query="qrySponsorsMain">   
  <a href="#qrySponsorsMain.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsMain.mediaLogo#" border="0" width="92" height="38" hspace="4" vspace="4" /></a><br></cfloop>
  
  
    <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">Suporting </span> </div>
	<cfloop query="qrySponsorsSup">   
  <a href="#qrySponsorsSup.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsSup.mediaLogo#" border="0" width="92" height="38" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">Contributing </span> </div>
	<cfloop query="qrySponsorsCont">   
  <a href="#qrySponsorsCont.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qrySponsorsCont.mediaLogo#" border="0" width="92" height="38" hspace="4" vspace="4" /></a><br></cfloop>
  
  
  </td>
  <td valign="top">
  	<div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">EXHIBITORS </span> </div>
	<cfloop query="qryExhibitors">   
  <a href="#qryExhibitors.url#" target="_blank"><img src="http://www.petro21.com/_files/business/#qryExhibitors.mediaLogo#" border="0" width="92" height="38" hspace="4" vspace="4" /></a> <!---#qryExhibitors.companyname# ---><br></cfloop>
  
  </td>
  <td width="300" valign="top" <cfif len(trim(getjob.col3color)) GT 2>bgcolor="###getjob.col3color#"</cfif>><table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; color:##fff;font-family:Arial, Helvetica, sans-serif;" bgcolor="###DarkColor#" width="300" >
    <tr>
     <td width="10" rowspan="3"></td>
     <td height="34"  style=" padding:20px 0 20px 0" align="center"><span style=" height:30px;border:1px solid ###lightColor#; padding:10px"><a href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#" style="color:##fff"> REGISTER NOW
      <cfif get_group.discountDate NEQ "" >
       <cfif dateCompare( dateformat(get_group.discountDate, "dd mm yyyy"), dateformat(now(), "dd mm yyyy"), "d" ) EQ 1 OR dateCompare( dateformat(get_group.discountDate, "dd mm yyyy"), dateFormat(now(), "dd mm yyyy"), "d" ) EQ 0 >
        FOR DISCOUNT
       </cfif>
      </cfif>
      </a></span></td>
     <td width="10" rowspan="3"></td>
    </tr>
    <tr>
     <td height="20" align="right"><a href="http://www.petro21.com" style="color:##fff">www.petro21.com</a></td>
    </tr>
    <tr>
     <td >&nbsp;</td>
    </tr>
   </table>
   <cfif IsBriefing NEQ 1 >
    <!--- Netwrk With Pod ------------>
    <cfinclude template="../networkWith/dsp_emailTemplate_networkWith.cfm">
   </cfif>
   
   <!--- END Netwrk With Pod // START FUNCTION AT THE EVENT------->
   
   <cfif function.recordcount GT 0  >
    <!--- Function Pod ------------>
    <div style="border-bottom:##000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid ##000 4px;">FUNCTIONS AT THE EVENT</span> </div>
    <cfloop query="function"> #function.title#, <span style=" font-size:11px;color:##666666">#DateFormat(function.functiondate, "dd.mm.yy")#</span><br />
    </cfloop>
   </cfif>
   
   <!--- END FUNCTION AT THE EVENT --------></td>
 </tr>
</table>
</td>
<td>&nbsp;</td>
</tr>
<tr>
 <td colspan="3" bgcolor="##CCCCCC"><table width="900" align="center" cellspacing="0" cellpadding="10">
   <tr>
    <td colspan="3" bgcolor="##303030" height="80" align="center" style="color:##CCCCCC; font-family:Arial, Helvetica, sans-serif; font-size:11px"><cfif parameterexists(unsubscribe)>
      <a style=" font-family:Arial, Helvetica, sans-serif;font-size:11px; color:##fff" href="http://petro21.com/post/Unsubscrib.cfm?field=chkWebIntAf&id=<cfoutput>#sendlist.id#</cfoutput>" >click to unsubscribe</a>
     </cfif>
     <br > Content and Design &copy;Copyright of Global Pacific & Partners 2010</td>
   </tr>
  </table></td>
</tr>
</table>
</cfoutput>
</body>
</html>

<!---<cfcatch type="any">
<cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in: #cfcatch.Type# <br> error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
 SQL state:<cfif parameterexists(cfcatch.SQLState)> #cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br >#cgi.script_name#</cfoutput>
 <cfdump var="#cfcatch#">
 <cfdump var="#cgi#">
 </cfmail>
 

</cfcatch>
</cftry>--->

<!---        <table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="300" >
            <tr>
            <td width="10" rowspan="4"></td>
            <td height="34"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">Network with</td>
            <td width="10" rowspan="4"></td>
            </tr>
            <tr>
             <td height="1" bgcolor="###lightColor#"></td>
            </tr>
            <tr>
             <td height="25"></td>
            </tr>
            <tr>
             <td >
             <cfloop query="get_Network" startrow="1" endrow="#NetWithCount#">
             		<cfif len(get_Network.companyname) GT 44>#left(rereplace(Lcase(get_Network.companyname), '^\w', '\u\0'), 44)#...<cfelse>#trim(rereplace(Lcase(get_Network.companyname), '^\w', '\u\0'))#</cfif><cfif get_Network.companyname contains get_Network.country ><cfelse><cfif len(get_Network.companyname) LT 44 >, <span style="color:##666666">#left(trim(rereplace(Lcase(get_Network.country), '^\w', '\u\0')), 50 - len(get_Network.companyname) )#</span>
                   </cfif></cfif><br />
             </cfloop>
             <cfif NetWithCount LT get_Network.recordCount ><a href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#"  style="color:###DarkColor#">more here..</a></cfif>
                          </td>
            </tr>
           </table>--->

<!---    groupby = #get_event.groupby# AND 
    YEAR(CRM_events.event_expire) = #get_event.event_year# AND --->
<!---  	SELECT events.id, events.id_gpp, events.event_abbr, events.event_name, events.event_days, events.event_month, events.event_year, events.event_type, events.event_blurb, events.event_loc_hotel AS venue, events.event_loc_city AS city, events.event_loc_country AS country, events.event_blurb, events.ColorD, events.ColorL, events.logos_supporter, events.supportedby,	events.logo_CorpSponsor,	events.logo_corpMembers,	events.sponsor_gold,	events.sponsor_platinum,	events.sponsor_silver,	events.sponsor_bronze,	events.FocusOn, events.Enquir,	events.exhEnq,	events.sponEnq,	events.PaCont,	 events.file_update, events.file_image_pdf, events.event_blurb_exhib, events.briefingSlogan, events.newsletterBannerTop, events.newsletterBannerCol1, events.newsletterBannerCol2, events.newsletterBannerTop600, events.logo_Contributing, events.sponsor_Airline, events.sponsor_lead, 
  hotels.hotelname, events.discountValue, events.discountDate
	FROM events
  LEFT JOIN hotels ON events.hotel = hotels.id
	WHERE groupby = #get_event.groupby# AND event_year = #get_event.event_year# AND LIVE = 1 AND ( event_type = 'event' OR event_type = 'eb' OR event_type = 'din' OR event_type = 'week' OR event_type = 'Bu_Pr' ) 
  ORDER BY event_type desc--->
<!---<cfdump var="#get_group#">--->

<!--- get the speakers 
<cfquery name="get_Network" datasource="#gpp#" >
	SELECT CompanyName, country
	FROM VIEWNetworkWith 
	
	WHERE ID IN (#network#)
  GROUP BY country, CompanyName
  ORDER BY CompanyName
</cfquery>------------------------------><!--- get the speakers ------------------------------
<cfquery name="get_speakers" datasource="#dsnP21#" >
	SELECT speakers_program.eventid
	FROM speakers_program 
	WHERE <cfloop query="get_group"><cfif i NEQ 0 >OR</cfif> speakers_program.eventid = #get_group.id#<cfset i = i + 1 ></cfloop>
	ORDER BY speakers_program.pos
</cfquery>-------><!---			<cfset logos 			= ListPrepend(logos, supportedby, ",") >	
        <cfset logos 			= ListPrepend(logos, logo_CorpSponsor, ",") >
        <cfset logos			= ListPrepend(logos, logo_corpMembers, ",") >	
        <cfset logos 			= ListPrepend(logos, logos_supporter, ",") >		
        <cfset logos 			= ListPrepend(logos, sponsor_bronze, ",") >
        <cfset logos 			= ListPrepend(logos, sponsor_silver, ",") >
        <cfset logos 			= ListPrepend(logos, sponsor_gold, ",") >	
        <cfset logos 			= ListPrepend(logos, sponsor_platinum, ",") >	
        <cfset logos 			= ListPrepend(logos, logo_Contributing, ",") >	--->
<!---<cfset contactsGroups = "events.Enquir, events.sponEnq, events.PaCont, events.exhEnq" >
<cfset contactsGroupsName = "Registration Enquiries, Sponsorship Enquiries, PetroAfricanus Contacts, Exhibition Enquiries" >


          <!--- flash news Container ---->
					<cfif flashNews EQ 1 >
          <table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; color:##333333;font-family:Arial, Helvetica, sans-serif;" width="300" >
          <tr>
          <td width="10" rowspan="4"></td>
          <td height="35"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">News Flash</td>
          <td width="10" rowspan="4"></td>
          </tr>
          <tr>
          <td height="1" bgcolor="###lightColor#"></td>
          </tr>
          <tr>
          <td height="25"></td>
          </tr>
          <tr>
					<td >
        	<!--- flash news here ---->
              <table cellpadding="0" cellspacing="0" border="0" width="300" >
								<cfloop query="showFlashNews">
							<tr>
              <td  valign="top" style="padding:0 0 0 5px; font-family:Arial, Helvetica, sans-serif;"><div style="font-size:13px; color:##444343; text-decoration:none; font-weight:bold">#showFlashNews.title#</div>
  								<cfif showFlashNews.speaker NEQ "">
  									<cfquery datasource="#dsnP21#" name="Speaker">SELECT name, delegation, photo FROM speakers WHERE id = #showFlashNews.speaker# </cfquery>

									<table border="0" cellpadding="0" cellspacing="2">
									<tr>
									<td valign="top" height="69" width="57"><img src="http://www.petro21.com/Speakers/photos/#Speaker.photo#" width="47" height="59" ></td>
									<td valign="top">
									<span style="color:##2175bb; font-size:12px"> #Speaker.name#</span><br>
									<span style=" font-size:12px;">#Speaker.delegation#</span>									</td>
									</tr>
									</table>
									</cfif>
                  <cfif showFlashNews.displayIMG EQ 1>
                  <table border="0" cellpadding="0" cellspacing="2">
                  <tr>
                  <td valign="top" height="69" width="57">
                  <img src="http://www.petro21.com/advertising/#showFlashNews.img#" width="47" height="59" />                  </td>
                  <td valign="top">
                  <span style="font-size:12PX; color:##2a2828; " >#showFlashNews.content#</span>                  </td>
                  </tr>
                  </table>
                  <cfelse>
                  <span style="font-size:12PX; color:##2a2828; " ><cfif showFlashNews.img NEQ "" ><a href="http://www.petro21.com/advertising/#showFlashNews.img#" style="text-decoration:none">#showFlashNews.content#</a><cfelse>#showFlashNews.content#</cfif></span>
                  </cfif>          	</td>
						</tr>
        		<tr>
        		<td height="15"></td>
        			</tr>
						</cfloop>
						</table>
        <!--- end flash news ------>				</td>
    			</tr>
				</table>
				</cfif>

---><!--- get the FLASH NEWS ------------   
<cfif getjob.flashnews NEQ "" >
    <cfquery datasource="#dsnP21#" name="showFlashNews"  >
      SELECT title, content, link, img, brochure, speaker, displayIMG
      FROM newsletter_FlashNews
      WHERE  id IN (#getjob.flashnews#) AND duedate > #now()#
      ORDER BY duedate
    </cfquery>
					<cfif showFlashNews.recordcount GT 0 >
            <cfset flashNews = 1 >
          </cfif>
</cfif>--------------->
                <!---<tr>
                <td width="10" rowspan="5"></td>
                <td height="35"  style="font-family:Georgia, Times New Roman, Times, serif; color:##333333; font-size:16px; padding:15px 0 0 0">#get_speakers.recordcount# Confirmed Speakers</td>
                <td width="10" rowspan="5"></td>
                </tr>
                <tr>
          			<td height="1" bgcolor="###lightColor#"></td>
          				</tr>
                <tr><td height="25"></td></tr>
--->     
                <!---	<table cellpadding="0" cellspacing="0" border="0" style=" font-family:Arial, Helvetica, sans-serif; color:##333; font-size:11px;">
                <cfloop query="get_speakers">
                <tr>
                	<td width="55">
                <img src="http://www.petro21.com/_files/client/<cfif get_speakers.photo NEQ "">#get_speakers.photo#<cfelse>MugShots.jpg</cfif>" width="47" height="60" />
                	</td>
                  <td>
                <strong style="color:###DarkColor#; font-size:13px; line-height:18px">#get_speakers.name#</strong><br />#get_speakers.delegation#
                	</td>
                  </tr>
                </cfloop>
                	</table>--->  