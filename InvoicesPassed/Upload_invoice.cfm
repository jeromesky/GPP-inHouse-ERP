<cfinclude template="../application.cfm">
<!---<cfexecute name="C:\VPNConnection\GPPNetworkPath.bat" variable="data"><cfdump var="#data#"></cfexecute>--->
<cfif parameterexists(form.currency) >

 

		<cfset FolderPath = "192.168.254.1\files\Public\INVOICES" >
        <!---<cfset FolderInvoiceYear = "IN2482~1" >--->
        <cfset FolderInvoiceYear = "\Invoices#form.year#" >
        <cfset FolderInvoiceCurrency = "\#form.currency#" >
        <!---\#FolderInvoiceYear#\#FolderInvoiceCurrency# #form.year# --->
        <cffile action="Upload" filefield="form.invoice" destination="G:\files\invoices\Invoices#trim(form.year)#\#trim(form.currency)#" nameconflict="MAKEUNIQUE">
        
       <!--- G:\files\invoices\Invoices#FolderInvoiceYear#\#FolderInvoiceCurrency#--->
        <cfquery datasource="#gpp#">
        	INSERT INTO invoicesPassed
            	(
                eventID
                ,invoiceYear
                ,invoiceCurrency
                ,filename
                ,invoiceNumber
                )
        	VALUES
            	(
                
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.year#">
                ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.currency#">
                ,<cfqueryparam cfsqltype="cf_sql_char" value="#cffile.serverFile#">
                ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.invoiceNumber#">
                )
        </cfquery>
        
        <CFIF FileExists("G:\files\invoices\Invoices#trim(form.year)#\#trim(form.currency)#\#cffile.serverFile#")>
        	<cfquery datasource="#gpp#" name="qryInvoices" >
                SELECT
                     [filename]
                FROM
                    [invoicesPassed]
                WHERE
                    [invoiceNumber] =  <cfqueryparam cfsqltype="cf_sql_char" value="#form.invoiceNumber#">
            </cfquery>
            		<cfif qryInvoices.recordcount GTE 1>
            			File <cfoutput>#qryInvoices.filename#</cfoutput> is loaded to the database<br />
                    <cfelse>
                    	File was not registered onto the database, let Jerome know issue<br />
                    </cfif>
        			and is also loaded to the webserver
        <cfelse>
        		<cfquery datasource="#gpp#" name="qryInvoices" >
                SELECT
                     [filename]
                FROM
                    [invoicesPassed]
                WHERE
                    [invoiceNumber] =  <cfqueryparam cfsqltype="cf_sql_char" value="#form.invoiceNumber#">
            </cfquery>
        			<cfif qryInvoices.recordcount GTE 1>
            			File <cfoutput>#qryInvoices.filename#</cfoutput> is loaded to the database<br />
                    <cfelse>
                    	File was not registered onto the database, let Jerome know issue<br />
                    </cfif>
        
			cant find the file on the sever,<br /> please try again!!
		</CFIF>

<cfelse>

<script type="text/javascript">
$(document).ready(function() { 	

$('#uploadInvoice').submit(function() { 
		$(this).ajaxSubmit({ success: UploadSuccess});
		$('#tableUploadInvoice').css({'visibility' : 'hidden'});
		$('#messageUploadingInvoice').html("<img src=../img/ajax-loadBar.gif>");
		return false; 
    });
});

function UploadSuccess(data){
		var thisWindow = $("#uploadInvoice").parent().attr("id");
		$("#messageUploadingInvoice").html(data);
		$("#dspInvoices").html("file Loaded....");
		//$("#uploadInvoice")
		//$("#"+thisWindow).dialog("close");
		//$("#modalExternal").html(data);
}

</script>
<!---<cfdirectory action="list"  directory="H:\Public\INVOICES" name="path">
<cfdump var="#path#">--->
<cfoutput>
<form name="uploadInvoice" id="uploadInvoice" action="../InvoicesPassed/Upload_invoice.cfm">
<div id="messageUploadingInvoice"></div>
<table width="300" border="0" cellspacing="0" cellpadding="4" id="tableUploadInvoice">
  <tr>
    <td width="125">invoice year folder</td>
    <td width="175">
    <select name="year">
	<option value="2012">2012</option>
    	<option value="2011">2011</option>
        <option value="2010">2010</option>
        <option value="2009">2009</option>
        <option value="2008">2008</option>
        <option value="2007">2007</option>
    	<option value="2006">2006</option>
    </select></td>
  </tr>
    <tr>
    <td>currency folder</td>
    <td>
    <select name="currency">
    	<option value="CYP">Cyprus</option>
    	<option value="ZAR">South Africa</option>
        <option value="ZAR-2010-AEF">ZAR-2010-AEF</option>
        <option value="GBP">United Kingdom</option>
        
        <option value="EUR">Netherlands</option>
        <!---<option value="AUSD">AUSD</option>--->
    </select>    </td>
  </tr>
    <tr>
      <td colspan="2">file to upload</td>
    </tr>
    <tr>
    <td colspan="2"><input type="file" name="invoice" class="ui-corner-all"></td>
  </tr>
    <tr>
    <td>
    	<input type="hidden" name="eventID" value="#form.eventID#" />
        <input type="hidden" name="invoiceNumber" value="#form.invoiceNumber#" />
    </td>
    <td><cfif #form.invoiceNumber# EQ "">no Invoice number<cfelse><input type="submit" value="upload" class="ui-corner-all"></cfif></td>
  </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</cfoutput>
</cfif>