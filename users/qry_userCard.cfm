
<cfparam name="form.userID" default="23720">

<cfquery datasource="#gpp#" name="qryUserCard">
SELECT
		[companyName]
      ,[AKA_companyName]
      ,[countryName]
      ,[title]
      ,[lastName]
      ,[name]
      ,[otherName]
      ,[position]
      ,[countryPhoneCode]
      ,[phoneCode]
      ,[phoneNumber]
      ,[faxCode]
      ,[faxNumber]
      ,[email_private]
      ,[userID]
      ,[fileName]
  FROM 
  		[CRM_user_card]
  WHERE
  		[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">

</cfquery>