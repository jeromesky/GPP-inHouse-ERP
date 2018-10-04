<cfinclude template="../areas/qry_areas.cfm">
<cfset regionsColumns = 4>
<cfset regionsColumnsRow = 1>

<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr bgcolor="#e8f2f9">
  <td><a href="javascript:loadEmailList();" id="B_goBack">go back</a></td>
</tr>
</table>

<cfset emailid = #form.id#>
<cfif form.id EQ 0 OR form.id IS 0 OR form.id LT 1> 
	<cfquery datasource="#dsnP21#" name="getNew">
       INSERT INTO MailOut_configuration (displayDate)
       VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#DateAdd('d', 30, Now())#">)
       SELECT @@IDENTITY AS id
	</cfquery>
	<cfset emailid = #getNew.id#>
</cfif>

<cfquery datasource="#dsnP21#" name="getData">
    		SELECT 
            	[ID]
      ,[datesend]
      ,[name]
      ,[namefROM]
      ,[EmailFrom]
      ,[subject]
      ,[tracking]
      ,[calendar]
      ,[interRestRegion]
      ,[contraJob_id]
      ,[eventid]
      ,[createFile]
      ,[company_id]
      ,[dateToSend]
      ,[country]
      ,[chkWebIntWo]
      ,[chkWebIntAf]
      ,[chkWebIntNaf]
      ,[chkWebIntSAE]
      ,[chkWebIntMe]
      ,[chkWebIntAs]
      ,[chkWebIntNa]
      ,[chkWebIntLa]
      ,[chkWebIntEu]
      ,[chkWebIntGen]
      ,[chkWebIntAdvertising]
      ,[template]
      ,[exactSearch]
      ,[delegate]
      ,[speaker]
      ,[guest]
      ,[moderator]
      ,[exhibitor]
      ,[press]
      ,[research]
      ,[sponsor]
      ,[operatorAttType]
      ,[content]
      ,[test]
      ,[displayDate]
      ,[flashnews]
      ,[conferenceExclude]
      ,[eventExact]
      ,[textmailSpeakers]
      ,[textmailfocus]
      ,[templateSize]
      ,[col1color]
      ,[col2color]
      ,[col3color]
      ,[textmailTitle]
      ,[textmailpricing]
      ,[textmailcombine]
      ,[textmailOverview]
      ,[textmailLogos]
      ,[timeToSend]
      ,[updated]
      ,[OnlyRegistered]
      ,[signature]
      ,[chkWebIntEA]
      ,[chkWebIntWa]
      ,[mailSent]
      ,[textmailDetails]
      ,[selectAllEmails]
      ,[chkWebIntAus]
      ,[DomainName]
      ,[CompanySearch]
      ,[CompanySearchExact]
      ,[countryID]
      ,[areaID]
      ,[roleID] 
      FROM 
      	MailOut_configuration 
     WHERE  
        id = <cfqueryparam cfsqltype="cf_sql_integer" value="#emailid#">
    </cfquery>
    
    <cfquery name="getSignature" datasource="#gpp#">       
      SELECT 
              staffID, staffName
      FROM 
              staff
      Order 
              BY staffName
 	</cfquery>
    
    <cfquery name="domains" datasource="#gpp#">       
        SELECT  
                id, domain_name
        FROM 
                domain_names
        WHERE 
                id NOT IN (12,13)
        Order 
                BY domain_name
 	</cfquery>
<!---      <cfquery name="getFlash" datasource="#dsnP21#">
        	SELECT  
            		id, name, title
			FROM    
            		newsletter_FlashNews
        	WHERE 
            		content <> '' AND dueDate > #now()#
        </cfquery>--->
        
        <cfquery datasource="#dsnP21#" name="getsendList">
        	SELECT 
            		id, dateToSend, timeToSend 
            FROM 
            		MailOut_calendar 
            WHERE 
            		emailid = <cfqueryparam cfsqltype="cf_sql_integer" value="#emailid#" > 
            		AND  dateToSend >= #now()#
         </cfquery>

<!---
<cfquery datasource="#gpp#" name="getcountry">
SELECT
		CountryName AS country 
