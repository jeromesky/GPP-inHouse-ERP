<cfquery datasource="#gpp#" name="qryUsers">
    SELECT 
            [IngIndividual_ID] AS userID
            ,[strFirst_Name]
            ,[strSurname]
    FROM 
            [tblIndividual]
    WHERE
            [AKA_companyID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.labelID#">)
</cfquery>
<!--- <cfdump var="#qryUsers#"> --->

<!--- update users company --->
<cfquery datasource="#gpp#">
	UPDATE [tblIndividual]
    SET 
    	[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    WHERE
		[AKA_companyID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.labelID#">)
</cfquery>

<!--- update labels --->
<cfquery datasource="#gpp#">
	UPDATE [companyAKA]
    SET 
    	[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    WHERE
		[AKA_companyID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.labelID#">)
</cfquery>

<cfoutput>
moved users: #qryUsers.recordcount#<br />
moved labels: #listlen(form.labelID, ",")#
</cfoutput>