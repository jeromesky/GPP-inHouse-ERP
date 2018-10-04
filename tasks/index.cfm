<cfparam name="form.packageID" default="0">
<cfparam name="form.eventID" default="0">
<cfparam name="form.taskID" default="0">
<script type="text/javascript">
<cfoutput>
	var tasks = {};	
	tasks.packageID = '#form.packageID#';
	tasks.eventID	= '#form.eventID#';
	//var taskID =  '#form.taskID#';
<!---function loadTaskForm(data){
	loadPageToPlaceHolder({ url:'../tasks/dsp_taskForm.cfm', placeHolder:'taskForm', textareaID:'no', Args: {"taskID": data, "packageID":tasks.packageID, "eventID": tasks.eventID}  }); 
}
function loadTasks(packageID){
	loadPageToPlaceHolder({ url:'../tasks/dsp_taskList.cfm', placeHolder:'taskList', textareaID:'no', Args: {"packageID": tasks.packageID}  }); 
}
function loadTask(data){
	$("##taskList").prepend(data);
}--->
</script>
<div class="c4">
	<div  class="ui-corner-all marginBottom15 ui-widget ui-widget-content podForm podBgFade_bl"> </div> 
    <div id="taskForm" class="ui-corner-all marginBottom15 ui-widget ui-widget-content podForm podBgFade"> 
    	<cfinclude template="dsp_taskForm.cfm">
    </div>
</div>

<div class="c5">
	<div id="tasksearch"  class="ui-corner-all marginBottom15 ui-widget ui-widget-content podForm podBgFade">
    	<a href="javascript:loadTasks();">Search menu</a>
        <a href="javascript:loadTaskForm(0);">New task</a>
    </div>
    <div class="ui-corner-all marginBottom15 ui-widget ui-widget-content podLinks" style=" height:310px; overflow:auto">
    	<fieldset style="overflow:hidden">
		<legend class="ui-corner-all">tasks</legend>
		<div id="taskList" class="tableContainer">
    	<cfinclude template="dsp_taskList.cfm">
        </div>
        </fieldset>
    </div>
</div>
</cfoutput>
<!---	loadTaskForm(#form.taskID#, packageID )
		loadTasks(packageID)--->	
<!---function loadTaskForm(taskID){
		$('##area_taskForm').load("../tasks/dsp_taskForm.cfm", {'taskID' : taskID, 'packageID' : packageID} );
		//alert("load form");
}--->
<!---function loadTasks(packageID){
		$('##area_taskList').fadeIn("fast").load("../tasks/dsp_taskList.cfm", { 'packageID' : packageID } );
		//alert("load list");
}---><!---<div id="area_taskForm" style="float:left; display:inline; width:260px;"></div>
<div id="area_taskList" style="float:left; display:inline; "></div>--->
<!---$(document).ready(function(){
			$('##taskForm').live('submit', function() { 
				$(this).ajaxSubmit({ success: loadTaskForm() }); 
				return false; 
			}); 
});--->