FROM 
		VIEWSearchCountries  
ORDER 
		BY country 
</cfquery>
<cfquery datasource="#gpp#" name="getevent">
SELECT 
		webid AS id, YEAR(event_expire) AS event_year, event_name 
FROM 
		CRM_events 
WHERE 
		( event_type = 'event' OR event_type = 'eb' OR event_type = 'din' OR event_type = 'Bu_Pr') AND event_expire > #dateAdd( "yyyy", -1,  now())#   
ORDER 
		BY event_expire DESC
</cfquery>

<cfquery datasource="#gpp#" name="getevent">
SELECT 
webID AS id,
YEAR(event_expire) AS event_year, 
event_name 
FROM 
		tblAnnual_Conf 
WHERE 
		(event_type = 'event' OR event_type = 'eb' OR event_type = 'din' OR event_type = 'Bu_Pr') AND YEAR(event_expire) > #(year(now()) - 1)#  
ORDER 
		BY event_expire DESC
</cfquery>
--->        
       <cfquery datasource="#dsnP21#" name="getcompany">
        	SELECT 
            		id, company, contactname 
            FROM 
            		logos 
            ORDER
            		BY company
       </cfquery>
    
      <cfquery datasource="#dsnP21#" name="getAttachment">
			SELECT 
            		id, filename, insertdate  
            FROM 
            		MailOut_attachment 
            WHERE 
            		emailid = #emailid# 
            ORDER 
            		BY insertdate
	</cfquery>
    
<!---    <cfquery datasource="#gpp#" name="CompanySearch">
			SELECT *  
            FROM 
            		CRM_Company_DISTINCT 
            ORDER 
            		BY companyName 
	</cfquery>--->
    
    <cfquery datasource="#dsnP21#" name="getTemplate">
			SELECT 
            		id, name  
            FROM 
            		MailOut_template 
            ORDER 
            		BY name 
	</cfquery>
    
<!--- Roles --->
<cfquery datasource="#gpp#" name="qryRole">
  SELECT 
      [roleID]
      ,[roleLabel]
      ,[roleName]
      ,[roleOrder]
  FROM [roles];
</cfquery>
<style type="text/css">   
   #tabs_mailer #column1, #tabs_mailer #column2{ float:left; display:block; width:520px;  margin-right:5px; }
   #tabs_mailer span {clear:both; display:block; float:left; width:130px; min-height:20px; margin:2px 2px 2px 0px; }
   #tabs_mailer I {display:block; float:left; min-height:20px; margin:2px 2px 2px 0px; }
   #tabs_mailer fieldset{ padding:10px;}
   #tabs_mailer #editEmail_fieldset_content {clear:both;}
   #tabs_mailer ul, #tabs_mailer li { list-style-type:none;list-style-image:none; padding:2px 0 2px 0;}
<!---   #areaEmail_opener,  #areaflash_opener, #areaMedia_opener { padding: 0 0 0 20px; background-image:url(../img/ln_arw2.gif); background-position:0px 3px; background-repeat:no-repeat; clear:both; }--->
   #areaMailContent Ul, #areaMailContent li { list-style-type:none; padding:0px; margin:0px}
</style>
<cfoutput>
<script type="text/javascript">
$(document).ready(function() { 
$('##B_newEmail').button({ text: true,});
	});
