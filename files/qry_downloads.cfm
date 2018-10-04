

<cfquery datasource="#gpp#" name="qry_files">
	SELECT
    	[fileName]
        ,[fileComment]
     FROM
     	[SITE_Files]
     WHERE 
     	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
        AND 
        [FilePurposeID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#FilePurposeID#">
     ORDER BY
     	[fileDate]
</cfquery>

<!---
FilePurposeID
brochure = 170
Schedule Of Events = 171
Booking Form =174
Sponsorship Document = 172
--->