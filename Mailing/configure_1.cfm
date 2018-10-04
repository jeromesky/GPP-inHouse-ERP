<cfinclude template="../Application.cfm">
<cfif form.id EQ 0 OR form.id IS 0 OR form.id LT 1 >
 <cfquery datasource="#dsnP21#" name="getNew">
INSERT INTO MailOut_configuration (displayDate)
VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#DateAdd('d', 30, Now())#">)
SELECT @@IDENTITY AS id
 </cfquery>
 <cfparam name="form.id" default="#getNew.id#" >
 <cfscript>
  alert = 'hello there!';
 </cfscript>
</cfif>
<cfset emailid = #form.id# >
<cfquery datasource="#dsnP21#" name="getData">
   SELECT * 
 FROM 
  MailOut_configuration 
 WHERE 
  id = <cfqueryparam cfsqltype="cf_sql_integer" value="#emailid#">
  </cfquery>
<cfquery name="getSignature" datasource="#dsnP21#">    
     SELECT 
      id, name
  FROM 
  GPPusers
     Order 
  BY name
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
<cfquery name="getFlash" datasource="#dsnP21#">
     SELECT 
  id, name, title
  FROM  
  newsletter_FlashNews
     WHERE 
  content <> '' AND dueDate > #now()#
    </cfquery>
<cfquery datasource="#dsnP21#" name="getsendList">
     SELECT 
  id, dateToSend, timeToSend 
 FROM 
  MailOut_calendar 
 WHERE 
  emailid = <cfqueryparam cfsqltype="cf_sql_integer" value="#emailid#" > AND dateToSend >= #now()#
     </cfquery>
<cfquery datasource="#gpp#" name="getcountry">
     SELECT
  CountryName AS country 
 FROM 
  VIEWSearchCountries 
 ORDER 
  BY country 
    </cfquery>
<cfquery datasource="#dsnP21#" name="getevent">
  SELECT 
  id, event_year, event_name 
 FROM 
  events 
 WHERE 
  ( event_type = 'event' OR event_type = 'eb' OR event_type = 'din' OR event_type = 'Bu_Pr') AND event_year > #(year(now()) - 1)# 
 ORDER 
  BY event_expire DESC
 </cfquery>
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
<cfquery datasource="#dsnP21#" name="getTemplate">
  SELECT 
  id, name 
 FROM 
  MailOut_template 
 ORDER 
  BY name 
 </cfquery>
<style type="text/css">
#tabs_mailer #column1, #tabs_mailer #column2 {
 float:left;
 display:block;
 width:420px;
 margin-right:5px;
}
#tabs_mailer span {
 clear:both;
 display:block;
 float:left;
 width:130px;
 min-height:20px;
 margin:2px 2px 2px 0px;
}
#tabs_mailer I {
 display:block;
 float:left;
 min-height:20px;
 margin:2px 2px 2px 0px;
}
#tabs_mailer fieldset {
 padding:10px;
}
#tabs_mailer ul, #tabs_mailer li {
 list-style-image:none;
 padding:2px 0 2px 0;
}
</style>
<cfoutput>
<div id="column1">
 <fieldset>
  <legend>Edit email Header /
  <label>
   <input type="checkbox" name="test" id="test" value="1" <cfif getData.test EQ true >checked</cfif>>
   send as test email</label>
  </legend>
  <span>Email reference</span><i>
  <input type="text" name="name" style="width:330px" maxlength="35" value="#getData.name#"/>
  </i> <span>From name</span><i>
  <input type="text" name="namefROM" style="width:330px" maxlength="30" <cfif getData.namefROM NEQ ""> value="#getData.namefROM#" <cfelse>value="Global Pacific & Partners" </cfif>/>
  </i> <span>Email domain</span> <i>
  <select name="DomainName" style="width:330px">
   <cfloop query="domains">
   <option value="#domains.id#" <cfif getData.DomainName EQ domains.id >selected</cfif> >#domains.domain_name#</option></cfloop>
  </select>
  <input type="hidden" name="EmailFrom" value="#getData.EmailFrom#"/>
  <input type="hidden" name="id" value="#emailid#" />
  </i> <span>Signature & Sender</span> <i>
  <select name="signature" id="signature" style="width:330px">
   <cfloop query="getSignature">
   <option value="#getSignature.id#" <cfif getData.signature EQ getSignature.id >selected</cfif>>#getSignature.name#</option></cfloop>
  </select>
  </i><span>subject</span><i>
  <input type="text" name="subject" style="width:330px" maxlength="200" value="#getData.subject#"/>
  </i>
  <fieldset>
   <legend>event</legend>
   <select name="eventid" id="select"><cfloop query="getevent">
    <option value="#getevent.id#" <cfif getData.eventid EQ getevent.id >selected</cfif>>#getevent.event_name#, #getevent.event_year#</option></cfloop>
   </select>
   <ul>
   <li>
    <input type="checkbox" name="OnlyRegistered" id="OnlyRegistered" value="1" <cfif getData.test EQ 1 OR getData.conferenceExclude EQ 1 >disabled</cfif> <cfif getData.OnlyRegistered EQ 1 or getData.mailsent eq 1 OR getData.template EQ 26 >checked</cfif>  />
    Email to Registered to Event</li>
   <li>
    <input type="checkbox" name="conferenceExclude" id="conferenceExclude" value="1"  <cfif getData.conferenceExclude eq 1> checked </cfif> <cfif getData.test EQ 1 OR getData.OnlyRegistered EQ 1 >disabled</cfif> / >
    Exclude Registered to this event</li>
   <li>
    <input type="checkbox" name="mailsent" id="mailsent" value="1" <cfif getData.mailsent eq 1 OR getData.template EQ 26> checked </cfif> />
    responce form</li>
   <li>
    <input type="checkbox" name="eventExact" id="eventExact" <cfif getData.eventExact EQ 1>checked</cfif> />
    mailout on exact selected event</li>
   <div id="mustSelect" style="color:##CC3300"></div>
  </fieldset>
  <fieldset id="area_company" <cfif getData.test EQ true >style="background-color:##ffe5e5"</cfif>>
   <legend>test email to company</legend>
   <select name="company_id" id="select" style="width:300px">
    <option value="0" <cfif getcompany.id EQ 0 >selected</cfif>>No test</option>
    <cfloop query="getcompany">
    <option value="#getcompany.id#" <cfif getData.company_id EQ getcompany.id >selected</cfif>>#getcompany.company#, -- #getcompany.contactname#</option></cfloop>
   </select>
  </fieldset>
  <span>Keep on list until</span><i>
  <input type="text" name="displayDate" id="displayDate" value="#DateFormat(getData.displayDate, "dd mmmm yyyy")#" style="width:150px" />
  </i> <i>
  <label>
   <input type="checkbox" name="templateSize" id="templateSize" <cfif getData.templateSize EQ 1> checked </cfif>>
   Template width 600</label>
  </i> <i>
  <label>
   <input type="checkbox" name="calendar" id="checkbox" <cfif getData.calendar EQ true>checked</cfif>>
   do not keep record</label>
  </i> <i>
  <label>
   <input type="checkbox" name="selectAllEmails" <cfif getData.selectAllEmails EQ 1>checked </cfif> />
   send to all registered emails</label>
  </i>
 </fieldset>
 </fieldset>
