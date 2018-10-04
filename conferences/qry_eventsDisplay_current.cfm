
<cfparam default="#dateAdd('d', -7, now())#" name="form.eventExpire" type="date">
<cfparam default="'event', 'din','EB', 'bu_pr'"name="form.eventType">
<cfparam default="2" name="form.conferenceID">

<cfquery datasource="#gpp#" name="qryEvents">
	SELECT
    	[eventID]
		,[eventName]
        ,[eventYear]
    FROM
    	[CRM_Events]
    WHERE
    	[conferenceID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.conferenceID#">
   AND
    	[event_Type] IN ('event', 'din','EB', 'bu_pr')<!--- --->
    AND
    	[event_expire] >= <cfqueryparam cfsqltype="cf_sql_date" value="#form.eventExpire#">
</cfquery>