<cfinclude template="../Application.cfm" >
<cfquery DATASOURCE="#dsnP21#" name="weekMenu" cachedwithin="#CreateTimeSpan(1,0,0,0)#">
Select id, event_name AS name, event_year AS year, event_type, event_loc_country AS country
FROM events 
WHERE  event_expire > #now()# 
AND (event_type = 'week') 
and (LIVE = 1) 
Order by event_expire
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.</title>
<style type="text/css">
<!--
body {
	background-color: #FFF;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}
p{ margin:0;
padding:6px;}
-->
</style></head>

<body>
<table width="702" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" bgcolor="#4388c8" style="padding:40px 60px 20px 60px;;"><table width="100%" border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td  ><span style="font: 1.8em normal Georgia, Times New Roman, Times, serif;color: #fff;">Access to Conference Presentations</span></td>
        <td>&nbsp;</td>
        <td><img src="http://www.petro21.com/docs/GPP_logo_econ_accEmail.gif" width="213" height="46" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" bgcolor="#EBE8E7" style="padding:30px 60px; border-bottom:1px solid #CCC;"><p align="justify">Dear #get.name# #get.surname#</p>
      <p align="justify">Thank you for your participation and support to the <strong>#event_name#</strong> held on the 8th September 2009.  We hope you found the Workshop interesting and enjoyed the presentations and workshop networking. We are working on a new agenda for 2010 and look forward to being in touch.  In the meantime we hope to see you at some of our other industry events held worldwide.    </p>
    <p align="justify">The <strong>#event_name#</strong> <strong>Presentations</strong> are now available for Download on the following link: <a href="http://petro21.com/conference/">http://petro21.com/conference/</a>, please login using your personel access detail  supplyed below </p></td>
  </tr>
  <tr>
    <td width="50%" valign="top" bgcolor="#EBE8E7" style="padding:20px 20px 20px 60px;"><p><strong>Access Details </strong></p>
      <p ><strong>User Name</strong>: your email address<br />
        <strong>Password:</strong> GPP<br />
        <br />
Please contact Jerome via <br />
email: &nbsp;<a href="mailto:jerome@glopac-partners.com">jerome@glopac-partners.com</a> should you have any problems accessing the site. </p>    </td>
    <td width="50%" valign="top" bgcolor="#EBE8E7" style="padding:20px 60px 20px 20px; border-left:1px solid #CCC;"><p><strong>Future Events </strong></p>
      
      <p style="margin:0 0 0 10px"><cfoutput query="weekMenu">
      	<cfif weekMenu.currentrow EQ 1><strong>#weekMenu.name# #weekMenu.year# </strong><cfelse>#weekMenu.name# #weekMenu.year#</cfif><br />
      </cfoutput></p>
      <p >For Further information on these events or our <cfoutput> #year(now())# - #(year(now())+1)# </cfoutput>schedule, Please visit our website www@petro21.com or email us on: info@glopac.com 
Best wishes from the Team </p>
      <p align="justify">&nbsp;</p>    </td>
  </tr>

  <tr bgcolor="#999999">
    <td valign="top" bgcolor="#333333" style="padding:20px 20px 20px 60px; color:#FFF"><p><strong style="color:#EBE8E7">The Hague Office<br />
</strong>Laan Copes van Cattenburch 60A,<br />
2585 GC, &nbsp;The Hague, The Netherlands<br />
Tel: + 31 70 324 6154 <br />
Fax: + 31 70 324 1741<br />
e-mail:  <a href="mailto:babette@glopac-partners.com" style="color:#FFFFFF">babette@glopac-partners.com</a><br />
<a href="http://www.petro21.com/" style="color:#FFFFFF">www.petro21.com</a></U>
&nbsp;<br />
    </p></td>
    <td valign="top" bgcolor="#333333" style="padding:20px 60px 20px 20px; color:#FFF"><p><strong style="color:#EBE8E7">Johannesburg Office<br />
</strong>Tel: + 27 11 880 7052<br />
Fax: + 27 11 880 1798<br />
<a href="mailto:amanda@glopac-partners.com" style="color:#FFFFFF">amanda@glopac-partners.com</a> or <a href="mailto:sonika@glopac-partners.com" style="color:#FFFFFF">sonika@glopac-partners.com</a><br />
  </p>
    <p>&nbsp;</p></td>
  </tr>
</table>

</body>
</html>
