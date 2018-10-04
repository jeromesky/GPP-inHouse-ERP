

<cfquery datasource="#gpp#" name="qryEventLocation">
SELECT TOP 1 
		[countryName]
      ,[cityName]
      ,[venuRoom]
      ,[eventID]
      ,[countryID]
      ,[cityID]
      ,[VenueName]
      ,[venueID]
  FROM
  		[CRM_event_location]
  WHERE
  		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
</cfquery>