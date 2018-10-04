
<cfquery datasource="#gpp#" name="qryAddPackage">
	INSERT INTO packages 
    		(
            	contractID
               ,eventID
               ,packagetypeID
               ,staffIDAdded
              ,packagesDateAdded
            )
    VALUES
    		(
            <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractID#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.packagetypeID#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            )
	SELECT @@IDENTITY AS packageID
</cfquery>

<cfparam name="form.packagesID" default="#qryAddPackage.packageID#">
<cfinclude template="dsp_Packages.cfm">