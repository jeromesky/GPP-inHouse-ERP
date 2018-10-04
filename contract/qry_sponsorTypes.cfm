
<cfquery name="get_sponsorType" datasource="#gpp#">
SELECT 
	[sponsorTypeID]
    ,[sponsorTypeName]

FROM 
	[sponsorType]
ORDER
	BY sponsorTypeID

</cfquery>