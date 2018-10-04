
<!---///////////FIND IF INVOICE ALREADY EXSISTS----------------->
<cfquery datasource="#gpp#" name="qryFindInvoice">
	SELECT TOP 1 
    	[bookingREF]
        ,[invoiceID]
    FROM
    	[invoices]
   WHERE
   		[bookingREF] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">
</cfquery> 



<cfif qryFindInvoice.recordCount EQ 0>

        <cfquery datasource="#gpp#" name="qryMakeInvoice">
        INSERT INTO [invoices] 
        	(
		 	 [invoicePrice]
             ,[invoiceTAXvalue]
            ,[invoicePriceTAX]
            ,[currency_code]
            ,[bookingREF]
			,[invoiceDate]
		 	,[branchID]
            ,[InvoiceCarbonCopy]
        	)
        VALUES
        	(
            <cfqueryparam cfsqltype="cf_sql_decimal" value="#qryInvoiceTotal.InvoiceTotal#">
             ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#qry_taxTotal.VATAMOUNT#">
            ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#qry_taxTotal.vatTotal#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#qryAttendents.priceCurrency#"> 
           ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">
           ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchID#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.contactName#">
            )
            SELECT @@IDENTITY AS invoiceID
        </cfquery>
        
        <cfset var.invoiceID = qryMakeInvoice.invoiceID>
 
<cfelseif qryFindInvoice.recordCount EQ 1>

		<cfquery datasource="#gpp#" name="qryUpdateInvoice">
        UPDATE [invoices]
        SET
		 	 [invoicePrice] 				= <cfqueryparam cfsqltype="cf_sql_decimal" value="#qryInvoiceTotal.InvoiceTotal#">
             ,[invoiceTAXvalue]		= <cfqueryparam cfsqltype="cf_sql_decimal" value="#qry_taxTotal.VATAMOUNT#">
            ,[invoicePriceTAX]		= <cfqueryparam cfsqltype="cf_sql_decimal" value="#qry_taxTotal.vatTotal#">
            ,[currency_code]			= <cfqueryparam cfsqltype="cf_sql_char" value="#qryAttendents.priceCurrency#"> 
            ,[bookingREF]				= <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">
			,[invoiceDate]				= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
		 	,[branchID]					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchID#">
            ,[InvoiceCarbonCopy]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactName#">
        WHERE
        	[invoiceID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryFindInvoice.invoiceID#">
        </cfquery>
		<cfset var.invoiceID = qryFindInvoice.invoiceID>
</cfif>