</script>
 <div id="column1">
        <fieldset>
            <legend>Edit email Header / <label><input type="checkbox" name="test" id="test" value="1" <cfif getData.test EQ true >checked</cfif>>send as test email</label></legend>
            		<b>Email reference</b><i class="NoFormat"><input type="text" name="name" style="width:330px" maxlength="35" value="#getData.name#"/></i>
            		<b>From name</b><i class="NoFormat"><input type="text" name="nameFROM" style="width:330px" maxlength="30" <cfif getData.namefROM NEQ ""> value="#getData.namefROM#" <cfelse>value="Global Pacific & Partners" </cfif>/></i>
       <b>Email domain</b>
       	<i class="NoFormat">
           <select name="DomainName" style="width:330px"><cfloop query="domains">
             <option value="#domains.id#" <cfif getData.DomainName EQ domains.id>selected</cfif>>#domains.domain_name#</option></cfloop>
           </select><input type="hidden" name="EmailFrom" value="#getData.EmailFrom#"/><input type="hidden" name="id" value="#emailid#" />
           </i>
       <b>Signature & Sender</b>
           <i class="NoFormat">
           <select name="signature" id="signature" style="width:330px"><cfloop query="getSignature">
           <option value="#getSignature.staffID#" <cfif getData.signature EQ getSignature.staffID>selected</cfif>>#getSignature.staffName#</option></cfloop>
           <option value="0" <cfif getData.signature EQ 0>selected</cfif>>Custom</option>
           </select></i>
       <b>Subject</b><i class="NoFormat"><input type="text" name="subject" style="width:330px" maxlength="200"  value="#getData.subject#"/></i>
       		</fieldset>
       <fieldset>
       	<legend>Event</legend>
    <!---  <select name="eventid" id="select">
      <option value="1" <cfif getData.eventid EQ 1 >selected</cfif>>not relation to event</option>
      <cfloop query="getevent"><option value="#getevent.id#" <cfif getData.eventid EQ getevent.id >selected</cfif>>#getevent.event_name#, #getevent.event_year#</option>
      </cfloop>
      </select>--->
      <cf_events_dropDown eventID="#getData.eventid#" fieldName="eventid" elapse="1" operator="IN"  eventType="din,event,Bu_pr,eb" multiple="0" >
    <!---  <cf_event_dropDown eventID="#getData.eventid#" fieldName="eventid" elapse="1" type="<>" >--->
      <ul>
      	<li><input type="checkbox" name="OnlyRegistered" id="OnlyRegistered" value="1" <cfif getData.test EQ 1 OR getData.conferenceExclude EQ 1 >disabled</cfif> <cfif getData.OnlyRegistered EQ 1 or getData.mailsent eq 1 OR getData.template EQ 26 >checked</cfif>   /> Email to Registered to Event</li>
      	<li><input type="checkbox" name="conferenceExclude" id="conferenceExclude" value="1" <cfif getData.conferenceExclude eq 1>checked</cfif> <cfif getData.test EQ 1 OR getData.OnlyRegistered EQ 1 >disabled</cfif>  / > Exclude  Registered  to this event</li>
      	<li><input type="checkbox" name="mailsent" id="mailsent" value="1" <cfif getData.mailsent eq 1 OR getData.template EQ 26>checked</cfif> /> responce form</li>
      	<li><input type="checkbox" name="eventExact" id="eventExact" <cfif getData.eventExact EQ 1>checked</cfif> /> mailout on exact selected event</li>
      </ul>
      	<div id="mustSelect" style="color:##CC3300"></div>
       </fieldset>
       <fieldset id="area_company" <cfif getData.test EQ true >style="background-color:##ffe5e5"</cfif>>
       		<legend>Test email to media contact</legend>
              <select name="company_id" id="select"  style="width:300px">
  <option value="0" <cfif getcompany.id EQ 0 >selected</cfif>>No test</option><cfloop query="getcompany">
  <option value="#getcompany.id#" <cfif getData.company_id EQ getcompany.id >selected</cfif>>#getcompany.company#, -- #getcompany.contactname#</option>
  </cfloop>
  </select> 
  <b>Keep on list until</b><i class="NoFormat"><input type="text" name="displayDate" id="displayDate" value="#DateFormat(getData.displayDate, "dd mmmm yyyy")#" style="width:150px" /></i>
       <i class="NoFormat"><label><input type="checkbox" name="templateSize" id="templateSize"  <cfif getData.templateSize EQ 1>checked</cfif>> Template width 600</label></i>
       <i class="NoFormat"><label><input type="checkbox" name="calendar" id="checkbox" <cfif getData.calendar EQ true >checked</cfif>> do not keep record</label></i>
       <i class="NoFormat"><label><input type="checkbox" name="selectAllEmails" <cfif getData.selectAllEmails EQ 1>checked</cfif> /> send to all registered emails</label></i>
       </fieldset>
 </div>
 <div id="column2">
