<cfset editedField = #form.fieldname# >
<cfset value = URLDecode(form.value) >

<cfif ListFind( "comment,extraDetails,arragements", editedField, ",")>
	<cfset value = replace(value, "<p>", "", "ALL")>
	<cfset value = replace(value, "</p>", "", "ALL")>

</cfif>

<cfif parameterexists(form.speakerID) AND value NEQ "">
    
        
        <cfquery datasource="#gpp#" name="get">
                UPDATE   speakers
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
                WHERE speakerID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerID#">
        </cfquery>
        
        <cfoutput>
        <cfswitch expression="#editedField#">
        	
            <cfcase value="speakerUnit">
            	#(value*5)#
            </cfcase>
            
            
            <cfdefaultcase>
            #value#
            </cfdefaultcase>
        
       </cfswitch>        
        </cfoutput>
</cfif>