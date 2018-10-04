<cfinclude template="../Application.cfm">

<cfif parameterexists(form.speakersession) AND parameterexists(form.id)>

<!--- UPDATE SLOT --->
<cfquery datasource="#dsnP21#">
  UPDATE 
    speakers_program
  SET 
    decription= '#form.decription#', 
    speakersession = #form.speakersession#, 
<cfif parameterexists(form.speakertime) AND form.speakertime NEQ "">
    speakertime	= <cfqueryparam value=" #form.speakertime#" cfsqltype="CF_SQL_TIME">,
</cfif>
    clientid = <cfif parameterexists(form.clientid)><cfqueryparam cfsqltype="cf_sql_integer" value="#form.clientid#"><cfelse>0</cfif>,
    speaker	= '#trim(form.speaker)#', 
    comment	= '#trim(form.comment)#'
  WHERE 
    id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<!--- get all the deails for the new slot --->
<cfquery datasource="#dsnP21#" name="get">
  SELECT 
    speakers_program.*, 
    speakers.name, 
    speakers.delegation, 
    speakers.photo, 
    speakers.cv
  FROM 
    speakers_program 
    LEFT 
      outer JOIN speakers ON speakers_program.clientid = speakers.id
  WHERE 
    speakers_program.id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<cfoutput>
<div class="clear"></div>
<div class="timebox"><cfif get.speaker NEQ 1><span class="date" id="#get.id#"><cfif get.speakertime NEQ "">#timeformat(get.speakertime, "HH:mm")#<cfelse>__:__</cfif></span><cfelse>&nbsp;</cfif></div>
<div class="headerbox" <cfif get.speaker EQ 1>style="font-weight:normal; color:##0099CC;"</cfif>><cfif get.decription NEQ ""><strong><span class="decription" id="#get.id#">#get.decription#</span></strong><cfelse>&nbsp;</cfif></div>
<div class="editbox"><a href="javascript:loadEditSlot(#get.id#);<!--- speakers_program_edit.cfm?eventid=#eventid#&id=<cfif #get.id# NEQ "">#get.id#<cfelse>0</cfif>&groupby=#groupby#--->"><img src="../img/contract_report.gif"  border="0" /></a></div>
<div class="speakerB"><span class="speak" id="#get.id#"><cfif get.speaker eq 0> yes<cfelse>no</cfif></span></div>
<div class="posbox"><cfif get.speakertime NEQ ""><span class="pos" id="#get.id#">#get.pos#</span><cfelse>&nbsp;</cfif></div>
<div class="delbox"><cfif get.cv NEQ ""><img src="../img/ok_tick.gif"><cfelse>&nbsp;</cfif></div>
<div class="delbox"><cfif get.photo NEQ ""><img src="../img/ok_tick.gif"><cfelse>&nbsp;</cfif></div>
<div class="delbox"><a href="javascript:DeleteRow(#get.id#);"><img src="../img/new_delete.gif" border="0" /></a></div>
<div class="clear"></div>
<div class="timebox">&nbsp;</div>
<div class="headerbox"><cfif get.name NEQ ""><div class="editSpeaker" id="#get.id#">#trim(get.name)#, #trim(get.delegation)#</div></cfif>
<cfif get.comment NEQ "" OR len(get.comment) GT 4><div style="font-size:11px;"><span class="comment" id="#get.id#">#get.comment#</span></div></cfif>
</div>
<div class="clear"></div>
</cfoutput>
</cfif>

<cfif parameterexists(form.speakersession) AND parameterexists(form.eventid)>
<!--- INSERT NEW SLOT --->
<cfquery datasource="#dsnP21#" name="newSlot">
  INSERT INTO 
    speakers_program (
      decription, 
      speakersession, 
      <cfif parameterexists(form.speakertime) AND form.speakertime NEQ "">speakertime,</cfif>
      clientid,
      comment, 
      eventid, 
      groupby, 
      speaker
      )
      VALUES
      (
      '#form.decription#',
      #form.speakersession#, 
      <cfif parameterexists(form.speakertime) AND form.speakertime NEQ "">
      <cfqueryparam value=" #form.speakertime#" cfsqltype="CF_SQL_TIME">,</cfif>
      <cfif parameterexists(form.clientid)>
      <cfqueryparam cfsqltype="cf_sql_integer" value="#form.clientid#"><cfelse>0</cfif>,
      '#trim(form.comment)#', 
      #form.eventid#, 
      #form.groupby#, 
      '#trim(form.speaker)#'
      )
    SELECT @@IDENTITY AS id
</cfquery>

<!--- get all the details for the new slot --->
<cfquery datasource="#dsnP21#" name="get">
    SELECT 
      speakers_program.*, 
      speakers.name, 
      speakers.delegation, 
      speakers.photo, 
      speakers.cv
    FROM 
      speakers_program 
      LEFT outer JOIN speakers ON speakers_program.clientid = speakers.id
    WHERE 
      speakers_program.id = #newSlot.id#
    ORDER BY 
      speakersession, speakertime
</cfquery>

<cfoutput>
<li id="item_#get.id#" style="border-bottom:1px solid ##BBE7F3;<cfif get.speaker EQ 1> background-color:##edf8ff;</cfif><cfif get.speaker EQ 2> background-color:##fff2ef</cfif>">
<div class="clear"></div>
<div class="timebox"><cfif get.speaker NEQ 1><span class="date" id="#get.id#"><cfif get.speakertime NEQ "">#timeformat(get.speakertime, "HH:mm")#<cfelse>__:__</cfif></span><cfelse>&nbsp;</cfif></div>
<div class="headerbox" <cfif get.speaker EQ 1>style="font-weight:normal; color:##0099CC;" </cfif>><cfif get.decription NEQ ""><strong><span class="decription" id="#get.id#">#get.decription#</span></strong><cfelse>&nbsp;</cfif></div>
<div class="editbox"><a href="javascript:loadEditSlot(#get.id#);<!--- speakers_program_edit.cfm?eventid=#eventid#&id=<cfif #get.id# NEQ "">#get.id#<cfelse>0</cfif>&groupby=#groupby#--->"><img src="../img/contract_report.gif"  border="0" /></a></div>
<div class="speakerB"><span class="speak" id="#get.id#"><cfif get.speaker eq 0>yes<cfelse>no</cfif></span></div>
<div class="posbox"><cfif get.speakertime NEQ ""><span class="pos" id="#get.id#">#get.pos#</span><cfelse>&nbsp;</cfif></div>
<div class="delbox"><cfif get.cv NEQ ""><img src="../img/ok_tick.gif"><cfelse>&nbsp;</cfif></div>
<div class="delbox"><cfif get.photo NEQ ""><img src="../img/ok_tick.gif"><cfelse>&nbsp;</cfif></div>
<div class="delbox"><a href="javascript:DeleteRow(#get.id#);"><img src="../img/new_delete.gif" border="0" /></a></div>
<div class="clear"></div>
<div class="timebox">&nbsp;</div>
<div class="headerbox"><cfif get.name NEQ ""><div class="editSpeaker" id="#get.id#">#trim(get.name)#, #trim(get.delegation)#</div></cfif>
<cfif get.comment NEQ "" OR len(get.comment) GT 4><div style="font-size:11px;"><span class="comment" id="#get.id#">#get.comment#</span></div></cfif>
</div>
<div class="clear"></div>
</li>
</cfoutput>

</cfif>