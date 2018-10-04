<cfinclude template="qry_notes.cfm">

<cfoutput query="qry_notes">
<div class="note">

	
    
	<span class="date">
    	#dateFormat(qry_notes.noteDate, "dd mm yyyy")#
    </span>
    <span class="staff">
    	#qry_notes.staffname#
    </span>
    <div class="clear"></div>
    #qry_notes.noteComment#
</div></cfoutput>