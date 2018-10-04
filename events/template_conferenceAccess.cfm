


<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>econference files access</title>
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
<table width="702" align="center" cellpadding="0" cellspacing="0" style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
  <tr>
    <td colspan="2" bgcolor="#4388c8" style="padding:40px 60px 20px 60px;;"><table width="100%" border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td  ><span style="font: 1.8em normal Georgia, Times New Roman, Times, serif;color: #fff;">Access to <br />
          <cfoutput>#geteventidGPP.event_name#</cfoutput></span></td>
        <td>&nbsp;</td>
        <td><img src="http://www.petro21.com/docs/GPP_logo_econ_accEmail.gif" width="213" height="46" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" bgcolor="#f7f7f7" style="padding:30px 60px; border-bottom:1px solid #CCC;"><p align="justify"><cfoutput>Dear #qryAttendenceList.name# #qryAttendenceList.surname#</p><br>
      <p align="justify">Thank you for your participation and support to the <strong>#geteventidGPP.event_name#</strong> held on the #qry_eventDateFormatWeek#.  We trust you benefited from the presentations and networking and hope to have your participation at our future worldwide events.   </p><br>
      <p align="justify">We will celebrate our 20th Africa Oil Week next year, with dates set for 25th &shy; 29th November 2013, at the Cape Town International Convention Centre.</p><br>
    <p align="justify">The  <strong>#geteventidGPP.event_name# Presentations</strong> are now available for Download on the following link: <a href="http://www.petro21.com/delegates/">http://www.petro21.com/delegates/</a>, please login using your personal access details supplied below. </p><br>
    <p> We hope to see you at our upcoming events.<!---or for the #right(trim(geteventidGPP.event_name), (len(trim(geteventidGPP.event_name))-4))# #(year(now() )+1)#---></p>
    <p >Best wishes from the Team</p>
    </cfoutput></td>
  </tr>
  <tr>
    <td width="50%" valign="top" bgcolor="#f7f7f7" style="padding:20px 20px 20px 60px;"><p><strong style="color:#4388c8">Access Details </strong></p>
      <p ><strong>User Name</strong>:<cfif qryAttendenceList.paid EQ 1><cfoutput> #qryAttendenceList.email#</cfoutput><cfelse><span style="color:#FF0000; font-weight:bold; margin-bottom:10px">Payment not received</span></cfif><br />
        <strong>Password:</strong> <cfif qryAttendenceList.paid EQ 1><cfoutput>#qryAttendenceList.password#</cfoutput><cfelse><span style="color:#FF0000; font-weight:bold; margin-bottom:10px">Payment not received</span></cfif><br />
        <br />
<cfif qryAttendenceList.paid EQ 1>
Please contact <br />
<strong>Jerome </strong> <br />
email: &nbsp;<a href="mailto:jerome@glopac-partners.com">jerome@glopac-partners.com</a> should you have any problems accessing the presentations.<cfelse>
<br />
<H4>Please contact Accounts &minus; ref payment of invoice</h4>
 <br />
<strong>Janine van der Leeuw </strong> <br />
email: &nbsp;<a href="mailto:accounts@glopac-partners.com">accounts@glopac-partners.com</a> with proof of payment, to enable your account, or <br /><br />
<strong>Babette van Gessel </strong> <br />
email: &nbsp;<a href="mailto:babette@glopac-partners.com">babette@glopac-partners.com</a> for any other related issues. <br />
</cfif> </p>    </td>
    <td width="50%" valign="top" bgcolor="#f7f7f7" style="padding:20px 60px 20px 20px; border-left:1px solid #CCC;"><p><strong style="color:#4388c8">Future Events </strong></p>
      
      <p style="margin:0 0 0 15px"><cfoutput query="qryUpcomingEvents">
      	<a href="http://www.petro21.com/events/index.cfm?id=#qryUpcomingEvents.id#" style="text-decoration:none; color:##333333"><cfif qryUpcomingEvents.currentrow EQ 1><strong>#qryUpcomingEvents.name# #qryUpcomingEvents.year# </strong><cfelse>#qryUpcomingEvents.name# #qryUpcomingEvents.year#</cfif></a><br />
      </cfoutput></p>
    <br>  <p >For Further information on these events or our <cfoutput> #year(now())# - #(year(now())+1)# </cfoutput>schedule, Please visit our website <a href="http://www.petro21.com">www.petro21.com</a> or email us on: info@glopac.com</p>
        </td>
  </tr>

  <tr bgcolor="#999999">
    <td valign="top" bgcolor="#333333" style="padding:20px 20px 20px 60px; color:#FFF"><p><strong style="color:#4388c8">The Hague Office<br />
</strong>Denneweg 124, <br />
2514 CL, &nbsp;The Hague, The Netherlands<br />
Tel: + 31 70 324 6154 <br />
Fax: + 31 70 324 1741<br />
e-mail:  <a href="mailto:babette@glopac-partners.com" style="color:#FFFFFF">babette@glopac-partners.com</a><br />
<a href="http://www.petro21.com/" style="color:#FFFFFF">www.petro21.com</a></U>
&nbsp;<br />
    </p>    </td>
    <td valign="top" bgcolor="#333333" style="padding:20px 60px 20px 20px; color:#FFF;  border-left:1px solid #fff;"><p><strong style="color:#4388c8">Johannesburg Office<br />
</strong>Tel: + 27 11 880 7052<br />
Fax: + 27 11 880 1798<br />
<a href="mailto:amanda@glopac-partners.com" style="color:#FFFFFF">amanda@glopac-partners.com</a> or <a href="mailto:sonika@glopac-partners.com" style="color:#FFFFFF">sonika@glopac-partners.com</a><br />
  </p>
    <p>&nbsp;</p></td>
  </tr>
</table>

</body>
</html>
