<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21.com</title>
</head>

<body><form id="form1" name="form1" method="post" action="#">
<table width="400" border="0" cellspacing="3">
  <tr>
    <td colspan="2">clean Database fields</td>
  </tr>
  <tr>
    <td width="80">table </td>
    <td width="307">
      <input type="text" name="table" id="textfield" />    </td>
  </tr>
  <tr>
    <td>field</td>
    <td><input type="text" name="field" id="textfield2" /></td>
  </tr>
  <tr>
    <td>string</td>
    <td><input type="text" name="remove" id="textfield3" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<cfif parameterexists(form.field)>
<cfquery datasource="petro21" name="get">
SELECT id, #form.field# FROM #form.table#
Order by id
</cfquery>
<cfset countRec = 0 >
<cfloop query="get">
    
<cfset cleaner = replace(Evaluate("get.#form.field#"),'#remove#',"","All") >

	<cfquery datasource="petro21">
    	UPDATE #form.table#
        SET #form.field# = <CFQUERYPARAM Value="#cleaner#">
        WHERE id = <CFQUERYPARAM Value="#get.id#">
    </cfquery>
<cfoutput>#cleaner#</cfoutput><br/>
<cfset countRec = countRec +1 >
</cfloop>
<cfoutput>#countRec#</cfoutput>
</cfif>
</body>
</html>
<!---
<cfoutput>#get.id#</cfoutput>
    
	<cfset subby =  len(Evaluate("get.#form.field#")) - Find('"', Evaluate("get.#form.field#")) Find('"><', Evaluate("get.#form.field#"))>
	<cfset cleaner =  Left( Evaluate("get.#form.field#"),len(Evaluate("get.#form.field#")) - (finder-3) )>	<cfset finder = Find('"><', Evaluate("get.#form.field#"))>
	<cfif  finder NEQ 0 ></cfif></cfif>--->