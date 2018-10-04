<cferror type="exception" template="cferror.cfm">
 
<!--- Kill extra output. --->
<cfsilent>
 
<!--- Set some sercur form data. --->
<cfset FORM.CreditCard = "1234567890123456" />
<cfset FORM.ExpirationDate = "12/12" />
 
</cfsilent>
 
<html>
<head>
<title>ColdFusion CFError Handling Tutorial</title>
</head>
<body>
 
<!--- Force an error. --->
<cfset asdf = sf />
 
</body>
</html>