<cfinclude template="../application.cfm">
<cfif parameterexists(form.group) >
	
    <cfquery datasource="#gpp#" name="getevents">
 		UPDATE tblConference
    	SET week = <cfqueryparam value="#form.group#" >
        WHERE IngCon_ID IN (#form.week#)
</cfquery>


<cfelse>


<cfquery datasource="#gpp#" name="get">
 	select  *
	from Conference_groups
</cfquery>

Select week
<form action="#" method="post" >
<select name="group" >
	<cfoutput query="get">
    	<option value="#get.id#">#get.name#</option>
    </cfoutput>
</select>
<div style=" clear:both; height:15px; margin-bottom:10px; border-bottom:1px solid #999999"></div>
<cfquery datasource="#gpp#" name="getevents">
 	select  tblConference.IngCon_ID, tblConference.strConference_Description, Conference_groups.name
	from tblConference
    LEFT JOIN Conference_groups 
    ON tblConference.week = Conference_groups.id
    
</cfquery>

<table cellpadding="4" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
	<cfoutput query="getevents">
	<tr>
    	<td>#getevents.strConference_Description#</td>
        <td>#getevents.name#</td>
        <td><input type="checkbox" name="week" value="#getevents.IngCon_ID#" /></td>
	</tr>
    </cfoutput>
</table>
<input type="submit" value="save" />
</form>
</cfif>