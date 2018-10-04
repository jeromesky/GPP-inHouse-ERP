<cfdump var="#form#">
<cfquery datasource="#gpp#" name="qryUpdateInvoice">
	UPDATE invoices
    SET
    processSteps					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.processSteps#">
    
    <cfif parameterexists(form.paymentClearanceDate) AND len(form.paymentClearanceDate) GT 4 >
    	,paymentClearanceDate 	= <cfqueryparam cfsqltype="cf_sql_date" value="#form.paymentClearanceDate#">
    </cfif>
    
     <cfif parameterexists(form.paymentClearanceDate) AND len(form.paymentClearanceDate) GT 4>
    	,gw_paymentDate				= <cfqueryparam cfsqltype="cf_sql_date" value="#form.gw_paymentDate#">
    </cfif>
    
     <cfif parameterexists(form.invoiceTaxNo) AND len(form.invoiceTaxNo) GT 3>
    	,invoiceTaxNo					= <cfqueryparam cfsqltype="cf_sql_char" value="#form.invoiceTaxNo#">
    </cfif>
    
    <cfif len(form.invoiceTaxNo) GT 4>
    	,InvoiceCarbonCopy			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.InvoiceCarbonCopy#">
    </cfif>    
    
    WHERE
    	[bookingref] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingRef#">

</cfquery>



<cflocation addtoken="no" url="../bookings/?fa=bookings">