<cfinclude template="../Application.cfm">

 <cfquery datasource="#dsnP21#" name="getTheme">
UPDATE   docs 
SET
GKB = <cfif form.rating eq 1 >1<cfelse>0</cfif>
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#" >
</cfquery>