</div>
<div id="column2">
 <fieldset>
  <legend>Attachments</legend>
  <table border="0" cellspacing="0" cellpadding="4" style="color:##333333">
   <tr>
    <td>Loaded Date</td>
    <td>File </td>
    <td>Delete </td>
   </tr><cfloop query="getAttachment">
   <tr id="attach#getAttachment.id#">
    <td>#dateformat(getAttachment.insertdate, "dd mm yyyy")#</td>
    <td>#getAttachment.filename#</td>
    <td width="20"><a href="javascript:deleteAttachment(#getAttachment.id#);"><img src="../img/newS_delete.gif" border="0" /></a></td>
   </tr></cfloop>
   <tr>
    <td><div id="fileStatus"></div></td>
    <td colspan="2"><a href="" id="upload_button_">Upload file</a></td>
   </tr>
  </table>
 </fieldset>
 <fieldset>
  <legend>Select country</legend>
  <select name="country" id="select"><cfloop query="getcountry">
   <option value="#getcountry.country#" <cfif getData.country EQ getcountry.country >selected</cfif>>#getcountry.country#</option></cfloop>
  </select>
 </fieldset>
 <fieldset id="area_Attend_Type" >
  <legend> Attendents Type</legend>
  <table border="0" cellspacing="0" cellpadding="2">
   <tr>
    <td><label>
 <input type="checkbox" name="delegate" id="delegate" <cfif getData.delegate EQ 1>checked</cfif> />Delegate</label></td>
    <td><label>
 <input type="checkbox" name="speaker" id="speaker" <cfif getData.speaker EQ 1>checked</cfif> />Speakers</label></td>
    <td><label>
 <input type="checkbox" name="guest" id="guest" <cfif getData.guest EQ 1>checked</cfif> />Guest</label></td>
    <td><label>
 <input type="checkbox" name="moderator" id="moderator" <cfif getData.moderator EQ 1>checked</cfif> />Moderator</label></td>
    <td><label>
 <input type="checkbox" name="exhibitor" id="exhibitor" <cfif getData.exhibitor EQ 1>checked</cfif> />Exhibitor</label></td>
   </tr>
   <tr>
    <td><label><input type="checkbox" name="press" id="press" <cfif getData.press EQ 1>checked</cfif> />Press</label></td>
    <td><label><input type="checkbox" name="research" id="research" <cfif getData.research EQ 1>checked</cfif> />Research</label></td>
    <td><label><input type="checkbox" name="sponsor" id="sponsor" <cfif getData.sponsor EQ 1>checked</cfif> />Sponsor</label></td>
    <td colspan="2"><label>
 <input type="checkbox" name="operatorAttType" value="1" <cfif getData.operatorAttType eq 1> checked </cfif> / >
 exact&nbsp;search </label></td>
   </tr>
  </table>
 </fieldset>
 <fieldset id="area_region_Interest">
  <legend>Region of Interest</legend>
  <table border="0" cellspacing="0" cellpadding="4">
   <tr>
    <td><label><input type="checkbox" name="chkWebIntGen" value="chkWebIntGen" <cfif getData.chkWebIntGen eq 1> checked </cfif>> General </label></td>
    <td><label><input type="checkbox" name="chkWebIntAf" value="chkWebIntAf" <cfif getData.chkWebIntAf eq 1> checked </cfif> > Africa</label></td>
    <td><label><input type="checkbox" name="chkWebIntMe" value="chkWebIntMe" <cfif getData.chkWebIntMe eq 1> checked </cfif>> MidEast</label></td>
    <td><label><input type="checkbox" name="chkWebIntAs" value="chkWebIntAs" <cfif getData.chkWebIntAs eq 1> checked </cfif>> Asia</label></td>
   </tr>
   <tr>
    <td><input type="checkbox" name="chkWebIntNa" value="chkWebIntNa" <cfif getData.chkWebIntNa eq 1> checked </cfif> />
     North America</td>
    <td><label><input type="checkbox" name="chkWebIntAdvertising" value="chkWebIntAdvertising" <cfif getData.chkWebIntAdvertising eq 1> checked </cfif> / >
 Advertising</label></td>
    <td></td>
    <td><input type="checkbox" name="chkWebIntAus" value="chkWebIntAus" <cfif getData.chkWebIntAus eq 1> checked </cfif> />Australia</td>
   </tr>
   <tr>
    <td><label><input type="checkbox" name="chkWebIntLa" value="chkWebIntLa" <cfif getData.chkWebIntLa eq 1> checked </cfif> />Latin</label></td>
    <td><label><input type="checkbox" name="chkWebIntEu" value="chkWebIntEu" <cfif getData.chkWebIntEu eq 1> checked </cfif> />Europe</label></td>
    <td><label><input type="checkbox" name="chkWebIntWo" value="chkWebIntWo" <cfif getData.chkWebIntWo eq 1> checked </cfif> />World </label></td>
    <td><label><input type="checkbox" name="exactSearch" value="1" <cfif getData.exactSearch eq 1> checked </cfif> / >
 Make search exact</label></td>
   </tr>
   <tr>
    <td><label><input type="checkbox" name="chkWebIntSAE" value="chkWebIntSAE" <cfif getData.chkWebIntSAE eq 1> checked </cfif> />Southern Africa</label></td>
    <td><label><input type="checkbox" name="chkWebIntEA" value="chkWebIntEA" <cfif getData.chkWebIntEA eq 1> checked </cfif> />East Africa</label></td>
    <td><label><input type="checkbox" name="chkWebIntWa" value="chkWebIntWa" <cfif getData.chkWebIntWa eq 1> checked </cfif> />West Africa </label></td>
    <td><label><input type="checkbox" name="chkWebIntNaf" value="chkWebIntNaf" <cfif getData.chkWebIntNaf eq 1> checked </cfif> />North Africa</label></td>
   </tr>
  </table>
 </fieldset>
</div>
<a href="" id="areaEmail_opener" style="clear:both">show email content</a>
<div id="areaMailContent" style="clear:both">
 <textarea name="content" id="content" style="width:650px; height:350px; display:block; float:left">#getData.content#</textarea>
 <ul>
  <li><input type="checkbox" name="textmailDetails" id="textmailDetails" <cfif getData.textmailDetails EQ 1 > checked</cfif> />
   Include Main Details</li>
  <li><input type="checkbox" name="textmailSpeakers" id="textmailSpeakers" <cfif getData.textmailSpeakers EQ 1 > checked</cfif> />
   Include Speakers</li>
  <li><input type="checkbox" name="textmailfocus" id="textmailfocus" <cfif getData.textmailfocus EQ 1 > checked</cfif> />
   Include Focus</li>
  <li><input type="checkbox" name="textmailTitle" id="textmailTitle" <cfif getData.textmailTitle EQ 1 > checked</cfif> />
   Include Event title</label></li>
  <li><input type="checkbox" name="textmailpricing" id="textmailpricing" <cfif getData.textmailpricing EQ 1 > checked</cfif> />
   Include Events Pricing</li>
  <li><input type="checkbox" name="textmailcombine" id="textmailcombine" <cfif getData.textmailcombine EQ 1 > checked</cfif> />
   Include Combine price</li>
  <li><input type="checkbox" name="textmailOverview" id="textmailOverview" <cfif getData.textmailOverview EQ 1 > checked</cfif> />
   Include Overview</li>
  <li><input type="checkbox" name="textmailOverview" id="textmailOverview" <cfif getData.textmailOverview EQ 1 > checked</cfif> />
   Include Overview</li>
  <li><input type="checkbox" name="textmailLogos" id="textmailLogos" <cfif getData.textmailLogos EQ 1 > checked</cfif> />
   Include Logos</li>
 </ul>
</div>
<a href="" id="areaflash_opener" style="clear:both">show flash news / templates</a>
<div id="areaflashnews" style="clear:both" >
 <div id="column1">
  <fieldset>
   <legend>Select Flash News</legend>
   <table border="0" cellspacing="4" cellpadding="4" style="color:##333333">
    <tr>
     <td valign="top"><select name="flashnews" multiple="multiple" id="flashnews" style="width:350px; height:120px">
  <cfloop query="getFlash"><option value="#getFlash.id#" <cfif listcontains(getData.flashnews, getFlash.id, "," ) NEQ "0">selected</cfif>>#getFlash.name#, #getFlash.title#</option>
  </cfloop>
 </select>
 <br />
 to diselect Flash News hold CMD + click away from entry (MAC), PC use Ctrl and click</td>
    </tr>
   </table>
  </fieldset>
 </div>
 <div id="column2">
  <fieldset>
   <legend>Select Template</legend>
   <table border="0" cellspacing="0" cellpadding="4" style="color:##333333">
    <tr>
     <td width="180">Select Event</td>
     <td><select name="template" id="template">
  <option value="0" <cfif getData.template EQ 0 >selected</cfif>>Select this option for no template</option>
  <cfloop query="getTemplate"><option value="#getTemplate.id#" <cfif getData.template EQ getTemplate.id >selected</cfif>>#getTemplate.name#</option>
  </cfloop>
 </select></td>
    </tr>
    <tr>
     <td>Collum 1 background color</td>
     <td><input type="text" name="col1color" id="col1color" size="8" value="#trim(getData.col1color)#" maxlength="6" /></td>
    </tr>
    <tr>
     <td>Collum 2 background color</td>
     <td><input type="text" name="col2color" id="col2color" size="8" value="#trim(getData.col2color)#" maxlength="6" /></td>
    </tr>
    <tr>
     <td>Collum 3 background color</td>
     <td><input type="text" name="col3color" id="col3color" size="8" value="#trim(getData.col3color)#" maxlength="6" /></td>
    </tr>
   </table>
  </fieldset>
 </div>
