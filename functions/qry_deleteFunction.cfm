<cfsilent>
<cfquery datasource="#gpp#">
	DELETE 
    FROM functions 
    WHERE functionID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.functionID#">
</cfquery></cfsilent><cfoutput>#form.functionID#</cfoutput>