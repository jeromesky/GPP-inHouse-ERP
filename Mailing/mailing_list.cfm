<cfinclude template="../Application.cfm" >

<cfquery datasource="#dsnP21#" name="get">
SELECT *
FROM SITE_Mailer_ListEmails
WHERE displayDate >= #now()#
ORDER BY displayDate 
</cfquery>

<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr bgcolor="#e8f2f9">
    <td colspan="3"><a href="javascript:loadForm(0);" id="B_newEmail">Create a new email</a></td>
    <td>subject</td>
	<td>file</td>
    <td>email type</td>
    <td>send to</td>
    <td colspan="3">on this event</td>
</tr>
<cfoutput query="get"><tr id="rec#get.id#" class="highLightRow" onMouseOver="style.backgroundColor='##e8f2f9';" onMouseOut="style.backgroundColor='##ffffff';" style="border-bottom:1px solid ##e8f2f9"> 
  <td width="20"><cfif get.test eq 1 and get.company_id EQ 0><img src="../img/mail_error.gif" /><cfelse><a href="javascript:ExternalPopUp('../mailing/MailOut_Check_Send.cfm', #get.id#);"><img src="../img/mail.gif" border="0"></a></cfif></td>
  <td width="20"><a href="MailOut_View.cfm?emailid=#get.id#" target="_blank"><img src="../img/view.png" border="0" /></a></td>
  <td width="160"><span id="emailname#get.id#">#get.name#</span></td>
  <td width="300">#get.subject# <cfif get.test eq 1> <span style="color:##CC3300">(TEST)</span></cfif></td>
  <td width="40"><cfif get.filename NEQ ""><img src="../img/Paper-Clip.jpg" border="0"></cfif></td>
  <td width="140"><CFIF get.template NEQ 0 >Template email<cfelse>Text email</CFIF></td>
  <td width="400"><cfif get.test eq 1 ><span style="color:##CC3300">#get.company#, #get.name#</span>
	<cfelseif get.CompanySearch NEQ "">#get.CompanySearch#
	<cfelseif get.OnlyRegistered EQ 1 >Registered attendies for<cfelse>
		<cfif get.test Neq 1 ><span style="color:##CC3300">
                <cfif get.chkWebIntWo EQ 1 >World Interest, </cfif>
                <cfif get.chkWebIntAf EQ 1 >Africa Interest, </cfif> 
                <cfif get.chkWebIntNaf EQ 1 >North African Interest, </cfif> 
                <cfif get.chkWebIntSAE EQ 1 >Southern Africa Interest, </cfif> 
                <cfif get.chkWebIntMe EQ 1 >Midle East Interest, </cfif>
                <cfif get.chkWebIntAs EQ 1 >Asia Interest, </cfif>
                <cfif get.chkWebIntNa EQ 1 >North America, </cfif> 
                <cfif get.chkWebIntLa EQ 1 >Latin INterest, </cfif> 
                <cfif get.chkWebIntEu EQ 1 >Europe Interest, </cfif>
                <cfif get.chkWebIntGen EQ 1 >General Interest, </cfif>
                <cfif get.chkWebIntAdvertising EQ 1 >3rd Party Advertising, </cfif>
                <cfif get.chkWebIntEA EQ 1 >Eastern Africa Interest, </cfif>
                <cfif get.chkWebIntWa EQ 1 >Western Africa Interest </cfif>
                <cfif get.chkWebIntAus EQ 1 >Australia </cfif></span>
		<cfif get.conferenceExclude EQ 1 >Excluding attendies for </cfif></cfif></cfif>
		<cfif get.country NEQ "">#get.country#</cfif></td>
     <td><cfif get.eventid NEQ "">#get.event_name# #get.event_year#</cfif></td>
    <td width="20"><a href="javascript:loadForm(#get.id#);"><img src="../img/new_edit.gif" border="0"></a></td>
    <td width="20"><a href="javascript:deleteEmail(#get.id#);" class="ui-state-default ui-corner-all ui-corner-all ui-icon ui-icon-circle-close"><img src="../img/new_delete.gif" border="0" alt="Delete #get.id#"></a></td>
  </tr></cfoutput>
</table>

<!---<cfquery datasource="#dsnP21#" name="getname"> SELECT event_name, event_year FROM events WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.eventid#"></cfquery>--->
<!---  <a href="MailOut_Send.cfm?emailid=#get.id#" id="#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'Send', objectType: 'iframe', objectWidth: 320, objectHeight: 170} )" class="highslide"><img src="../img/mail.gif" border="0"></a>--->
<!---<cfquery datasource="#dsnP21#" name="get">
SELECT MailOut_configuration.id,  MailOut_configuration.name, MailOut_configuration.subject, MailOut_configuration.dateToSend, MailOut_configuration.test, MailOut_configuration.template,MailOut_configuration. company_id, MailOut_configuration.eventid, MailOut_configuration.chkWebIntWo, MailOut_configuration.chkWebIntAf, MailOut_configuration.chkWebIntNaf, MailOut_configuration.chkWebIntSAE, MailOut_configuration.chkWebIntMe, MailOut_configuration.chkWebIntAs, MailOut_configuration.chkWebIntNa, MailOut_configuration.chkWebIntLa, MailOut_configuration.chkWebIntEu,  MailOut_configuration.chkWebIntGen,  MailOut_configuration. chkWebIntAdvertising , MailOut_attachment.filename, MailOut_configuration.country, MailOut_configuration.OnlyRegistered, MailOut_configuration.chkWebIntEA, MailOut_configuration.chkWebIntWa, MailOut_configuration.conferenceExclude, MailOut_configuration.CompanySearch
FROM MailOut_configuration 
LEFT JOIN MailOut_attachment ON MailOut_configuration.id = MailOut_attachment.emailid
WHERE displayDate >= #now()#
ORDER BY displayDate 
</cfquery>---><!---<a href="javascript:loadMenuConf(#get.id#, '#get.name#');">--->

<!---<cfif get.company_id NEQ 0 OR  get.company_id NEQ "" >
			<CFQUERY DATASOURCE="#dsnP21#" name="sendto"  >
				SELECT company, contactname AS name FROM logos 
				WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.company_id#">
			</CFQUERY><cfif get.test eq 1 ><span style="color:##CC3300">#sendto.company#, #sendto.name#</span></cfif>
	</cfif>--->