<cfquery name="get" datasource="#gpp#">
	SELECT TOP 1 
    	strCity, 
        CountryName, 
        countryid, 
        IngIndividual_ID
	FROM 
    	tblIndividual
	WHERE     
    	(STATUS = 'C') 
    AND
		(cityID IS NULL) 
    AND
		(strCity IS NOT NULL) 
    AND 
    	(strCity <> '') 
<cfif parameterexists(form.exclude)>
    AND 
    	strCity <> <cfqueryparam cfsqltype="cf_sql_char" value="#form.exclude#">
</cfif>
	ORDER BY 
		strCity
</cfquery>

<cfquery name="get_Total" datasource="#gpp#">
	SELECT 
    	count(strCity) AS total
	FROM 
		tblIndividual
	WHERE     
    	(STATUS = 'C') 
	AND 
    	(cityID IS NULL) 
	AND 
    	(strCity IS NOT NULL)
	AND 
    	(strCity <> '')
</cfquery>