</div>
<a href="" id="areaMedia_opener" style="clear:both">show media recipients/ mailout planer</a>
<div id="areaMedia" style="clear:both" >
 <div id="column1">
  <fieldset>
   <legend>Select Media Recipient</legend>
   <table  border="0" cellspacing="0" cellpadding="4" style="color:##333333">
    <tr>
     <td width="133">Create file for attachement</td>
     <td><input name="createFile" type="checkbox" value="1" <cfif getData.createFile EQ true >checked</cfif> /></td>
    </tr>
    <tr>
     <td>Contract ID</td>
     <td><input type="text" name="contraJob_id" value="<cfif getData.contraJob_id NEQ "">#trim(getData.contraJob_id)#<cfelse>0</cfif>" /></td>
    </tr>
   </table>
  </fieldset>
 </div>
 <div id="column2">
  <fieldset>
   <legend>Configure date to send out email</legend>
   <table  border="0" cellspacing="0" cellpadding="4" style="color:##333333">
    <tr>
     <td width="133">Send out date</td>
     <td width="410"><input type="text" name="dateToSend" id="senddate" /><img src="../img/calendar_24.gif" border="0" onClick="scwShow(scwID('senddate'),event,3);" /></td>
     <td rowspan="3" valign="top"><table border="0" width="100%" >
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
 </table></td>
    </tr>
    <tr>
     <td>Send out time</td>
     <td><input type="text" name="timeToSend" id="timeToSend" maxlength="2" /><br /><i>time must be in 24 hour format, will only send from 4am to 22 pm</i></td>
    </tr>
    <tr>
     <td></td>
     <td><input type="submit" name="Submit" value="Save" /></td>
    </tr>
   </table>
  </fieldset>
 </div>
</div>
<fieldset style="clear:both">
 <legend>Save</legend>
 <input type="submit" name="Submit" value="Save" />
</fieldset>
<!---<table border="0" cellpadding="0" cellspacing="0">
<!---<tr>
 <td>
<fieldset>
 <legend>Edit email Header</legend>
  <table border="0" cellspacing="0" cellpadding="4" style="color:##333333">
   <tr>
    <td width="133">Email reference</td>
    <td width="200"><input type="text" name="name" style="width:170px" maxlength="35" value="#getData.name#"/></td>
    <td><label><input type="checkbox" name="test" id="test" value="1" <cfif getData.test EQ true >checked</cfif>>
    send as test email</label></td>
   </tr>
   <tr>
    <td>From name</td>
    <td><input type="text" name="namefROM" style="width:170px" maxlength="30" <cfif getData.namefROM NEQ ""> value="#getData.namefROM#" <cfelse>value="Global Pacific & Partners" </cfif>/></td>
    <td><input type="checkbox" name="templateSize" id="templateSize" <cfif getData.templateSize EQ 1> checked </cfif>>
    Template width 600</td>
   </tr>
 <tr>
  <td>from email domain</td>
  <td>
  <select name="DomainName">
    <cfloop query="domains">
 <option value="#domains.id#" <cfif getData.DomainName EQ domains.id >selected</cfif> >#domains.domain_name#</option>
   </cfloop>
    </select>
    
  <input type="hidden" name="EmailFrom" value="#getData.EmailFrom#"/>
   <input type="hidden" name="id" value="#emailid#" /></td>
  <td><input type="checkbox" name="calendar" id="checkbox" <cfif getData.calendar EQ true >checked</cfif>>
  do not keep record</td>
 </tr>
 <tr>
  <td>send to all registered emails ()</td>
  <td><input type="checkbox" name="selectAllEmails" <cfif getData.selectAllEmails EQ 1> checked </cfif> /></td>
  <td><input type="text" name="displayDate" id="displayDate" value="#DateFormat(getData.displayDate, "dd mmmm yyyy")#" style="width:150px" />
  <img src="../img/calendar_24.gif" border="0" onclick="scwShow(scwID('displayDate'),event,1);" />Keep on list until</td>
 </tr>
 <tr>
  <td>subject</td>
  <td colspan="2" ><input type="text" name="subject" style="width:330px" maxlength="200" value="#getData.subject#"/></td>
 </tr>
 <tr>
  <td colspan="3">
  <fieldset><legend>event</legend>
   <select name="eventid" id="select">
    <cfloop query="getevent">
    <option value="#getevent.id#" <cfif getData.eventid EQ getevent.id >selected</cfif>>#getevent.event_name#, #getevent.event_year#</option>
    </cfloop>
   </select>
   <table >
     <tr>
 <td width="300"><label><input type="checkbox" name="OnlyRegistered" id="OnlyRegistered" value="1" <cfif getData.test EQ 1 OR getData.conferenceExclude EQ 1 >disabled</cfif> <cfif getData.OnlyRegistered EQ 1 or getData.mailsent eq 1 OR getData.template EQ 26 >checked</cfif>  /> Email to Registered to Event</label></td>
  <td rowspan="4" width="200" valign="top"><div id="mustSelect" style="color:##CC3300"></div>  </td>
</tr>
<tr>
 <td><label><input type="checkbox" name="conferenceExclude" id="conferenceExclude" value="1"  <cfif getData.conferenceExclude eq 1> checked </cfif> <cfif getData.test EQ 1 OR getData.OnlyRegistered EQ 1 >disabled</cfif> / >Exclude Registered to this event</label>  </td>
     </tr>
     <tr>
      <td><label>
 <input type="checkbox" name="mailsent" id="mailsent" value="1" <cfif getData.mailsent eq 1 OR getData.template EQ 26> checked </cfif> /> responce form</label></td>
</tr>
<tr>
 <td><label><input type="checkbox" name="eventExact" id="eventExact" <cfif getData.eventExact EQ 1>checked</cfif> /> mailout on exact selected event</label>  </td>
</tr>
   </table>
   </fieldset>
   <fieldset id="area_company" <cfif getData.test EQ true >style="background-color:##ffe5e5"</cfif>><legend>test email to company</legend>
      
<select name="company_id" id="select">
 <option value="0" <cfif getcompany.id EQ 0 >selected</cfif>>No test</option>
 <cfloop query="getcompany">
 <option value="#getcompany.id#" <cfif getData.company_id EQ getcompany.id >selected</cfif>>#getcompany.company#, -- #getcompany.contactname#</option>
 </cfloop>
 </select>   
   </fieldset>   </td>
 </tr>
 <tr>
  <td> Signature &amp; Sender</td>
  <td colspan="2" >
   <select name="signature" id="signature"><cfloop query="getSignature">
    <option value="#getSignature.id#" <cfif getData.signature EQ getSignature.id >selected</cfif>>#getSignature.name#</option>
    </cfloop>
    </select></td>
 </tr>
  </table>     
</fieldset></td>
<td valign="top">
<fieldset>
 <legend>Attachments</legend>

  <table  border="0" cellspacing="0" cellpadding="4" style="color:##333333">
   <tr>
    <td>loaded date</td>
    <td>file </td>
    <td>delete </td>
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
  <td colspan="2"><div id="upload_button_" class="uploadButton" style="width:100px">Upload file</div> <img src="../img/newS_delete.gif" border="0" id="upload_button" /></td>
 </tr>
  </table>
</fieldset>
<fieldset>
 <legend>Select country</legend>

      <select name="country" id="select">
     <cfloop query="getcountry">
     <option value="#getcountry.country#" <cfif getData.country EQ getcountry.country >selected</cfif>>#getcountry.country#</option>
     </cfloop>
     </select>
</fieldset> 
<fieldset id="area_Attend_Type" >
 <legend> Attendents Type</legend>
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
<td colspan="2"><label><input type="checkbox" name="operatorAttType" value="1" <cfif getData.operatorAttType eq 1> checked </cfif> / >
exact&nbsp;search </label></td>
    </tr>
  </table>
