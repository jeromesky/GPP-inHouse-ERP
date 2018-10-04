<cfquery datasource="#gpp#" name="get">
SELECT [userID]
      ,[userName]
      ,[userSurname]
      ,[companyName]
      ,[holdingCompanyName]
      ,[duplicate]
  FROM [CRM_NewRegistration_List]

</cfquery>