<cfoutput>
<div class="c4" style="border:1px solid ##06C; padding:20px; float:left; margin-right:10px; width:300px">
  <h2>Send delegate email to finalize payment</h2>
  <form method="post" action="../bookings/?fa=booking-payment-email">
    <input type="hidden" name="invoiceID" value="#var.invoiceID#" />
    <input type="hidden" name="bookingREF" value="#qryInvoice.bookingREF#" />
    <input type="hidden" name="gw_status" value="reqEmail" />
    <input type="hidden" name="gw_REF" value="#qryInvoice.gw_REF#"/>
    <button> Send </button>
  </form>
</div>
</cfoutput>
