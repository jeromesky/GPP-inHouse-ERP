

<cfquery name="qry_event" datasource="#gpp#">
	SELECT
    	[eventID]
    	,[event_name]
        ,[presentationCost]
        ,[presentationCurrency]
        ,[event_type]
        ,[event_abbr]
     FROM
     	[CRM_events]
     WHERE
     	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
</cfquery>