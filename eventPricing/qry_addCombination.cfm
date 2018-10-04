
<cfset eventPriceCombination = replace(form.eventPriceCombination, "&set[]=", ",", "ALL")  >
<cfset eventPriceCombination = replace(eventPriceCombination, "set[]=", "", "ALL")  >

<cfset eventPriceCombination = listSort(eventPriceCombination, "Numeric", "asc", "," ) >

<cfset parentID = form.parentID>
<cfparam name="eventPriceType" default="1">

<cfquery datasource="#gpp#" >
	INSERT INTO eventPrices 
    		(
            eventPriceValue
            ,eventPriceCombination
            ,eventPriceDateApplied
            ,eventParentID
            ,eventCurrencyLabel
            )
    VALUES
    	( 
    		<cfqueryparam cfsqltype="cf_sql_decimal" value="#form.eventPriceValue#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#eventPriceCombination#">
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            ,<cfqueryparam cfsqltype="" value="#form.parentID#"> 
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.eventCurrency#">
            )

</cfquery>
<cfinclude template="dsp_selectedCombinations.cfm">

<!---<cfset eventPriceCombination = replace(eventPriceCombination, "s", ",", "ALL" ) >
<cfset eventIDList = eventPriceCombination>--->