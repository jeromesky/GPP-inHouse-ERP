<cfquery datasource="#gpp#" name="qryUser">
SELECT
	strFirst_Name AS userName
    ,strSurname AS userSurname
FROM
	[tblIndividual]
WHERE 
	IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">
</cfquery>

<cfloop list="#form.invoiceID#" index="i" delimiters=",">
  <cfquery datasource="#gpp#" name="qryEvents">
    UPDATE 
    	tblInvoiceDetails
    SET 
    	GPP_bankAccount 	= 13
      ,transactionStaffID	= <cfqueryparam cfsqltype="cf_sql_integer" value="#trim(session.gpp_id)#">
      ,discountValue	= <cfqueryparam cfsqltype="cf_sql_integer" value="#trim(form.discountVal)#">
      ,cost			= <cfqueryparam cfsqltype="cf_sql_decimal" value="#trim(form.cost)#">
      ,costDiscount	= <cfqueryparam cfsqltype="cf_sql_decimal" value="#trim(form.costDiscount)#">
      ,costVat		= <cfqueryparam cfsqltype="cf_sql_decimal" value="#trim(form.costVat)#">
      ,costTotal	= <cfqueryparam cfsqltype="cf_sql_decimal" value="#trim(form.costTotal)#">
      ,totalGBP		= <cfqueryparam cfsqltype="cf_sql_decimal" value="#trim(form.totalGBP)#">
    WHERE
    	INVRecIDX = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#"> 
  </cfquery>
</cfloop>

<cfset Pid = (RandRange(1000, 9999) & RandRange(1000, 9999))> 
<cfscript>
	url 			= '';
	desc 			= '&desc=description';
	event			= '&event=#URLEncodedFormat(form.events)#';
	payment_amount	= '&payment_amount=#trim(numberformat(form.totalGBP,'9999.99'))#';
	currency		= '&currency=GBP';
	product_code	= '&product_code=#Pid#';
	name 			= '&name=#qryUser.userName#';
	surname			= '&surname=#qryUser.userSurname#';
	Pid				= '&Pid=#Pid#';
	process			= "&process=internal";
	invoiceIDs		= "&invoiceIDs=#form.invoiceID#";
</cfscript>

<cflocation url="https://www.netbanx.com/cgi-bin/payment/globalpacific-petro21?#desc##event##payment_amount##currency##product_code##name##surname##Pid##process##invoiceIDs#">
<!---
<cfoutput>
#desc# 			<br>
#event#			<br>
#payment_amount#<br>
#currency#		<br>
#product_code#	<br>
#name# 			<br>
#surname#		<br>
#Pid#			<br>
</cfoutput>--->

<!---
<cfdump var="#qryEvents#">
<cfset location	= "#url##desc##event##payment_amount##currency##product_code##name##surname##Pid#">
<cfdump var="#location#">

, AConfID, AConfCode, IND_ID, Conf_Reg_ID, InvoiceNo_LNK, InvoiceAmount, InvoicePaid, InvPDBank, InvPDBankNumber, 
                      InvPDDateNum, INVCancelled, InvCanDateNum, UpdateBy, UpdateDateNum, INVComments, InvRefunded, InvRefundComment, InvRefundDateNum, 
                      RefundAmount, INVCancelledNo, , Comment_Public, Comment_Paid_Status, Invoice_Sent, Invoice_Sent_Date, 
                      invoiceProcessPayment,
					  
                      SELECT     dbo.tblAnnual_Conf.groupby, dbo.tblAnnual_Conf.event_name AS eventName, dbo.tblAnnual_Conf.event_expire AS eventExpire, 
                      dbo.tblConference_Registration.lngIndividual_ID AS userID, dbo.tblAnnual_Conf.event_cost_currency AS eventCurrency, 
                      dbo.tblAnnual_Conf.event_cost_us AS eventCost, dbo.tblAnnual_Conf.event_type, dbo.tblConference_Registration.chkDelegate, 
                      dbo.tblConference_Registration.chkExhibitor, Countries_1.countryVat AS userVat, Countries_1.countryNameEN AS userCountry, 
                      dbo.tblInvoiceDetails.discountValue, dbo.tblInvoiceDetails.INVComments, dbo.tblAnnual_Conf.event_loc_country AS eventCountry, 
                      Countries_1.countryID, dbo.tblInvoiceDetails.INVRecIDX AS invoiceID
FROM         dbo.tblConference_Registration INNER JOIN
                      dbo.tblAnnual_Conf ON dbo.tblConference_Registration.lngConference_ID = dbo.tblAnnual_Conf.IngConference_ID INNER JOIN
                      dbo.tblIndividual ON dbo.tblConference_Registration.lngIndividual_ID = dbo.tblIndividual.IngIndividual_ID INNER JOIN
                      dbo.Countries AS Countries_1 ON dbo..countryID = Countries_1.countryID LEFT OUTER JOIN
                      dbo.tblInvoiceDetails ON dbo.tblConference_Registration.IngClient_Conf_ID = dbo.tblInvoiceDetails.Conf_Reg_ID --->