<cfquery datasource="stats" name="get">
select id, emailaddr 
from inport 
where emailaddr NOT LIKE '%@%'
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.</title>
</head>

<body>
<cfloop query="get">
<cfquery datasource="stats">
    DELETE 
FROM inport 
where id = <CFQUERYPARAM Value="#get.id#">
    </cfquery>
	<cfoutput>#get.emailaddr#, #get.id#</cfoutput><br />
</cfloop>
done...
</body>
</html>
