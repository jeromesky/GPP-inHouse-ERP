<cfquery datasource="#gpp#" name="qryPriceCombinations" >
	SELECT
       	[eventPriceID]
    	,[eventPriceValue] 
        ,[eventPriceCombination] 
        ,[eventPriceDateApplied]
        ,[eventID]
        ,[eventCurrencyLabel]
     FROM
     	[eventPrices]
     WHERE
     	[eventParentID] = #parentID#
     <cfif eventPriceType EQ 1>
     	AND
     	[eventPriceCombination] <> '0'
     </cfif>
     <cfif eventPriceType EQ 2>
     	AND
     	[eventID] <> 0
        AND
        [eventPricePercent] = 0
     </cfif>
     
	ORDER BY 
    	[eventPriceDateApplied] DESC

</cfquery>