</fieldset>
<fieldset id="area_region_Interest">
 <legend>Region of Interest</legend>
  <table border="0" cellspacing="0" cellpadding="4" >
     <tr>
 <td><label><input type="checkbox" name="chkWebIntGen" value="chkWebIntGen" <cfif getData.chkWebIntGen eq 1> checked </cfif>><!---  --->
 General
 </label></td>
 <td><label><input type="checkbox" name="chkWebIntAf" value="chkWebIntAf" <cfif getData.chkWebIntAf eq 1> checked </cfif> ><!--- --->
 Africa</label></td>
 <td> <label ><input type="checkbox" name="chkWebIntMe" value="chkWebIntMe" <cfif getData.chkWebIntMe eq 1> checked </cfif>><!--- --->
 MidEast</label></td>
 <td><label><input type="checkbox" name="chkWebIntAs" value="chkWebIntAs" <cfif getData.chkWebIntAs eq 1> checked </cfif>><!---  --->
 Asia</label></td>
     </tr>
     <tr>
 <td><input type="checkbox" name="chkWebIntNa" value="chkWebIntNa" <cfif getData.chkWebIntNa eq 1> checked </cfif> /><!---  --->
  North America</td>
 <td><label><input type="checkbox" name="chkWebIntAdvertising" value="chkWebIntAdvertising" <cfif getData.chkWebIntAdvertising eq 1> checked </cfif> / ><!--- --->
 advertising</label></td>
 <td></td>
 <td><input type="checkbox" name="chkWebIntAus" value="chkWebIntAus" <cfif getData.chkWebIntAus eq 1> checked </cfif> /><!---  --->
  Australia</td>
     </tr>
     <tr>
 <td><label><input type="checkbox" name="chkWebIntLa" value="chkWebIntLa" <cfif getData.chkWebIntLa eq 1> checked </cfif> /><!--- --->
 Latin</label></td>
 <td><label><input type="checkbox" name="chkWebIntEu" value="chkWebIntEu" <cfif getData.chkWebIntEu eq 1> checked </cfif> /><!--- --->
 Europe</label></td>
 <td><label><input type="checkbox" name="chkWebIntWo" value="chkWebIntWo" <cfif getData.chkWebIntWo eq 1> checked </cfif> /><!--- --->
 World </label></td>
 <td><label><input type="checkbox" name="exactSearch" value="1" <cfif getData.exactSearch eq 1> checked </cfif> / >Make search exact</label></td>
     </tr>
<tr>
 <td><label><input type="checkbox" name="chkWebIntSAE" value="chkWebIntSAE" <cfif getData.chkWebIntSAE eq 1> checked </cfif> />
 Southern Africa</label></td>
 <td><label><input type="checkbox" name="chkWebIntEA" value="chkWebIntEA" <cfif getData.chkWebIntEA eq 1> checked </cfif> /><!--- --->
 East Africa</label></td>
 <td><label><input type="checkbox" name="chkWebIntWa" value="chkWebIntWa" <cfif getData.chkWebIntWa eq 1> checked </cfif> /><!--- --->
 West Africa </label></td>
 <td><label><input type="checkbox" name="chkWebIntNaf" value="chkWebIntNaf" <cfif getData.chkWebIntNaf eq 1> checked </cfif> /><!--- --->
  North Africa</label></td>
     </tr>
     </table>
</fieldset>

</td>
</tr>--->

<!---<tr>
<td colspan="2">
<fieldset>
 <legend>Email text content</legend>
 <table  border="0" cellspacing="0" cellpadding="4" style="color:##333333">
   <tr>
    
    <td><textarea name="content" id="content" style="width:750px; height:350px" >#getData.content#</textarea></td>
    <td valign="top">
    <label><input type="checkbox" name="textmailDetails" id="textmailDetails" <cfif getData.textmailDetails EQ 1 > checked</cfif> /> Include Main Details</label><br />
    <label><input type="checkbox" name="textmailSpeakers" id="textmailSpeakers" <cfif getData.textmailSpeakers EQ 1 > checked</cfif> /> Include Speakers</label><br />
    <label><input type="checkbox" name="textmailfocus" id="textmailfocus" <cfif getData.textmailfocus EQ 1 > checked</cfif> /> Include Focus</label><br />
    <label><input type="checkbox" name="textmailTitle" id="textmailTitle" <cfif getData.textmailTitle EQ 1 > checked</cfif> /> Includ Event title</label><br />
    <label><input type="checkbox" name="textmailpricing" id="textmailpricing" <cfif getData.textmailpricing EQ 1 > checked</cfif> /> Include Events Pricing</label><br />
    <label><input type="checkbox" name="textmailcombine" id="textmailcombine" <cfif getData.textmailcombine EQ 1 > checked</cfif> /> Include combine price</label><br />
    <label><input type="checkbox" name="textmailOverview" id="textmailOverview" <cfif getData.textmailOverview EQ 1 > checked</cfif> /> Include Overview</label><br />
    <label><input type="checkbox" name="textmailLogos" id="textmailLogos" <cfif getData.textmailLogos EQ 1 > checked</cfif> /> Include Logos</label></td>
   </tr>
  </table>
 </fieldset>
<!--- /WIZIWIG ---></td>
</tr>--->
<!---<tr>
 <td colspan="2">
   <a href="" id="areaflash_opener">show flash news / templates</a> 
  </td>
</tr>
<tr>
<td id="areaflashnews" >
<!--- ## START FLASH NEWS  --->
<fieldset>
 <legend>Select Flash News</legend>

   <table border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td valign="top" >
<select name="flashnews" multiple="multiple" id="flashnews" style="width:350px; height:120px">
 <cfloop query="getFlash">
 <option value="#getFlash.id#" <cfif listcontains(getData.flashnews, getFlash.id, "," ) NEQ "0" >selected</cfif>>#getFlash.name#, #getFlash.title#</option>
 </cfloop>
    </select>
<br />
to diselect Flash News hold CMD + click away from entry (MAC), PC use ctrl + click, </td>
   </tr>
     </table> 
</fieldset>
<!--- ## HERE END FLASH NEWS ---></td>
<td valign="top">
<!--- ## START TEMPLATE SELECT  --->
<fieldset>
 <legend>Select Template</legend>

  <table  border="0" cellspacing="0" cellpadding="4" style="color:##333333">
   <tr>
    <td width="180">Select Event</td>
    <td><select name="template" id="template">
    <option value="0" <cfif getData.template EQ 0 >selected</cfif>>Select this option for no template</option>
    <cfloop query="getTemplate">
    <option value="#getTemplate.id#" <cfif getData.template EQ getTemplate.id >selected</cfif>>#getTemplate.name#</option>
    </cfloop>
    </select> </td>
   </tr>
 <tr>
  <td>Collum 1 background color</td>
  <td><input type="text" name="col1color" id="col1color" size="8" value="#trim(getData.col1color)#" maxlength="6" /></td>
 </tr>
 <tr>
 <td>Collum 2 background color</td>
  <td><input type="text" name="col2color" id="col2color" size="8" value="#trim(getData.col2color)#" maxlength="6" /></td>
 </tr>
 <tr>
 <td>Collum 3 background color</td>
  <td><input type="text" name="col3color" id="col3color" size="8" value="#trim(getData.col3color)#" maxlength="6" /></td>
 </tr>
  </table> 
</fieldset>
<!--- ## END TEMPLATE SELECT ---></td>
</tr>--->
<tr>
 <td colspan="2">
   <a href="" id="areaMedia_opener">show media recipient</a> 
  </td>
</tr>
<tr>
<td valign="top" colspan="2" id="areaMedia" >
<fieldset>
 <legend>Select Media Recipient</legend>

<table  border="0" cellspacing="0" cellpadding="4" style="color:##333333">
   <tr>
    <td width="133">Create file for attachement</td>
    <td><input name="createFile" type="checkbox" value="1" <cfif getData.createFile EQ true >checked</cfif> /></td>
   </tr>
   <tr>
    <td>Contract ID</td>
    <td><input type="text" name="contraJob_id" value="<cfif getData.contraJob_id NEQ "">#trim(getData.contraJob_id)#<cfelse>0</cfif>" /></td>
   </tr>
  </table>
 </fieldset>
 <!---<fieldset>
 <legend>Configure date to send out email</legend>
  <table  border="0" cellspacing="0" cellpadding="4" style="color:##333333">
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
 <cfloop query="getsendList">
 <tr id="date#getsendList.id#">
  <td>#dateformat(getsendList.dateToSend, "ddd, dd mmm yy")#</td>
       <td>#getsendList.timeToSend#</td>
       <td width="20"><a href="javascript:deleteSchedule(#getsendList.id#);"><img src="../img/newS_delete.gif" border="0" /></a></td>
      </tr>
 </cfloop>
 </table></td>
   </tr>
 <tr>
  <td>Send out time</td>
  <td><input type="text" name="timeToSend" id="timeToSend" maxlength="2" /><br /> <i>time must be in 24 hour format, will only send from 4am to 22 pm</i></td>
 </tr>
 <tr>
  <td></td>
  <td><input type="submit" name="Submit" value="Save" /></td>
 </tr>
  </table>
