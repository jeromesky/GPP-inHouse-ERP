<cfscript>
	discount 	= 0;
	dinnerCost = 0;

	//fetch total cost for this user
	eventIDsIN 	= "";
	promoCodeIN= "";
	discountIN= 0;
	priceOb = createObject("component", "Webcfc.registrationEventPrice");
  	qry_bookingTotal = priceOb.bookingLITotal(eventIDsIN,promoCodeIN, discountIN);
</cfscript>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>

<cfdump var="#qry_bookingTotal#">
</body>
</html>