<cfquery name="qry_newsletters" datasource="#gpp#" cachedWithin="#CreateTimeSpan(0,9,0,0)#">
SELECT 
  [newsletterid]
  ,[newsletterName]
  ,[live]
  ,[areaID]
  ,[newsletterDesciption]
  ,[newsletterFrequency]
FROM 
  [newsletters]
WHERE 
	[live] = 1
ORDER BY 
	[newsletterFrequency], [areaID], [newsletterid]   
</cfquery>