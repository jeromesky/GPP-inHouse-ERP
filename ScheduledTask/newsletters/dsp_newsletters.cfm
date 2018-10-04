<cfquery name="qry_newsletters" datasource="#gpp#" cachedWithin="#CreateTimeSpan(0,8,0,0)#">
SELECT 
  [newsletterid]
  ,[newsletterName]
  ,[live]
  ,[areaID]
  ,[newsletterDesciption]
  ,[newsletterFrequency]
  ,[recipientCount]
FROM 
  [newsletters]
WHERE 
	[live] = 1
ORDER BY 
	[newsletterFrequency], [areaID], [newsletterid]   
</cfquery><cfoutput><cfloop query="qry_newsletters">
<cfif qry_newsletters.newsletterFrequency EQ 1>#qry_newsletters.newsletterDesciption# | 
<cfelse>#qry_newsletters.newsletterDesciption# | </cfif></cfloop></cfoutput>