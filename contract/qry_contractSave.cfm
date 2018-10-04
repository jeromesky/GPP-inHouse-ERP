
  
  
<cfset contractID = form.contractID>

<cfif form.contractID EQ 0>
	<cfquery name="new_contract" datasource="#gpp#">
        INSERT INTO 
        	[contracts] 
            	(
                	[contractDateAdded]
                   ,[staffIDAdded]
                   ,[contractREF]
                 )
        VALUES 
        		(
                	<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.staffID#">
                    ,<cfqueryparam cfsqltype="cf_sql_char" value="#CreateUUID()#" maxlength="36">
                 )
        SELECT @@IDENTITY AS contractID
	</cfquery>
    <cfset contractID = new_contract.contractID>
</cfif>


<cfquery datasource="#gpp#">
UPDATE  [contracts]
SET 
         
         [contractComment]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contractComment#">
        ,[companyID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
        ,[statusInternalID]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.statusInternalID#">
        ,[branchID]					= <cfif form.branchID EQ "">0<cfelse> <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchID#"></cfif>
        ,[contractURL]				= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contractURL#">
        ,[contractDateUpdated]= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ,[staffIDUpdated]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
        ,[contractCompanyComment] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.contractCompanyComment#">
        ,[currencyCode]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.currencyCode#">
        ,[contractCost]				= <cfqueryparam cfsqltype="cf_sql_decimal" scale="2" value="#form.contractCost#">
        ,[contractType]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractType#">
        <cfif form.AKA_companyID NEQ "">
        ,[AKA_companyID]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.AKA_companyID#">
        </cfif>
        <cfif form.contactID NEQ "">
        ,[contactID]					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactID#">
        </cfif>
        <cfif parameterexists(form.contractBookedDated)>
        ,[contractBookedDated]= <cfqueryparam cfsqltype="cf_sql_date" value="#form.contractBookedDated#">
        </cfif>
WHERE 
		[contractID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#contractID#">
</cfquery>
<cfoutput>#contractID#</cfoutput>