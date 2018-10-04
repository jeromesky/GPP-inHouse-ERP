<cfinclude template="../Application.cfm">
<cfif parameterexists(form.name)>
	<cfquery datasource="#dsnP21#">
	UPDATE youTubCategory
	SET name = '#form.name#'
	WHERE id = #url.id#
	</cfquery>
<cfelse>
	<cfquery datasource="#dsnP21#" name="getCat">
    SELECT name 
    FROM youTubCategory 
    WHERE id = #url.id#
    </cfquery>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<cfif parameterexists(form.name)>
<body onload="javascript:parent.window.hs.closeId('cat<cfoutput>#url.id#</cfoutput>')" >
<cfelse>
<body >
    <div class="sectionHeader">Edit Category Name</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
    <form id="form1" name="form1" method="post" action="editcat.cfm?id=<cfoutput>#url.id#</cfoutput>">
	  <table width="400" border="0" cellspacing="4">
        <tr>
          <td>Category Name</td>
          <td><input type="text" name="name" value="<cfoutput>#trim(getcat.name)#</cfoutput>" maxlength="50" /></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" name="button" id="button" value="Submit" /></td>
        </tr>
      </table></form> 
      </cfif>
</body>
</html>