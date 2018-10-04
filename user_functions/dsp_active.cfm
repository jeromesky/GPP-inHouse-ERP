<cfoutput><script type="text/javascript">
$('.userActive').change(function(){
	$.post("../user_Edit/Update_Individual.cfm", {"id": #form.userid#, "fieldname": "active", "oldValue": #form.active#, "value": $(this).val() }, function(rdata){ 
		var jsonData = eval(rdata);
		if ( jsonData.status == 1) {
		  growl("Update", 'data updated successfully', 'message', 'ui-icon ui-icon-check', 'notice');
		  $(this).parent().css('background-color', bgColor(1));
		}
		if ( jsonData.status == 0 ) {
		  growl("communication error", 'data change not saved', 'message', 'ui-icon ui-icon-check', 'error');
		  $(this).parent().css('background-color', bgColor(0));
		}
	}); 
});
</script>
<div class="ui-corner-top ui-widget ui-widget-content podForm">
   <fieldset>
      <legend>Set User Status</legend>
  <ul class="listMenu">
      <li><input type="radio" value="0" name="userActive"  class="userActive"  <cfif form.active EQ 0>checked</cfif> /> Archived </li>
      <li><input type="radio" value="1" name="userActive"  class="userActive"  <cfif form.active EQ 1>checked</cfif> /> Current </li>
      <li><input type="radio" value="5" name="userActive"  class="userActive"  <cfif form.active EQ 5>checked</cfif>  /> Freeze </li>
  </ul>
  </fieldset>
</div></cfoutput>