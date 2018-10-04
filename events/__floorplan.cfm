<cfinclude template="../Application.cfm">
<cfif parameterexists(url.id)>
	<cfset id = #url.id# >
<cfelseif parameterexists(form.id)>
	<cfset id = #form.id# >
</cfif>

<cfif parameterexists(url.planid)>
	<cfquery datasource="#dsnP21#" name="getfile">
		SELECT filename FROM floorplan WHERE id = #url.planid#
	</cfquery>

	<cfif  FileExists("G:\Websites\petro21\htdocs\docs\#getfile.filename#")>
		<CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\docs\#getfile.filename#">
	</CFIF>

	<cfquery datasource="#dsnP21#">
		DELETE FROM floorplan WHERE id = #url.planid#
	</cfquery>
</cfif>
<cfif parameterexists(form.filename)>
	    <CFFILE ACTION="Upload" FILEFIELD="form.filename" DESTINATION="G:\Websites\petro21\htdocs\docs" nameconflict="MAKEUNIQUE">
	<CFQUERY datasource="#dsnP21#">
    	INSERT INTO floorplan (eventid, filename, type)
        VALUES (#form.id#, '#File.ServerFile#', '#form.type#')
	</cfquery>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body >
<div style="border-bottom:1px solid #539ad2; font-weight:bold; height:20px; margin:17px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;">Add / remove floorplan </div>

<div style="border-bottom:1px solid #539ad2; width:580px; margin:17px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <form  name="form1" method="post" action="#" enctype="multipart/form-data"> <tr>
    <td width="61%">Add floorplan</td>
    <td width="33%">filetype</td>
    <td width="6%">&nbsp;</td>
  </tr>
  <tr>
    <td><input type="file" name="filename"  /></td>
    <td>
      <select name="type">
        <option value="plan">floorplan</option>
      </select>
    
    </td>
    <td><input type="hidden" name="id" value="<cfoutput>#id#</cfoutput>" /></td>
  </tr>
  <tr>
    <td width="61%"></td>
    <td width="33%"><input name="submit" type="submit" /></td>
    <td width="6%"></td>
  </tr></form>
</table>
</div>
<div style="border-bottom:1px solid #539ad2; width:580px; margin:17px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;">
<cfquery datasource="#dsnP21#" name="get">SELECT * FROM floorplan WHERE eventid = #id#</cfquery>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="17%"  style="border-bottom:1px solid #539ad2;">File type</td>
    <td width="76%"  style="border-bottom:1px solid #539ad2;">file</td>
    <td width="7%"  style="border-bottom:1px solid #539ad2;">delete</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <cfoutput query="get">
  <tr>
    <td>#type#</td>
    <td>#filename#</td>
    <td><a href="floorplan.cfm?planid=#get.id#&id=#id#&del=1"><img src="../img/new_delete.gif" border="0" /></a></td>
  </tr>
 </cfoutput> 
</table>
</div>
</body>
</html>
