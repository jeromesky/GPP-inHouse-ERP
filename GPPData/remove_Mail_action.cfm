<CFINCLUDE template="../Application.cfm">


<cfquery datasource="#gpp#" name="get" >
UPDATE  tblIndividual 
SET
 <cfif parameterexists(form.archive) >   
    STATUS = 'A',
    Archive_Reason = '#Session.username# :  Cleaning returned mail',
</cfif>
	chkMail = 1,
    dtmUpdated = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
    


WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.chkMail#" > 

</cfquery>
<cfoutput>
<table width="600" border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td width="80">#form.chkMail#</td>
    <td width="245">#form.searchfield#</td>
    <td >removed from  mail list</td>
    <td ><cfif parameterexists(form.archive) >archived</cfif></td>
  </tr>
</table>

</cfoutput>