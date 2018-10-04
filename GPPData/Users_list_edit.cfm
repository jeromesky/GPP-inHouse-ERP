<CFINCLUDE template="../Application.cfm">


<cfif form.desid eq "save" >
  
        <CFLOOP INDEX="i" FROM="1" TO="#form.recordcount#">    
        
        <cfset getTheID =  form["id#i#"]   >
        <cfquery datasource="#gpp#" >
        UPDATE tblIndividual SET 
        
      
        
		chkW 	= <cfif structKeyExists( form, 'chkW#i#' )> 1<cfelse>0</cfif>,
        chkNA 	= <cfif structKeyExists( form, 'chkNA#i#' )>1<cfelse>0</cfif>,
        chkL 	= <cfif structKeyExists( form, 'chkL#i#' )>1<cfelse>0</cfif>,
       chkME 	= <cfif structKeyExists( form, 'chkME#i#' )>1<cfelse>0</cfif>,
        chkE 	= <cfif structKeyExists( form, 'chkE#i#' )>1<cfelse>0</cfif>,
       chkAF	= <cfif structKeyExists( form, 'chkAF#i#' )>1<cfelse>0</cfif>,
       chkA 		= <cfif structKeyExists( form, 'chkA#i#' )>1<cfelse>0</cfif>,
       chkMag 	= <cfif structKeyExists( form, 'chkMag#i#' )>1<cfelse>0</cfif>,
       
       chkEAF 	= <cfif structKeyExists( form, 'chkEAF#i#' )>1<cfelse>0</cfif>,
       chkWA 	= <cfif structKeyExists( form, 'chkWA#i#' )>1<cfelse>0</cfif>,
       chSAE 	= <cfif structKeyExists( form, 'chSAE#i#' )>1<cfelse>0</cfif>,
       
       chkPrioPost	= <cfif structKeyExists( form, 'chkPrioPost#i#' )>1<cfelse>0</cfif>,
       chkSecPost	= <cfif structKeyExists( form, 'chkSecPost#i#' )>1<cfelse>0</cfif>,
       chkMail			= <cfif structKeyExists( form, 'chkMail#i#' )>1<cfelse>0</cfif>,
       chkExploration = <cfif structKeyExists( form, 'chkExploration#i#' )>1<cfelse>0</cfif>,
       chkPower 		= <cfif structKeyExists( form, 'chkPower#i#' )>1<cfelse>0</cfif>,
       chkRefining 		= <cfif structKeyExists( form, 'chkRefining#i#' )>1<cfelse>0</cfif>,
       chkGas 				= <cfif structKeyExists( form, 'chkGas#i#' )>1<cfelse>0</cfif>,
       chkRenBio			 = <cfif structKeyExists( form, 'chkRenBio#i#' )>1<cfelse>0</cfif>

		
        WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#getTheID#" >
        </cfquery>
        
            
        </CFLOOP>
<cfelseif form.desid eq "Make archive" >


        <CFLOOP INDEX="i" FROM="1" TO="#ListLen(form.archive, ",")#">    
        
        
        
                <cfquery datasource="#gpp#" >
                    UPDATE tblIndividual SET 
                    STATUS = 'A'
        
                     WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#" >
                </cfquery>

	
        </CFLOOP>
        
        
</cfif>

<cflocation url="Users_List.cfm">