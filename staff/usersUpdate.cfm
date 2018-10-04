<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#">
UPDATE 
	gppusers 
SET
<cfif parameterexists(url.tel)>
	tel = '#url.tel#'
</cfif>
<cfif parameterexists(url.password)>
	password = '#url.password#'
</cfif>
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="url.id">
</cfquery>