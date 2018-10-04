<cfsilent>
<cfquery datasource="#gpp#" name="qryAddTimeManage">
	INSERT INTO TimeManagement
    	(
         [staffID]
         ,[TimeManagementDate]
         ,[TimeManagementTime]
         ,[TimeManagementDesc]
         ,[eventID] 
        ,[taskID]
        ,[projectID]
        ,[timeManagementInsertTime]
        )
     VALUES
     	(
        <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#form.TimeManagementTime#">
        ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.TimeManagementDesc#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.taskID#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.projectID#">
        ,<cfqueryparam cfsqltype="cf_sql_time" value="#now()#">
        )
      SELECT @@IDENTITY AS TimeManagementID
</cfquery>
<cfparam name="form.TimeManagementID" default="#qryAddTimeManage.TimeManagementID#" type="integer">
</cfsilent>
<cfinclude template="dsp_timeManaged.cfm">