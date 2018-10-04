<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
<cfquery datasource="gppdata" name="get">
SELECT top 4
id, name, surname, email 
FROM VIewMailouts 
WHERE #url.field# = 1 AND surname = 'svikovsky'
ORDER BY surname
<!---chkP21 = , chkW = , chkNA = , chkLA = , chkME = , chkE = , chkAF= , chkA = ,  --->
</cfquery>

<table width="600" border="0" cellspacing="2" cellpadding="4">
<cfoutput query="get">
  <tr>
    <td>#get.id#</td>
    <td>#get.name#</td>
    <td>#get.surname#</td>
    <td>#get.email#</td>
  </tr></cfoutput>
</table>
<cfmail from="web@petro21.com" to="jerome@glopac-partners.com" subject="your email region" type="html">
<a href="http://www.petro21.com/post/Unsubscrib.cfm?id=#get.id#">unsubscrib</a>
</cfmail>
</body>
</html>