
<cfloop query="qryBookingContact">

<cfmail to="#Lcase(qryBookingContact.email)#" 
	from="bookings@petro21.com"
	subject="Confirmation booking for #qryBooking_lineItems.eventName#"
	type="html" 
	cc = "#qryInvoice.InvoiceCarbonCopy#"
	failto="bookings@glopac-partners.com"
   >

		<cfinclude template="dsp_Statement_request_bookings.cfm">
</cfmail>

</cfloop>