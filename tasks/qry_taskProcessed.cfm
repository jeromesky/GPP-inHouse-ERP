
<cfquery datasource="#gpp#">
	UPDATE tasks
    SET 
    	taskCompleted = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
        taskStatusID		= 6
    WHERE
    	[taskID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.taskID#"> 
</cfquery>
<cfoutput>updated</cfoutput>