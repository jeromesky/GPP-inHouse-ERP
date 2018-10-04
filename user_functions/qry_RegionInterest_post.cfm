<cfquery datasource="#gpp#" name="get">
	select *
	from 
    	CRM_Individual_RegionInterest_Post
	WHERE 
    	userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>
