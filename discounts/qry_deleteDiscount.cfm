<cfsilent>
<cfquery datasource="#gpp#" name="qry_delDiscount">
	DELETE
    FROM
    	[eventPrices]
    WHERE 
    	[eventPriceID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventPriceID#">
</cfquery>
</cfsilent>
<cfoutput>#form.eventPriceID#</cfoutput>