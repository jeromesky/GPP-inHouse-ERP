<cfquery name="get" datasource="#gpp#">
  SELECT 
       [areaID]
      ,[areaName]
      ,[dataFieldMail]
      ,[datafieldPost]
  FROM
      [CRM_Areas]
  WHERE
      [userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>
