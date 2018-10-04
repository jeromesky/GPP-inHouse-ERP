<cfif NOT parameterexists(form.userid)>
<cfset userid = #form.id#>
<cfelse>
<cfset userid = #form.userid#>
</cfif>

<cfquery name="get" datasource="#gpp#">
	SELECT 
    	 [strPersonal_Info]
         ,[Perasonal_info_public]
        ,[userID]
    FROM
    	[CRM_personalNote]
    WHERE
    	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#userid#">
</cfquery>
