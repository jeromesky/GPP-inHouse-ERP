<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
<cfset counter = 0 >
<cfquery datasource="inport" name="get">
	SELECT * 
	FROM inport
</cfquery>

<cfloop query="get">
<cfquery datasource="petro21" name="check">SELECT id, IntWo, emailaddr FROM email_news WHERE emailaddr = '#get.emailaddr#'</cfquery>

<cfif check.recordcount GTE 1 >

<cfelse>
	<cfset counter = counter + 1 >
	<cfquery datasource="petro21" >
		INSERT INTO email_news( emailaddr, intwo, no_email,  html, via_form, password, advertising, date )
		VALUES ('#get.emailaddr#', 0,0, 1, 0, 'gpp', 0, #now()#)
	</cfquery>
</cfif>

</cfloop>

<cfoutput>#counter#</cfoutput>
</body>
</html>