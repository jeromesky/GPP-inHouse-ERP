<cfsilent>
<cfquery datasource="#gpp#" name="qry_branches">
SELECT     
	 [branchID]
    ,[branchType]
    ,CASE
    	WHEN companyID = 3954 THEN  ISNULL('<strong>' + streetCountryName + '</strong>: ' + branchName, branchName)
<!---    	WHEN branchType IN (500, 501, 502)  THEN branchName + ' (' + typeLabel + ')'
        WHEN branchType IN (503, 504) AND streetAddress = '' THEN '<strong>' + streetCountryName + '</strong>: ' --->
        WHEN branchType IN (503, 504) AND streetAddress <> '' THEN ISNULL(streetAddress, postalAddress)
<!---        WHEN branchType IN (503, 504) AND postalAddress = '' THEN '<strong>' + postalCountryName + '</strong>: '
        WHEN branchType IN (503, 504) AND postalAddress <> '' THEN ISNULL('<strong>' + postalCountryName + '</strong>: ' + postalAddress, postalAddress)--->
	END AS branchName
FROM         
	[CRM_Branch]
WHERE
	[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    AND
 (   postalCountryID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.searchingCountryID#">   OR streetCountryID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.searchingCompanyID#"> )
ORDER	BY
	[branchType] DESC
</cfquery>

</cfsilent>