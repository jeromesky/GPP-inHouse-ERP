<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>www.petro21.com</title>
</head>
<cfquery datasource="stats" name="getlist">
Select  * 
FROM job
</cfquery>
<body>
    <form  action="delete.cfm" method="post">
  <table width="550" border="0" cellspacing="0" cellpadding="0" class="columntitle">
	<tr><td colspan="2"><strong>Select stats to delete</strong></td></tr>
	<tr><td colspan="2" height="25"></td></tr>
  <cfloop query="getlist"><cfoutput>
	<tr>
    <td width="30"><input type="checkbox" name="get" value="#getlist.datesent#" /></td>
    <td><cfoutput>#trim(getlist.name)# : sent on <cfset IndexOfOccurrence=REFind(":", #getlist.datesent#) ><cfoutput>#DateFormat(right(getlist.datesent, (len(getlist.datesent) - IndexOfOccurrence)) , "yyyy mmmm dd")#</cfoutput></option>
	</cfoutput></td>
  </tr>
	</cfoutput></cfloop>
	<tr><td></td><td><input name="" type="submit" /></td></tr>
</table>

</form>
</body>
</html>