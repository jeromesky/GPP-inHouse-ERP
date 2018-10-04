<cfparam name="form.AKA_companyID" default="0">
<cfparam name="form.companyID" default="0">
<cfparam name="formLabelDisplay" default="Edit this label">



<cfquery datasource="#GPP#" name="qryCompanyLabel">
SELECT
		[AKA_companyID]
      ,[companyID]
      ,[AKA_companyName]
      ,[AKA_companyURL]
      ,(SELECT TOP 1 companyName FROM dbo.companies WHERE companies.companyID = #form.companyID#) AS companyName
  FROM 
  		[CRM_companyAKA]
<!---        INNER JOIN
                      dbo.companies ON CRM_companyAKA.companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">--->
  WHERE 
  		1 =1 
  		<!---<cfif form.AKA_companyID NEQ 0>--->
        AND
        [AKA_companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.AKA_companyID#">
        <!---</cfif>
        <cfif form.companyID NEQ 0>--->
        AND
        [companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
		<!---</cfif> --->       
ORDER BY
		[AKA_companyName]

</cfquery>

<cfif form.AKA_companyID EQ 0>
	<cfset formLabelDisplay = "Add a new label">
</cfif>