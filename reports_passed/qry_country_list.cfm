<cfquery datasource="#dsnP21#" name="output">
	SELECT 
		id,
		country 
	FROM 
		GPP.dbo.ViewCountries;
</cfquery>