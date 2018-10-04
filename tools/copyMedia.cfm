<cfif parameterexists(form.to)>
<cfquery datasource="petro21" name="get">
SELECT logos_sponsore 
FROM events 
WHERE id = <CFQUERYPARAM Value="#form.from#">
</cfquery>

<cfquery datasource="petro21" name="current">
SELECT logos_sponsore 
FROM events 
WHERE id = <CFQUERYPARAM Value="#form.to#">
</cfquery>

<cfset newmedia =  listAppend(current.logos_sponsore, get.logos_sponsore, ",") >

<cfquery datasource="petro21">
UPDATE events
SET logos_sponsore = <CFQUERYPARAM Value="#newmedia#">
WHERE id = <CFQUERYPARAM Value="#form.to#">
</cfquery>

</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="#">
<table width="300" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td>Copy Media to new field</td>
  </tr>
  <tr>
    <td>from</td>
    <td>
      <label>
        <input type="text" name="from" id="textfield" />
        </label>    </td>
  </tr>
  <tr>
    <td>to</td>
    <td><input type="text" name="to" id="textfield2" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" />
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
