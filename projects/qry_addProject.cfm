
<cfsilent>
<cfquery datasource="#gpp#" name="qryAddProject">
	INSERT INTO Projects
    	(
         [projectName]
         ,[projectDateAdded]
        )
     VALUES
     	(        
         <cfqueryparam cfsqltype="cf_sql_char" value="#form.projectName#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        )
      SELECT @@IDENTITY AS projectID

</cfquery>
<!---<cfparam name="form.TimeManagementID" default="#qryAddTimeManage.TimeManagementID#" type="integer">--->
</cfsilent>
<!-- include dsp-record here --->