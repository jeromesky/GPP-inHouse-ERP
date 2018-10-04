<cfquery name="getNewsClickCount" datasource="#gpp#" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
SELECT 
		[newsletterName], [newsletterid] AS newsid
FROM 
		[newsletters];
</cfquery>