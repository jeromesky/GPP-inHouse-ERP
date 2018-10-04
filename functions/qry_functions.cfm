<cfparam name="form.parentID" default="">
<cfparam name="form.eventID" default="765">

<cfquery datasource="#gpp#" name="qryFunctions">
	SELECT     
    	 [functionID]
         ,[eventID]
        ,[functionTitle]
    FROM
        [functions]
    WHERE
        <cfif form.parentID NEQ "">
        	[parentID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.parentID#">
        <cfelse>
        	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
        </cfif>
</cfquery>