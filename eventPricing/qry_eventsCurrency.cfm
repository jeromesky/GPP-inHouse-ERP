
<cfparam default="0" name="form.parentID" >

<cfquery datasource="#gpp#" name="eventCurrency">

	SELECT TOP 1
    	eventCurrencyLabel
    FROM
    	eventPrices
    WHERE
    	eventParentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#">
        AND
        (eventPriceValue <> 0 AND eventID <> 0)


</cfquery>