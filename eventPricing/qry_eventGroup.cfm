


<cfquery datasource="#gpp#" name="qryEventsGroup_names">
SELECT 
	 [eventID]
    ,[event_name]
FROM
	[CRM_events]
WHERE 
	parentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#"> AND
    event_type NOT IN ('spon', 'exh', 'week' )
</cfquery>