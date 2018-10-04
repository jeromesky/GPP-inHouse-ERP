<cfquery datasource="#gpp#" name="qryNewRegistrations">
SELECT
		[userName]
      ,[companyName]
      ,[eventName]
      ,[insertdate]
FROM
  		[CRM_New_Registrations]
</cfquery>