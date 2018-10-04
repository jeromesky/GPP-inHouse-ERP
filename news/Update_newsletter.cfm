<cfinclude template="../Application.cfm">



<cfif parameterexists(form.newsletterBanner) >
	
                <CFFILE ACTION="Upload" FILEFIELD="form.newsletterBanner" DESTINATION="G:\websites\petro21\_files\enews\" NAMECONFLICT="MakeUnique">
                <cfquery datasource="#gpp#"  name="newFile">
                    UPDATE newsletters
                    SET newsletterBanner = <cfqueryparam  value="#File.ServerFile#" >
                    WHERE  newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#" >
                </cfquery>

<cfelseif parameterexists(form.sendDay) >

                
               <cfquery datasource="#gpp#"  name="newFile">
                    UPDATE newsletters
                    SET sendDay = <cfqueryparam  value="#form.sendDay#" >
                    WHERE  newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#" >
                </cfquery><!--- --->
<cfelse>


	<cfset editedField = #form.fieldname# >
    <cfset value = URLDecode(form.value) >
    
                <cfquery name="newsletters" datasource="#gpp#">
                UPDATE newsletters
                SET                      
					<cfif isdate(value) AND len(value)  GTE 8 >
                    #editedField# = <cfqueryparam cfsqltype="cf_sql_date" value="#value#">
                    
                    <cfelseif Isnumeric(value) >
                    #editedField# = <cfqueryparam  value="#value#">
                    
                    <cfelseif IsBoolean(value) >
                    #editedField# = <cfqueryparam cfsqltype="cf_sql_bit" value="#value#">       		                        
                    <cfelse  >
                    #editedField# = <cfqueryparam  value="#value#">
                    </cfif>	
                
                WHERE 
                	[newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.newsletterID#">
                </cfquery>
                
                <cfoutput>{"data" : "#value#", "status" : "1"}</cfoutput>
</cfif>

				
