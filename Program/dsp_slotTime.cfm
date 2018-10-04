<cfoutput>
<cfswitch expression="#qry_program.speakerType#">

<cfcase value="1"><!--- Speaker  and end of day---> 
    <div class="slot_time_#qry_program.speakerType# <cfif qry_program.speakerStatus eq 3>confirmed<cfelseif qry_program.speakerStatus eq 6>finalized</cfif>">
            #timeFormat(qry_program.speakerTime, "HH:MM")#
			<!---  (#qry_program.speakerID#) [#qry_program.speakerSession#]--->
            <input type="radio" name="tolocation" class="tolocation" />
    </div>
    
	<cfif qry_program.fileName NEQ "">
        <img src="http://www.petro21.com/_files/client/#qry_program.fileName#" width="70" height="90" class="slot_sortable_handle"  alt="move" />
    <cfelse>
        <img src="http://www.petro21.com/_files/client/MugShots.jpg" width="70" height="90" class="slot_sortable_handle"  alt="move" />
    </cfif>
</cfcase>

<cfcase value="2"><!--- Session slot --->
	<div class="slot_time_#qry_program.speakerType#">
            &nbsp;<!---#timeFormat(qry_program.speakerTime, "HH:MM")#
			 (#qry_program.speakerID#)[#qry_program.speakerSession#]--->
	</div>
    <img src="http://www.petro21.com/my-office/_img/program_holder-session.jpg" width="70" height="40" class="slot_sortable_handle"  alt="move" />
</cfcase>

<cfcase value="3"><!--- Info slot  --->
    <div class="slot_time_#qry_program.speakerType#">
           #timeFormat(qry_program.speakerTime, "HH:MM")#
		   <!--- (#qry_program.speakerID#) [#qry_program.speakerSession#]--->
    </div>
    <img src="http://www.petro21.com/my-office/_img/program_holder-info.jpg" width="70" height="40" class="slot_sortable_handle"  alt="move" />
</cfcase>

<cfcase value="4"><!--- File slot  --->
	<div class="slot_time_#qry_program.speakerType#">
            &nbsp;#timeFormat(qry_program.speakerTime, "HH:MM")#
			<!--- (#qry_program.speakerID#)[#qry_program.speakerSession#]--->
	</div>
    <img src="http://www.petro21.com/my-office/_img/program_holder-file.jpg" width="70" height="40" class="slot_sortable_handle"  alt="move" />
</cfcase>

<cfcase value="5"><!---  Moderator---> 
    <div class="slot_time_#qry_program.speakerType#">
            #timeFormat(qry_program.speakerTime, "HH:MM")#
			<!---  (#qry_program.speakerID#) [#qry_program.speakerSession#]--->
            <input type="radio" name="tolocation" class="tolocation" />
    </div>
    <cfif qry_program.fileName NEQ "">
        <img src="http://www.petro21.com/_files/client/#qry_program.fileName#" width="70" height="90" class="slot_sortable_handle"  alt="move" />
    <cfelse>
        <img src="http://www.petro21.com/_files/client/MugShots.jpg" width="70" height="90" class="slot_sortable_handle"  alt="move" />
    </cfif>
</cfcase>

<cfcase value="6"><!--- Iend of day  --->
    <div class="slot_time_#qry_program.speakerType#">
           #timeFormat(qry_program.speakerTime, "HH:MM")#
		   <!--- (#qry_program.speakerID#) [#qry_program.speakerSession#]--->
    </div>
    <img src="http://www.petro21.com/my-office/_img/program_holder-info.jpg" width="70" height="90" class="slot_sortable_handle"  alt="move" />
</cfcase></cfswitch></cfoutput>