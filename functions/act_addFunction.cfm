


<cfif form.functionID EQ 0>
	
    <cfquery datasource="#gpp#" name="qryAddfunction">
    	INSERT INTO functions(parentID, eventID)
        VALUES(<cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">)
    	SELECT @@Identity as functionID
	</cfquery>
    <cfset form.functionID = qryAddfunction.functionID >

</cfif>

<cfquery datasource="#gpp#" name="qryFunction">
	UPDATE   [functions]
    SET
        [functionTitle] 		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.functionTitle#" maxlength="70">
        ,[functiondate] 		= <cfqueryparam cfsqltype="cf_sql_date" value="#form.functiondate#">
        ,[functionTime] 		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.functionTime#" maxlength="5">
        ,[functionTrack] 		= <cfif parameterexists(form.functionTrack)>1<cfelse>0</cfif>
        ,[functionDetails] 	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.functionDetails#">
        ,[menuOptions]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.menuOptions#" maxlength="40">
        ,[functionType] 		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.functionType#">
        ,[companyID]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
        ,[functionVenue]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.functionVenue#" maxlength="60">
        ,[functionTimeEnd]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.functionTimeEnd#" maxlength="5">
 WHERE
 	 [functionID] =   <cfqueryparam cfsqltype="cf_sql_integer" value="#form.functionID#">
 </cfquery>