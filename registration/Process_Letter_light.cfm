<!---<cftry>--->

<cfset user_id = #form.user_id# >
<cfset conf_id = #form.conf_id# >
<cfset rec_id = #form.rec_id# >
<cfparam name="FilePurposeID" default="174">

<cfset testing = 0>

<cfif form.other NEQ "" AND NOT parameterexists(form.contactemailAddress)>
  <cfset emailrecipient = "#form.other# " >
  <cfelseif form.other NEQ "" AND parameterexists(form.contactemailAddress)>
  <cfset emailrecipient = "#form.contactemailAddress#; #form.other# " >
  <cfelseif parameterexists(form.contactemailAddress) AND form.other EQ "">
  <cfset emailrecipient = #form.contactemailAddress# >
</cfif>

<!--- get User Details details --->
<cfquery datasource="#gpp#" name="order">
SELECT * 
FROM CRM_WelcomeLetter_Form
Where <!---user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#user_id#"> 
AND conf_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#conf_id#">  --->
id = <cfqueryparam cfsqltype="cf_sql_integer" value="#rec_id#">
</cfquery>

<!---<cfquery datasource="#gpp#" name="getReg_toEvents">
	SELECT webid
    FROM tblAnnual_Conf
    WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#getwebid.id#">
</cfquery>--->

    <!--- GET THE EVENT INFORMATION TO POPULATE THE EMAIL AND PDF ------------->
    <cfquery datasource="#gpp#" name="qryEvent">
                            SELECT 
                            		event_name,
                                    event_type,
                                    parentID,
                                    eventId,
                                    webid,
                                    groupby,
<!---                                    day(event_expire) AS event_days, 
                                    MONTH(event_expire) AS event_month, --->
                                    YEAR(event_expire) AS event_year, 
                                    event_loc_city AS city,
                                    event_loc_country AS country,
                                    venuroom AS room,
                                    hotel, 
                                    timereg, 
                                    timestart,
                                    event_expire
                            FROM 
                            		CRM_Events 
                            WHERE 
                            		 eventId = <cfqueryparam cfsqltype="cf_sql_integer" value="#conf_id#">
                                    <!--- AND event_expire > #now()#--->
                                     
</cfquery>
<cfquery datasource="#gpp#" name="get">
                            SELECT 
                            		webid, 
                                    eventID,
                                    event_type, 
                                    parentID,
                                    event_expire, 
                                    YEAR(event_expire) AS event_year, 
                                    event_name,  
                                    event_loc_city AS city, 
                                    event_loc_country AS country, 
                                    venuroom AS room, <!---google,---> 
                                    event_loc_weather AS HotelForm,
                                    ColorD, 
                                    ColorL,
                                    boothDateRemove,
                                    boothDateSetup,
                                    boothTimeSetup,
                                    groupby,
                                    boothTimeRemove
                            FROM 
                            		CRM_Events 
                            WHERE 
                            		 eventId = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.parentID#"> OR 
                                     parentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.parentID#"> AND
                                     (event_type = 'week' OR event_type = 'event' OR event_type = 'EB' OR event_type = 'DIN'  OR event_type = 'Bu_pr') AND
                                     live = 1
                           ORDER BY
                           			event_type DESC
</cfquery>
<!---<cfmail to="jerome@glopac.com" from="web@petro21.com" subject="qry" type="html"><cfdump var="#get#"></cfmail>---->

<!--- Set variables
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<cfloop query="get">
	
	<cfif  get.event_type EQ "week">
		  <cfset EventWeekName =  "#get.event_name#" >
          <cfset  HotelForm = "#get.HotelForm#"  >
          <cfset  EventWeekID = "#get.webid#"  >
          <cfset  ColorD = "#get.ColorD#"  >
          <cfset  ColorL = "#get.ColorL#"  >
          
          <cfparam name="getGroup.webid" default="#get.webid#">
          <cfparam name="getGroup.ColorD" default="#get.ColorD#">
          <cfparam name="getGroup.ColorL" default="#get.ColorL#">
          <cfparam name="form.eventID" default="#get.eventID#">
          <cfparam name="boothDateRemove" default="#get.boothDateRemove#">
          <cfparam name="boothDateSetup" default="#get.boothDateSetup#">
          <cfparam name="boothTimeSetup" default="#get.boothTimeSetup#">
          <cfparam name="boothDateRemove" default="#get.boothDateRemove#">
          <cfparam name="boothTimeRemove" default="#get.boothTimeRemove#">
    </cfif>
</cfloop>

<cfinclude template="../files/qry_downloads.cfm">

