<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cfscript>
 stri = '768,765';

discountOb = createObject("component", "Officecfc.eventDiscount");
bookingDiscount = discountOb.bookingEventDiscount(stri);


	discount = 15;
	dinnerCost = 0;
	//fetch total cost for this user
	eventIDsIN 	= "765";
	promoCodeIN = "";
	discountIN = 15; //#qryFindUserDiscount.discount#;
	priceOb = createObject("component", "Webcfc.registrationEventPrice");
  	qry_bookingTotal = priceOb.bookingLITotal(eventIDsIN,promoCodeIN, discountIN);	

</cfscript>

<cfdump var="#qry_bookingTotal#" label="full price">
<cfdump var="#bookingDiscount#" label="discount">

</body>
</html>
<!---discount = 0;
	dinnerCost = 0;
	//fetch total cost for this user
	promoCodeIN = "";
	discountIN = 0; //#qryFindUserDiscount.discount#;
	priceOb = createObject("component", "Webcfc.registrationEventPrice");
  	qry_bookingTotal = priceOb.bookingLITotal(stri,promoCodeIN, discountIN);--->