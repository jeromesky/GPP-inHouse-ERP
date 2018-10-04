<cfoutput>
<div align="left">

<fieldset>
  <legend>Audience List</legend>
  
<table width="100%" border="0">
<tr bgcolor="##69c">
<th><a href="?FA=audienceCreate">Add</a></td>
<th>Name&nbsp;</th>
<th>Interest/s&nbsp;</th>
<!---<th>Regions&nbsp;of&nbsp;the&nbsp;World&nbsp;</th>---->
<th>Countries</th>
<th>Business&nbsp;Focus&nbsp;</th>
<th>Company&nbsp;</th>
<th title="BPA&nbsp;Designation">Roles&nbsp;/&nbsp;Positions&nbsp;</th>
<th>Event</th>
<th>Total</td>
<th>Added/Updated&nbsp;by&nbsp;</th>
<th>&nbsp;Date&nbsp;Updated&nbsp;</th>
</tr>
<cfloop query = "qry_AudienceList"><tr valign="top"<cfif qry_AudienceList.currentRow MOD 2 is 0> bgcolor="##ccc"</cfif>>
<td><a href="?FA=audienceEdit&ID=#audienceID#">Edit</a></td>
<td><a href="?FA=audienceTotalUpdate&ID=#audienceID#">#audienceName#</a></td>
<td>#AUDIENCEBUSINESSECTOR#</td>
<td>#AUDIENCECOUNTRYLIST#</td>
<td>#AUDIENCEREGIONS#</td>
<td>#AUDIENCECOMPANYLIST#</td>
<td>#AUDIENCEROLELIST#</td>
<td>#AUDIENCEEVENTLIST#</td>
<td>#AUDIENCETOTAL#</td>
<td>#StaffIDcreated# /<br>#StaffIDupdated# <cfif StaffIDupdated EQ "100">-Testing</cfif></td>
<td><cfif DateUpdated EQ "">#dateformat(DateAdded, 'YY/MM/DD')#<cfelse>#dateformat(DateUpdated, 'YY/MM/DD')#&nbsp;#timeformat(DateUpdated, 'HH:MM')#</cfif></td>
</tr></cfloop>

<cfif qry_AudienceList.recordcount GT 15><tr bgcolor="##69c">
<th><a href="?FA=audienceCreate">Add</a></td>
<th>Name&nbsp;</th>
<th>Interest/s&nbsp;</th>
<!---<th>Regions&nbsp;of&nbsp;the&nbsp;World&nbsp;</th>---->
<th>Countries</th>
<th>Business&nbsp;Focus&nbsp;</th>
<th>Company&nbsp;</th>
<th title="BPA&nbsp;Designation">Roles&nbsp;/&nbsp;Positions&nbsp;</th>
<th>Event</th>
<th>Total</td>
<th>Added/Updated&nbsp;by&nbsp;</th>
<th>&nbsp;Date&nbsp;Updated&nbsp;</th>
</tr></cfif>
</table>

</fieldset>

</div>
</cfoutput>