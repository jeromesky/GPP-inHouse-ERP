
<cfmail to="#Lcase(qryBookingContact.email)#" 
	from="bookings@petro21.com"
	subject="Accounts department at Global Pacific & Partners"
	type="html" 
	cc="#Lcase(qryInvoice.InvoiceCarbonCopy)#" 
    bcc=""
	failto="bookings@glopac-partners.com"
	> 

<!---    Dear   #qryBookingContact.Title#  #qryBookingContact.name# #qryBookingContact.lastName#--->

<cfinclude template="dsp_Statement_emailRequest_booking.cfm">
</cfmail>
