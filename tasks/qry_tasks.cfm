<cfscript>
function EpochTimeToDate(epoch) {
    return DateAdd("s", epoch, "January 1 1970 00:00:00");
}
</cfscript>

<cfquery datasource="#gpp#" name="qryTasks">

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
<!---      ,[contactPhoneAreaCode]
      ,[contactPhoneNumber]
      ,[countryPhoneCode]
      ,[LeadTime]--->
	,[contactNumber]
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

<cfswitch expression="#returnType#">
	<cfcase value="calendar">
            [taskDateDue] >= <cfqueryparam cfsqltype="cf_sql_date" value="#EpochTimeToDate(form.start)#">
            AND
            [taskDateDue] <= <cfqueryparam cfsqltype="cf_sql_date" value="#EpochTimeToDate(form.end)#">
	</cfcase>
    
    <cfcase value="emailTask">
            [taskDateDue] = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
	</cfcase>
</cfswitch>

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [eventName]
      ,[taskDateDue]
      ,[emailPrivate]
      ,[typeLabel]
      ,[staffName]
      ,[taskComment]
      ,[taskSpecs]
      ,[branchName]
      ,[taskID]
      ,[packageID]
      ,[eventID]
      ,[taskCompleted]
      ,[allocation]
      ,[taskManager]
      ,[taskTypeID]
      ,[publicationURL]
      ,[branchPassword]
      ,[branchUserName]
      ,[contactID]
      ,[contactName]
      ,[contactNumber]
      ,[contactEmail]
  FROM [GPP].[dbo].[TASKS_tasks]



</cfquery>