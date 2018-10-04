
<cfparam name="form.eventPriceID" default="0" type="integer">
<cfparam name="form.eventID" default="0" type="integer">
<cfparam name="form.parentID" default="0" type="integer">

<cfquery datasource="#gpp#" name="qryDiscounts">
	SELECT 
    	  [eventPriceID]
         ,[eventPricePercentDate]
         ,[eventPricePercent]
         ,[eventPriceDateApplied]
    FROM
    	[eventPrices]
      
    WHERE 
    	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
      
      <cfif form.eventPriceID NEQ 0>
      	AND
      	[eventPriceID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventPriceID#">
	</cfif>
    
    ORDER BY [eventPriceDateApplied]
</cfquery>