<cfquery name="getDataSource" datasource="#gpp#">
  SELECT 
       [recordSource] as recordSourced
      ,[directoriesName]
      ,[directoriesID]
      ,[RoleID]
      ,[userID]
  FROM
      [CRM_DataClasification]
  WHERE
      [userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>