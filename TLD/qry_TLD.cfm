<cfquery datasource="#gpp#" name="qryTLD">
	SELECT *
    FROM
    	[CRM_TLD2country]
    WHERE
    	[TLDname] = <cfqueryparam cfsqltype="cf_sql_char" value="#url.TLDname#">
</cfquery>
