Remove abort
<cfabort>

<cfquery datasource="gpp" name="qrybookings">
SELECT
    TOP 300 dbo.tblConference_Registration.IngClient_Conf_ID
   , dbo.tblConference_Registration.lngConference_ID
   , dbo.tblConference_Registration.lngIndividual_ID
   , dbo.tblConference_Registration.strInvoice_No
   , dbo.tblConference_Registration.chkPaid
   , dbo.tblConference_Registration.insertdate
   , dbo.tblInvoiceDetails.InvoicePaid
   , dbo.tblConference_Registration.registerdBy
   , dbo.tblInvoiceDetails.InvoiceNo_LNK 
FROM
    dbo.tblConference_Registration 
    INNER JOIN dbo.tblInvoiceDetails ON dbo.tblConference_Registration.IngClient_Conf_ID = dbo.tblInvoiceDetails.Conf_Reg_ID 
WHERE
    (dbo.tblConference_Registration.ChkCancelled <> 1) 
AND (dbo.tblConference_Registration.chkDelegate = 1) 
AND InvoiceNo_LNK <> '' 
GROUP BY
    dbo.tblConference_Registration.IngClient_Conf_ID
   , dbo.tblConference_Registration.lngConference_ID
   , dbo.tblConference_Registration.lngIndividual_ID
   , dbo.tblConference_Registration.strInvoice_No
   , dbo.tblConference_Registration.insertdate
   , dbo.tblInvoiceDetails.InvoicePaid
   , dbo.tblConference_Registration.registerdBy
   , dbo.tblInvoiceDetails.InvoiceNo_LNK
   , dbo.tblConference_Registration.strInvoice_No
   , dbo.tblConference_Registration.chkPaid HAVING (dbo.tblConference_Registration.lngConference_ID IN (689, 688, 687, 686)) 
AND (dbo.tblInvoiceDetails.InvoicePaid = N'no') 
ORDER BY
    dbo.tblInvoiceDetails.InvoiceNo_LNK
   , dbo.tblConference_Registration.lngIndividual_ID
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Import</title>
</head>

<body>
Bookings <cfoutput>#qrybookings.recordcount#</cfoutput>
<table border="1">
<cfoutput query="qrybookings" group="InvoiceNo_LNK"><tr><cfset bookingREF = '#CreateUUID()#'>
    	<td colspan="15">#InvoiceNo_LNK# #bookingREF#</td>
    </tr>
    <tr>
<th>bookingID</th>
<th>bookingReference</th>
<th>insertDate</th>
<th>sourceID</th>
<th>delegateUserID</th>
<th>bookingType</th>
<th>eventID</th>
<th>priceCurrency</th>
<th>payment</th>
<th>bookingComment</th>
    </tr>
    <cfoutput><tr>
    	<td>?</td>
    	<td>#bookingREF#</td>
        <td>#insertdate#</td>
        <td>#registerdBy#</td> 
    <td>#LNGINDIVIDUAL_ID#</td>
        <td>1</td>
      <td>#LNGCONFERENCE_ID#</td>
        <td>GBP</td>
        <td>0</td>
        <td>DBimport: #InvoiceNo_LNK#</td>
    </tr>
	<!--- sql for insert here to bookings --->
    <cfquery datasource="gpp" name="insertbookings">
    INSERT INTO [GPP].[dbo].[bookings]
           ([bookingReference]
           ,[insertDate]
           ,[sourceID]
           ,[delegateUserID]
           ,[bookingType]
           ,[eventID]
           ,[priceCurrency]
           ,[payment]
           ,[bookingComment]
           )
     VALUES
           (
           '#bookingREF#'
           ,'#insertdate#'
           ,'#registerdBy#'
           ,#LNGINDIVIDUAL_ID#
           ,1
           ,#LNGCONFERENCE_ID#
           ,'GBP'
           ,0
           ,'DBimport: #InvoiceNo_LNK#'
           )
    </cfquery>       
    
	</cfoutput>
    
    <!--- sql for insert here to invoices --->	
	
	</cfoutput>
 </table>
</body>
</html>