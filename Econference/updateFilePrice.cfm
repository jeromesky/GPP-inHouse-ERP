<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get">

UPDATE docs
SET  cost = <cfqueryparam cfsqltype="cf_sql_money" value="#form.cost#" >
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<cfoutput>#numberFormat(form.cost, "9999.99")#</cfoutput>