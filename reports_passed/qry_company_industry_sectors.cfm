<cfquery datasource="#dsnP21#" name="company_industry_sectors">
	SELECT 
		IngIndustry_ID,  
		strIndustry_Description  
	FROM 
		GPP.dbo.tblIndustry_Code
	WHERE
		strIndustry_Description != ''
	ORDER BY 
		strIndustry_Description;
</cfquery>