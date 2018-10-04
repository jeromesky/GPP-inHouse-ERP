<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#">
DELETE 
FROM #form.table#
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>