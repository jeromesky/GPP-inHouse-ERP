<cfoutput><div align="left">

<fieldset>
  <legend><cfif var.past EQ '0'>Current<cfelse>Past</cfif> Announcements</legend>

<table width="100%" border="0" cellpadding=2 cellspacing=2>
<tr bgcolor="##69c">
<th><a href="?FA=announcement-Create">Add</a></td>
<th>Name</th>
<th>Subject</th>
<th>Event</th>
<th>Expiries</th>
<th>Template</th>
<th><img src="http://test.steelsoldiers.com/gfx_OliveDrab/misc/paperclip.gif"></th>
<th>Updated by</th>
<th>Date Updated</th>
</tr> 
<cfloop query="qryAnnouncementsList"><tr<cfif qryAnnouncementsList.currentRow MOD 2> bgcolor="##ddd"</cfif>>
<td><a href="?FA=announcementEdit&ID=#announcementID#">Edit</a></td>
<td>#announcementName#</td>
<td>#announcementSubject#</td>
<td title="#eventID#">#eventName#</td>
<td>#announcementExpiry#</td>
<td>#announcementType# - #TemplateID#</td>
<td><cfif announcementAttachments NEQ ""><img src="../img/Paper-Clip.jpg"><cfelse>&nbsp;</cfif></td>
<td><cfif StaffIDupdated EQ "">#StaffIDcreated#<cfelse>#StaffIDupdated#</cfif></td>
<td><cfif DateUpdated EQ "">#DateAdded#<cfelse>#DateUpdated#</cfif></td>
</tr></cfloop>
<cfif qryAnnouncementsList.recordcount GT 15><tr bgcolor="##69c">
<th><a href="?FA=announcement-Create">Add</a></td>
<th>Name</th>
<th>Subject</th>
<th>Event</th>
<th>Expiries</th>
<th>Template</th>
<th><img src="http://test.steelsoldiers.com/gfx_OliveDrab/misc/paperclip.gif"></th>
<th>Updated by</th>
<th>Date Updated</th>
</tr></cfif>
</table>
</fieldset>

</div></cfoutput>