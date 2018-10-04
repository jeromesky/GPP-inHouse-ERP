<cfquery name="get_sponsors" datasource="#gpp#">
SELECT 
        [eventName]
      ,[contractID]
      ,[sponsorLabel]
      ,[typeLabel]
      ,[sponsorID]
      ,[typeGroup]
FROM 
		[CRM_sponsors]
WHERE
		[contractID] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.contractID#">
</cfquery> 
