<cfoutput>
<div class="c4" style="border:1px solid ##06C; padding:20px; float:left; margin-right:10px; width:300px">
  <h2>Make this Invoice as a paid through other method</h2>
  <form method="post" action="../bookings/?fa=booking-register-transfer">
    <input type="hidden" name="invoiceID" value="#var.invoiceID#" />
    <input type="hidden" name="bookingREF" value="#qryInvoice.bookingREF#" />
   <label>select transfer Type:  <select name="gw_status">
      <option value="reqTransfer">Bank Transfer</option>
      <option value="reqCheque">Pay With Check</option>
      <option value="reqCash">Cash</option>
    </select></label>
    <label>transfer ref:<input type="text" name="gw_REF" value="" maxlength="40" /></label>
    <button> Finalize </button>
  </form>
</div></cfoutput>