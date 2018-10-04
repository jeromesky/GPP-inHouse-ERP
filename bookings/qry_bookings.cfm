<cfparam name="form.searchBookings" default="">

<cfquery datasource="#gpp#" name="qryBookings">
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
      ,[insertDate]
      ,[bookingReference]
      ,[processSteps]
      ,CASE WHEN payment = 0 THEN 'Declined Transactions'
      WHEN payment = 1 THEN 'Approved Card Transactions'
      WHEN payment = 2 THEN 'Approved Bank Transfer'
      WHEN payment = 3 THEN 'Requested Bank Transfer'
      WHEN payment = 4 THEN 'Approved Cheque Payment'
      WHEN payment = 5 THEN 'Requested Cheque Payment'
      WHEN payment = 6 THEN 'Approved Cash Payment'
      WHEN payment = 7 THEN 'Requested Cash Payment'
      WHEN payment = 8 THEN 'Approved Email to Client form'
      WHEN payment = 9 THEN 'Sent Email to Client for online payment form'
      END AS payment
      ,payment AS paymentID
      ,[branchID]
       [invoiceLocationID]
FROM 
  	[CRM_booking_lineItem]
WHERE    
<cfif form.searchBookings NEQ "">
	[name] LIKE '%#form.searchBookings#%'
    OR
    [lastName] LIKE '%#form.searchBookings#%'
    OR
    [bookingReference] LIKE '%#form.searchBookings#%'
<cfelse>
	[payment] NOT IN ( 2,4,6,8 )
</cfif>
ORDER BY
	[payment], [insertDate]
</cfquery>



<cfquery dbtype="query" name="qryCards">
SELECT 
	DISTINCT
	COUNT(bookingReference) AS cardsTotal
FROM
	[qryBookings]
WHERE
	[paymentID] = 0
</cfquery>

<cfquery dbtype="query" name="qryTransfer">
SELECT 
	DISTINCT
	COUNT(bookingReference) AS transferTotal
FROM
	[qryBookings]
WHERE
	[paymentID] = 3
</cfquery>

<cfquery dbtype="query" name="qryEmail">
SELECT 
	DISTINCT
	COUNT(bookingReference) AS emailTotal
FROM
	[qryBookings]
WHERE
	[paymentID] = 9
</cfquery><!------>