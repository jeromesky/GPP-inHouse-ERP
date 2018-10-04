<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.</title>
</head>

<body>

<cfquery datasource="petro21" name="get">
SELECT id, no_email
FROM email_news
order by id;
</cfquery>

<cfloop query="get" >
<cftry   >
<cfquery datasource="petro21" >
UPDATE    email_news
SET              PA = 0
WHERE id = <CFQUERYPARAM Value="#get.id#"> 
AND no_email = 0
</cfquery>
<cfcatch type="database">
 error in process
</cfcatch>
</cftry>
</cfloop> 

done...
</body>
</html>
