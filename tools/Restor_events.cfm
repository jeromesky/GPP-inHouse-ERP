<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Petro21.com</title>
</head>

<body>

<cfquery datasource="petro21" name="get">
SELECT event_name, id FROM events_BU
Order BY ID 
</cfquery>

<cfloop query="get">

	<cfquery datasource="petro21">
    UPDATE events
    set event_name = <CFQUERYPARAM Value="#get.event_name#">
    WHERE id = <CFQUERYPARAM Value="#get.id#">
    </cfquery>
</cfloop>

</body>
</html>