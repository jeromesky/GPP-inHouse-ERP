<cfparam  name="url.eventID" default="0">


<cfquery datasource="#gpp#" name="qryResult">
SELECT 
	   [eventName]
      ,[taskDateDue]
      ,[emailPrivate]
      ,[typeLabel]
      ,[staffName]
      ,[taskComment]
      ,[taskSpecs]
      ,[branchName]
      ,[contactName]
      ,[taskID]
      ,[packageID]
      ,[eventID]
      ,[taskCompleted]
      ,[taskManager]
      ,[contactEmail]
      ,[taskTypeID]
      ,[publicationURL]
      ,[branchPassword]
      ,[branchUserName]
  FROM 
  	[TASKS_tasks]
WHERE
  		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.eventID#">
ORDER BY
		branchName
</cfquery>

<cfscript>
	eventCfc			= createObject("component", "Officecfc.eventName");
	eventName		= #eventCfc.eventName(url.eventID)#;
</cfscript>