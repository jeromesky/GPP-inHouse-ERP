<cfoutput>
<table width=768px border=1>
<tr>
<td>List Format</td>
<td>Event (code) Name</td>
<td>Output Format</td>
</tr>
<td><select name=event><cfloop query="get_ListFormat">
<option value="#listName#"> - #listName#</option></cfloop>
</select></td>
<td><select name=event><cfloop query="get_Events">
<option value="#get_Events.eventId#"> #get_Events.eventName# (#get_Events.eventCode#) </option></cfloop>
</select></td>
<td><select name=event><cfloop query="get_OutputFormat">
<option value="#outputName#"> - #outputName#</option></cfloop>
</select></td>
</tr>
</table>
* = Only one format of output
</cfoutput>