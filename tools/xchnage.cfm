<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.</title>
</head>

<body>
<form action="exchange.cfm?do" method="post" name="form">
Change this amount:

<input type="text" name="amount">

into

<select name="currency" size="1">
<option value="united states">US dollars</option>
<option value="euro">Euros</option>
</select>

<br><br>

<input type="submit" value="Convert it!">

</form>

<p>&nbsp;</p>

<cfif IsDefined("url.do")>

<cfinvoke
	webservice="http://www.xmethods.net/sd/2001/CurrencyExchangeService.wsdl"
	method="getRate"
	returnvariable="aRate">
<cfinvokeargument name="country1" value="united kingdom"/>
<cfinvokeargument name="country2" value="#form.currency#"/>
</cfinvoke>

<cfoutput>

You entered <b>#form.amount#</b> which is worth #NumberFormat(Evaluate(amount * aRate), '.__')# in #form.currency# currency

</cfoutput>

</cfif> 
</body>
</html>
