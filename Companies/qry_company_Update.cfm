<cfsilent>
<cfif form.companyID EQ 0>

	<cfif NOT find("http://", form.companyURL) >
    	<cfset form.companyURL = "http://#form.companyURL#">
    </cfif>
        
        <cfquery datasource="#gpp#" name="qryInsertCompany">
            INSERT INTO companies
                (active, companyName, industryID, VATNumber, companyURL, companyBios, createDate)
            VALUES
                (
                 <cfqueryparam cfsqltype="cf_sql_integer" value="1">
                 ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.companyName#">
                 ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.industryID#">
                 ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.VATNumber#">
                 ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.companyURL#">
                 ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.companyBios#">
                 ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                )
            SELECT @@IDENTITY AS companyID
        </cfquery>
        <!--- set companyID----->
        <cfset form.companyID = #qryInsertCompany.companyID#>
        
        <!--- input label name----->
        <cfquery datasource="#gpp#" name="qryInsertAKACompany">
        	INSERT INTO companyAKA
            	(companyID, AKA_companyName, updated, active, AKA_companyURL)
            VALUES
            	(
                	<cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#"> 
                   ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.companyName#">
                   ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                   ,1
                   ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.companyURL#">
                )
             SELECT @@IDENTITY AS AKA_companyID   
        </cfquery>
        <!--- set aka ID----->
        <cfset form.AKA_companyID = #qryInsertAKACompany.AKA_companyID#>
        
<cfelse>    
	
	<cfquery datasource="#gpp#">
    	UPDATE companies
        SET
             [active]		= <cfif structKeyExists(form, "form.active")>1<cfelse>0</cfif>
            ,[companyName]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.companyName#">
            ,[industryID]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.industryID#">
            ,[VATNumber]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.VATNumber#">
            ,[companyURL]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.companyURL#">
            <cfif form.companyBios NEQ "">
            ,[companyBios]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.companyBios#">
            </cfif>
        WHERE
        	[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
    </cfquery>

    <!--- script for the change logs --->
	<cfscript>
		tableName 	= 'companies';
		tableID 		= form.companyID;
		//tableField		= "myfiled";
	</cfscript>
	<cfinclude template="../../my-officeX/changes/act_formDetect.cfm">    

</cfif>	
</cfsilent><cfoutput>#form.companyID#</cfoutput>