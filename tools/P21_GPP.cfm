<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
<!---
<cfexecute name="C:\VPNConnection\GPPServer.bat"
variable="data" timeout="10" ></cfexecute> --->
<cfexecute name="C:\WINDOWS\system32\cmd.exe"
ARGUMENTS="rasdial GPPServer webserver mm60860202"

variable="data"><cfdump var="#data#"></cfexecute> 

<cfinclude template="../Application.cfm" >
<cfquery datasource="gppdata" name="get">
SELECT top 50 ind.IngIndividual_ID AS id, ind.strfirst_name AS name, ind.strSurname AS surname, ind.strEmail AS email , opt.lngIndividual_ID, opt.chkP21
FROM tblindividual ind
LEFT JOIN tblIndOptions opt
ON  ind.IngIndividual_ID = opt.lngIndividual_ID
WHERE ind.strfirst_name LIKE '%#url.searchword#%' AND ind.strEmail <> '' AND ind.chkMail <> 1 AND opt.chkP21 = 1

<!---chkP21 = , chkW = , chkNA = , chkLA = , chkME = , chkE = , chkAF= , chkA = ,  --->
</cfquery>

<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50"><cfoutput>#get.recordcount#</cfoutput></td>
    <td>name</td>
    <td>surname</td>
    <td>email address</td>
  </tr>
  <tr>
    <td>id</td>
    <td>name</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <cfoutput query="get"><tr>
    <td>#get.id#</td>
    <td>#get.name#</td>
    <td>#get.surname#</td>
    <td>#get.email#</td>
  </tr></cfoutput>
</table>
</body>
</html>