</fieldset>--->
</td>

</tr>
<tr>
<td valign="top">
<!--- ## END TEMPLATE SELECT  --->
</td>
<td valign="top">

</td>
</tr>
<tr>
<td colspan="2">
<fieldset>
 <legend>Save</legend>
<input type="submit" name="Submit" value="Save" />
</fieldset>
<!--- ## END COUNTRY SELECT  ---></td>
</tr>
</table>--->
<script type="text/javascript" >
$(function() {
 $("##displayDate").datepicker( {dateFormat: 'd M, y' });
 $('##upload_button_').button({ text: true, });
 });
 
 $(document).ready(function() {
 $('##saveEmail').submit(function() { 
  $('form').bind('form-pre-serialize', function(e) {
   tinyMCE.triggerSave();
   });
  $(this).ajaxSubmit({ clearForm: true, success: loadEmailList});
  tinyMCE.execCommand('mceRemoveControl',false,'content');
  return false; 
 });
});
function unloadPage(){ 
 loadEmailList
 //$("##modalEditEmail").dialog('close');
 
}
</script>
<script type="text/javascript">
 $(document).ready(function() {
 
$('##areaMedia_opener').click(function(){
 $('##areaMedia').toggle("fast");
   return false;
});
 

$('##areaflash_opener').click(function(){
 $('##areaflashnews').toggle("fast");
   return false;
});

$('##areaEmail_opener').click(function(){
 $('##areaMailContent').toggle("fast");
   return false;
});
 
 $('##areaMedia, ##areaflashnews, ##areaMailContent').hide(); 
 
 new AjaxUpload('##upload_button', {
  action: 'UploadAttachement.cfm',
  name: 'Upload',
  data: {   id : '#emailid#', field : 'file_update'  },
  autoSubmit: true,
  responseType: false,
  onSubmit: function(file, extension) {$('##upload_button').html("<img src=../img/ProgressBar_transparent.gif width=70 >");},
  onComplete: function(file, response) {$('##upload_button').html("Loading Completed..."); $('##fileStatus').append(response);}
 });

$('##OnlyRegistered').change(function(){

 var get_Black_Listed = $(this).attr("checked") ? $(this).val() : 0
  if(get_Black_Listed == 1 ){
  $('##area_Attend_Type').css( 'backgroundColor' , '##ffe5e5' );
  $('##mustSelect').html('You must select at least one attendent type');
  $('##conferenceExclude').attr('disabled', true);
  $('##conferenceExclude').attr('checked', false);
  }else{
  $('##area_Attend_Type').css( 'backgroundColor' , '##ffffff' );
  $('##mustSelect').html('');
  $('##conferenceExclude').attr('disabled', false);
  }
});

////////THIS IS FOR RESPONCE FORM MARK OTHER TICKBOXES 
$('##mailsent').change(function(){

 var get_responceForm = $(this).attr("checked") ? $(this).val() : 0
  if(get_responceForm == 1 ){
  $('##OnlyRegistered').attr('checked', true);
  }else{
  $('##OnlyRegistered').attr('checked', false);
  }
});
///////////Heigh light company box 
$('##test').change(function(){
 var get_test = $(this).attr("checked") ? $(this).val() : 0
  if(get_test == 1 ){
  $('##area_company').attr('checked', true);
  }else{
  $('##area_company').attr('checked', false);
  }
});

$('##conferenceExclude').change(function(){

 var get_Exlude = $(this).attr("checked") ? $(this).val() : 0
  if(get_Exlude == 1 ){
  $('##area_Attend_Type, ##area_region_Interest').css( 'backgroundColor' , '##ffe5e5' );
  $('##mustSelect').html('You must select at least one attendent type and region of interest');
  $('##OnlyRegistered').attr('disabled', true);
  $('##OnlyRegistered').attr('checked', false);
  
  }else{
  $('##area_Attend_Type, ##area_region_Interest').css( 'backgroundColor' , '##ffffff' );
  $('##mustSelect').html('');
  $('##OnlyRegistered').attr('disabled', false);
  }
});

$('##test').change(function(){
 
 var get_test = $(this).attr("checked") ? $(this).val() : 0
  if(get_test == 1 ){
  $("##area_company").css('backgroundColor' , '##ffe5e5' );
  $('##conferenceExclude, ##OnlyRegistered').attr('disabled', true);
  $('##conferenceExclude, ##OnlyRegistered').attr('checked', false);
  }else{
  $("##area_company").css('backgroundColor' , '##ffffff' );
  $('##conferenceExclude, ##OnlyRegistered').attr('disabled', false);
  $('##conferenceExclude, ##OnlyRegistered').attr('checked', true);
  }
});
});

function Checkattendence() {
  if ($('##OnlyRegistered').is(':checked') || $('##conferenceExclude').is(':checked'))  {
 $('##mustSelect').html('You must select at least one attendent type');
    
  } else {
 $('##mustSelect').html('');
 }
}
</script></cfoutput>
<!--- sytart adding values --->
<!--- <cfelse  >

 <cfif parameterexists(emailid)>
 <cfquery datasource="#dsnP21#" name="add">
  UPDATE MailOut_configuration SET 

   <cfif parameterexists(form.eventid)>  
  <cfif parameterexists(form.delegate)>delegate = 1,<cfelse>delegate = 0,</cfif>
  <cfif parameterexists(form.speaker)>speaker = 1,<cfelse>speaker = 0,</cfif>
  <cfif parameterexists(form.guest)>guest = 1,<cfelse>guest = 0,</cfif>
  <cfif parameterexists(form.moderator)>moderator = 1,<cfelse>moderator = 0,</cfif>
  <cfif parameterexists(form.exhibitor)>exhibitor = 1,<cfelse>exhibitor = 0,</cfif>
  <cfif parameterexists(form.press)>press = 1,<cfelse>press = 0,</cfif>
  <cfif parameterexists(form.research)>research = 1,<cfelse>research = 0,</cfif>
  <cfif parameterexists(form.sponsor)>sponsor = 1,<cfelse>sponsor = 0,</cfif>
  <cfif parameterexists(form.operatorAttType) >operatorAttType = 1,<cfelse>operatorAttType = 0,</cfif>
  <cfif parameterexists(form.eventid)>eventid = #form.eventid#,</cfif>
  <cfif parameterexists(form.conferenceExclude)>conferenceExclude = 1,<cfelse>conferenceExclude = 0,</cfif>
  <cfif parameterexists(form.eventExact)>eventExact = 1,<cfelse>eventExact = 0,</cfif>
  <cfif parameterexists(form.OnlyRegistered)>OnlyRegistered = 1,<cfelse>OnlyRegistered = 0,</cfif>
  <cfif parameterexists(form.mailsent)>mailsent = 1,<cfelse>mailsent = 0,</cfif>
</cfif>  

<!---  
<cfif parameterexists(form.dateToSend)> 
 dateToSend = <cfqueryparam cfsqltype="cf_sql_date" value="#form.dateToSend#">,
  timeToSend = '#form.timeToSend#',
