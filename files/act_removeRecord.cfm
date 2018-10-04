<cfsilent>
<cfquery datasource="#gpp#">
DELETE 
FROM 
  		[files]
WHERE
		[fileID] 	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileID#" >
</cfquery> 


</cfsilent>
<cfoutput>#form.fileID#</cfoutput>