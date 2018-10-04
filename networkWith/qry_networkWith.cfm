<cfquery name="get_NetworkWith" datasource="#gpp#">
  SELECT DISTINCT 
    [CompanyName],
    [country]
	FROM 
    [SITE_NetworkWith] 
	WHERE 
    	[eventID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#url.weekGroupId#">)
    GROUP 
    	BY  [country], [CompanyName]
    ORDER 
    	BY [CompanyName]
</cfquery>