</cfif>  
--->  
   <cfif parameterexists(form.regions)> </cfif>
  <cfif parameterexists(form.exactSearch) >exactSearch = 1,<cfelse>exactSearch = 0,</cfif>
  
  <cfif parameterexists(form.chkWebIntAus) AND form.chkWebIntAus EQ "chkWebIntAus">chkWebIntAus = 1,<cfelse>chkWebIntAus = 0,</cfif>
  <cfif parameterexists(form.chkWebIntNa) AND form.chkWebIntNa EQ "chkWebIntNa">chkWebIntNa = 1,<cfelse>chkWebIntNa = 0,</cfif>
  <cfif parameterexists(form.chkWebIntWo) AND form.chkWebIntWo EQ "chkWebIntWo">chkWebIntWo = 1,<cfelse>chkWebIntWo = 0,</cfif>
  <cfif parameterexists(form.chkWebIntAf) AND form.chkWebIntAf EQ "chkWebIntAf">chkWebIntAf = 1,<cfelse>chkWebIntAf = 0,</cfif>
  <cfif parameterexists(form.chkWebIntNaf) AND form.chkWebIntNaf EQ "chkWebIntNaf">chkWebIntNaf = 1,<cfelse>chkWebIntNaf = 0,</cfif>
  <cfif parameterexists(form.chkWebIntMe) AND form.chkWebIntMe EQ "chkWebIntMe">chkWebIntMe = 1,<cfelse>chkWebIntMe = 0,</cfif>
  <cfif parameterexists(form.chkWebIntAs) AND form.chkWebIntAs EQ "chkWebIntAs">chkWebIntAs = 1,<cfelse>chkWebIntAs = 0,</cfif>
  <cfif parameterexists(form.chkWebIntLa) AND form.chkWebIntLa EQ "chkWebIntLa">chkWebIntLa = 1,<cfelse>chkWebIntLa = 0,</cfif>
  <cfif parameterexists(form.chkWebIntEu) AND form.chkWebIntEu EQ "chkWebIntEu">chkWebIntEu = 1,<cfelse>chkWebIntEu = 0,</cfif>
  <cfif parameterexists(form.chkWebIntGen) AND form.chkWebIntGen EQ "chkWebIntGen">chkWebIntGen = 1,<cfelse>chkWebIntGen = 0,</cfif>
  
  <cfif parameterexists(form.chkWebIntWa) AND form.chkWebIntWa EQ "chkWebIntWa">chkWebIntWa = 1,<cfelse>chkWebIntWa = 0,</cfif>
  <cfif parameterexists(form.chkWebIntEA) AND form.chkWebIntEA EQ "chkWebIntEA">chkWebIntEA = 1,<cfelse>chkWebIntEA = 0,</cfif>
  
   <cfif parameterexists(form.chkWebIntAdvertising) AND form.chkWebIntAdvertising EQ "chkWebIntAdvertising">chkWebIntAdvertising = 1,<cfelse>chkWebIntAdvertising = 0,</cfif>
  <cfif parameterexists(form.chkWebIntSAE) AND form.chkWebIntSAE EQ "chkWebIntSAE">chkWebIntSAE = 1,<cfelse>chkWebIntSAE = 0,</cfif> 

   <cfif parameterexists(form.country)>country = '#trim(form.country)#',</cfif>
 
   <cfif parameterexists(form.content)>
    content   = '#trim(form.content)#',
    textmailDetails = <cfif parameterexists(form.textmailDetails)>1<cfelse>0</cfif>,
    textmailSpeakers =  <cfif parameterexists(form.textmailSpeakers)>1<cfelse>0</cfif>,
    textmailfocus  =  <cfif parameterexists(form.textmailfocus)>1<cfelse>0</cfif>,
    textmailTitle  =  <cfif parameterexists(form.textmailTitle)>1<cfelse>0</cfif>,
    textmailpricing = <cfif parameterexists(form.textmailpricing)>1<cfelse>0</cfif>,
    textmailcombine = <cfif parameterexists(form.textmailcombine)>1<cfelse>0</cfif>,
    textmailOverview = <cfif parameterexists(form.textmailOverview)>1<cfelse>0</cfif>,
    textmailLogos = <cfif parameterexists(form.textmailLogos)>1<cfelse>0</cfif>,
 </cfif>
   <cfif parameterexists(form.company_id)> 
 createFile = <cfif parameterexists(form.createFile)>1,<cfelse>0,</cfif>
 contraJob_id = <cfif parameterexists(form.contraJob_id )> #trim(form.contraJob_id)#,<cfelse>0,</cfif>
 <cfif parameterexists(form.company_id)>company_id = #form.company_id#,</cfif>
</cfif>
   <cfif parameterexists(form.template)>
    template = '#trim(form.template)#',
    col1color = <cfqueryparam value="#trim(form.col1color)#" >,
    col2color = <cfqueryparam value="#trim(form.col2color)#" >,
    col3color = <cfqueryparam value="#trim(form.col3color)#" >,
</cfif>
 
   <cfif parameterexists(form.flashnews)>flashnews = <cfqueryparam value="#trim(form.flashnews)#">,<cfelse>flashnews = <cfqueryparam value="">,</cfif>
   <cfif parameterexists(form.name)> 
 name = '#trim(form.name)#',
 signature = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.signature#">,
 <cfif parameterexists(form.namefrom)>namefrom = '#trim(form.namefrom)#',</cfif>
 <cfif parameterexists(form.emailfrom)>emailfrom = '#trim(form.emailfrom)#',</cfif>
 DomainName = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DomainName#">,
 <cfif parameterexists(form.selectAllEmails)><!---selectAllEmails = 1,<cfelse>0,---></cfif>
 <cfif parameterexists(form.subject)>subject = '#trim(form.subject)#',</cfif>
 <cfif parameterexists(form.displayDate)>displayDate = <cfqueryparam cfsqltype="cf_sql_date" value="#form.displayDate#">,</cfif>
 calendar  = <cfif parameterexists(form.calendar)>1,<cfelse>0,</cfif>
 templateSize = <cfif parameterexists(form.templateSize)>1,<cfelse>0,</cfif>
 test   = <cfif parameterexists(form.test)>1,<cfelse>0,</cfif>
</cfif> 
 
 updated = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >
 WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#emailid#">
 </cfquery>
 <CFPARAM name="add.id" default="#emailid#">

