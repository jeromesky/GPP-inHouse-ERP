<cfinclude template="../Application.cfm">
<cfif parameterexists(form.id)>
	<cfset id = #form.id# >
<cfelse >
	<cfset id = #url.id# >
 </cfif>
 <cfif parameterexists(form.submit)>
 <cfquery datasource="#gpp#">
 		 UPDATE events
 		 SET id_gpp = #form.id_gpp#
         WHERE id = #form.id#
</cfquery>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body  <cfif parameterexists(form.submit)> onload="javascript:parent.window.hs.closeId('')"</cfif>>
<form action="#" method="post" name="form" >
<div style="border-bottom:1px solid #539ad2; font-weight:bold; height:20px; margin:17px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;">Edit selected event from GPP database <cfoutput><input type="hidden" name="id" value="#id#"></cfoutput></div>
<div style="clear:both"></div>
<cfif NOT parameterexists(form.submit)>
<cfquery datasource="#gpp#" name="get">
		SELECT * 
        FROM ViewEvents 
        order by name
</cfquery>
<cfoutput><select name="id_gpp" style="width:340px">
        <cfloop query="get"><option value="#get.conf_id#">#get.name#, #get.code#</option></cfloop>
	</select>
</cfoutput></cfif>
<div style="height:20px; margin:25px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;"><input type="submit" name="submit" value="submit" /></div>

</form>
</body>
</html>