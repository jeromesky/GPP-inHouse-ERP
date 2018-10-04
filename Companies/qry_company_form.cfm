<cfparam name="form.companyID" default="0">
<cfparam name="form.userID" default="0">
<cfparam name="form.companyName" default="" >


<cfquery name="qry_company" datasource="#gpp#">
	<!---SELECT
       [companyID]
      ,[companyName]
      ,[industryID]
      ,[companyURL]
      ,[companyBios]
      ,[active]
      ,[createDate]
      ,[updated]
      ,[VATNumber]
     , (SELECT TOP (1) fileName FROM dbo.CRM_files_notice WHERE (fileTable = 'company') AND (fileTableID = companies.companyID) AND (FilePurposeID = 178)) AS companyLogo
  FROM 
  		[companies]
  WHERE
  		[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">--->
 SELECT
	   [VATNumber]
      ,[updated]
      ,[active]
      ,[industryID]
      ,[companyID]
      ,[companyName]
      ,[companyURL]
      ,[companyBios]
      ,[createDate]
      ,[companyLogo]
      ,[lock]
  FROM 
  		[CRM_Companies]
  WHERE
  		[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
</cfquery>



<cfquery datasource="#gpp#" name="qry_industry">
SELECT
	[industryCode]
    ,[industryName]
    ,[industryID]
FROM 
	[CRM_industry]
    tblIndustry_Code
ORDER BY  industryName
</cfquery>

<!---<cfparam default="#qry_company.companyName#" name="qry_company.companyName">--->
