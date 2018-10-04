<cfparam name="form.taskID" default="0">

<cfquery name="get_tasks" datasource="#gpp#">
SELECT
		[taskID]
      ,[taskStatusID]
      ,[typeLabel]
      ,[staffID]
      ,[taskDateDue]
      ,[taskDateAdded]
      ,[taskComment]
      ,[taskSpecs]
      ,[allocation]
      ,[packageID]
      ,[taskTypeID]
      ,[statusLabel]
  FROM 
  		[CRM_tasks]
WHERE 
		<cfif form.taskID EQ 0>
        [packageID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.packageID#">
        <cfelseif form.taskID NEQ 0>
        [taskID] 		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.taskID#">
        </cfif>
ORDEr by taskDateDue 
</cfquery>