<fieldset>
	<legend>Attachments</legend>
   <table border="0" cellspacing="0" cellpadding="4" style="color:##333333">
   <tr>
     <td>loaded date</td>
     <td>file</td>
     <td>delete</td>
   </tr>
   	<cfloop query="getAttachment">
      <tr id="attach#getAttachment.id#">
        <td>#dateformat(getAttachment.insertdate, "dd mm yyyy")#</td>
        <td>#getAttachment.filename#</td>
        <td width="20"><a href="javascript:deleteAttachment(#getAttachment.id#);"><img src="../img/newS_delete.gif" border="0" /></a></td>
      </tr>
     </cfloop>
      <tr>
        <td><div id="fileStatus"></div></td>
        <td colspan="2"><a href="" id="upload_button_">Upload file</a> </td> 
      </tr>
    </table>
</fieldset>
<fieldset>
	<legend>Send by company  <input type="checkbox" id="showCompanySearch" value="1" /></legend>
     		<div id="search_Company" class="tagbox"><input type="text" name="CompanySearch" id="CompanySearch" value="#getData.CompanySearch#" style="width:400px" /></div> 
			<input type="checkbox" id="CompanySearchExact" value="1" <cfif getData.CompanySearchExact EQ 1> checked="checked"</cfif> /> serch on exact name above
</fieldset>
<fieldset>
	<legend>Select </legend>
<!---<select name="country" id="country">
     		<cfloop query="getcountry">
     		<option value="#getcountry.country#" <cfif getData.country EQ getcountry.country >selected</cfif>>#getcountry.country#</option>
     		</cfloop>
     		</select>--->
           <cf_country_dropDown_multiple countryid="#getData.countryID#" fieldName="countryID">
</fieldset> 
<fieldset id="area_Attend_Type" <cfif getData.conferenceExclude EQ 1 OR getData.OnlyRegistered EQ 1>style="background-color:##ffe5e5"</cfif> >   
	<legend>Attendents Type</legend>
<table border="0" cellspacing="0" cellpadding="2">
<tr>
          <td><label><input type="checkbox" name="delegate" id="delegate" <cfif getData.delegate EQ 1>checked</cfif> /> Delegate</label></td>
              <td><label><input type="checkbox" name="speaker" id="speaker" <cfif getData.speaker EQ 1>checked</cfif> /> Speakers</label></td>
              <td><label><input type="checkbox" name="guest" id="guest" <cfif getData.guest EQ 1>checked</cfif> /> Guest</label></td>
              <td><label><input type="checkbox" name="moderator" id="moderator" <cfif getData.moderator EQ 1>checked</cfif> /> Moderator</label></td>
              <td><label><input type="checkbox" name="exhibitor" id="exhibitor" <cfif getData.exhibitor EQ 1>checked</cfif> /> Exhibitor</label></td>
</tr>
            <tr>
            	<td><label><input type="checkbox" name="press" id="press" <cfif getData.press EQ 1>checked</cfif> /> Press</label></td>
              <td><label><input type="checkbox" name="research" id="research" <cfif getData.research EQ 1>checked</cfif> /> Research</label></td>
              <td><label><input type="checkbox" name="sponsor" id="sponsor" <cfif getData.sponsor EQ 1>checked</cfif> /> Sponsor</label></td>
              <td colspan="2"><label><input type="checkbox" name="operatorAttType"  value="1" <cfif getData.operatorAttType eq 1>checked</cfif> / >
              exact&nbsp;search </label></td>
            </tr>
        </table>
</fieldset>
<fieldset id="area_region_Interest" <cfif getData.conferenceExclude EQ 1>style="background-color:##ffe5e5"</cfif>>
	<legend>Region of Interest</legend>
    <table border="0" cellspacing="0" cellpadding="4"><cfloop query="qry_areas">
        <cfif qry_areas.currentrow EQ  ((regionsColumnsRow * regionsColumns) - 3) ><tr>
        	</cfif><td><label><input type="checkbox" name="areaID" id="areaID" value="#qry_areas.areaID#" <cfif ListContains(getData.areaID, qry_areas.areaID ,",") NEQ 0>checked="checked"</cfif>  /> #qry_areas.areaName#</label></td>
       <cfif qry_areas.currentrow  EQ (regionsColumnsRow * regionsColumns) OR qry_areas.currentrow  EQ qry_areas.recordCount ></tr><cfset regionsColumnsRow = regionsColumnsRow + 1></cfif></cfloop>
       </table>
