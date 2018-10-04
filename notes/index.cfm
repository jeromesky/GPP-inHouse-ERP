<cfoutput>
<script type="text/javascript">
	notes = new Object;
	var noteTable = '#form.noteTable#';
	var noteTableID = #form.noteTableID#;
	
	

	<!---$("##noteAdd").click(function(){--->
	function noteAdd(){
			var get_noteData = $("##noteComment").val();
			var get_noteTable = $("##noteTable").val();
			var get_noteTableID = $("##noteTableID").val();
			postData({ url:'../notes/qry_noteSave.cfm', callfunction:'returnNote',  Args: {"noteTable": get_noteTable, "noteTableID":get_noteTableID, "noteComment":get_noteData}  });
			$("##noteComment").val("");
	}
	
	function returnNote(data){
		$("##notes").prepend(data);	
	}
</script>
<div class="c5">
	<div id="tasksearch"  class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade_bl">
    	<fieldset  style="overflow:hidden">
		<legend class="ui-corner-all">new note</legend>
        		<input type="hidden" id="noteTable" value="#form.noteTable#" />
                <input type="hidden" id="noteTableID" value="#form.noteTableID#" />
        	 	<textarea id="noteComment" style="width:355px ; height:55px" ></textarea>
                <button onclick="javascript:noteAdd();" >Add comment</button>
        </fieldset>
    </div>
    
    <div id="notes" class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podLinks" style=" height:280px; overflow:auto">
		<cfinclude template="dsp_notes.cfm">
    </div>

</div>
</cfoutput>