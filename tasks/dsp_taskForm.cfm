<!---<cfparam name="form.packageID" default="0">--->
<cfparam name="form.taskID" default="0">
<cfinclude template="../tasks/qry_taskForm.cfm">


<cfoutput>
<script type="text/javascript">
	<!---var packageID = #form.packageID#;--->
	var taskID	= #form.taskID#;
	

$(document).ready(function(){
	
	$("##taskDateDue").datepicker({ dateFormat: 'dd MM yy' });
    
<!---	$('##form_task').live('submit', function() { 
		$(this).ajaxSubmit({ success: function(){ loadTasks();  } }); 
		return false; 
    });--->

});
<!---function taskSaved(){
		loadTaskForm(0, packageID )  
		loadTasks(packageID)
		loadTaskForm(); 
}--->
</script>

<form action="../tasks/qry_taskSave.cfm" method="post" id="form_task">
<fieldset>
	<legend class="ui-corner-all"><cfif form.taskID EQ 0>Add<cfelse>Edit</cfif> Task</legend>
<input type="hidden" name="packageID" id="packageID" value="#form.packageID#">
<input type="hidden" name="eventID" id="eventID" value="#form.eventID#">
<input type="hidden" name="taskID" id="taskID" value="#form.taskID#">

<b>Task Type</b>
<i class="NoFormat">
<cf_Types name="taskTypeID" cat="media sub" id="#get_task.taskTypeID#">
</i>

<b>Due</b>  
<i class="NoFormat">
<input type="text" name="taskDateDue" id="taskDateDue" value="#dateFormat(get_task.taskDateDue, "dd mmmm yyyy")#" class="ui-corner-all" />
</i>

<!---<b>grace</b>
<i class="NoFormat">
		<select name="LeadTime">
        	<option value="1" <cfif get_task.LeadTime EQ 1>selected</cfif>>1 day</option>
            <option value="2" <cfif get_task.LeadTime EQ 2>selected</cfif>>2 day</option>
            <option value="5" <cfif get_task.LeadTime EQ 5>selected</cfif>>5 day</option>
            <option value="7" <cfif get_task.LeadTime EQ 7>selected</cfif>>1 week</option>
            <option value="14" <cfif get_task.LeadTime EQ 14>selected</cfif>>2 weeks</option>
            <option value="30" <cfif get_task.LeadTime EQ 30>selected</cfif>>1 month</option>
        </select>
</i>--->

<b>Status</b>  
<i class="NoFormat">
<!---<cf_status name="taskStatusID" cat="2" id="#get_task.taskStatusID#">--->
<label><input type="checkbox" name="taskStatusID" value="6" <cfif get_task.taskStatusID EQ 6>checked="checked"</cfif> /> Task done</label> 
</i>


<b>Task Specs</b>  
<i class="NoFormat">
<textarea type="text" name="taskSpecs" id="taskSpecs" class="ui-corner-all">#get_task.taskSpecs#</textarea>
</i>

<b>Comment</b>  
<i class="NoFormat">
<textarea type="text" name="taskComment" id="taskComment" class="ui-corner-all">#get_task.taskComment#</textarea>
</i>


<b>allocation</b>  
<i class="NoFormat">
	<div class="c1">
          <label><input type="radio" name="allocation" value="11" <cfif get_task.allocation EQ 11> checked="checked"</cfif> />Tanya</label>  <br />
          <label><input type="radio" name="allocation" value="8"  <cfif get_task.allocation EQ 8> checked="checked"</cfif> />Jerry</label>  <br />
          <label><input type="radio" name="allocation" value="7" <cfif get_task.allocation EQ 7> checked="checked"</cfif> />Jerome</label> <br />
          <label><input type="radio" name="allocation" value="34" <cfif get_task.allocation EQ 34> checked="checked"</cfif>/>Jodee</label> <br />
          <label><input type="radio" name="allocation" value="67" <cfif get_task.allocation EQ 67> checked="checked"</cfif>/>David</label> <br />
          <label><input type="radio" name="allocation" value="4" <cfif get_task.allocation EQ 4> checked="checked"</cfif>/>Babette</label> 
    </div>
    <div class="c1" style="width:85px">
          <label><input type="radio" name="allocation" value="5" <cfif get_task.allocation EQ 5> checked="checked"</cfif> />Amanda</label> <br />
          <label><input type="radio" name="allocation" value="10" <cfif get_task.allocation EQ 10> checked="checked"</cfif>/>Sonika</label> <br />
          <label><input type="radio" name="allocation" value="20" <cfif get_task.allocation EQ 20> checked="checked"</cfif>/>Jason</label> 
  </div>
</i>




<b></b>  
<i class="NoFormat"><button class="ui-corner-all">Save</button></i>

</fieldset>
</form>
</cfoutput>