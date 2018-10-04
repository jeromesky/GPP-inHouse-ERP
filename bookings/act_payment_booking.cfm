<cfmail to="#Lcase(qryBookingContact.email)#" 
	from="bookings@petro21.com"
	subject="Confirmation of payment for #qryBooking_lineItems.eventName#"
	type="html" 
	cc = "#Lcase(qryInvoice.InvoiceCarbonCopy)#"
	failto="bookings@glopac-partners.com"
    query="qryBookingContact" >

		<cfinclude template="dsp_Statement_payment_bookings.cfm">
</cfmail>