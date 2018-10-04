<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get">
		SELECT *
        FROM  MediaReview
        WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
<cfoutput>
<table border="0" cellspacing="4" cellpadding="4" width="610">
  <tr>
    <td colspan="2">#get.title#</td>
  </tr>
  <tr>
    <td>Published date</td>
    <td>#dateformat(get.publishdate, "dd, ddd mmm yyyy")#</td>
  </tr>
  <tr>
    <td>Source</td>
    <td>#get.source#</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>Link</td>
    <td><a href="#get.link#" target="_blank">#get.link#</a></td>
  </tr>
  <tr>
    <td>video</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">#get.utube#</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">#get.content#</td>
  </tr>
</table>
</cfoutput>
</body>
</html>