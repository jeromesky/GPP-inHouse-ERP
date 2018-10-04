
<cfset gpp = "gpp">

<cfif form.companyID NEQ "">
<cfquery datasource="#gpp#">

	DELETE FROM 
    companies
    WHERE companyID = <cfqueryparam cfsqltype="cf_sql_integer"  value="#form.companyID#">
    
    </cfquery>
    more the 0 records
 </cfif>