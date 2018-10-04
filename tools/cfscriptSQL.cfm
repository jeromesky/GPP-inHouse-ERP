<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>


<cfscript>
	gpp 		= "GPP";

function bookingDiscount(bookingRef, userID){
	var queryService = new query(); 
	
	queryService.setDatasource(gpp);
	queryService.setSQL("SELECT  TOP 1 discount FROM bookings WHERE bookingReference = :bookingReference  AND delegateUserID = :delegateUserID ORDER BY discount desc");
	
	queryService.addParam(name="bookingReference", value=bookingRef, cfsqltype="cf_sql_char");
	queryService.addParam(name="delegateUserID", value=userID, cfsqltype="cf_sql_integer");
	
	var result = queryService.execute();
	
	return result.getResult();
}


function bookingCost(bookingType, price, packageID){
	returnCost = price;
		
	// is delegate and paying
	if (bookingType is 1 AND packageID EQ  0 ){
		returnCost = price;
	
	// delegate with free pass
	} else if ( bookingType is 1 AND packageID GT  0 ){
		returnCost = 0;
	
	//not delegate
	}else if ( bookingType GT 1 ){
		returnCost = 0;
	}
	return returnCost;
}

//SET THE VALUE FROM BOOKINGTYPE TO PAYMENT FIELD
function paymentVal(bookingType){
	paymentValue= 0;
	
	// is speaker
	if (bookingType is 2){
			paymentValue= 102;
	// is guest
	}else if (bookingType is 3){
			paymentValue= 103;
	// is moderator
	}else if (bookingType is 4){
			paymentValue= 104;
	// is exibitor
	}else if (bookingType is 5){
			paymentValue= 105;
	// is press
	}else if (bookingType is 6){
			paymentValue= 106;
	}else {
			paymentValue= 0;
	}
	return paymentValue;
}

bla = bookingDiscount('278BBAA8-1F29-65A5-4C8C079BEE6CAB4C', 18286);
</cfscript>

<cfoutput><cfdump var="#bla.discount#"></cfoutput>

</body>
</html>