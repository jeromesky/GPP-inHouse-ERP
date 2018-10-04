

<cfquery datasource="#gpp#" name="qryPackages">
	SELECT 
    	[packagesID]
    FROM 
    	[packages]
    WHERE
    	[contractID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractID#">
</cfquery>


<cfset taskToDelete = #ListAppend( valueList(qryPackages.packagesID, ","), 0 )# >


<cfif listLen(taskToDelete) GT 0>
    <cfquery datasource="#gpp#">
        DELETE FROM
            [tasks] 
        WHERE
            packageID IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#taskToDelete#">)
    </cfquery>
</cfif>


<cfquery datasource="#gpp#">
	DELETE FROM 
    	[packages]
    WHERE
    	[contractID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractID#">
</cfquery>

<cfquery datasource="#gpp#">
	DELETE FROM 
    	[contracts]
    WHERE
    	[contractID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractID#">
</cfquery>