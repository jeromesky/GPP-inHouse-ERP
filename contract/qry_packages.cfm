
<cfparam name="form.contractID" default="0">
<cfparam name="form.packagesID" default="0">

<cfquery datasource="#gpp#" name="qryPackages">
	SELECT
       [typeLabel]
      ,[event_name]
      ,[packagesID]
      ,[tasks] 
  FROM 
  		[CRM_packages]
        
  WHERE
  		[contractID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractID#">
  <cfif form.packagesID NEQ 0>
  		AND
        [packagesID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.packagesID#">
  </cfif>

</cfquery>