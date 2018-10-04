<cfoutput><div align="left">

<fieldset>
  <legend>Template List</legend>

<table width="100%" border="0" cellpadding=2 cellspacing=2>
<tr bgcolor="##69c">
<th><a href="?FA=templateCreate">Upload</a></td>
<th>Name</th>
<th>Preview</th>
<th>Usage</th>
<th>Expiries</th>
<th>Updated by</th>
<th>Date Updated</th>
</tr> 
<cfloop query="qry_templateList"><tr<cfif qry_templateList.currentRow MOD 2> bgcolor="##ddd"</cfif>>
<td><a href="?FA=templateEdit&ID=#templateID#">Edit</a></td>
<td>#templateName#</td>
<td>#announcementSubject#</td>
<td title="#eventID#">#eventName#</td>
<td>#announcementExpiry#</td>
<td>#announcementType# - #TemplateID#</td>
<td><cfif announcementAttachments NEQ ""><img src="../img/Paper-Clip.jpg"><cfelse>&nbsp;</cfif></td>
<td><cfif StaffIDupdated EQ "">#StaffIDcreated#<cfelse>#StaffIDupdated#</cfif></td>
<td><cfif DateUpdated EQ "">#DateAdded#<cfelse>#DateUpdated#</cfif></td>
</tr></cfloop>
<cfif qry_templateList.recordcount GT 15><tr bgcolor="##69c">
<th><a href="?FA=templateUpload">Upload</a></td>
<th>Name</th>
<th>Preview</th>
<th>Usage</th>
<th>Expiries</th>
<th>Updated by</th>
<th>Date Updated</th>
</tr></cfif>
</table>

</fieldset>

</div></cfoutput>