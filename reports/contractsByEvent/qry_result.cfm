<cfparam  name="url.eventID" default="0">


<cfquery datasource="#gpp#" name="qryResult">
SELECT
	   [companyName]
       ,[AKA_companyName]
      ,[branchName]
      ,[packagesID]
      ,[contractDateAdded]
      ,[contactName]
      ,[contactEmail]
      ,[currencyCode]
      ,[contractCost]
  FROM 
  		[CRM_Reports_contractsByEvent]
  WHERE
  		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.eventID#">
</cfquery>

<cfscript>
	eventCfc			= createObject("component", "Officecfc.eventName");
	eventName		= #eventCfc.eventName(url.eventID)#;
</cfscript>