<cfset getGroup = listGetAt(url.secondaryid, 1, ",")>
<cfset getyear = listGetAt(url.secondaryid, 2, ",")>
<cfset events = "">
<cfset invoiceIDset = "">
<cfset cost = 0>
<cfset vatTotal = 0>

<cfquery datasource="#gpp#" name="qryEvents">
    SELECT  
          [eventName]
          ,[eventCurrency]
          ,[eventCost]
          ,[userVat]
          ,[userCountry]
          ,[discountValue]
          ,[INVComments]
          ,[eventCountry]
          ,[countryID]
          ,[invoiceID]
    FROM 
        [CRM_Individual_PayEvents]
    WHERE
        groupby = <cfqueryparam cfsqltype="cf_sql_integer" value="#getGroup#"> 
    AND
        YEAR(eventExpire) = <cfqueryparam value="#getyear#"> 
    AND
        userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#"> 
    AND
        event_type IN (N'event', N'eb', N'din', N'bu_pr')
</cfquery>
 <!---<cfdump var="#qryEvents#">--->

<cfif qryEvents.countryID EQ 224>
	<cfset userVat = #qryEvents.userVat#>
<cfelse>
    <cfset userVat = 0>
</cfif>
	
<cfloop query="qryEvents">
	<cfset cost = cost + qryEvents.eventCost>
    <cfset invoiceIDset = listAppend(invoiceIDset, #qryEvents.invoiceID#, ",") >
    <cfset events =  listAppend(events, qryEvents.eventName, ",")>
</cfloop>

<cfscript>
	if (qryEvents.discountValue EQ ''){
		discountValue = 0;
	}else{
		discountValue = qryEvents.discountValue;
	}
	discountCost = NumberFormat(cost - ( (cost/100) * discountValue  ) , "___.__");
	vatTotal = discountCost  * (userVat / 100);
</cfscript>
<!--- <cfdump var="#userVat#"><cfdump var="#invoiceIDset#"><cfdump var="#cost#"> --->