<cfinclude template="../application.cfm">
<cfif parameterexists(form.groupby)>
<cfquery  datasource="#dsnP21#"   >
   	INSERT INTO  groupby (groupby)
	Values('#form.groupby#')
</cfquery>
</cfif>
<html>
<head>
<title>Petro21.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="img/p21-gry.css" type="text/css" mcedia="screen" title="grey" />
</head>

<body>
<div id="header">Events Groups: -- <span class="header_title"></span></div>
<div style="margin:10px 20px 0 20px; background-color:#EFEFEF; padding:10px 20px 10px 20px;">
<table width="660" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff"  style="border:1px solid #333333; padding:6px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333 ">
<form name="form1" method="post" action="EventGroup.cfm">
 <tr><td colspan="4" bgcolor="#3399ff">Creat new Event group</td></tr>
     		    <tr bgcolor="#666666">
	      <td height="2" colspan="4"></td>
      </tr>
	    <tr bgcolor="#999999">
      <td height="2" colspan="4"></td>
    </tr> 
    <tr onMouseOver="this.style.backgroundColor='cce1fd'" onMouseOut="this.style.backgroundColor='ffffff'">
      <td width="28">&nbsp;</td>
      <td width="243"><input type="text" name="groupby"></td>
      <td width="331"><input type="submit" name="Submit" value="Submit"></td>
      <td width="56"><a href="filesave.cfm?id=#id#&action=del"></a></td>
    </tr></form>
  </table>
<br />
<CFQUERY datasource="#dsnP21#" name="getgroup"  >
SELECT *
FROM groupby 
</CFQUERY> 
  <table width="661" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="border:1px solid #333333; padding:6px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333 ">
    <tr><td height="17" colspan="3" bgcolor="#3399ff">Current event Groups</td>
    </tr>
	<tr bgcolor="#666666">
	      <td height="2" colspan="3"></td>
      </tr>
	    <tr bgcolor="#999999">
      <td height="2" colspan="3"></td>
    </tr> 
	<tr>
      <td width="27"></td>
      <td width="506"></td>
      <td width="126"></td>
    </tr>
	<cfloop query="getgroup"><cfoutput>
    <tr>
      <td align="center">#id#</td>
      <td>#trim(groupby)#</td>
      <td>&nbsp;</td>
    </tr></cfoutput></cfloop>	
  </table>
  </div>
</body>
</html>