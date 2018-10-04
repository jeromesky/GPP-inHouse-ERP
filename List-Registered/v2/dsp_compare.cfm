<cfparam default="noshow" name="url.debug" type="string">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Event Compare List</title>
</head>

<style>
td, body { font-size:12px; font-family:Arial, Helvetica, sans-serif;}
</style>

<body>
<cfif qry_profile2do.recordcount NEQ 0>
<b>To do Profile to be linked to user</b>
<table cellpadding="2" bgcolor="yellow">
<cfoutput query="qry_profile2do"><tr>
<td>#profileID#</td>
<td>#name#</td>
<td>#surname#</td>
</tr></cfoutput>
</table><hr />
</cfif>

<table cellpadding="5">
<cfoutput query="qry_KEY"><tr>
<td>#eventID#</td>
<td>#eventName#</td>
</tr></cfoutput>
</table>

<cfif url.debug EQ 'show'><cfdump var="#qry_compare#" expand="no"></cfif>
<b>Total: <cfoutput>#qry_compare.recordcount# <cfif qry_profile2do.recordcount NEQ 0>+ #(qry_profile2do.recordcount - 1)#</cfif></cfoutput> </b>

<table cellpadding="2">
<tr>
<td><b>userID</b></td>
<td><b>name</b></td>
<td><b>surname</b></td><cfloop list="#url.id#" index="fff"><cfoutput>
<td>OLD #fff#</td>
<td>NEW #fff#</td></cfoutput>
<td><b>Check</b></td><td>&nbsp;&nbsp;</td></cfloop>
</tr>
<cfoutput query="qry_compare"><tr>
<td <cfif userID EQ 0>bgcolor="yellow"</cfif>>#userID#</td>
<td <cfif len(name) EQ 0>bgcolor="yellow"</cfif>><cfif len(name) EQ 0>1 or more profile records need linking<cfelse>#name#</cfif></td>
<td <cfif len(surname) EQ 0>bgcolor="yellow"</cfif>>#surname#</td><cfloop list="#url.id#" index="ggg">
<td <cfif '#evaluate('oldreg#ggg#')#' NEQ '#evaluate('newreg#ggg#')#'><cfif 1 EQ #evaluate('oldreg#ggg#')#>bgcolor="##00FF00"<cfelse>bgcolor="##FF0000"</cfif></cfif>>#evaluate('oldreg#ggg#')#</td>
<td <cfif '#evaluate('oldreg#ggg#')#' NEQ '#evaluate('newreg#ggg#')#'><cfif 1 EQ #evaluate('newreg#ggg#')#>bgcolor="##00FF00"<cfelse>bgcolor="##FF0000"</cfif></cfif>>#evaluate('newreg#ggg#')#</td>
<td <cfif 1 EQ '#evaluate('newreg#ggg#')#'>bgcolor="##00FF00"<cfelse>bgcolor="##FF0000"</cfif>>&nbsp;<cfif 1 EQ '#evaluate('newreg#ggg#')#' and userID NEQ 0>ok</cfif>&nbsp;</td><td>#paid# / #payment#</td></cfloop>
</tr></cfoutput>
</table>

</body>
</html>