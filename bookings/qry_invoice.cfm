<cfparam name="var.invoiceIDp" default="20">


<cfquery datasource="#gpp#" name="qryInvoice">
SELECT TOP 1
       [bankAccountAccountNumber]
      ,[bankAccountDescriptionLabel]
      ,[bankAccountCompanyName]
      ,[bankAccountID]
      ,[processSteps]
      ,[branchID]
      ,[payment_type]
      ,[InvoiceCarbonCopy]
      ,[gw_paymentDate]
      ,[gw_payment_amount]
      ,[gw_status]
      ,[gw_trans_ID]
      ,[gw_REF]
      ,[gw_currency_code]
      ,[userID]
      ,[contactID]
      ,[currency_code]
      ,[invoiceTAXvalue]
      ,[invoiceDate]
      ,[invoicePrice]
      ,[invoicePriceTAX]
      ,[invoiceNarrative]
      ,[invoiceTaxNo]
      ,[subscriptionREF]
      ,[contractREF]
      ,[bookingREF]
      ,[cancellationDate]
      ,[cancellationReason]
      ,[oldInvoiceID]
      ,[invoiceID]
      ,[billingCountryName]
      ,[paymentClearanceDate]
FROM         
		[CRM_invoices]
WHERE
	<cfif parameterexists(url.bookingREF)>
	[bookingREF] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#url.bookingREF#">
    <cfelseif parameterexists(form.bookingREF)>
	[bookingREF] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.bookingREF#">
    <cfelse>
    [invoiceID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#var.invoiceID#">
    </cfif>
</cfquery>

<cfscript>
	var.invoiceID = qryInvoice.invoiceID;
</cfscript>

<!---<cfdump var="#qryInvoice#">--->

<cfif qryInvoice.recordcount EQ 1 AND qryInvoice.currency_code NEQ "GBP">
    <cfscript>
        xe.amount 		= qryInvoice.invoicePriceTAX;
        xe.currencyIN	= qryInvoice.currency_code;
        xe.currencyOUT= 'GBP';
        xe.fxOb = createObject("component", "officeCfc.fx");
      	xe.qry_fx_rate = xe.fxOb.xchange(xe.amount,'#xe.currencyIN#','#xe.currencyOUT#');
		qryInvoice.invoicePriceTAX = numberFormat(xe.qry_fx_rate, "99999.99");
    </cfscript>
</cfif>