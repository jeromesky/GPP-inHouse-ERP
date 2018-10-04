
<cfoutput>
<cfif form.aka_companyURL EQ "-1">

	<cfquery datasource="GPP">
    	UPDATE companyAKA
        SET valid = <cfqueryparam cfsqltype="cf_sql_integer" value="-1">
        WHERE 
        	[AKA_companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.AKA_companyID#">
    </cfquery>
    
    
	change active #form.aka_companyURL#...
<cfelse>

	<cfset NewUrl = "">
	<cfif find( "www", form.aka_companyURL)>
    		<cfset NewUrl = "http://#form.aka_companyURL#/?">
     <cfelse>	
     		<cfset NewUrl = "http://www.#form.aka_companyURL#/?">
     </cfif>
     
	<cfquery datasource="GPP">
    	UPDATE companyAKA
        SET 
        	AKA_companyURL = <cfqueryparam cfsqltype="cf_sql_char" value="#NewUrl#">
        WHERE 
        	AKA_companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.AKA_companyID#">
	</cfquery>

</cfif></cfoutput>