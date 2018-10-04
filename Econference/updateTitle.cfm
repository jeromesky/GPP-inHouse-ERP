<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get">

UPDATE speakers_program
SET  decription = '#form.newvalue#'
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<cfoutput>#form.newvalue#</cfoutput>