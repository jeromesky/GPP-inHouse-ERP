<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p21</title>
</head>

<body>
<h1>Find double email in a table</h1>
<cfif parameterexists(form.fieldname) >
<cfquery name="getdoubles" datasource="#form.datasource#">
SELECT #form.fieldname# AS email
FROM #form.table# 
GROUP BY #form.fieldname#
HAVING ( COUNT(#form.fieldname#) > 1 )
</cfquery>
<table width="450" border="0">
 <form id="form2" name="form2" method="post" action="check_emails.cfm"> 
   <tr>
     <td>this is step 2</td>
     <td><cfoutput>#getdoubles.recordcount#</cfoutput></td>
   </tr>
   <tr>
    <td width="97%"><textarea name="data" id="textarea" cols="45" rows="14" style="height:80%; width:400px"><cfoutput query="getdoubles" ><cfif  getdoubles.currentRow EQ getdoubles.recordcount >#trim(getdoubles.email)#<cfelse>#trim(getdoubles.email)#,</cfif></cfoutput></textarea></td>
    <td width="3%"><input type="hidden" name="table" value="<cfoutput>#form.table#</cfoutput>" />
    <input type="hidden" name="datasource" value="<cfoutput>#form.datasource#</cfoutput>" />
    <input type="hidden" name="fieldname" value="<cfoutput>#form.fieldname#</cfoutput>" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="button2" id="button2" value="Submit" />    </td>
  </tr></form>
</table>
<cfelse>
<table width="400" border="0">
 <form id="form1" name="form1" method="post" action="#"> 
   <tr>
     <td colspan="2">This step 1</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>database</td>
     <td><input type="text" name="datasource" id="textfield3" /></td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
   </tr>
   <tr>
    <td width="113">Field name</td>
    <td width="210">
      <input type="text" name="fieldname" id="textfield" />    </td>
    <td width="45">&nbsp;</td>
    <td width="14">&nbsp;</td>
  </tr>
  <tr>
    <td>table name</td>
    <td><input type="text" name="table" id="textfield2" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr></form>
</table>
</cfif>

</body>
</html>