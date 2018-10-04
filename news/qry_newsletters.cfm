<cfquery name="qry_newsletters" datasource="#gpp#" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
SELECT 
	  [newsletterid]
      ,[newsletterName]
      ,[live]
      ,[areaID]
      ,[newsletterDesciption]
      ,[newsletterFrequency]
FROM 
		[newsletters]
ORDER BY 
	[newsletterName]   
</cfquery>
