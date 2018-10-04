<cfinclude template="../Application.cfm">
<cfif parameterexists(url.delete)>
	<cfquery datasource="#dsnP21#">
	DELETE FROM awards WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.delete#">
    </cfquery>
</cfif>

<cfif parameterexists(form.id)>
<cfquery datasource="#dsnP21#"  >
	UPDATE awards
    SET
    awardname			= '#form.awardname#',
    conf						= '#form.conf#',
    delegation				= '#form.delegation#',
    company				= '#form.company#',
    recipient				= '#form.recipient#',
    reason					= '#form.reason#',
    eventid					= #form.eventid#,
    awardyear				= '#form.awardyear#'
	WHERE id 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">    
</cfquery>
<cfelseif parameterexists(form.awardname) >
      <cfquery datasource="#dsnP21#"  >
        INSERT INTO awards( 
        awardname, 
        conf, 
        delegation,
        company, 
        recipient, 
        reason, 
        eventid,
        awardyear
 )
        Values(
        '#form.awardname#', 
        '#form.conf#', 
        '#form.delegation#', 
        '#form.company#', 
        '#form.recipient#', 
        '#form.reason#',
        #form.eventid#,
        '#form.awardyear#'
)
     </cfquery>
</cfif>

 	<CFQUERY datasource="#dsnP21#" name="gethotels">
		SELECT *
		FROM awards
        ORDER BY awardyear DESC, id
		</CFQUERY>      
<table width="100%" border="0" cellspacing="5">
  <tr>
    <td >year</td>
    <td><strong>award name</strong></td>
    <td><strong>recipient</strong></td>
    <td><strong>Position</strong></td>
    <td><strong>company</strong></td>
    <td><strong>Description</strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<cfoutput query="gethotels">
  <tr>
  <td width="42" >#gethotels.awardyear#</td>
    <td >#gethotels.awardname#</td>
    <td >#LEFT(gethotels.recipient, 20)#</td>
    <td >#left(gethotels.delegation, 40)#</td>
    <td >#left(gethotels.company, 40)#</td>
    <td>#left(gethotels.conf, 25)#, </td>
    <td width="20"><a href="javascript:editHotel(#gethotels.id#)"><img src="../img/new_edit.gif" border="0" /></a></td>
    <td width="20"><a href="javascript:deleteHotel(#gethotels.id#)"><img src="../img/new_delete.gif" border="0" /></a></td>
  </tr>
 </cfoutput>
</table>
		