<!---
<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=badge_#dateformat(now(), "yyyy-mm-dd")#-#randrange(1,99)#.xls">
<CFCONTENT TYPE="application/vnd.msexcel">--->
<style>
td, th {font-family:Calibri; font-size:12px;}
</style>

<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TableEdit">
<tr>
<th width='15px'>&#10004;</th>
<th width='200px'>name</th>
<th width='350px'>full name</th> 
<th width='350px'>company</th>
<th width='300px'>company1</th>
<th width='100px'>events</th>
<th width='85px'>type</th>
</tr><cfset row=0>
<cfoutput query="qry_print" group='user_id'><tr bgcolor="#iif(row MOD(2) eq 1,de('ffffff'),de('dadada'))#"><cfset row= row +1>
<td><input type="checkbox"></td>
<td>#trim(name)#</td>
<td>#trim(name)# #trim(surname)#</td> 
<td>#trim(company)#</td>
<td><cfif len(trim(company)) GT 26><font color="red"><!--- #Insert(' ~~ ', company, 26)# --->#company#</font><cfelse>&nbsp;</cfif></td><cfset num = 0><cfoutput><cfset num = num + eventID></cfoutput>
<td><cfif #num# EQ #var.tttt#><font color="green"><b>ALL</b>
<cfelseif #num# EQ #url.dID#><font color="orange">Only Dinner
<cfelseif #num# EQ #url.eID#><font color="orange">0nly Event
<cfelseif #num# EQ #url.sID#><font color="orange">Only SB
<cfelseif #num# EQ #url.fID#><font color="orange">Only Fourm
<cfelseif #num# EQ #var.de#><font color="purple">Dinner + Event 2
<cfelseif #num# EQ #var.df#><font color="purple">Dinner + Fourm 2
<cfelseif #num# EQ #var.ds#><font color="purple">Dinner + SB 2
<cfelseif #num# EQ #var.ef#><font color="purple">Event + Fourm 2
<cfelseif #num# EQ #var.es#><font color="purple">Event + SB 2
<cfelseif #num# EQ #var.fs#><font color="purple">Fourm + SB 2
<cfelseif #num# EQ #var.efs#><font color="blue">Event + Fourm + SB 3
<cfelseif #num# EQ #var.dfs#><font color="blue">Dinner + Fourm + SB 3
<cfelseif #num# EQ #var.des#><font color="blue">Dinner + Event + SB 3
<cfelseif #num# EQ #var.def#><font color="blue">Dinner + Event + Fourm 3
<cfelse><font color="red">Combo / Error #num#</cfif></font></td>
<td><cfif chkSpeaker EQ 1>+Speaker
  <cfelseif chkGuest EQ 1>+Guest
  <cfelseif chkModerator EQ 1>Moderator
  <cfelseif chkExhibitor EQ 1>Exhib
  <cfelseif chkDelegate EQ 1>Delegate
  <cfelseif chkPress EQ 1>Press
  <cfelse><font color="red">Error</font></cfif></td>
</tr></cfoutput>
</table>Total: <cfoutput>#row#</cfoutput>