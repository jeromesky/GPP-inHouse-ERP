<cfquery name="get" datasource="#gpp#">
	SELECT 
    	 [status],
       [userID]
    FROM
    	[CRM_Status]
    WHERE
    	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>