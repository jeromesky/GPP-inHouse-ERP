<cfinclude template="qry_upcomingList.cfm">
<table width="100%" border="0" cellspacing="0" cellpadding="2">
<cfoutput query="get">
  <tr onMouseOver="style.backgroundColor='##D8E2F9';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';">
    <td>#get.conferenceName# #datePart("yyyy", get.event_expire)#</td>
    <td>#get.strConference_Code#</td>
  </tr>
</cfoutput>
</table>
