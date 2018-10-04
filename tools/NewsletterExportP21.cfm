<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<form method="post" action="#">
<table width="300" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>fildname</td>
    <td>fieldid</td>
  </tr>
  <tr>
    <td><input type="text" name="fieldName" id="fieldName" /></td>
    <td>
      <input type="text" name="newsletterID" id="newsletterID" />

    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" /></td>
  </tr>
</table>
    </form>

<cfquery name="get" datasource="#gppData#">
SELECT 
		[lngIndividual_ID]
  FROM [tblIndOptions]
  WHERE
   chkP21 = 1
</cfquery>

<cfdump var="#get#">

<cfloop query="get">
        <cfquery datasource="#gppdata#">
        UPDATE tblIndividual
        SET  userAllowSubs  = 1
        WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.lngIndividual_ID#"> 
        </cfquery>

</cfloop>

</body>
</html>