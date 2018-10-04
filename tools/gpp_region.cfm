<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21.com</title>
</head>

<body>
<cfquery datasource="gppdata" name="get">
SELECT
id, name, surname, email 
FROM Viewmailouts 
WHERE #url.field# = 1
<!---chkP21 = , chkW = , chkNA = , chkLA = , chkME = , chkE = , chkAF= , chkA = ,  --->
</cfquery>

<table width="600" border="0" cellspacing="2" cellpadding="4">
<cfoutput query="get">
  <tr>
    <td>#get.id#</td>
    <td>#get.name#</td>
    <td>#get.surname#</td>
    <td>#get.email#</td>
  </tr>
</cfoutput>
</table>
</body>
</html>