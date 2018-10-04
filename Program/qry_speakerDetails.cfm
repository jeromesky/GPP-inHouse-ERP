<cfquery datasource="#gpp#" name="qry_speakerDetails">
	SELECT
    	[#form.field#]
    FROM
    	[speakers]
    WHERE
    	speakerID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerid#">
</cfquery>