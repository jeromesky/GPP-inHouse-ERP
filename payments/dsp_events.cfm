<cfinclude template="qry_events.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Credit Card Payment</title>
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>

<style type="text/css">
.underline{
border-top:1px solid #CCCCCC;
padding-top:10px;
}
#box {
	margin: 50px auto 20px auto; 
	padding:20px; 
	border:1px solid #CCDFFF; 
	background-color:#F9F9F9; 
	font-family:Arial, Helvetica, sans-serif;
	width:600px;
	font-size:12px;
	}
</style>
</head>

<body>
	<div id="box">
<!---<cfdump var="#qryEvents#">--->
<h2>Make Credit Card Payment</h2><cfoutput>
<form action="process.cfm" method="post">
<table border="0" cellspacing="0" cellpadding="2">
<h4>Payment for following events</h4>
<cfloop query="qryEvents">
  <tr>
    <td>#qryEvents.eventName#</td>
    <td align="right">#qryEvents.eventCurrency#</td>
    <td>#numberFormat(qryEvents.eventCost, "999.99")#</td>
    <td>#qryEvents.INVComments#</td>
  </tr>
<!---  <cfset cost = cost + qryEvents.eventCost>
  <cfset invoiceID = listAppend(invoiceID, qryEvents.invoiceID, "," )>--->
</cfloop>
	<!---<cfset discountCost = NumberFormat(cost - ( (cost/100) * qryEvents.discountValue  ) , "___._")  >
    <cfset vatTotal = discountCost  * (userVat / 100) >--->
  <tr>
    <td colspan="3" class="underline"><h4>Transaction costs</h4></td>
    <td class="underline" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td class="underline">User Country: #qryEvents.userCountry#</td>
    <td class="underline">Cost</td>
    <td class="underline" ><input type="text" name="cost" id="cost" value="#cost#" /></td>
    <td rowspan="4" valign="top" class="underline"><br /></td>
  </tr>
   <tr>
     <td class="underline">Discount Value % <input type="text" name="discountVal" id="discountVal" value="#discountValue#" size="4" style="width:30px"/></td>
     <td class="underline">Discount Cost</td>
     <td class="underline"><input type="text" name="costDiscount" id="costDiscount" value="#trim(discountCost)#" /></td>
    </tr>
   <tr>
    <td class="underline">Vat Value % <!---<input type="text" name="vatValue" id="vatValue" value="#userVat#" size="4"  style="width:30px"/>---></td>
    <td class="underline">Vat (#userVat#%)</td>
    <td class="underline"><input type="text" name="costVat" id="vat" value="#vatTotal#" /></td>
    </tr>
  <tr>
    <td class="underline">&nbsp;</td>
    <td class="underline">Total id #qryEvents.eventCurrency#</td>
    <td class="underline"><input type="text" name="costTotal" id="total" value="#discountCost + vatTotal#" /></td>
    </tr>
  <tr>
    <td class="underline"></td>
    <td class="underline">Total id GBP</td>
    <td class="underline"><input type="text" name="totalGBP" id="totalGBP" /></td>
    <td class="underline"></td>
  </tr>
  <tr>
    <td class="underline"></td>
    <td class="underline"></td>
    <td class="underline">
    	<button>Process</button>
        <input type="hidden" name="invoiceID" value="#invoiceIDset#" />
        <input type="hidden" name="userID" value="#url.id#" />
        <input type="hidden" name="events" value="#events#" />
        <input type="hidden" name="process" value="internal" /></td>
    <td class="underline"></td>
  </tr>
</table>
</form>

<script type="text/javascript">
//focusout
$('##cost, ##discountVal, ##vatValue').change(function(){  
	var cost 			= $('##cost').val();
	var vat		 		= #userVat#/100; 
	var discountval	= $('##discountVal').val();
	var discountCost= cost - ( (cost/100) *  discountval );
	var discountCost= discountCost.toFixed(2);
	var totalVat		= parseInt(discountCost * vat);
	var totalVat		=  totalVat.toFixed(2);
	var totalCost		= parseInt(discountCost) + parseInt(totalVat);
	var totalCost		= totalCost.toFixed(2);
	//alert(cost);
	$('##costDiscount').val(discountCost);
	$('##total').val(totalCost);
	$('##vat').val(totalVat);
	convertTotal( totalCost, '#qryEvents.eventCurrency#')
});

$(document).ready(function() { 	
 	convertTotal( #discountCost + vatTotal#, '#qryEvents.eventCurrency#');
});
 
function convertTotal(total, currency){
 	$.post("../currencyExchange/qry_fx.cfm", { "total": total ,"currency" : currency}, function(data){  $("##totalGBP").val(data); } );
}
</script></cfoutput>
</body>
</html>