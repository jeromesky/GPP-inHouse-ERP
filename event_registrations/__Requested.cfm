<cfinclude template="../application.cfm">
<cfif  parameterexists(form.action)>
<cfif form.action EQ 1 >
<cfquery datasource="#dsnP21#"   name="re">
   SELECT * FROM MoreInfo
   WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<cfquery name=get datasource="#dsnP21#"   >
   	SELECT id, file_program  
	FROM events
	WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.eventid#">
</cfquery>
  <CFmail
  	from="Petro21.com"
	to="#re.gemail#" 	
	subject="www.petro21.com Requested Event Program" type="html">
	
	<cfmailparam file="G:\websites\petro21\htdocs\docs\#get.file_program#">

Dear #re.title# #re.name# #re.surname#,<br><BR>
Please find attached the brochure you have requested from Petro21 for the following event.<br><BR>
#re.event#<br><BR>
with best regards,<br /><br />

Babette van Gessel<br />
Group Managing Director<br />
Global Pacific & Partners<br />
264 Groot Hertoginnelaan, 2517EZ<br />
The Hague, The Netherlands<br />
Tel: 31-70.324.6154  Fax: 31-70.324.1741<br />
babette@glopac.com<br /><br />

Dr Duncan Clarke, Chairman & CEO<br />
Global Pacific & Partners International Ltd<br />
London, The Hague, Johannesburg<br />
Suite 27, 78 Marylebone High St, London W1U 5AP<br />
Tel: 44-207.487.3173  Fax: 44-207.487.5611<br />
Cell Tel: 44-77.39.45.77.69  www.petro21.com <br />
duncan@glopac.com <br /><br />

Johannesburg: Amanda Wellbeloved<br />
Tel:  27-11.679.5167<br />
Fax:  27-22.679.5456<br />
amanda@glopac.com
</cfmail>

 <cfquery datasource="#dsnP21#"   name="del">
   DELETE FROM MoreInfo
   WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
</cfif>
<cfif form.action EQ 2 >
 <cfquery datasource="#dsnP21#"   name="del">
   DELETE FROM MoreInfo
   WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
</cfif>
<cflocation url="menu.cfm">
<table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="#F4F4F4" style="border:1px solid #333333; padding:10px ">
    <tr>
      <td width="234">&nbsp;</td>
      <td width="298">Email Sent</td>
      <td width="266">&nbsp;</td>
    </tr>
  </table>
  </cfif>
<html>
<head>
<title>P21</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.links {font-family: Arial, Helvetica, sans-serif;	font-size: 10px;color: #333333;	text-decoration: none;
}
-->
</style>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<cfset eventid = #url.eventid#>
<cfset id = #url.id#>

<cfquery datasource="#dsnP21#"   name="re">
   SELECT * FROM MoreInfo
   WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#id#">
</cfquery>

<cfquery name=qry_event datasource="#dsnP21#"   >
   	SELECT id, file_program  
	FROM events
	WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
</cfquery>
 
   <table width="801" border="0" cellpadding="0" cellspacing="0" bgcolor="#F4F4F4" style="border:1px solid #333333; padding:6px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333 ">
    
	    <tr bgcolor="#3399FF">
      <td width="561">Approve and Send Brochure via email</td>
    </tr>
			    <tr bgcolor="#666666">
	      <td height="2" ></td>
      </tr>
	    <tr bgcolor="#999999">
      <td height="2" ></td>
    </tr>
    <tr>
      <td width="561"><cfoutput>#re.title# #re.name# #re.surname#</cfoutput> <BR />Company:  <cfoutput>#re.company#</cfoutput> <BR />       
       Event: <cfoutput>#re.event#</cfoutput> <BR />Date:  <cfoutput>#re.TransDate#</cfoutput></td>
     </tr>
    <tr>
      <td>Brochure available  <cfif qry_event.file_program NEQ "">Yes<cfelse>No</cfif><br >File name: <cfoutput>#qry_event.file_program#</cfoutput></td>
    </tr>
   <form name="form1" method="post" action="Requested.cfm"> <tr>
      <td>
	  <input type="hidden" name="action" value="1">
	  <input type="hidden" name="id" value="<cfoutput>#id#</cfoutput>">
	  <input type="hidden" name="eventid" value="<cfoutput>#eventid#</cfoutput>"> 
	  <cfif qry_event.file_program NEQ ""><input type="submit" name="Submit" value="Send"><cfelse></cfif></td>
    </tr></form>
	<tr>
	<td><a href="#" onClick="history.go(-1)">go back</a></td></tr>
		    <tr  bgcolor="#3399FF">
      <td width="561" >Delete Request and not Send Brochure via email  </td>
    </tr>
			    <tr bgcolor="#666666">
	      <td height="2" ></td>
      </tr>
	    <tr bgcolor="#999999">
      <td height="2" ></td>
    </tr>
	   <form name="form1" method="post" action="Requested.cfm"> <tr>
      <td>
	  <input type="hidden" name="action" value="2">
	  <input type="hidden" name="id" value="<cfoutput>#id#</cfoutput>">
	  <input type="hidden" name="eventid" value="<cfoutput>#eventid#</cfoutput>"> 
	  <input type="submit" name="Submit" value="delete"></td>
    </tr></form>
  </table>

</body>
</html>