<!--- insert TIME TO SEND OUT EMAIL --->
   <cfif parameterexists(form.dateToSend)>
   <cfquery datasource="#DSNP21#" >
   INSERT INTO MailOut_calendar (emailid, dateToSend, TIMETOSEND)
   Values (#emailid#, <cfqueryparam cfsqltype="cf_sql_date" value="#form.dateToSend#" >, '#form.timeToSend#')
   </cfquery> 
  </cfif> 
 <cfelse>
 <cfquery datasource="#dsnP21#" name="add">
  INSERT INTO MailOut_configuration (
  
 <cfif parameterexists(form.name)>name, </cfif>
 <cfif parameterexists(form.namefROM)>namefROM, </cfif>
 <cfif parameterexists(form.EmailFrom)>EmailFrom, </cfif>
 <cfif parameterexists(form.subject)> subject , </cfif>
 <cfif parameterexists(form.name)>calendar,</cfif>
  <cfif parameterexists(form.displayDate)>displayDate,</cfif>
 <cfif parameterexists(form.test)>test,</cfif>
  datesend
  )
  VALUES(
 <cfif parameterexists(form.name)> '#trim(form.name)#',</cfif>
 <cfif parameterexists(form.namefrom)>'#trim(form.namefrom)#',</cfif>
 <cfif parameterexists(form.emailfrom)> '#trim(form.emailfrom)#',</cfif>
 <cfif parameterexists(form.subject)> '#trim(form.subject)#',</cfif>
 <cfif parameterexists(form.calendar)>1,<cfelse>0,</cfif>
 <cfif parameterexists(form.displayDate)><cfqueryparam cfsqltype="cf_sql_date" value="#form.displayDate#">,</cfif>
 <cfif parameterexists(form.test)>1,</cfif>
 <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
  )
  SELECT @@Identity AS id
 </cfquery>
 </cfif>

#add.id# 
</cfif>--->
<!---
 <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="4"><h1>Edit email <span class="headermini">Content</span></h1> </td>
   </tr>
   <tr>
    <td width="133">Name this email for reference</td>
    <td width="200"><input type="text" name="name" style="width:170px" maxlength="35" value="#getData.name#"/></td>
    <td width="133">&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
   <tr>
    <td>from name</td>
    <td><input type="text" name="namefROM" style="width:170px" maxlength="30" value="#getData.namefROM#" /></td>
    <td>&nbsp;</td>
    <td><input type="checkbox" name="templateSize" id="templateSize" <cfif getData.templateSize EQ 1> checked </cfif>> Tick to make Template width 600 not 900</td>
   </tr>
 <tr>
  <td>subject </td>
  <td colspan="2"><input type="text" name="subject" style="width:330px" maxlength="200" value="#getData.subject#"/></td>
  <td><input type="checkbox" name="calendar" id="checkbox" <cfif getData.calendar EQ true >checked</cfif>>
  do not keep record of sending out on calendar</td>
 </tr>
 <tr>
  <td>from email</td>
  <td colspan="2"><input type="text" name="EmailFrom" style="width:170px" maxlength="30" value="#getData.EmailFrom#"/></td>
  <td><input type="text" name="displayDate" id="displayDate" value="#DateFormat(getData.displayDate, "dd mmmm yyyy")#" />
  <img src="../img/calendar_24.gif" border="0" onclick="scwShow(scwID('displayDate'),event,1);" />Keep on list until</td>
 </tr>
 <tr>
  <td>send as test email</td>
  <td colspan="2"><input type="checkbox" name="test" id="test" <cfif getData.test EQ true >checked</cfif>>
  make sure you select the company to send test to</td>
  <td><input type="hidden" name="id" value="#emailid#" /><input type="submit" name="Submit" value="Save" /></td>
 </tr>
  </table>     
 <cfelseif parameterexists(form.step) AND form.step eq "wysiwyg">

  <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="15"><h1>Configure mail content</h1> </td>
   </tr>
 <tr align="right">
    <td width="120">Include Speakers</td>
    <td width="22" class="boxborderRight" ><input type="checkbox" name="textmailSpeakers" id="textmailSpeakers" <cfif getData.textmailSpeakers EQ 1 > checked</cfif> /></td>
    <td width="100" >Include Focus</td>
    <td width="25" class="boxborderRight" ><input type="checkbox" name="textmailfocus" id="textmailfocus" <cfif getData.textmailfocus EQ 1 > checked</cfif> /></td>
    <td width="110" >Includ Event title</td>
    <td width="25" class="boxborderRight" ><input type="checkbox" name="textmailTitle" id="textmailTitle" <cfif getData.textmailTitle EQ 1 > checked</cfif> /></td>
    <td width="160" >Include Events Pricing</td>
    <td width="25" class="boxborderRight" ><input type="checkbox" name="textmailpricing" id="textmailpricing" <cfif getData.textmailpricing EQ 1 > checked</cfif> /></td>
    <td width="160" >Include combine price</td>
    <td width="20" class="boxborderRight" ><input type="checkbox" name="textmailcombine" id="textmailcombine" <cfif getData.textmailcombine EQ 1 > checked</cfif> /></td>
    <td width="120" >Include Overview</td>
    <td width="20" class="boxborderRight"><input type="checkbox" name="textmailOverview" id="textmailOverview" <cfif getData.textmailOverview EQ 1 > checked</cfif> /></td>
    <td width="100" >Include Logos</td>
    <td width="20" class="boxborderRight"><input type="checkbox" name="textmailLogos" id="textmailLogos" <cfif getData.textmailLogos EQ 1 > checked</cfif> /></td>
    <td ></td>
   </tr>
   <tr>
    <td><input type="hidden" name="id" value="#emailid#" />
<input type="submit" name="Submit" value="Save" /></td>
    <td colspan="14"><textarea name="content" id="content" style="width:100%; height:350px" >#getData.content#</textarea></td>
   </tr>
  </table>
 <cfelseif parameterexists(form.step) AND form.step eq "flash" >
 <cfquery name="getFlash" datasource="#dsnP21#">
    SELECT id, name, title
 FROM  newsletter_FlashNews
    WHERE content <> '' AND dueDate > #now()#
    </cfquery>
  <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="4"><h1>Select edit Flash <span class="headermini">News</span></h1> </td>
   </tr>
   <tr>
    <td width="60" colspan="1"><input type="hidden" name="id" value="#emailid#" />
<input type="submit" name="Submit2" value="Save" /></td>
    <td >
<select name="flashnews" multiple="multiple" id="flashnews" style="width:650px; height:120px">
 <cfloop query="getFlash"><option value="#getFlash.id#" <cfif listcontains(getData.flashnews, getFlash.id, "," ) NEQ "0" >selected</cfif>>#getFlash.name#, #getFlash.title#</option>
 </cfloop>
    </select></td>
   </tr>
  </table> 
<cfelseif parameterexists(form.step) AND form.step eq "region">

  <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="2"><h1>Configure email <span class="headermini">/ Region of interest</span></h1> </td>
   </tr>
   <tr>
    <td width="133" height="46">Select Region of interest</td>
    <td rowspan="2"><table width="" border="0" cellspacing="5" cellpadding="0">
     <tr>
 <td><label><input type="checkbox" name="chkWebIntGen" value="chkWebIntGen" <cfif getData.chkWebIntGen eq 1> checked </cfif>><!---  --->
 All
 </label></td>
 <td><label><input type="checkbox" name="chkWebIntAf" value="chkWebIntAf" <cfif getData.chkWebIntAf eq 1> checked </cfif> ><!--- --->
 Africa</label></td>
 <td> <label ><input type="checkbox" name="chkWebIntMe" value="chkWebIntMe" <cfif getData.chkWebIntMe eq 1> checked </cfif>><!--- --->
 MidEast</label></td>
 <td><label><input type="checkbox" name="chkWebIntAs" value="chkWebIntAs" <cfif getData.chkWebIntAs eq 1> checked </cfif>><!---  --->
 Asia</label></td>
 <td></td>
 <td><label><input type="checkbox" name="chkWebIntAdvertising" value="chkWebIntAdvertising" <cfif getData.chkWebIntAdvertising eq 1> checked </cfif> / ><!--- --->
 advertising</label></td>
     </tr>
     <tr>
 <td><input type="checkbox" name="chkWebIntNa" value="chkWebIntNa" <cfif getData.chkWebIntNa eq 1> checked </cfif> /><!---  --->
  North America</td>
 <td><input type="checkbox" name="chkWebIntNaf" value="chkWebIntNaf" <cfif getData.chkWebIntNaf eq 1> checked </cfif> /><!--- --->
  North Africa</td>
 <td><input type="checkbox" name="chkWebIntSAE" value="chkWebIntSAE" <cfif getData.chkWebIntSAE eq 1> checked </cfif> />
 Southern Africa</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
     </tr>
     <tr>
 <td><label><input type="checkbox" name="chkWebIntLa" value="chkWebIntLa" <cfif getData.chkWebIntLa eq 1> checked </cfif> /><!--- --->
 Latin</label></td>
 <td><label><input type="checkbox" name="chkWebIntEu" value="chkWebIntEu" <cfif getData.chkWebIntEu eq 1> checked </cfif> /><!--- --->
 Europe</label></td>
 <td><label><input type="checkbox" name="chkWebIntWo" value="chkWebIntWo" <cfif getData.chkWebIntWo eq 1> checked </cfif> /><!--- --->
 World </label></td>
 <td></td>
 <td>&nbsp;</td>
 <td><label><input type="checkbox" name="exactSearch" value="1" <cfif getData.exactSearch eq 1> checked </cfif> / >Make search exact</label></td>
     </tr>
    </table></td>
   </tr>
   <tr>
    <td><input type="hidden" name="id" value="#emailid#" /><input type="hidden" name="regions" value="1" /></td>
   </tr>
 <tr>
  <td>&nbsp;</td>
  <td><input type="submit" name="Submit" value="Save" /></td>
 </tr>
  </table>

<cfelseif parameterexists(form.step) AND form.step eq "event">

<cfquery datasource="#dsnP21#" name="getevent">
SELECT id, event_year, event_name 
FROM events 
WHERE ( event_type = 'event' OR event_type = 'eb' OR event_type = 'din' ) 
AND event_year > #(year(now()) - 1)# AND live = 1 ORDER BY event_expire DESC
</cfquery>
  <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="2"><h1>Select Event <span class="headermini"></span></h1> </td>
   </tr>
   
   <tr>
    <td width="133">Select Event</td>
    <td><select name="eventid" id="select">
    <cfloop query="getevent">
    <option value="#getevent.id#" <cfif getData.eventid EQ getevent.id >selected</cfif>>#getevent.event_name#, #getevent.event_year#</option>
    </cfloop>
    </select></td>
   </tr>
 
 <tr>
  <td>Select who to send to</td>
  <td>
   <table border="0" cellspacing="4" cellpadding="0">
    <tr>
<td><label><input type="checkbox" name="delegate" id="delegate" <cfif getData.delegate EQ 1>checked</cfif> /> Delegate</label></td>
<td><label><input type="checkbox" name="speaker" id="speaker" <cfif getData.speaker EQ 1>checked</cfif> /> Speakers</label></td>
<td><label><input type="checkbox" name="guest" id="guest" <cfif getData.guest EQ 1>checked</cfif> /> Guest</label></td>
<td width="160"><label><input type="checkbox" name="moderator" id="moderator" <cfif getData.moderator EQ 1>checked</cfif> /> Moderator</label></td>
<td><label><input type="checkbox" name="eventExact" id="eventExact" <cfif getData.eventExact EQ 1>checked</cfif> /> mailout on exact selected event</label></td>
<td><label><input type="checkbox" name="OnlyRegistered" id="OnlyRegistered" <cfif getData.OnlyRegistered EQ 1>checked</cfif> /> Only send email to Registered to Event</label></td>
    </tr>
    <tr>
<td><label><input type="checkbox" name="exhibitor" id="exhibitor" <cfif getData.exhibitor EQ 1>checked</cfif> /> Exhibitor</label></td>
<td><label><input type="checkbox" name="press" id="press" <cfif getData.press EQ 1>checked</cfif> /> Press</label></td>
<td><label><input type="checkbox" name="research" id="research" <cfif getData.research EQ 1>checked</cfif> /> Research</label></td>
<td><label><input type="checkbox" name="sponsor" id="sponsor" <cfif getData.sponsor EQ 1>checked</cfif> /> Sponsor</label></td>
<td><label><input type="checkbox" name="operatorAttType" value="1" <cfif getData.operatorAttType eq 1> checked </cfif> / >Make search exact</label></td>
    </tr>
    <tr>
      <td colspan="4"></td>
 <td><label><input type="checkbox" name="conferenceExclude" value="1" <cfif getData.conferenceExclude eq 1> checked </cfif> / >
 Exclude clients Registered </label> 
  to this event</td>
     </tr>
   </table></td>
 </tr>
 <tr>
  <td><input type="hidden" name="id" value="#emailid#" /></td>
  <td><input type="submit" name="Submit" value="Save" /></td>
 </tr>
  </table>
<cfelseif parameterexists(form.step) AND form.step eq "template">

<cfquery datasource="#dsnP21#" name="getTemplate">
SELECT id, name 
FROM MailOut_template 
ORDER BY name 
</cfquery>
  <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="6"><h1>Templates</h1> </td>
   </tr>
   <tr>
    <td width="126">Select Event</td>
    <td colspan="5"><select name="template" id="template">
    <option value="0" <cfif getData.template EQ 0 >selected</cfif>>Select this option for no template</option>
    <cfloop query="getTemplate">
    <option value="#getTemplate.id#" <cfif getData.template EQ getTemplate.id >selected</cfif>>#getTemplate.name#</option>
    </cfloop>
    </select> &nbsp;   </td>
   </tr>
 <tr>
  <td>Column 1 <br />
  Background Color</td>
  <td width="152"><input type="text" name="col1color" id="col1color" size="8" value="#getData.col1color#" maxlength="6" /></td>
  <td width="127">Column<br />
  Background Color</td>
  <td width="83"><input type="text" name="col2color" id="col2color" size="8" value="#getData.col2color#" maxlength="6" /></td>
  <td width="132">Column<br />
  Background Color</td>
  <td width="1174"><input type="text" name="col3color" id="col3color" size="8" value="#getData.col3color#" maxlength="6" /></td>
 </tr>
 <tr>
  <td><input type="hidden" name="id" value="#emailid#" /></td>
  <td colspan="5"><input type="submit" name="Submit3" value="Save" /></td>
 </tr>
  </table>
<cfelseif parameterexists(form.step) AND form.step eq "attachment" >

<cfquery datasource="#dsnP21#" name="getAttachment">
SELECT id, filename, insertdate FROM MailOut_attachment WHERE emailid = #emailid# ORDER BY insertdate 
</cfquery>
  <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="3"><h1>Attachments</h1> </td>
   </tr>
   <tr>
    <td>loaded date</td>
    <td>file </td>
    <td>delete </td>
   </tr>
    <cfloop query="getAttachment">
 <tr id="attach#getAttachment.id#">
  <td>#dateformat(getAttachment.insertdate, "dd mm yyyy")#</td>
  <td>#getAttachment.filename#</td>
  <td width="20"><a href="javascript:deleteAttachment(#getAttachment.id#);"><img src="../img/newS_delete.gif" border="0" /></a></td>
 </tr>
    </cfloop>
 <tr>
  <td><input type="hidden" name="id" value="#emailid#" /></td>
  <td colspan="2"><input type="submit" name="Submit3" value="Return" /></td>
 </tr>
  </table>

<cfelseif parameterexists(form.step) AND form.step eq "contra">

<cfquery datasource="#dsnP21#" name="getcompany">
SELECT id, company, contactname 
FROM logos 
ORDER BY company
</cfquery>
<table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="2"><h1>Configure contract details <span class="headermini"></span></h1></td>
   </tr>
   <tr>
    <td width="133">Create file for attachement</td>
    <td><input name="createFile" type="checkbox" value="1" <cfif getData.createFile EQ true >checked</cfif> /></td>
   </tr>
   <tr>
    <td>Contract ID</td>
    <td><input type="text" name="contraJob_id" value="<cfif getData.contraJob_id NEQ "">#trim(getData.contraJob_id)#<cfelse>0</cfif>" /></td>
   </tr>
   <tr>
    <td>Select company</td>
    <td><select name="company_id" id="select">
    <option value="0" <cfif getcompany.id EQ 0 >selected</cfif>>No test</option>
    <cfloop query="getcompany">
    <option value="#getcompany.id#" <cfif getData.company_id EQ getcompany.id >selected</cfif>>#getcompany.company#, -- #getcompany.contactname#</option>
    </cfloop>
    </select></td>
   </tr>
 <tr>
  <td><input type="hidden" name="id" value="#emailid#" /></td>
  <td><input type="submit" name="Submit" value="Save" /></td>
 </tr>
  </table>
<cfelseif parameterexists(form.step) AND form.step eq "sendDate" >

<table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="3"><h1>Configure date <span class="headermini">to send out email blast</span></h1></td>
   </tr>
   <tr>
    <td width="133">Send out date</td>
    <td width="410"><input type="text" name="dateToSend" id="senddate" /><img src="../img/calendar_24.gif" border="0" onClick="scwShow(scwID('senddate'),event,3);" /></td>
    <td rowspan="3" valign="top">
    <cfquery datasource="#dsnP21#" name="getList">SELECT id, dateToSend, timeToSend FROM MailOut_calendar WHERE emailid = <cfqueryparam cfsqltype="cf_sql_integer" value="#emailid#" > AND dateToSend >= #now()#</cfquery>
    <table border="0" width="100%" >
   <tr>
  <td>sending on</td>
  <td>at</td>
  <td width="20">delete</td>
    </tr>
 <cfloop query="getList">
 <tr id="date#getList.id#">
  <td>#dateformat(getList.dateToSend, "ddd, dd mmm yy")#</td>
  <td>#getList.timeToSend#</td>
  <td width="20"><a href="javascript:deleteSchedule(#getList.id#);"><img src="../img/newS_delete.gif" border="0" /></a></td>
 </tr></cfloop>
 </table>
    </td>
   </tr>
   <tr>
  <td>Send Out Time</td>
  <td><input type="text" name="timeToSend" id="timeToSend" maxlength="2" /><br /><i>time must be in 24 hour format, will only send between 04:00am and 22:00pm</i></td>
 </tr>
 <tr>
  <td><input type="hidden" name="id" value="#emailid#" /></td>
  <td><input type="submit" name="Submit" value="Save" /></td>
 </tr>
  </table>
  
  <cfelseif parameterexists(form.step) AND form.step eq "country" >

<cfquery datasource="#gpp#" name="getcountry">
SELECT CountryName AS country FROM VIEWSearchCountries ORDER BY country 
</cfquery>
  <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
   <tr>
    <td colspan="2"><h1>Select Country</h1></td>
   </tr>
   <tr>
    <td width="133">Select country</td>
    <td><select name="country" id="select">
    <cfloop query="getcountry">
    <option value="#getcountry.country#" <cfif getData.country EQ getcountry.country >selected</cfif>>#getcountry.country#</option>
    </cfloop>
    </select></td>
   </tr>
   <tr>
  <td><input type="hidden" name="id" value="#emailid#" /></td>
  <td><input type="submit" name="Submit" value="Save" /></td>
 </tr>
  </table>
 --->