<!---<cfmail to="jerome@glopac.com" from="web@petro21.com" subject="WL" type="html">
<cfdump var="#get#">
<cfdump var="#qryEvent#"></cfmail>--->


<!--- get HoTELS  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<cfif qryEvent.event_type EQ "event" OR qryEvent.event_type EQ "eb" OR qryEvent.event_type EQ "din" OR qryEvent.event_type EQ "bu_pr" >   
	<cfquery datasource="#gpp#" name="hotel" >
		SELECT *  FROM CRM_Venues WHERE venueID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryEvent.hotel#">
	</cfquery>
</cfif>
<!--- get functions  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------>
<!---    <cfquery datasource="#dsnP21#" name="function">
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
    
      <cfquery datasource="#gpp#" name="function">
        SELECT 
        		* 
        FROM 
        	CRM_functions 
        WHERE 
        	eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.webid#">
        ORDER 
        	BY functiondate , functionTime
    </cfquery>


<!---#emailrecipient# bcc="jerome@glopac-partners.com"#emailrecipient#--->
<cfmail from="web@petro21.com" to="#emailrecipient#" subject="Your Welcome Pack for #qryEvent.event_name#" type="html"><!---#emailrecipient#--->
<!---<cfdump var="#EventWeekID#"> //
<cfdump var="#EventWeekName#"> //
<cfdump var="#get#">--->

<div style="font-family:Arial, Helvetica, sans-serif; font-size:12px">Dear <strong>#order.name# #order.surname#</strong><br />
  <br />
  Please find your confirmation for :<br />
  <br />
  <table cellpadding="6" cellspacing="1" border="0" style="font-size:12px;">
    <tr bgcolor="##F2F2F2">
      <td><strong>Item</strong></td>
      <td><strong>Date</strong></td>
      <td><strong>Location</strong></td>
    </tr>
 <cfscript>
 edf = createObject("component", "_handlers.EventDateFormat");
 qry_eventDateFormatWeek = edf.eventDate(qryEvent.eventId);
</cfscript>

    <!--- Clean the file name ---->
    <cfset cleanFileName = replace(get.event_name,' ','_','All')>
    <cfset cleanFileName = replace(cleanFileName,'"','-','All')>
    <!--- SELECT WHICh PDF TEMPLATE TO INCLUDE 
	-------------------------------------------------------------------------------------------------------------------->
    
	<cfif order.chkDelegate eq 1 OR  order.chkGuest eq 1 OR order.chkPress eq 1>
      <cfinclude template="../registration/Wlcome_letter/WL_Guest_Del_Template.cfm">
    </cfif>
    
	
	<cfif order.chkSpeaker eq 1 OR order.chkModerator eq 1 >
      <cfinclude template="../registration/Wlcome_letter/WL_Speaker_Template.cfm">
    </cfif>
    
	
	<cfif order.chkExhibitor eq 1 >
      <cfinclude template="../registration/Wlcome_letter/WL_Exhibitor_Template.cfm">
    </cfif>
    
	
	<cfif order.chkSponsor eq 1 >
    </cfif>
<!---    <cfdump var="#get#">--->
    <!--- attache pdf --->
    <tr>
      <td>#qryEvent.event_name#</td>
      <td>#qry_eventDateFormatWeek#</td>
      <td>#qryEvent.city#, #qryEvent.country#</td>
    </tr>
  
  </table>
  <!---  CONTENT TEXT OF EMAIL START HERE 
  ------------------------------------------------------------------------------------------------------------------------------->
  <cfif order.chkSpeaker eq 1 >
  </cfif>
<!---  <cfif listlen(WEB_Conf_id, ",") GT 0 >
    <br />
    <cfif HotelForm NEQ "">
      together with a hotel booking form.
    </cfif>
    An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.<br />
    <br />
    <cfif get.event_type EQ "event" OR get.event_type EQ "din" OR get.event_type EQ "eb" OR get.event_type EQ "week">
      Visa regulations are frequently revised, and we therefore suggest you visit the following website for Visa requirements; <a href="http://www.ukvisas.gov.uk">www.ukvisas.gov.uk</a> <br />
      Should you require a Visa Letter of Invitation please contact
      <cf_staff_Email contactTypeID="9" eventID="#EventWeekID#">
      For any visa enquiries please visit <a href="http://www.visahq.com/visas.php">here </a><br />
      <br />
    </cfif>
    We look forward to seeing you there,<br />
    <br />
    <cfelse>--->
    <cfif order.chkDelegate eq 1 >
    <br />
    An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.<br />
    <br />
    </cfif>
    <cfif get.event_type EQ "event" OR get.event_type EQ "din" OR get.event_type EQ "eb">
      <cfif get.country EQ "UK">
        Visa regulations are frequently revised, and we therefore suggest you visit the following website for Visa requirements; <a href="http://www.ukvisas.gov.uk">www.ukvisas.gov.uk</a> <br />
        Should you require a Visa Letter of Invitation please contact
        <cf_staff_Email contactTypeID="9" eventID="#EventWeekID#">
      </cfif>
      For any visa enquiries please visit <a href="http://www.visahq.com/visas.php">here </a><br />
      <br />
    </cfif>
    We look forward to seeing you there,<br />
    <br />
