<cfinclude template="../application.cfm">

<cfquery datasource="#gpp#" name="qryInvoices">
 	select  *
	from CRM_Invoices_User
	WHERE user_id = #form.id#<!--- <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >--->
        ORDER BY ID DESC
</cfquery>

<script type="text/javascript" src="../javascript/Vtip/vtip-min.js"></script>
<script type="text/javascript" >
$(document).ready(function(){
$('#tabs_invoice').tabs();

});
</script>

<cfinclude template="../user_functions/dsp_index.cfm">

<table  border="0" cellspacing="1" cellpadding="4" class="tableClientHeader">
      <tr >
        <td width="80">Invoice No</td>
        <td width="250">Event</td>
        <td width="60">Type</td>
        <td width="280">Invoice Comment</td> 
        <td width="50">Discount</td>

      </tr>
</table>
<div id="paneLeft">
<table  border="0" cellspacing="1" cellpadding="4" id="tableClientIncoices" >
<cfoutput query="qryInvoices">
      <tr id="invoice_#qryInvoices.id#"  
      onclick="javascript:Edit_Invoice(#qryInvoices.id#);"
      style="<cfif qryInvoices.chkDelegate EQ 1 OR  qryInvoices.chkExhibitor EQ 1 OR qryInvoices.chkSponsor EQ 1><cfif qryInvoices.paid eq 'No' or qryInvoices.paid eq "" >color:##fff; background-color:##c61d1d</cfif></cfif>" 
		class="vtip" title="
                 		<cfif qryInvoices.Invoice_Sent_Date NEQ ""> <strong>Invoice Sent</strong>: #dateFormat(qryInvoices.Invoice_Sent_Date, "dd mmm yyyy")#</cfif>
                		<cfif qryInvoices.invoiceProcessPayment NEQ "" ><br /><strong>Payment In process</strong>: #dateFormat(qryInvoices.invoiceProcessPayment, "dd mmm yyyy")# </cfif>
						<cfif qryInvoices.Cancel_Reason NEQ ""><br /><strong>Cancell</strong>: #qryInvoices.Cancel_Reason#<br><strong>Cancell date</strong>: #dateformat(qryInvoices.Cancel_Date, "dd mmm yyyy")#</cfif>
						<cfif qryInvoices.reActivate_date NEQ "" ><br><strong>Reactiveated on</strong>: #dateformat(qryInvoices.reActivate_date, "dd mmm yyyy")#</cfif>
                        <cfif qryInvoices.registrationDate NEQ ""><br><strong>Registered on the</strong>:  #dateformat(qryInvoices.registrationDate, "dd mmm yyyy")#</cfif>
                        <cfif qryInvoices.staffUserName NEQ 0><br><strong>Registered by</strong>:  #qryInvoices.staffUserName#</cfif>
                        <cfif qryInvoices.InvoiceNoteid NEQ ""><br><strong>Comments</strong> check history tab for mor details</cfif> "
        >
        <td>#qryInvoices.InvoiceNo_LNK# &nbsp;&nbsp;&nbsp;</td>
        <td>#qryInvoices.event#&nbsp;</td>
        <td><cfif qryInvoices.chkDelegate EQ 1 >delegate
					<cfelseif qryInvoices.chkSpeaker EQ 1>speaker
                    <cfelseif qryInvoices.chkGuest EQ 1>guest
                    <cfelseif qryInvoices.chkModerator EQ 1>moderator
                    <cfelseif qryInvoices.chkExhibitor EQ 1>exhibitor
                    <cfelseif qryInvoices.chkPress EQ 1>press
                    <cfelseif qryInvoices.chkResearch EQ 1>research
                    <cfelseif qryInvoices.chkSponsor EQ 1>sponsor</cfif>
        </td>
        <td>#qryInvoices.INVComments#
        <cfif qryInvoices.InvoiceNoteid NEQ "">
           <div style="color:##FFF; padding: 0px 10px; width:25px">
            	<div class="ui-state-error ui-corner-all" style="padding: 0pt 0.1em;"><em class="ui-icon ui-icon-alert"></em></div>
            </div>
        </cfif>
        </td>
        <td <cfif qryInvoices.cancelled EQ 1 >style="background-color:##f9e60e;"</cfif>>% #qryInvoices.discountValue#</td>
      </tr>
 </cfoutput>
       <tr>
        <td width="80"></td>
        <td width="250"></td>
        <td width="60"></td>
        <td width="280"></td>
        <td width="50"></td>
      </tr>
    </table>

<div class="clear"></div>
</div>
<div id="paneRightInvoice">
            <div id="tabs_invoice" style="min-height:496px">
                        <ul>
                            <li><a href="#invoice_details">Details</a></li>
                            <li><a href="#invoice_history">History</a></li>
                            <li><a href="#invoice_Cancel">Cancellations/Refunds</a></li>
                        </ul>
                       <div id="invoice_details" >
                                <div id="areaEdit_Invoice"></div>
                        </div>
                        <div id="invoice_history">
                                <div id="area_invoice_History"></div>
                        </div>
                        <div id="invoice_Cancel" >
                                <div id="area_invoice_cancel"></div>
                                <div class="clear"></div>
                        </div>
            </div> 
</div>

<!---		$(".INVComments").editable("Update_Invoice.cfm?fieldname=INVComments", { 
				id   		: 'id',
				name 	: 'INVComments',
				indicator : '<img src="../img/indicator.gif">',
				type   	: "textarea",
				width		:  290,
				height	: 50,
				style  	: "inherit",
				onblur 	: 'submit',
			  });--->