<cfinclude template="qry_speakers.cfm">
<div style="border-bottom:#000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid #000 4px;"><cfoutput>#Ucase(qrySpeakers.recordcount)# CONFIRMED SPEAKERS</cfoutput></span> </div>
<table cellpadding="0" cellspacing="0" border="0" style="font-family:Arial, Helvetica, sans-serif; color:#333; font-size:11px;">
<cfoutput query="qrySpeakers"><tr>
<td width="55"><img src="http://www.petro21.com/_files/client/<cfif qrySpeakers.fileName NEQ "">#qrySpeakers.fileName#<cfelse>MugShots.jpg</cfif>" width="47" height="60" /></td>
<td><strong style="color:###DarkColor#; font-size:13px; line-height:18px">#qrySpeakers.speakerName#</strong><br />#qrySpeakers.userPosition#<br /><span style="color:##666">#Ucase(qrySpeakers.companyName)#</span></td>
</tr></cfoutput>
</table>