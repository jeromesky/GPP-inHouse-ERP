

<cfscript>
	commit = true;
	catcherror = '';

</cfscript>
<cftransaction action="begin">

<cftry>
    <cfquery datasource="#gpp#">
    UPDATE tblIndividual
    SET companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    WHERE companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID_remove#">
    </cfquery>
<cfcatch type="database">
	<cfset commit = false>
    <cfset catcherror = #cfcatch#>
</cfcatch>
</cftry>


<cftry>    
    <cfquery datasource="#gpp#">
    UPDATE companyAKA
    SET companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    WHERE companyID= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID_remove#">
    </cfquery>
<cfcatch type="database">
	<cfset commit = false>
    <cfset catcherror = #cfcatch#>
</cfcatch>
</cftry>

   
<cftry>    
    <cfquery datasource="#gpp#">
    UPDATE contacts 
    SET companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    WHERE companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID_remove#">
    </cfquery>
<cfcatch type="database">
	<cfset commit = false>
    <cfset catcherror = #cfcatch#>
</cfcatch>
</cftry>


<cftry>
    <cfquery datasource="#gpp#">
    UPDATE branch 
    SET companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    WHERE companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID_remove#">
    </cfquery>
<cfcatch type="database">
	<cfset commit = false>
    <cfset catcherror = #cfcatch#>
</cfcatch>
</cftry>
    

<cftry>
    <cfquery datasource="#gpp#">
    UPDATE contracts
    SET companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    WHERE companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID_remove#">
    </cfquery>
<cfcatch type="database">
	<cfset commit = false>
    <cfset catcherror = #cfcatch#>
</cfcatch>
</cftry>

    
<cftry>    
    <cfquery datasource="#gpp#">
    DELETE FROM companies
    WHERE companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID_remove#">
    </cfquery>
<cfcatch type="database">
	<cfset commit = false>
    <cfset catcherror = #cfcatch#>
</cfcatch>
</cftry>




	<cfif commit>
        <cftransaction action="commit"/>
        Companies have been merged successfully 
    <cfelse>
        <cftransaction action="rollback"/>
		There was an error with the Merge
        
    </cfif> 
</cftransaction>
