<CFINCLUDE template="../Application.cfm">
                    <cfquery datasource="#gpp#" name="get" >
                    UPDATE          	tblIndividual 
                    SET					strEmail = '#form.email#'
                    WHERE			IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
                    </cfquery>
                    <cfquery datasource="#gpp#" name="get" >
                    
                    UPDATE          	tblIndOptions 
                    SET					
                    						mailOutFlag = 0
                    WHERE			lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
                    </cfquery>
                    
  <cfoutput>#form.email#</cfoutput>