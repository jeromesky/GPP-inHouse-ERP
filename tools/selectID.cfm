<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>.</title>
</head>

<body><form name="form1" method="post" action="moveData.cfm">
<table width="546" border="1">
  <tr>
    <td width="148">id from table </td>
    <td width="87">
      <input name="fromID" type="text" size="5">
    </td>
    <td width="289">&nbsp;</td>
  </tr>
  <tr>
    <td>id to table </td>
    <td><input name="toID" type="text" size="5"></td>
    <td><input type="submit" name="Submit" value="Submit"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table></form>
<!---
<cfquery name="bla" datasource="petro21" password="hashbrown" username="petro21">
select *
from events_test2
where id = 232;
</cfquery>

<cfoutput>#bla.event_loc_xchange#</cfoutput>--->
</body>
</html>
