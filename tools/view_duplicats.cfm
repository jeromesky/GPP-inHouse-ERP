<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.</title>
</head>

<body>
<cfquery datasource="petro21" name="get">
SELECT     emailAddr, COUNT(*) AS TotalCount
FROM         email_news
GROUP BY emailAddr
HAVING      (COUNT(*) > 1)
ORDER BY COUNT(*) DESC;
</cfquery>
<table width="495" border="0">
  <tr>
    <td width="28">id</td>
    <td width="73">name</td>
    <td width="112">surname</td>
    <td width="71">email</td>
    <td width="37">pa</td>
    <td width="56">p21</td>
    <td width="88"><cfoutput>#get.recordcount#</cfoutput></td>
  </tr>
 <cfoutput query="get">
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td>#get.emailaddr#</td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
 </cfoutput>
</table>

</body>
</html>
