<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
</head>

<body>
<cfinclude template="../Application.cfm">
<cfset counter = 0 >
<cfquery datasource="#dsnP21#" name="get">
SELECT id 
FROM email_news 
WHERE no_email = 0
</cfquery>

<cfloop query="get">
<cfquery datasource="#dsnP21#">
    UPDATE email_news
    SET advertising = 0
    WHERE id = <CFQUERYPARAM Value="#get.id#">
</cfquery>

<cfset counter = counter + 1 >
</cfloop>

<cfoutput>#counter#</cfoutput>
</body>
</html>
