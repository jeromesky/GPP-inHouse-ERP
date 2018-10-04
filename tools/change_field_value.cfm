<cfquery datasource="petro21" name="check">
SELECT id, PA 
FROM email_news
</cfquery>

<cfloop query="check">
<cfquery datasource="petro21">
UPDATE email_news
set PA = 1
where id = <CFQUERYPARAM Value="#check.id#">
</cfquery>
</cfloop>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.</title>
</head>

<body>
</body>
</html>
