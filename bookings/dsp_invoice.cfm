

<script type="text/javascript">
$(document).ready(function() {
		$(".date").datepicker({dateFormat: "d MM yy"});
});
</script>
<br /><br />
<div class="c6">
<cfoutput>
<form action="../bookings/?fa=update-invoice" method="post">
<input type="hidden" name="bookingRef" value="#qryInvoice.bookingRef#" />

  <fieldset>
    <legend>Invoice #qryInvoice.invoiceID#</legend>
	<table>
    <tr>
        	<td>Booking Refefrence</td>
            <td>#qryInvoice.bookingRef#</td>
        </tr>
          <tr>
        	<td>invoiceDate</td>
           <td>#dateFormat(qryInvoice.invoiceDate, "ddd, dd mmm yyyy")#</td>
        </tr>
    	<tr>
    	  <td>Payment Type</td>
    	  <td>#qryInvoice.payment_type#</td>
  	  </tr>
        <tr>
        	<td>Payment Clearence Date</td>
           <td>
           	<cfif qryInvoice.paymentClearanceDate EQ "">
           		<input type="text" name="paymentClearanceDate" value="#dateFormat(qryInvoice.paymentClearanceDate, 'ddd, dd mmm yyyy')#" class="ui-corner-all date" />
           <cfelse>
           		#dateFormat(qryInvoice.paymentClearanceDate, "ddd, dd mmm yyyy")#
           </cfif></td>
        </tr>
        <tr>
        	<td>Payment Received Date</td>
           <td>
           <cfif qryInvoice.gw_paymentDate EQ "">
           		<input type="text" name="gw_paymentDate" value="#dateFormat(qryInvoice.gw_paymentDate, 'ddd, dd mmm yyyy')#" class="ui-corner-all date" />
            <cfelse>
           		#dateFormat(qryInvoice.gw_paymentDate, "ddd, dd mmm yyyy")#
           </cfif></td>
        </tr>
       <tr>
        	<td>&nbsp;</td>
           <td></td>
        </tr>
    	<tr>
        	<td>Status</td>
            <td><select name="processSteps">
            	<option value="0" <cfif qryInvoice.processSteps EQ 0>selected="selected"</cfif> >not aproved</option>
             	<option value="2" <cfif qryInvoice.processSteps EQ 2>selected="selected"</cfif> >Viewed</option>
                <option value="1" <cfif qryInvoice.processSteps EQ 1>selected="selected"</cfif>>Approved</option>
            </select></td>
        </tr>
        <!---<tr>
        	<td>oldInvoiceID</td>
            <td>#qryInvoice.oldInvoiceID#</td>
        </tr>
		<tr>
        	<td>oldInvoiceID</td>
            <td><input type="text" name="oldInvoiceID" value="" class="ui-corner-all" /></td>
        </tr>--->
        <tr>
        	<td>invoice Tax No</td>
           <td><input type="text" name="invoiceTaxNo" value="#qryInvoice.invoiceTaxNo#" class="ui-corner-all" /></td>
        </tr>

         <tr>
        	<td>invoiceNarrative</td>
           <td><textarea name="invoiceNarrative" class="ui-corner-all">#qryInvoice.invoiceNarrative#</textarea></td>
        </tr>
     
        <tr>
        	<td>Contact for this invoice</td>
           <td>#qryInvoice.contactID#</td>
        </tr>
        <tr>
        	<td>user Contact</td>
           <td>link to a user</td>
        </tr>
<!---        <tr>
        	<td>gw_currency_code</td>
           <td><input type="text" name="gw_currency_code" value="" class="ui-corner-all" /></td>
        </tr>
        <tr>
        	<td>gw_REF</td>
           <td><input type="text" name="gw_REF" value="" class="ui-corner-all" /></td>
        </tr>
        <tr>
        	<td>gw_trans_ID</td>
           <td><input type="text" name="gw_trans_ID" value="" class="ui-corner-all" /></td>
        </tr>
        <tr>
        	<td>gw_status</td>
           <td><input type="text" name="gw_status" value="" class="ui-corner-all" /></td>
        </tr>
        <tr>
        	<td>gw_payment_amount</td>
           <td><input type="text" name="gw_payment_amount" value="" class="ui-corner-all" /></td>
        </tr>
         <tr>
        	<td>gw_paymentDate</td>
           <td><input type="text" name="gw_paymentDate" value="" class="ui-corner-all" /></td>
        </tr>
        <tr>
        	<td>gw_paymentDate</td>
           <td><input type="text" name="gw_paymentDate" value="" class="ui-corner-all" /></td>
        </tr>
        <tr>
        	<td>payment_type</td>
           <td><input type="text" name="payment_type" value="" class="ui-corner-all" /></td>
        </tr>--->
        <tr>
        	<td colspan="2">
           <cf_contact_suggest  random="5585" displayReturn="contactEmail"  contactID="0" textName="InvoiceCarbonCopy" contact="#qryInvoice.InvoiceCarbonCopy#">
           Copy of invoice was sent to and will be to this address</td>
        </tr>
        <tr>
          <td> Billing Country</td>
          <td>#qryInvoice.billingCountryName#</td>
        </tr>
        <tr>
        	<td>GPP Bank</td>
           <td>#qryInvoice.bankAccountAccountNumber#<br />
      #qryInvoice.bankAccountDescriptionLabel#<br />
      #qryInvoice.bankAccountCompanyName#</td>
        </tr>
        <tr>
        	<td></td>
           <td><button >Save</button></td>
        </tr>
