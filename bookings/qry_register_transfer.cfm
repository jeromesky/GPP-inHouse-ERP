

<cfquery datasource="#gpp#" name="qryUpdateInvoice">

UPDATE [invoices]
SET 
	 [gw_status] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.gw_status#">
    ,[gw_REF]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.gw_REF#">
    <cfif parameterexists(booking.payment_type)>
    ,[payment_type] = <cfqueryparam cfsqltype="cf_sql_char" value="#booking.payment_type#">
    </cfif>
WHERE
	[invoiceID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.invoiceID#">
	AND
    [bookingREF] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">
</cfquery>  