<cfsilent>

<cfquery datasource="#gpp#" name="qry_branches">
    SELECT
         [branchID]
        ,[branchType]
        ,[companyName]
        ,CASE
            WHEN branchType IN (500, 501, 502) THEN branchName + ' (' + typeLabel + ')'
            WHEN branchName <> '' THEN branchName
            WHEN companyID = 3954 THEN ISNULL('<strong>' + streetCountryName + '</strong>: ' + branchName, branchName)
            WHEN branchType IN (503, 504) AND streetAddress <> '' THEN ISNULL('<strong>' + streetCountryName + '</strong>: ' + streetCityName + ' ' + streetAddress, streetAddress)
            WHEN branchType IN (503, 504) AND postalAddress = '' THEN '<strong>' + postalCountryName + '</strong>: '
            WHEN branchType IN (503, 504) AND postalAddress <> '' THEN ISNULL('<strong>' + postalCountryName + '</strong>: ' + postalCityName + ' ' + postalAddress, postalAddress)
            WHEN branchType IN (503, 504) AND streetAddress = '' THEN '<strong>' + streetCountryName + '</strong>: ' 
        END AS branchName
    FROM         
        [CRM_Branch]
    WHERE
        [companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
	ORDER BY
		[branchType], branchName DESC;
</cfquery>

<!---<cfquery datasource="#gpp#" name="qry_branches">
SELECT dbo.branch.branchID, dbo.branch.branchName, userBranch.userBranchID
FROM   dbo.branch LEFT OUTER JOIN
          (SELECT  branchID AS userBranchID
           FROM    dbo.tblIndividual
          WHERE      (IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">)) AS userBranch ON dbo.branch.branchID = userBranch.userBranchID
WHERE     (dbo.branch.companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#"> )
</cfquery>

SELECT [branchID]
      ,[branchName]
  FROM [branch]  LEFT OUTER JOIN
    (	SELECT branchID
        FROM tblIndividual
        WHERE [IngIndividual_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
    ) AS userBranchID ON branch.branchID = userBranchID.branchID
    WHERE
    	[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#"> 
        <cfif form.userid NEQ 0>
        AND [userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
        </cfif>---></cfsilent>