</table>

  </fieldset>
  
    <fieldset>
    <legend>Invoice Cancellation</legend>
  <table width="100%">
          <tr>
        	<td>Cancellation Reason</td>
           <td><textarea name="cancellationReason"  class="ui-corner-all" >#qryInvoice.cancellationReason#</textarea></td>
        </tr>
         <tr>
        	<td>Cancellation Date</td>
           <td><input type="text" name="cancellationDate" value="#dateFormat(qryInvoice.cancellationDate, "ddd, dd mmm yyyy")#"  class="ui-corner-all date"  /></td>
        </tr>
</table>
 </fieldset></cfoutput>
</div>

<div class="c6">
 <fieldset>
    <legend>attendends</legend>
    <table class="tableList" width="100%" cellspacing="4">
      <cfoutput query="qryAttendents" group="lastName">
      <tr>
      	<td colspan="4" class="groupLabel">#qryAttendents.name# #qryAttendents.lastname#</td>
        </tr>
        <cfoutput><tr>
        <td>#qryAttendents.eventName#</td>
        <td>#qryAttendents.bookingTypeLabel#</td>
        <td>%#qryAttendents.discount#</td>
        <td>#qryAttendents.priceCurrency# #qryAttendents.priceCost#</td>
      </tr></cfoutput></cfoutput>
    </table>
  </fieldset>
  <br />
  <br />

<cfoutput>
 <fieldset>
    <legend>Attendends total</legend>
    <table class="tableList" width="100%">
      <cfloop query="qryBookingsTotal"><tr>
        <td>#qryBookingsTotal.name# #qryBookingsTotal.lastname#</td>
        <td>#qryAttendents.priceCurrency# #qryBookingsTotal.pricefull#</td>
      </tr></cfloop>
    </table>
  </fieldset>
  <br />
  <br />
	  <fieldset>
    <legend>Invoice Cost</legend>
    <table class="tableList" width="100%">
      <tr>
        <td>Total net</td>
        <td>#qryAttendents.priceCurrency# #qryInvoiceTotal.INVOICETOTAL#</td>
      </tr>
      <tr>
        <td>Vat</td>
        <td>#qryAttendents.priceCurrency# #qry_taxTotal.vatAmount#</td>
      </tr>
      <tr>
        <td>Total amount</td>
        <td>#qryAttendents.priceCurrency# #qry_taxTotal.vatTotal#</td>
      </tr>
      <tr>
        <td>Total amount in GPP</td>
        <td>GPP #qryInvoice.invoicePriceTAX#</td>
      </tr>
    </table>
  </fieldset>
  
    <br />
  <br />
	  <fieldset>
    <legend>Gateway payment details</legend>
     <table class="tableList" width="100%">
      <tr>
        <td>Ref</td>
        <td>#qryInvoice.gw_REF#</td>
      </tr>
      <tr>
        <td>Trans_ID</td>
        <td>#qryInvoice.gw_trans_ID#</td>
      </tr>
      <tr>
        <td>Status</td>
        <td>#qryInvoice.gw_status# </td>
      </tr>
      <tr>
        <td>Payment_amount</td>
        <td>#qryInvoice.gw_currency_code# #qryInvoice.gw_payment_amount#</td>
      </tr>
       <tr>
        <td>Payment Date</td>
        <td>#dateFormat(qryInvoice.gw_paymentDate, "ddd, dd mm yyyy")#</td>
      </tr>
    </table>   
    </fieldset>
  <br />
  <br />
	  <fieldset></cfoutput>
</div>

</form>
<hr>

<div class="c12">
  <fieldset>
    <legend>Payment method</legend>
    <cfinclude template="gw_form_netBanx.cfm">
    <cfinclude template="gw_form_transfer.cfm">
    <cfinclude template="gw_form_mailDelegate.cfm">
  </fieldset>
</div>