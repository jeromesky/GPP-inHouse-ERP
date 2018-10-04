<cfquery name="qry_areas" datasource="#gpp#">
SELECT 
	   [areaID]
      ,[areaName]
      ,[areaNotes]
FROM 
  		[CRM_Areas]
ORDER BY
		[areaName]
</cfquery>