<!---<cfdump var="#form#">
<cfif parameterexists(form.STREETCOUNTRYID) AND form.STREETCOUNTRYID NEQ "">
	<cfset invoiceLocationID = form.STREETCOUNTRYID>
<cfelseif parameterexists(form.POSTALCOUNTRYID) AND form.postalcountryID NEQ "">
	<cfset invoiceLocationID = form.POSTALCOUNTRYID>
</cfif>--->

<cfquery datasource="#gpp#" name="qryAttendents">
SELECT
	  bookingID
      ,bookingReference
      ,profileUserID
      ,delegateUserID
      ,bookingType
      ,priceCurrency
      ,priceCost
      ,priceFull
      ,promoCode
      ,discount
      ,name
      ,lastName
      ,eventName
      ,Title
      ,invoiceLocationID
      ,eventLocationID
      ,bookingTypeLabel
      <!---[companyName]--->
  FROM 
  	[CRM_booking_lineItem]
WHERE
	[bookingReference] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">
ORDER BY
	[lastName]
</cfquery>


<cfquery dbtype="query" name="qryBookingsTotal">
	SELECT DISTINCT
       [name]
      ,[lastName]
      ,[priceFull]
    FROM
    	[qryAttendents]
</cfquery>


<cfquery dbtype="query" name="qryInvoiceTotal">
	SELECT 
      SUM(priceFull) AS InvoiceTotal
    FROM
    	[qryBookingsTotal]
</cfquery>


<!---///////////CALCULATE VAT FIOR INVOICE----------------->
<cfscript>
	amountIN 			= qryInvoiceTotal.InvoiceTotal;
	billingCountryIN= #qryAttendents.invoiceLocationID#;
	taxLocationIN	= #qryAttendents.eventLocationID#;
	currencyIN		= "#qryAttendents.priceCurrency#";
	taxOb 				= createObject("component", "Webcfc.vat");
  	qry_taxTotal 	= taxOb.vat(amountIN,billingCountryIN, taxLocationIN,currencyIN);
	
</cfscript>
