

<cfquery datasource="#gpp#">
UPDATE 
	[tblAnnual_Conf]
SET 
	[countryID] 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryID#">,
    [cityID]		 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.cityID#">,
    [venuRoom]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.venuRoom#">,
    [hotel]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.hotel#">
WHERE
	[IngConference_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
</cfquery>