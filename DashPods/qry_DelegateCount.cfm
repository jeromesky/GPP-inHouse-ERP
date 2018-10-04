<cfquery name="getEventList" datasource="#gpp#" cachedWithin="#CreateTimeSpan(0,4,0,0)#">
SELECT  
		[eventYear]
    ,[eventName]
    ,[eventID]
  FROM 
  		[DashPod_DelegateCount]
  ORDER BY 
  		[event_expire]
</cfquery>