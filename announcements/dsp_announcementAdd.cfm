<cfoutput>
<div align="left">

<fieldset>
  <legend>Announcement Added</legend>

<cfif check.recordcount EQ 0>
The announcement'<b>#form.announcementName#</b> has been added.<br>
Do you wish to ...<br>
- <a href="?">return to the main menu</a><br>
or <a href="?FA=announcement-Create">edit</a> the this newly created annoucment<br>
or <a href="?FA=announcement-Create">Add</a> another new one<br>
<cfelse>
Sorry unable to add new Announcement called, as it is simialr to the existing one with the same name<br>
<!--- add link to existing one to edit --->

</cfif>
</fieldset>

</div>
</cfoutput>