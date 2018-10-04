<cfquery name="get_currencies" datasource="#gpp#" >
SELECT	
        [countryID]
        ,[countryCurrencyCode]
FROM
		[CRM_Currency_List]
</cfquery>