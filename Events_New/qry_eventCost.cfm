<cfquery name="get" datasource="#gpp#">
	SELECT
       [eventPriceID]
      ,[eventID]
      ,[eventPriceValue]
      ,[eventCurrencyLabel]
      ,[eventPriceDateApplied]
      ,[eventPricePercentDate]
      ,[eventPricePercent]
  FROM 
  		[eventPrices]
  WHERE
  		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
  ORDER 
 		BY eventPriceDateApplied

</cfquery>