

<cfif parameterexists(url.invoiceID) AND IsValid("numeric",url.invoiceID)>
<cfquery datasource="#gpp#" name="qryInvoices" >
    SELECT
         [filename]
        ,[invoiceID]
        ,[invoiceYear]
        ,[invoiceCurrency]
        ,[filename]
    FROM
    	[invoicesPassed]
    WHERE
    	[invoiceID] =  <cfqueryparam cfsqltype="cf_sql_char" value="#url.invoiceID#">
</cfquery>

<cffile 
action="copy" 
source="G:\files\invoices\Invoices#qryInvoices.invoiceYear#\#qryInvoices.invoiceCurrency#\#qryInvoices.filename#" 
destination="G:\websites\my-office\_files\temporary" 
nameconflict="overwrite"
>


<cfheader name="content-disposition" value="attachment;filename=#qryInvoices.filename#">
<cfcontent type="application/pdf" file="http://www.petro21.com/my-office/_files/temporary/#qryInvoices.filename#" deletefile="yes">
</cfif>