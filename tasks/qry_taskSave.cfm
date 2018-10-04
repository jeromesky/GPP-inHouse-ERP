<cfsilent>
<cfset taskID = form.taskID>

<cfif form.taskID EQ 0>
    <cfquery name="qryNew_task" datasource="#gpp#">
        INSERT INTO [tasks] 
        		(
                packageID
                ,taskDateAdded
                ,staffID
                ,eventID
                )
        VALUES 
        		(
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.packageID#">
                ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
                )
        SELECT @@IDENTITY AS taskID
	</cfquery>
    <cfset taskID = qryNew_task.taskID>
</cfif>


<cfquery name="get_task" datasource="#gpp#">
UPDATE [tasks]
SET 
      [taskTypeID]					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.taskTypeID#">
      
      ,[taskStatusID]				= <cfif parameterexists(form.taskStatusID)><cfqueryparam cfsqltype="cf_sql_integer" value="#form.taskStatusID#"><cfelse>5</cfif>
      
      ,[taskDateDue]				= <cfqueryparam cfsqltype="cf_sql_date" value="#form.taskDateDue#">
      ,[taskDateUpdated]		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
      ,[staffIDUpdated]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
      ,[taskComment]				= <cfqueryparam cfsqltype="cf_sql_char" value="#form.taskComment#">
      ,[taskSpecs]					= <cfqueryparam cfsqltype="cf_sql_char" value="#form.taskSpecs#">
     ,[allocation]						= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.allocation#">
     <!---,[LeadTime]						= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.LeadTime#">--->
  WHERE 
  		[taskID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#taskID#">
</cfquery>
</cfsilent>
<cfparam name="form.taskID" default="#taskID#">
<cfinclude template="dsp_taskList.cfm">