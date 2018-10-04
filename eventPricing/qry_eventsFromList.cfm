<cfsilent>
<cfparam name="eventPriceCombination" default="0">

<cfquery datasource="#gpp#" name="qryEventsNamesFromList">
SELECT 
	eventID
    ,[event_name]
FROM
	[CRM_events]
    
    <cfif eventPriceCombination NEQ 0>
WHERE 
	eventID IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#qryPriceCombinations.eventPriceCombination#">)
    </cfif>
    
    
     <cfif eventID NEQ 0>
WHERE 
	eventID = <cfqueryparam cfsqltype="cf_sql_integer"  value="#eventID#">
    </cfif>
    
</cfquery>
</cfsilent>
<cfoutput><cfloop query="qryEventsNamesFromList">#qryEventsNamesFromList.event_name#<br /></cfloop></cfoutput>