<!---  </cfif>--->
  <cfinclude template="../../petro21/htdocs/Components/signaturehtml.cfm">
</div>
<cfmailparam file="G:\websites\my-office\registration\Wlcome_letter\#cleanFileName#-#get.event_year#.pdf">
<!---<cfif HotelForm NEQ "">
  <cfmailparam  file="G:\websites\petro21\htdocs\docs\#HotelForm#">
</cfif>--->

<cfif qry_files.recordCount GT 0>
	<cfloop query="qry_files">
    	<cfmailparam  file="G:\websites\petro21\htdocs\_files\conference\#qry_files.fileName#">
     </cfloop>
</cfif>



</cfmail>

<cfscript>
          thread = CreateObject("java", "java.lang.Thread");
          thread.sleep(500);
</cfscript>
<cfif testing NEQ 1> 
<!-------- SEND NOTICE TO GPP
------------------------------------------------------------------------------------------------------------------------------>
            <CFmail from="#contactFrom#"
                to="#contactRego#"
                subject="Welcome Pack sent for #get.event_name#...." type="html">
                        Welcome pack sent for #order.name# #order.surname# to following email:<br />
                        <br />
                        <cfloop list="#emailrecipient#" delimiters=";" index="i">#i#<br ></cfloop>
            </CFmail>
            <!---  MARK As WELCOLETTER SENT  
            --------------------------------------------------------------------------------------------------------------------------->
            <cfquery datasource="#gpp#" >
                UPDATE tblConference_Registration
                SET welcomeSent = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                WHERE IngClient_Conf_ID IN (#rec_id#)
            </cfquery>
            
            <!--- TO SEE IF THE ACCOUNTANTS NEED TO BE CONTACTED FROR THIS REGISTRATION 
            -------------------------------------------------------------------------------------------------------------------------------------->
            <cfif order.chkDelegate eq 1 OR order.chkExhibitor eq 1 OR order.chkSponsor eq 1 >
              <cfquery datasource="#gpp#" name="contactAcc" >
                        SELECT *
                        FROM CRM_email_accountants_registration
                        WHERE id = #form.rec_id#
                    </cfquery>
              <cfif contactAcc.recordcount eq 1 AND contactAcc.chkCompGuest NEQ 1 >
             <!---  bcc="jerome@glopac-partners.com"--->
                <cfmail to="#contactAccountants#; jerome@glopac.com"
                                from="web@petro21.com"
                                subject="New Invoice request"
                                type="html"> <strong>New Registration for</strong> #contactAcc.userTitle# #contactAcc.username# #contactAcc.usersurname#<br />
                                    <strong>Company</strong>:#contactAcc.company# <br />
                                    <strong>Label</strong>: #contactAcc.companyName# <br />
                                    <strong>Event</strong>: #contactAcc.event# <br />
                                    <strong>Bank</strong>: #contactAcc.InvPDBank#<br />
                                    <strong>Invoice Paid</strong>: #contactAcc.InvoicePaid#<br />
                                    <strong>Bank reference Number </strong>: #contactAcc.InvPDBankNumber#<br />
                                    <strong>Get Discount</strong>:
                    <cfif contactAcc.chkDiscount EQ 1>
                      yes
                      <cfelse>
                      no
                    </cfif><br />
                    
                <strong>3rd Party Guest</strong>:
                <cfif contactAcc.chkCompGuest EQ 1>
                  yes
                  <cfelse>
                  no
                </cfif><br />
                <strong>Invoice Comment</strong>: #contactAcc.INVComments #
                <!---contactAccountants--->
                </cfmail>
              </cfif>
            </cfif>

</cfif>


<!---<cfcatch type="any">
	<cfmail to="jerome@glopac.com" from="web@petro21.com" subject="error on #cgi.SCRIPT_NAME#" type="html"><cfdump var="#cfcatch#"></cfmail>
    <cfabort>
</cfcatch>
</cftry>--->