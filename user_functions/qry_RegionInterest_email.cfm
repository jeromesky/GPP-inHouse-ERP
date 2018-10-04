<cfquery datasource="#gpp#" name="get">
 	select  *
	from 
    	CRM_Individual_RegionInterest_email
	WHERE 
    	userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>
<cfquery datasource="#gpp#" name="getUnreg">
    SELECT RecordDetails
    FROM tblGlopacHistory
	WHERE RecordWorked = <cfqueryparam value="#form.userid#">
</cfquery>
<cfset unresitered = #valueList(getUnreg.RecordDetails, ",")# >