<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
</head>

<body>
<cfquery datasource="petro21" name="get">
SELECT id 
FROM email_news
WHERE PA = 0 
AND id >28317
</cfquery>

<cfloop query="get">
	<cfquery datasource="petro21">
    	UPDATE  email_news
      SET intaf = 0
      WHERE id = <CFQUERYPARAM Value="#get.id#">
	</cfquery>
</cfloop>

</body>
</html>
