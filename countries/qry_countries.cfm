<cfquery datasource="#gpp#" name="qry_countries">
SELECT 
	[countryID]
 ,[countryNameEN]
FROM
	[countryies]
ORDER BY
	[countryNameEN]
</cfquery>