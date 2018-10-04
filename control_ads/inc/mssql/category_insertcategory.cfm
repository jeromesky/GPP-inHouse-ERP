<cfquery name="qAddCategory" datasource="#ds#">
	insert into fuseAds_Categories
	(vchCategoryName, chCategoryStatus)
	values
	('#CategoryName#', '#CategoryStatus#')
</cfquery>