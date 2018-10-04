<cfset thelist = #form.data#>
<cfloop index="i" list="#thelist#">
<cfquery datasource="#FORM.datasource#" name="curr">
SELECT id, #FORM.fieldname# 
FROM #form.table#
WHERE #FORM.fieldname# = '#i#'
</cfquery>
<cfset add = curr.recordcount - 1>
<cfloop query="curr" startrow="1" endrow="#add#" >
<cfquery datasource="#FORM.datasource#" >
DELETE FROM #form.table#
WHERE id = #curr.id#
</cfquery>
</cfloop>
</cfloop>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>www.petro21.com</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="#">
<table width="260" height="112" border="1">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
      <label>
      <input type="text" name="emailaddr" id="textfield" />
      </label>    </td>
    <td><input type="submit" name="button" id="button" value="Submit" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>    
</form>

<!--- check email address not working to good 
 <cfset error = 0>
<cfquery datasource="news" name="curr">
SELECT id, name, surname, emailaddr FROM newusers
</cfquery>
<cfloop query="curr">
<cfinclude template="../Components/inportCheck_email.cfm">
<cfif error NEQ 1>
<cfquery datasource="news">
UPDATE newusers
set bad = 1
WHERE id = #curr.id#
</cfquery>
</cfif>
</cfloop>------------------------->

</body>
</html>                                                              