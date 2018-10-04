<cfif form.UserID NEQ 0 >
	<cfset diff_id = form.UserID >
<cfelseif form.companyID NEQ 0 >
	<cfset diff_id = form.companyID >
</cfif>

<cfquery datasource="#gpp#" name="get">
  SELECT *
  FROM CRM_Memberships
  WHERE 
  <cfif form.UserID NEQ 0 >
      UserID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.UserID#">
  </cfif>
  <cfif form.companyID NEQ 0 >
      companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
  </cfif>
</cfquery>