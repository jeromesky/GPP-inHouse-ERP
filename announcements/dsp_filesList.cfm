<cfoutput>
<div align="left">

<fieldset>
  <legend>File Manager</legend>

<table width="100%" border="0" cellpadding=2 cellspacing=2>
<tr bgcolor="##69c">
<th><a href="?FA=fileLoad">Add</a></td>
<th>Name</th>
<th>Location</th>
<th>Size</th>
<th>Last Modified</th>
<th>Preview</th>
</tr>
<cfloop query="dir_img_events_2011"><tr<cfif dir_img_events_2011.currentRow MOD 2> bgcolor="##ddd"</cfif>>
<td><a href="?FA=fileUpdate&fileName=#NAME#">Update</a></td>
<td>#Name#</td>
<td>#replace(replace(DIRECTORY, 'G:\websites\petro21\htdocs\', 'http://www.petro21.com/'), '\', '/', 'ALL')#/#name#</td>
<td title="#Size#">#Size#</td>
<td>#DATELASTMODIFIED#</td>
<td><a href="?FA=filePreview&fileName=#name#">p</a></td>
</tr></cfloop>

<cfif dir_img_events_2011.recordcount GT 15><tr>
<th><a href="?FA=fileLoad">Add</a></td>
<th>Name</th>
<th>Location</th>
<th>Size</th>
<th>Last Modified</th>
<th>Preview</th>
</tr></cfif>
</table>
</fieldset>

</div>
</cfoutput>