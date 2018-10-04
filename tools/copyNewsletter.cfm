<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.</title>
</head>

<body>
<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get">
SELECT id
FROM email_news
WHERE no_email = 0 AND id < 18154 AND stopdate is NULL;
</cfquery>

<cfloop query="get">
<cfquery datasource="#dsnP21#" >
UPDATE email_news 
set pas = 0,
intas = 0  
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.id#">
</cfquery>

</cfloop>

</body>
</html>
