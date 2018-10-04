<cfscript>
// gateways setting
	gw.netbanx.live = 'https://pay.netbanx.com/globalpacific-petro21-upp';
	gw.netbanx.posturl = gw.netbanx.live;
	gw.netbanx.postalert = '';
// return settings for public side
// we should consider an SSL for this folder area )& backend) in the future
	return.dir 			= 'my-office/bookings';
	return.dir_gw 	= 'gateway';
	//session.step 	= 3;
	// label invoice based on payment entry
	// convert amount into cents for PCI GW 
	var.gw_netbanx_amount_cent 		= qryInvoice.invoicePriceTAX * 100;
	var.gw_netbanx_currency = 'GBP';
	//var.invoice = 'PS11#qryInvoice.currency_code##numberformat(qryInvoice.invoiceID, '000000')#X#timeformat(now(),'HHMM')#';
	var.invoice = 'PS11GBP#numberformat(qryInvoice.invoiceID, '000000')#X#timeformat(now(),'HHMM')#';
	// GW: netbanx 
	var.secertKEY = 'VOw6qF9kQLht%WCm8EO38VAqWyh%7LbL';
</cfscript>