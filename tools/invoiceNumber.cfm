

<!---
<cfscript>
	testdate	= CreateDate( "2013", "01", "01" );
	year = datePart("yyyy", testdate);
	bankID = 6;
</cfscript>

<!---find the locationID for the invoiceNumber string--->
<cfquery datasource="GPP" name="qryBank">
	SELECT 
    	[invoiceLocationCode]
    FROM 
    	[bankAccounts]
    WHERE
    	[bankID]  = <cfqueryparam cfsqltype="cf_sql_integer" value="#bankID#">
</cfquery>

<!--- serach invoices to find the last invoice in that year to increment ----->
<cfquery datasource="GPP" name="qryInvoices">
	SELECT TOP 1
    	[invoiceID]
        ,[invoiceNumber]
    FROM
    	[invoices]
    WHERE
    	[bankAccountID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#bankID#">
      	AND
        YEAR(invoiceDate) = <cfqueryparam cfsqltype="cf_sql_char" value="#year#">
        AND
        [currentInvoice] = 0
    ORDER BY
    	[invoiceID] DESC
</cfquery>


<cfscript>

	NumLen					= 5;
	new.year					= right(year, 2);
	new.locID					= qryBank.invoiceLocationCode;

	if ( qryInvoices.recordcount EQ 0 ){
		
		new.number				= '00000';
		new.InvNum				= new.year & new.locID & new.number;

	}else if ( qryInvoices.recordcount EQ 1 ){
		
		last.invNum				= qryInvoices.invoiceNumber;
		last.number 				= right(last.invNum, 5);
	
		new.number				= zeroPad(toString(last.number + 1));
		new.InvNum				= new.year & new.locID & new.number;
		
	}

	
	
	function zeroPad(n){
		
		pad_char = '00000';	
		pad = right(pad_char & n, 5);
		
		return pad;
	}
</cfscript>


<cfoutput>
	<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>Year: </td>
    <td>#year#</td>
  </tr>
  <tr>
    <td>BankID: </td>
    <td>#bankID#</td>
  </tr>
  <tr>
    <td>LocationID: </td>
    <td>#new.locID#</td>
  </tr>

  <tr>
    <td>new Number: </td>
    <td>#new.number#</td>
  </tr>
  <tr>
    <td>new Invoice : </td>
    <td>#new.InvNum#</td>
  </tr>
  <tr>
  	<td>new icrement number:</td>
    <td>#new.number#</td>
   </tr>
</table>

	<br>
    <br>
    <br>
    <br>
    
    
<cfdump var="#qryInvoices#">
</cfoutput>
--->

<cfscript>
		bankID = 3;
		invoiceNumOb 	= createObject("component", "OfficeXcfc.newInvoiceNumber");
		InvNum		= invoiceNumOb.CreateNewInvoiceNumber(bankID);
</cfscript>
<cfoutput>#InvNum#</cfoutput>