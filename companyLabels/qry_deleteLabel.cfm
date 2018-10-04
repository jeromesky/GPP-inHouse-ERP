<cfquery datasource="#GPP#" name="qryCompanyLabel">
    DELETE 
    	FROM [companyAKA]
    WHERE
		[AKA_companyID] =<cfqueryparam cfsqltype="cf_sql_integer" value="#form.aka_companyID#">
</cfquery>