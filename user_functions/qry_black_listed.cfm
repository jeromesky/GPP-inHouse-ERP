<cfquery name="qryBlackListed" datasource="#gpp#">
  SELECT 
      [Black_Listed]
      ,[Black_Listed_Date]
      ,[Black_Listed_comment]
      ,[userID]
  FROM
      [CRM_Black_Listed]
  WHERE
      [userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>