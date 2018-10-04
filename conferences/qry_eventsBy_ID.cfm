<cfquery datasource="#gpp#" name="qryEvents">
	SELECT
    	[eventID]
		,[eventName]
        ,[eventPrice]
        ,[eventCurrency]
        ,[event_type]
        ,[countryID]
    FROM
    	[CRM_Events]
    WHERE
    	[eventID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.eventID#">)
	ORDER BY
    	[event_type]
</cfquery>