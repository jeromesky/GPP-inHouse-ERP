<cfinclude template="../Application.cfm">
<cfif parameterexists(form.name)>
<cfquery datasource="#dsnP21#">
UPDATE speakers 
SET name  		= '#form.name#',
	delegation 	= '#form.delegation#'
    WHERE id = #form.id#
</cfquery>
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>P21</title>
<style type="text/css">
body { color:#333333; font-family:Arial, Helvetica, sans-serif; font-size:12px; background-color:#fff;margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;}
form{padding:0px; margin:0px }
</style>
</head>

<body <cfif parameterexists(form.name)>onload="javascript:parent.window.hs.closeId('speaker<cfoutput>#form.id#</cfoutput>')"</cfif>>
<cfquery datasource="#dsnP21#" name="get">SELECT * FROM speakers WHERE id = #url.id#</cfquery>
<form id="form1" name="name" method="post" action="#">
<table width="490" border="0" cellspacing="0" cellpadding="4" bgcolor="#fff">
  <tr>
    <td colspan="2" style="border-bottom:3px solid #333333"><strong>Edit speaker</strong></td>
    </tr>
  <tr>
    <td width="160">speaker name</td>
    <td width="330">delegation and company</td>
    </tr>
  <tr>
    <td><input name="name" type="text" style="width:150px" maxlength="35" value="<cfoutput>#get.name#</cfoutput>" /></td>
    <td><input name="delegation" type="text" style="width:320px" maxlength="60" value="<cfoutput>#get.delegation#</cfoutput>" /></td>
    </tr>
  <tr>
    <td><input type="hidden" name="id" value="<cfoutput>#url.id#</cfoutput>" /></td>
    <td><input type="submit" name="button" id="button" value="Submit" /></td>
    </tr>
    <tr ><td colspan="2" height="7" bgcolor="#1D1D1D"></td></tr>
</table>

</form> 
</body>
</html>