</fieldset>

 </div>
 <div class="clear"></div>
 <!--- <div id="areaEmail_opener">show email content</div>---> 
<fieldset class="Collapsible " >   
	<legend>Roles/BPA Designation</legend>
    	<cfloop query="qryRole">
        <label><input type="radio" name="Role" value="#roleID#" <cfif qryRole.roleID EQ getData.roleID>checked=checked</cfif> >#qryRole.roleLabel#</label>
        </cfloop>
</fieldset>
<!--- <div id="areaEmail_opener">show email content</div>---> 
<fieldset class="Collapsible " >   
	<legend id="areaEmail_opener">Show email content</legend>
 		<div id="areaMailContent" style="clear:both">
 				  <ul style="clear:both; display:block; float:left; width:180px;">
 				  Include the following:
<li><input type="checkbox" name="textmailDetails" id="textmailDetails" <cfif getData.textmailDetails EQ 1 >checked</cfif> />Main Details</li>
<li><input type="checkbox" name="textmailSpeakers" id="textmailSpeakers" <cfif getData.textmailSpeakers EQ 1 >checked</cfif> />Speakers</li>
<li><input type="checkbox" name="textmailfocus" id="textmailfocus" <cfif getData.textmailfocus EQ 1 >checked</cfif> />Focus</li>
<li><input type="checkbox" name="textmailTitle" id="textmailTitle" <cfif getData.textmailTitle EQ 1 >checked</cfif> />Event title</label></li>
<li><input type="checkbox" name="textmailpricing" id="textmailpricing" <cfif getData.textmailpricing EQ 1 >checked</cfif> />Events Pricing</li>
<li><input type="checkbox" name="textmailcombine" id="textmailcombine" <cfif getData.textmailcombine EQ 1 >checked</cfif> />Combine Price</li>
<li><input type="checkbox" name="textmailOverview" id="textmailOverview" <cfif getData.textmailOverview EQ 1 >checked</cfif> /> Overview</li>
<li><input type="checkbox" name="textmailLogos" id="textmailLogos" <cfif getData.textmailLogos EQ 1 >checked</cfif> /> Logos</li>
   </ul>
        <div style="width:650px; height:350px; float:left; display:block;">
 				<!---<textarea name="content" id="tinymc" style="width:650px; height:350px;">#getData.content#</textarea>--->
<cfscript>
	fckEditor = createObject("component", "/FCKeditor/fckeditor");
	fckEditor.instanceName="content";
	fckEditor.basePath="../FCKeditor/";
	fckEditor.value="#getData.content#";
	fckEditor.width="740";
	fckEditor.height="360";
	fckEditor.canUpload="true";
	fckEditor.checkBrowser="false";
	fckEditor.create(); // create instance now.
</cfscript>
 		</div>
	</div>
 </fieldset>
 
<fieldset class="Collapsible " >
 <legend>show flash news / templates</legend>
 		 <div id="column1">
<!---       <fieldset >
       <legend>Select Flash News</legend>
       <table  border="0" cellspacing="4" cellpadding="4" style="color:##333333">
       <tr>
       <td valign="top">
       <select name="flashnews" multiple="multiple" id="flashnews" style="width:350px; height:120px">
       <cfloop query="getFlash">
       <option value="#getFlash.id#" <cfif listcontains(getData.flashnews, getFlash.id, "," ) NEQ "0">selected</cfif>>#getFlash.name#, #getFlash.title#</option>
       </cfloop>
       </select>
       <br />
       To deselect Flash News hold CMD + click away from entry (MAC), PC not sure yet</td>
       </tr>
       </table>  
       </fieldset>--->
         </div>
          <div id="column2">
       <fieldset>
       <legend>Select Template</legend>
       <table border="0" cellspacing="0" cellpadding="4" style="color:##333333">
       <tr>
       <td width="180">Select Event</td>
       <td><select name="template" id="template">
       <option value="0" <cfif getData.template EQ 0 >selected</cfif>>Select this option for no template</option><cfloop query="getTemplate">
       <option value="#getTemplate.id#" <cfif getData.template EQ getTemplate.id>selected</cfif>>#getTemplate.name#</option></cfloop>
       </select></td>
       </tr>
       <tr>
       <td>Column 1 background color</td>
       <td><input type="text" name="col1color" id="col1color" size="8" value="#trim(getData.col1color)#" maxlength="6" /></td>
       </tr>
       <tr>
       <td>Column 2 background color</td>
       <td><input type="text" name="col2color" id="col2color" size="8" value="#trim(getData.col2color)#" maxlength="6" /></td>
       </tr>
       <tr>
       <td>Column 3 background color</td>
       <td><input type="text" name="col3color" id="col3color" size="8" value="#trim(getData.col3color)#" maxlength="6" /></td>
       </tr>
       </table> 
       </fieldset>
 			</div>
