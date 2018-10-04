

<cfif form.AKA_companyID EQ 0 OR form.AKA_companyID EQ "">
	<cfquery datasource="#gpp#" name="qryAddLabel">
    	INSERT INTO companyAKA (AKA_companyName, companyID, AKA_companyURL)
        VALUES 
        	(
            	<cfqueryparam cfsqltype="cf_sql_char" value="#form.AKA_companyName#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">, 
                <cfqueryparam cfsqltype="cf_sql_char" value="#form.AKA_companyURL#">
           )
           SELECT @@IDENTITY AS AKA_companyID
    </cfquery>
		<cfset form.AKA_companyID = #qryAddLabel.AKA_companyID#>
<cfelseif form.AKA_companyID NEQ 0 OR form.AKA_companyID NEQ "">

    <cfquery datasource="#gpp#">
        UPDATE companyAKA
             SET
             companyID 					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
             ,AKA_companyName 	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.AKA_companyName#">
            , AKA_companyURL		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.AKA_companyURL#">
        WHERE
            AKA_companyID			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.AKA_companyID#">
    </cfquery>
</cfif>