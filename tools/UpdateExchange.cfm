<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.</title>
</head>

<body>

<cfset currency[1] = "south africa">
<cfset currency[2] = "euro">
<cfset currency[3] = "united states">
<cfset count = 1 >
<cfset amount = 1 >

<!--- <cfloop index="i" from="1" to="3"> <cfinvokeargument name="country1" value="#currency[1]#"/>--->
<cfinvoke
webservice="http://www.xmethods.net/sd/2001/CurrencyExchangeService.wsdl"
method="getRate"
returnvariable="aRate">
<cfinvokeargument name="country1" value="south africa"/>
<cfinvokeargument name="country2" value="united kingdom"/>
</cfinvoke>

<!--- <cfquery name="edite" datasource="petro21" username="petro21" password="hashbrown" >
UPDATE CurrencyConverter 
SET 	value = '#NumberFormat(Evaluate(amount * aRate), '.____')#',
	date  = '#DateFormat(Now(), "dd-mm-yyyy")#'
WHERE id = 1		
</cfquery>--->
<cfoutput>#NumberFormat(Evaluate(amount * aRate), '.____')# #DateFormat(Now(), "dd-mm-yyyy")#<br /></cfoutput>
<!--- </cfloop>--->

</body>
</html>
