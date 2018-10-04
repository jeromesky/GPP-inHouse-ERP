<cfquery name="get" datasource="#gpp#">
	SELECT TOP 1
    	 [username]
         ,[password]
        ,[userID]
    FROM
    	[CRM_UserLogin]
    WHERE
    	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>
