<cfparam  name="url.areaID" default="0">
<cfparam  name="url.branchUserName" default="0">
<cfparam  name="url.branchPassword" default="0">
<cfparam  name="url.publicationURL" default="0">


<cfquery datasource="#gpp#" name="qryResult">
SELECT
	   [branchName]
      ,[branchUserName]
      ,[branchPassword]
      ,[publicationURL]
      ,[contactName]
      ,[contactEmail]
  FROM 
  		[CRM_Reports_publicationsNoRegion]
</cfquery>