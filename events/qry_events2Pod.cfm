

<cfquery datasource="#gpp#" name="qryEvents">
SELECT 
	eventID
    ,[event_name]
    ,YEAR(event_expire) AS eventYear
FROM
	[CRM_events]
WHERE
	[event_type] 				IN ('event', 'eb', 'bu_pr') AND
    YEAR(event_expire) = #datepart('yyyy', now())# AND
    [event_expire] 			<= <cfqueryparam cfsqltype="cf_sql_date" value="#dateAdd('d', 28, now())#"> AND
    [live] 							= 1
ORDER BY
	[event_expire]  DESC
</cfquery>