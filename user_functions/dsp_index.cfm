<cfinclude template="qry_index.cfm"><cfoutput><div class="index">
<sup class="displayLabel">User</sup>		<sup class="displayData">#qryIndexUser.userName# #qryIndexUser.userSurname#</sup>
<sup class="displayLabel">Updated</sup>		<sup class="displayData">#updatedDate#</sup>
<sup class="displayLabel">Updated by</sup>	<sup class="displayData">#get_update.updateStaff#</sup>
<sup class="displayLabel">Capture</sup>		<sup class="displayData">#dateformat(get_update.dtmCaptured, "dd mmm yyyy")#</sup>
<sup class="displayLabel">Capture by</sup>	<sup class="displayData">#get_update.capby#</sup> 
<sup class="displayLabel">Speaker</sup>		<sup class="displayData"><cfif get_attandedSpeaker.chkSpeaker EQ true>YES<cfelse>Never</cfif></sup> 
<sup class="displayLabel">Att Event</sup>	<sup class="displayData"><cfif get_attandedEvent.chkDelegate EQ true OR get_attandedSpeaker.chkSpeaker EQ true>YES<cfelse>Never</cfif></sup> 
<sup class="displayLabel"><cfif qryIndexUser.status EQ 0><div class="ui-state-error ui-corner-all archived" id="" style="padding: 0pt 0.1em;"><em class="ui-icon ui-icon-alert" style="float:left"></em>User archived</div></cfif></sup>
<div class="clear"></div>
</div></cfoutput>