<!--- Thank you page --->
<!--- Final page for payments --->

<!---<cfdump var="#url#">--->
<cfscript>
	gppX.invoiceID 				= url.invoiceID;
	var.invoiceID					= url.invoiceID;
	gppX.gpp_bookingREF 	= url.gpp_bookingREF;
	form.bookingREF				= url.gpp_bookingREF;
	nbx.status						= url.nbx_status;
		
</cfscript>

<cfoutput> #nbx.status#

<cfif nbx.status EQ "declined"><!--- declined transaction --->
        
     <cfinclude template="qry_invoice.cfm">
     <cfinclude template="gw_settings_netBanx.cfm">

<!--- DISPLAY --->
      <div style="padding:20px; border:1px solid ##C60; background-color:##FFF2EC; margin:10px 0 20px">
          <h2>Transaction Failed</h2>
          <p>try one of the options below to finalize</p>
          <p>Netbanx transaction ref: <strong>#qryInvoice.gw_REF#</strong></p>
          <p>Booking ref: <strong>#qryInvoice.bookingREF#</strong></p>
          <p>Total Cost for Invoice: <strong>#qryInvoice.currency_code# #qryInvoice.invoicePriceTAX#</strong></p>
      </div>

    <cfinclude template="gw_form_netBanx.cfm">
    <cfinclude template="gw_form_transfer.cfm">
    <cfinclude template="gw_form_mailDelegate.cfm">

<cfelseif nbx.status EQ "passed"><!--- successful transaction --->
	
    <cfinclude template="qry_Statement_payment_bookings.cfm">
    
    <div style="padding:20px; border:1px solid ##7ae27a; background-color:##dcf1e4; margin:10px 0 20px">
        <h2>Transaction successful</h2>
        <p>Netbanx transaction ref: <strong>#qryInvoice.gw_REF#</strong></p>
        <p>Booking ref: <strong>#qryInvoice.bookingREF#</strong></p>
        <p>Total charged for Invoice: <strong>#qryInvoice.gw_currency_code# #numberFormat(qryInvoice.gw_payment_amount/100, "99,9999.99")#</strong></p>
        
        <hr />
        
        <cfinclude template="dsp_Statement_payment_bookings.cfm">
        <cfinclude template="act_payment_booking.cfm">
    </div>


 </cfif>
</cfoutput>