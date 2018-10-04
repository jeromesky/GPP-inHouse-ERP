<cftry>
  <cfoutput>
  <h4>#qryNarative.contentLabel#</h4>
  </cfoutput>
  <cfoutput>#narativeOutputP1#</cfoutput>
  <table cellpadding="4" cellspacing="2" width="100%">
    <tr>
      <td colspan="3" style="color:#fff; background-color:#0a3a5e">Confirmed Attendends </td>
    </tr>
    <tbody>
      <cfoutput query="qryBooking_lineItems" group="lastName">
      <tr>
        <td colspan="3" style="background-color:##efefef"><strong>#Title# #lastName#</strong></td>
      </tr>
      <cfoutput>
      <tr>
        <td width="40%">#qryBooking_lineItems.eventName#</td>
        <td width="15%">#qryBooking_lineItems.bookingTypeLabel#</td>
        <td width="45%"></td>
      </tr>
      </cfoutput>
      </cfoutput>
    <!---  <tr>
        <td colspan="3" style="color:#fff; background-color:#0a3a5e">Invoice details </td>
      </tr>
      <cfoutput>
      <tr>
        <td class="sub_total" style="text-align:right;">Total net</td>
        <td class="sub_total">#qryBooking_lineItems.priceCurrency# #qryInvoice.invoicePrice#</td>
        <td></td>
      </tr>
      <tr>
        <td class="sub_total" style="text-align:right;">TAX Amount</td>
        <td class="sub_total">#qryBooking_lineItems.priceCurrency# #qryInvoice.invoiceTAXvalue#</td>
        <td></td>
      </tr>
      <tr>
        <td class="grand_total" style="text-align:right; border-top:1px solid ##333"><strong>Grand Total</strong></td>
        <td class="grand_total" style="border-top:1px solid ##333">#qryBooking_lineItems.priceCurrency# #qryInvoice.invoicePriceTAX#</td>
        <td class="grand_total" style="border-top:1px solid ##333">&nbsp;</td>
      </tr>
      </cfoutput>--->
    </tbody>
  </table>
  <cfcatch type="any">
    <cfoutput>#cfcatch#</cfoutput>
  </cfcatch>
</cftry>
