<cfinclude template="../Application.cfm">
<cfquery datasource="inport" name="get">
SELECT * 
FROM inport 
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
<cfoutput query="get">
	<cfquery datasource="#dsnP21#" name="check">
    SELECT id, emailAddr FROM email_news WHERE  emailAddr = '#trim(get.emailAddr)#'
    </cfquery>
<cfif check.recordcount eq 0 >
 	<cfquery datasource="#dsnP21#">
 		INSERT INTO email_news (name, emailAddr, company, PAr, via_form, IntME,        PE, PL, PAs, PA, no_email , IntWo, IntAf, IntAs, IntGen, IntNAm, IntLa, IntEu, IntNAf, advertising, html)
        VALUES ('#left(get.name, 50)#', '#get.emailAddr#', '#left(get.name, 150)#', 0, 0, 0, 1,1,1,1,0,1,1,1,1,1,1,1,1,1, 1)
 	</cfquery>
</cfif>

</cfoutput>

<div style="border:1px solid #FF6600; background-color:#FFF2EC; padding:10px">shjgdjhg </div>
</body>
</html>