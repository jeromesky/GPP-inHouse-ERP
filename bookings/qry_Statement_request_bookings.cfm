<cfparam name="form.bookingREF" default="DEB4783F-1F29-65A5-4C7A1153DA25CA74">
<cfset gw_status= "declined">

<cfquery datasource="#gpp#" name="qryInvoice">
SELECT
			[invoiceDate]
		 	,[branchID]
            ,[InvoiceCarbonCopy]
            ,(dbo.ISZERO(dbo.invoices.fx_rate,1) * dbo.invoices.invoicePrice) AS invoicePrice
            ,(dbo.ISZERO(dbo.invoices.fx_rate,1) * dbo.invoices.invoicePriceTAX) AS invoicePriceTAX 
            ,(dbo.ISZERO(dbo.invoices.fx_rate,1) * dbo.invoices.invoiceTAXvalue) AS invoiceTAXvalue
            ,[gw_currency_code]
            ,[gw_status]
            ,[gw_REF]
FROM
	[invoices] 
WHERE
	[bookingREF] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">       
</cfquery>

<cfquery datasource="#gpp#" name="qryNarative">
SELECT 
 	[contentID]
      ,[contentCode]
      ,[contentName]
      ,[contentLabel]
      ,[contentText]
      ,[contentHTML]
      ,[contentDateAdded]
      ,[contentDateUpdated]
      ,[contentStaffIDadded]
      ,[contentStaffIDupdated]
      ,[oldID]
      ,[contentLayout]
      ,[contentHTML1]
      ,[contentHTML2]
      ,[contentHTML3]
      ,[contentHTML4]
      ,[contentDeleted]
  FROM
  		[contents]
	WHERE
    	[contentArea] = 'payment'
        AND 
        contentName	=  <cfqueryparam cfsqltype="cf_sql_char" value="#qryInvoice.gw_status#">
</cfquery>

<cfquery datasource="#gpp#" name="qryBooking_lineItems">
SELECT
	  [bookingID]
      ,[profileUserID]
      ,[delegateUserID]
      ,[bookingType]
      ,[eventID]
      ,[invitee]
      ,[status]
      ,[priceCurrency]
      ,[priceCost]
      ,[priceFull]
      ,[promoCode]
      ,[discount]
      ,[name]
      ,[lastName]
      ,[eventName]
      ,[Title]
      ,[bookingTypeLabel]
      ,[email]
FROM 
  	[CRM_booking_lineItem]
WHERE
	[bookingReference] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">
ORDER BY
	[lastName]
</cfquery>

<cfquery dbtype="query" name="qryBookingContact">
SELECT DISTINCT
	   [name]
      ,[lastName]
      ,[Title]
      ,[email]
      ,[bookingID]
FROM 
	[qryBooking_lineItems]
</cfquery>

<cfscript>
		returnNarativeVars = structNew();
		returnNarativeVars.gw_Ref			= qryInvoice.gw_REF;
		returnNarativeVars.bookingReference	= form.bookingREF;
		returnNarativeVars.GW_CURRENCY_CODE= qryInvoice.gw_currency_code;
		returnNarativeVars.INVOICEPRICETAX	= qryInvoice.invoicePriceTAX;

		narativeOutputP1 = "#qryNarative.contentHTML#";
		narativeOutputP2	 = "#qryNarative.contentHTML1#";
</cfscript>
<cfloop collection="#returnNarativeVars#" item="key">
  <cfset narativeOutputP1 = Replace(narativeOutputP1, "${" & key & "}",returnNarativeVars[key], "all")>
  <cfset narativeOutputP2 = Replace(narativeOutputP2, "${" & key & "}",returnNarativeVars[key], "all")>
</cfloop>