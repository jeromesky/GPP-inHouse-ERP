<!---<cfdump var="#qryBookingsTotal#" expand="no" label="x">--->

<cftry>
  <cfoutput>
  <fieldset>
    <legend>Invoice register attendends</legend>
    <table>
      <cfloop query="qryBookingsTotal">
      <tr>
        <td>#qryBookingsTotal.name# #qryBookingsTotal.lastname#</td>
        <td>#qryAttendents.priceCurrency# #qryBookingsTotal.pricefull#</td>
      </tr>
      </cfloop>
    </table>
  </fieldset>
  <fieldset>
    <legend>Invoice Cost</legend>
    <table>
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
  <fieldset>
    <legend>Payment method</legend>
    <cfinclude template="gw_form_netBanx.cfm">
    <cfinclude template="gw_form_transfer.cfm">
    <cfinclude template="gw_form_mailDelegate.cfm">
  </fieldset>
  </cfoutput>
  <cfcatch type="any">
    <cfoutput>#cfcatch#</cfoutput>
  </cfcatch>
</cftry>