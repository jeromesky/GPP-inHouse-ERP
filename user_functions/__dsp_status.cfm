<cfinclude template="qry_status.cfm">
 
 <script type="text/javascript">
 $('#area_status :checkbox').change(function(){

	var get_status	= $(this).attr("checked") ? $(this).val() : 0
			if(get_status == 1 ){

				$('#area_status').css( 'background-color', '#FF6633');
				$('#status_label').html("Archived");
				$.post("Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, 'value': 'A', 'fieldname' : 'STATUS', "oldValue" : 'C' });
			}else{
				$('#area_status').css( 'background-color', '#66CC66');
				$('#status_label').html("Current");
				$.post("Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, 'value': 'C', 'fieldname' : 'STATUS', "oldValue" : 'A' });
			}
});
</script>
<cfoutput>
 <fieldset id="area_status" style="background-color:<cfif get.STATUS eq "Current" >##66CC66<cfelseif get.STATUS EQ "Archived">##FF6633</cfif>" class="fieldsetHighLight">
    <legend>Status</legend>
        <b id="status_label">#get.status#</b>
        <i id="#get.userID#" class="field_button_container">
        <input type="checkbox" name="status" id="status" value="1" <cfif get.STATUS EQ "Archived">checked</cfif>></i>
</fieldset></cfoutput>