
<cfset gpp = "gpp">
<cfif form.aka_companyID NEQ "">
<cfquery datasource="#gpp#">

	DELETE FROM 
    companyAKA
    WHERE AKA_companyID = <cfqueryparam cfsqltype="cf_sql_integer"  value="#form.aka_companyID#">
    
    </cfquery>
    more the 0 records
 </cfif>