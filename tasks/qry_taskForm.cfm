

<cfquery name="get_task" datasource="#gpp#">
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
      ,[typeLabel]
<!---      ,[LeadTime]---> 
  FROM 
  		[CRM_tasks]
WHERE 
		[taskID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.taskID#">
</cfquery>