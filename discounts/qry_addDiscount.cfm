
<cfsilent>
<cfquery datasource="#gpp#" name="qryAddDiscount">
	INSERT INTO eventPrices
    	(
         [eventID]
         ,[eventParentID]
         ,[eventPricePercentDate]
         ,[eventPricePercent]
         ,[eventPriceDateApplied]
        )
     VALUES
     	(
        <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#form.eventPricePercentDate#">
        ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#form.eventPricePercent#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        )
      SELECT @@IDENTITY AS eventPriceID

</cfquery>
<cfparam name="form.eventPriceID" default="#qryAddDiscount.eventPriceID#" type="integer">
</cfsilent>
<cfinclude template="dsp_discounts.cfm">