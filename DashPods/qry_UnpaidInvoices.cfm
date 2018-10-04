<cfquery name="getUnpaidInvoices" datasource="#gpp#" cachedwithin="#CreateTimeSpan(1,0,0,0)#">
  SELECT 
    *
  FROM
    CRM_Incoices_UnpaidEvents
</cfquery>

<!---<cfquery name="getUnpaidInvoices" datasource="#gpp#">
SELECT top 100 * 
FROM
	CRM_Invoices_UnpaidLis
</cfquery>--->
<!---SELECT     dbo.tblAnnual_Conf.strConference_Name AS [Conference Name], 
                      dbo.tblInvoiceDetails.
FROM         dbo.tblIndividual INNER JOIN
                      dbo.tblInvoiceDetails ON dbo.tblIndividual.IngIndividual_ID = dbo.tblInvoiceDetails.IND_ID INNER JOIN
                      dbo.tblCompany ON dbo.tblIndividual.lngCompany_ID = dbo.tblCompany.IngCompany_ID INNER JOIN
                      dbo.tblAnnual_Conf ON dbo.tblInvoiceDetails.AConfID = dbo.tblAnnual_Conf.IngConference_ID
WHERE     (dbo.tblInvoiceDetails.InvoicePaid = N'no')--->