<cfinclude template="../tasks/qry_taskList.cfm">


  <cfoutput query="get_tasks">
	<div class="taskRow_#get_tasks.taskID#">
    		<div class="tableColAction">
            	<a href="javascript:DeleteTask(#get_tasks.taskID#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-circle-close"></em>
                    </div>
               </a>
           </div>
            <div class="tableColAction">
            	<a href="javascript:loadTaskForm(#get_tasks.taskID#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-arrowthickstop-1-s"></em>
                    </div>
                </a>
            </div>
            
    		<div class="tableColData">#dateFormat(get_tasks.taskDateDue, "dd.mm.yyyy")#</div>
            <div class="tableColData">#get_tasks.statusLabel#</div>
            <div class="tableColData"><!---#get_tasks.typeLabel#--->#listGetAt(get_tasks.typeLabel, 2, "-")#</div>
            
    </div>
</cfoutput>