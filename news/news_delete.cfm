<cfif parameterexists(form.delete) >
<cfloop list="#form.delete#" delimiters="," index="i">
<cfquery datasource="#gpp#">
  DELETE 
  FROM news
  WHERE newsID = #i#
</cfquery>
</cfloop>
<cflocation url="index.cfm">

</cfif>

<cfif parameterexists(form.id) >
<cfquery datasource="#gpp#">
  DELETE 
  FROM news
  WHERE newsID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
</cfif>