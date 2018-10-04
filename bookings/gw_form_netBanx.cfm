<cfoutput><div class="c4" style="border:1px solid ##06C; padding:20px; float:left; margin-right:10px; width:300px">
<h2>Make payment through the NetBanx gateway</h2>
  <form method="post" action="#gw.netbanx.posturl#">
    <input type="hidden" name="invoiceID" value="#var.invoiceID#" />
    <input type="hidden" name="gpp_inv" value="#var.invoice#" />
    <input type="hidden" name="gpp_transactionType" value="bookingREF" />
    <input type="hidden" name="gpp_bookingREF" value="#qryInvoice.bookingREF#" />
    <input type="hidden" name="nbx_payment_amount" value="#trim(var.gw_netbanx_amount_cent)#" />
    <input type="hidden" name="nbx_currency_code" value="GBP" />
    <input type="hidden" name="nbx_merchant_reference" value="#var.invoice#" />
    <input type="hidden" name="nbx_checksum" value="#lcase(hash('#trim(var.gw_netbanx_amount_cent)#GBP#var.invoice##var.secertKEY#', 'SHA'))#" />
    <input type="hidden" name="nbx_success_show_content" value=0 />
    <input type="hidden" name="nbx_failure_show_content" value=0 />
    <input type="hidden" name="nbx_success_url" value="http://www.petro21.com/#return.dir_gw#/gw-netbanx.cfm" />
    <input type="hidden" name="nbx_failure_url" value="http://www.petro21.com/#return.dir_gw#/gw-netbanx.cfm" />
    <input type="hidden" name="nbx_success_redirect_url" value="http://www.petro21.com/#return.dir#/gw-netbanx-reply.cfm" />
    <input type="hidden" name="nbx_failure_redirect_url" value="http://www.petro21.com/#return.dir#/gw-netbanx-reply.cfm" />
    #gw.netbanx.postalert#<br />
    #var.gw_netbanx_amount_cent#<br />
    #var.invoice#<br /> 
    <button> Pay GBP #numberformat(var.gw_netbanx_amount_cent/100, '___.__' )# </button>
  </form>
</div></cfoutput>