</fieldset>
  <fieldset  class="Collapsible " >
  <legend>show media recipients/ mailout planer</legend> 
 		 <div id="column1">
       <fieldset>
       <legend>show media recipients/ mailout planer..Select Media Recipient</legend>
       
       <table border="0" cellspacing="0" cellpadding="4" style="color:##333333">
       <tr>
       <td width="133">Create file for attachement</td>
       <td><input name="createFile" type="checkbox" value="1" <cfif getData.createFile EQ true >checked</cfif> /></td>
       </tr>
       <tr>
       <td>Contract ID</td>
       <td><input type="text" name="contraJob_id" value="<cfif getData.contraJob_id NEQ "">#trim(getData.contraJob_id)#<cfelse>0</cfif>" /></td>
       </tr>
       </table>
       </fieldset></div>
         <div id="column2"><fieldset>
       <legend>Configure date to send out email</legend>
       <table border="0" cellspacing="0" cellpadding="4" style="color:##333333">
       <tr>
       <td width="133">Send out date</td>
       <td width="410"><input type="text" name="dateToSend" id="senddate" /><img src="../img/calendar_24.gif" border="0" onClick="scwShow(scwID('senddate'),event,3);" /></td>
       <td rowspan="3" valign="top">
      <table border="0" width="100%" >
      <tr>
      <td>sending on</td>
      <td>at</td>
      <td width="20">delete</td>
      </tr>
      <cfloop query="getsendList"><tr id="date#getsendList.id#">
      <td>#dateformat(getsendList.dateToSend, "ddd, dd mmm yy")#</td>
      <td>#getsendList.timeToSend#</td>
      <td width="20"><a href="javascript:deleteSchedule(#getsendList.id#);"><img src="../img/newS_delete.gif" border="0" /></a></td>
      </tr></cfloop>
      </table>
       </td>
       </tr>
       <tr>
       <td>Send out time</td>
       <td><input type="text" name="timeToSend" id="timeToSend" maxlength="2" /><br /> <i class="NoFormat">time must be in 24 hour format, will only send from 4am to 22 pm</i></td>
       </tr>
       <tr>
       <td></td>
       <td><input type="submit" name="Submit" value="Save" /></td>
       </tr>
       </table>
       </fieldset>
</fieldset>
<fieldset style="clear:both">
	<legend>Save</legend>
	<input type="submit" name="Submit" value="Save" />
</fieldset></cfoutput>

