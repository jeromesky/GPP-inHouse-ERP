<cfsilent>
<cfparam name="form.branchid" default="0">
<cfparam name="form.branchCompanyID" default="0">
<cfparam name="form.branchUserID" default="0">

<!---<cfif form.branchid EQ 0 >
<cfquery datasource="#gpp#" name="qry_newBranchId">
SELECT 
		TOP 1 [branchID]
FROM
		[CRM_Branch]
ORDER 
		BY branchID DESC
</cfquery>
    <cfset branchid = get_newBranchId.branchID + 1>
        <cfparam name="form.branchid" default="#(qry_newBranchId.branchID + 1)#">
<cfelseif form.branchid NEQ 0 >
<cfset branchid = #form.branchid#>
</cfif>--->

<cfquery datasource="#gpp#" name="qry_branch">
 	SELECT 
       [branchID]
      ,[companyID]
      ,[postalCountryID]
      ,[postalRegionID]
      ,[postalAddress]
      ,[postalCityID]
      ,[PostalCode]
      ,[branchType]
      ,[branchEmail]
      ,[streetCountryID]
      ,[streetRegionID]
      ,[streetAddress]
      ,[streetCityID]
      ,[StreetCode]
      ,[branchVatNO]
      ,[branchURL]
      ,[contactID]
      ,[branchBios]
      ,[companyName]
      ,[postalCountryName]
      ,[postalCityName]
      ,[postalRegionName]
      ,[streetCountryName]
      ,[streetCityName]
      ,[streetRegionName]
      ,[branchName]
      ,[branchPassword]
      ,[branchUserName]
      ,[publicationURL]
      ,[contactName]
      ,[typeLabel]
      ,[countryPhoneCode]
      ,[branchAreaPhone]
      ,[branchPhoneNo]
      ,[branchAreaFax]
      ,[branchFaxNo]
      ,[branchLogo]
      ,[staffName]
      ,[dateCreated]
      ,[billingAddress]
  FROM 
  		[CRM_Branch]
   WHERE
   		[branchID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchid#">
</cfquery></cfsilent>