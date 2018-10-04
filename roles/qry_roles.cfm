<cfquery name="get" datasource="#gpp#">
	SELECT 
         [RoleID]
        ,[userID]
    FROM
    	[CRM_DataClasification]
    WHERE
    	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>
<cfquery datasource="#gpp#" name="qryRole">
  SELECT 
      [roleID]
      ,[roleLabel]
      ,[roleName]
      ,[roleOrder]
  FROM [roles];
</cfquery>