<script type="text/javascript" >
$(function() {
		$("#displayDate").datepicker( {dateFormat: 'd M, y' });
		$('#upload_button_').button({ text: true,		});
		$('#B_goBack').button({ text: true,		});
		$('#search_Company').css( {"display" : "none"} );
    $('#OnlyRegistered').change(function(){

	var get_Black_Listed = $(this).attr("checked") ? $(this).val() : 0
			if(get_Black_Listed == 1 ){
				$('#area_Attend_Type').css( 'backgroundColor' , '#ffe5e5' );
				$('#mustSelect').html('You must select at least one attendent type');
				$('#conferenceExclude, #test, #Region_Interest').attr('disabled', true).attr('checked', false);
			}else{
				$('#area_Attend_Type').css( 'backgroundColor' , '#ffffff' );
				$('#mustSelect').html('');
				$('#conferenceExclude, #test, #Region_Interest').attr('disabled', false);
			}
});

///////THIS IS FOR RESPONCE FORM MARK OTHER TICKBOXES 
$('#mailsent').change(function(){

	var get_responceForm		= $(this).attr("checked") ? $(this).val() : 0
			if(get_responceForm == 1 ){
				$('#OnlyRegistered').attr('checked', true);
			}else{
				$('#OnlyRegistered').attr('checked', false);
			}
});

////////////if company is selected nothing else can be
$('#showCompanySearch').change(function(){

	var get_Company	= $(this).attr("checked") ? $(this).val() : 0
			if(get_Company == 1 ){
				$('#area_Attend_Type, #area_region_Interest').css( 'backgroundColor' , '#fff' );
				$('#mustSelect').html('Only company can be selected on this option');
				$('#OnlyRegistered, #conferenceExclude, #OnlyRegistered, #mailsent, #eventExact, #test').attr('disabled', true).attr('checked', false);	
				$('#search_Company').css( {"display" : "inline"} );  		
			}else{
				$('#mustSelect').html('');
				$('#OnlyRegistered, #conferenceExclude, #OnlyRegistered, #mailsent, #eventExact, #test').attr('disabled', false);
				$('#search_Company').css( {"display" : "none"} ); 
				$('#CompanySearch').val("");  
			}
});

$('#conferenceExclude').change(function(){

	var get_Exlude		= $(this).attr("checked") ? $(this).val() : 0
			if(get_Exlude == 1 ){
				$('#area_Attend_Type, #area_region_Interest').css( 'backgroundColor' , '#ffe5e5' );
				$('#mustSelect').html('You must select at least one attendent type and region of interest');
				$('#OnlyRegistered').attr('disabled', true);
				$('#OnlyRegistered').attr('checked', false);
				
			}else{
				$('#area_Attend_Type, #area_region_Interest').css( 'backgroundColor' , '#ffffff' );
				$('#mustSelect').html('');
				$('#OnlyRegistered').attr('disabled', false);
			}
});

///////////Highlight company box 
//$('#test').change(function(){
//	var get_test		= $(this).attr("checked") ? $(this).val() : 0
//			if(get_test == 1 ){
//				$('#area_company').attr('checked', true);
//			}else{
//				$('#area_company').attr('checked', false);
//			}
//});

$('#test').change(function(){
	
	var get_test		= $(this).attr("checked") ? $(this).val() : 0
			if(get_test == 1 ){
				$("#area_company").css('backgroundColor' , '#ffe5e5' );
				$('#conferenceExclude, #OnlyRegistered').attr('disabled', true).attr('checked', false);
			}else{
				$("#area_company").css('backgroundColor' , '#ffffff' );
				$('#conferenceExclude, #OnlyRegistered').attr('disabled', false);
			}
});
	});
	
 $(document).ready(function() {
 		$('#search_Company').tagdragon({ 
 						'field':'CompanySearch',
						'url':'../components/JSON_Company.cfm',
						'charMin' : 3, 
						'cache' : true,
						'max' : 100
						//onSelectItem: function(val) { 
								//$('#lngCompany_ID').val(val.id);  
								//$('#button_get_Address').css( { 'visibility' : 'visible' } );
								//LoadForm(val.id);
								//}
						});
 
 $("fieldset.Collapsible").collapse( { closed: true });	
 
	<!---	$('#saveEmail').submit(function() { 
				$('form').bind('form-pre-serialize', function(e) {
					tinyMCE.triggerSave();
					});
				$(this).ajaxSubmit({ clearForm: true, success: loadEmailList});
				tinyMCE.execCommand('mceRemoveControl',false,'content');
				return false; 
		});--->
});
function unloadPage(){ 
	loadEmailList
	//$("#modalEditEmail").dialog('close');
}
</script>
<script type="text/javascript">
 $(document).ready(function() {
 
<!---$('#areaMedia_opener').click(function(){
		$('#areaMedia').toggle("fast");
    	return false;
});
 
$('#areaflash_opener').click(function(){
		$('#areaflashnews').toggle("fast");
    	return false;
});

$('#areaEmail_opener').click(function(){
		$('#areaMailContent').toggle("fast");
    	return false;
});--->
 
 $('#areaMedia, #areaflashnews, #areaMailContent').hide();
		new AjaxUpload('#upload_button_', {
			action: 'UploadAttachement.cfm',
			name: 'Upload',
			data: {     id : '<cfoutput>#emailid#</cfoutput>', 	field : 'Upload' },
			autoSubmit: true,
			responseType: false,
			onSubmit: function(file, extension) {$('#upload_button').html("<img src=../img/ProgressBar_transparent.gif width=70 >");},
			onComplete: function(file, response) {$('#upload_button').html("Loading Completed..."); $('#fileStatus').append(response);}
		});
});

