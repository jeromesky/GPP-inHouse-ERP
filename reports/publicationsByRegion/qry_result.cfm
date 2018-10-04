<cfparam  name="url.areaID" default="0">
<cfparam  name="url.branchUserName" default="0">
<cfparam  name="url.branchPassword" default="0">
<cfparam  name="url.publicationURL" default="0">


<cfquery datasource="#gpp#" name="qryResult">
SELECT 
		[branchName]
       ,[publicationURL]
       ,[branchPassword]
       ,[branchUserName]
       ,[contactName]
       ,[contactEmail]
  FROM 
  		[CRM_Reports_publicationsByRegion]
  WHERE
    	[areaID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#url.areaID#">)
</cfquery>