<cfparam default="0" name="form.companyID">
<cfparam default="0" name="form.contactID">

<cfquery name="qryContacts" datasource="#gpp#">
SELECT 
	   [contactID]
      ,[branchID]
      ,[companyID]
      ,[ContactType]
      ,[contactName]
      ,[contactEmail]
      ,[contactPhoneAreaCode]
      ,[contactPhoneNumber]
      ,[contactPhoneExt]
      ,[countryPhoneCode]
      ,[branchName]
      ,[companyName]
      ,[contactAddress]
      ,[countryID]
      ,[cityID]
      ,[contactNote]
      ,[CityNameEN]
      ,[countryNameEN]
      ,[contactPosition]
      ,[contactScope]
      ,[typeLabel]
      ,[userID]
FROM 
  		[CRM_contact]
WHERE
		[contactID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactID#">
        AND
		[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
</cfquery>