function Checkattendence() {
    if ($('#OnlyRegistered').is(':checked') || $('#conferenceExclude').is(':checked'))   {
		$('#mustSelect').html('You must select at least one attendent type');
        
    } else {
		$('#mustSelect').html('');
	}
} 
</script>
  <!---<table border="0" cellspacing="0" cellpadding="4">
    <tr><td colspan="4">Regions of Interest(Use this one untill its gone)</td>></tr
    ><tr>
      <td width="130"><label><input id="Region_Interest" type="checkbox" name="chkWebIntGen" value="chkWebIntGen" <cfif getData.chkWebIntGen eq 1>checked</cfif>>
      General
      </label></td>
<td width="98"><label><input id="Region_Interest" type="checkbox" name="chkWebIntAf" value="chkWebIntAf" <cfif getData.chkWebIntAf eq 1>checked </cfif> > 
Africa</label></td>
<td width="108"> <label ><input id="Region_Interest" type="checkbox" name="chkWebIntMe" value="chkWebIntMe" <cfif getData.chkWebIntMe eq 1>checked </cfif>> 
MidEast</label></td>
<td width="141"><label><input id="Region_Interest" type="checkbox" name="chkWebIntAs" value="chkWebIntAs" <cfif getData.chkWebIntAs eq 1>checked </cfif>>
Asia</label></td>
    </tr>
    <tr>
      <td><input id="Region_Interest" type="checkbox" name="chkWebIntNa" value="chkWebIntNa" <cfif getData.chkWebIntNa eq 1>checked </cfif> />
        North America</td>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntAdvertising" value="chkWebIntAdvertising" <cfif getData.chkWebIntAdvertising eq 1>checked</cfif> / ><!--- --->
Advertising</label></td>
      <td></td>
      <td><input id="Region_Interest" type="checkbox" name="chkWebIntAus" value="chkWebIntAus" <cfif getData.chkWebIntAus eq 1>checked</cfif>  />
        Australia</td>
    </tr>
    <tr>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntLa" value="chkWebIntLa" <cfif getData.chkWebIntLa eq 1>checked</cfif>  /> 
Latin</label></td>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntEu" value="chkWebIntEu" <cfif getData.chkWebIntEu eq 1>checked</cfif> /> 
Europe</label></td>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntWo" value="chkWebIntWo" <cfif getData.chkWebIntWo eq 1>checked</cfif>  /> 
World </label></td>
      <td><label><input id="Region_Interest" type="checkbox" name="exactSearch" value="1" <cfif getData.exactSearch eq 1>checked </cfif> / >Make search exact</label></td>
    </tr>
        <tr>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntSAE" value="chkWebIntSAE" <cfif getData.chkWebIntSAE eq 1>checked</cfif>  />
      Southern Africa</label></td>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntEA" value="chkWebIntEA" <cfif getData.chkWebIntEA eq 1>checked</cfif> /> 
East Africa</label></td>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntWa" value="chkWebIntWa" <cfif getData.chkWebIntWa eq 1>checked</cfif>  /> 
West Africa</label></td>
      <td><label><input id="Region_Interest" type="checkbox" name="chkWebIntNaf" value="chkWebIntNaf" <cfif getData.chkWebIntNaf eq 1>checked</cfif>  /> 
        North Africa</label></td>
    </tr>
          </table>--->