<cfinclude template="../Application.cfm">

<cfquery name="getSelect" datasource="#dsnP21#">
SELECT     *
FROM          	Updated_Fields 
WHERE    ( eventID = #url.id# AND field =  '#url.field#' ) 
ORDER BY insertDate desc
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>

<table width="100%" border="0" cellspacing="5" cellpadding="0" style=" font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333">
 <cfoutput query="getSelect">
  <tr style="border-bottom:1px solid ##666666">
    <td>#dateFormat(getSelect.insertDate, "dd mmm yyyy")#</td>
    <td>#getSelect.inputUser#</td>
    <td>#getSelect.NewValue#;</td>
  </tr></cfoutput>
</table>
</body>
</html>