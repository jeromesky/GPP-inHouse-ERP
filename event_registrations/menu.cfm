<cfinclude template="../Application.cfm">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="../img/p21-gry.css" type="text/css" mcedia="screen" title="grey" />
<head>
<script type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>P21</title>
<cfinclude template="getReg.cfm">
<style type="text/css">
<!--

.border {

	background-color: #F5F5F5;
	padding-left: 8px;
	border-bottom-width: 1px;
	border-right-width: 1px;
	border-left-width: 1px;
	border-bottom-style: dotted;
	border-right-style: dotted;
	border-left-style: dotted;
	border-bottom-color: #CCCCCC;
	border-right-color: #CCCCCC;
	border-left-color: #CCCCCC;
	padding-bottom: 8px;
	padding-right: 5px;
	padding-top: 8px;
}
-->
</style></head>

<body>
<div id="header">Transactions from NetBanx:  -- <span class="header_title">Full List</span></div>
<div style="margin:10px 20px 0 20px; background-color:##EFEFEF; padding:10px 20px 10px 20px;">
 <table width="724"  border="0" cellpadding="0" cellspacing="0"  style="border:1px solid #333333; padding:10px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333 ">
  <tr bgcolor="#CCCCCC">
    <td width="30%" style="border-right:1px solid #333333">&nbsp;</td>
    <td  align="center" style="border-right:1px solid #333333" onclick="MM_goToURL('parent.frames[\'content\']','menu.cfm?display=card');return document.MM_returnValue" onMouseOver="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onMouseOut="this.style.backgroundColor='#cccccc'">Card&nbsp;Payments&nbsp;Transactions (<cfoutput>#card.recordcount#</cfoutput>) </td>
    <td  align="center" style="border-right:1px solid #333333" onclick="MM_goToURL('parent.frames[\'content\']','menu.cfm?display=wire');return document.MM_returnValue" onMouseOver="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onMouseOut="this.style.backgroundColor='#cccccc'">Wire&nbsp;Tranfer&nbsp;Transactions (<cfoutput>#wire.recordcount#</cfoutput>) </td>
	<td align="center" style="border-right:1px solid #333333" onclick="MM_goToURL('parent.frames[\'content\']','menu.cfm?display=all');return document.MM_returnValue" onMouseOver="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onMouseOut="this.style.backgroundColor='#cccccc'">All&nbsp;Other&nbsp;Transactions (<cfoutput>#all.recordcount#</cfoutput>)</td>
   <td  align="center" style="border-right:1px solid #333333" onclick="MM_goToURL('parent.frames[\'content\']','menu.cfm?display=requesti');return document.MM_returnValue" onMouseOver="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onMouseOut="this.style.backgroundColor='#cccccc'">Requested&nbsp;Documents (<cfoutput>#requesti.recordcount#</cfoutput>) </td>
    
    <td align="center" style="border-right:1px solid #333333" onclick="MM_goToURL('parent.frames[\'content\']','creatPack.cfm');return document.MM_returnValue" onMouseOver="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onMouseOut="this.style.backgroundColor='#cccccc'">add&nbsp;welcome&nbsp;pack</td>
    <td width="35%"></td>
  </tr>
  		    <tr bgcolor="#666666">
	      <td height="2" colspan="7"></td>
      </tr>
  <tr bgcolor="#999999">
    <td height="2" colspan="7"></td>
  </tr>
</table>
<cfif parameterexists(display)>
<cfloop query=#url.display# ><cfoutput>
<table width="858"  border="0" cellpadding="0" cellspacing="0"  onMouseOver="this.style.backgroundColor='cce1fd';" onMouseOut="this.style.backgroundColor='F5F5F5'" class="border">
  <tr>
    <td width="218"><strong>#title# #name# #surname#</strong></td>
    <td width="248">#gemail#</td>
    <td width="240">#TransDate#</td>
    <td width="150"><a href="<cfoutput><cfif #url.display# NEQ "requesti">print.cfm?<cfelse>Requested.cfm?eventid=#trim(eventid)#&</cfif>id=#id#</cfoutput>" style="color:##00CC00">View Transaction</a> </td>
  </tr>
  <tr>
    <td width="218">#company#</td>
    <td width="248">#event#</td>
    <td width="240"><cfif #url.display# NEQ "requesti"><strong>Ref:</strong> #netbanx_reference#<cfelse><cfif Right(programe,Len(programe)-1) contains trim(requesti.eventid) ><span style="color:##00CC00">Yes</span><cfelse><span style="color:##00CC00">No</span></cfif></cfif></td>
    <td ><a href="deleteUser.cfm?id=#id#&action=0"  style="color:##00CC00">Remove Transaction</a><br>
      <cfif display NEQ "requesti" AND eventid NEQ ""><a href="deleteUser.cfm?id=#id#&action=1&eventid=#eventid#&userid=#userid#"  style="color:##00CC00">Add events to user </a></cfif></td>
  </tr>
</table>
</cfoutput></cfloop>
</cfif>
</div>
</body>
</html>