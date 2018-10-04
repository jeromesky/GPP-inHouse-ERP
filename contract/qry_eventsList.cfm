
<cfquery datasource="#gpp#" name="getweeks">
 	select  
    	[eventName]
        ,[eventID]
	from 
    	[crm_events_listNames]
    WHERE   eventType = <cfqueryparam cfsqltype="cf_sql_char" value="week" >
</cfquery>

