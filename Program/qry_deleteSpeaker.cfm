

<cfswitch expression="#form.status#">

	<cfcase value="10,11" delimiters=",">
        <cfquery datasource="#gpp#" >
                UPDATE   speakers
                SET       
                	speakerStatus = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.status#">
                        
               WHERE speakerID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerID#">
        </cfquery>
        
        <cfquery datasource="#gpp#" name="qry">
                SELECT   
                	[userID]
                    ,[eventID]
               FROM
               		[speakers]
               WHERE 
               		[speakerID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerID#">
        </cfquery>
        
        <cfset userID = #qry.userID#>
        <cfset eventID = #qry.eventID#>
        	
            <cfswitch expression="#form.status#">
        		<cfcase value="10">
					<cfset attendType = "chkSpeaker">
                </cfcase>

        		<cfcase value="11">
					<cfset attendType = "chkModerator">
                </cfcase>
           </cfswitch>
                    
        <cfinclude template="../eventRegistration/qry_registrationDelete.cfm">
        
	</cfcase>
    
    
    <cfcase value="5">
    	<cfquery datasource="#gpp#" >
                DELETE 
                FROM
                	[speakers]
               WHERE 
               		[speakerID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerID#">
        </cfquery>
    
    
    </cfcase>
</cfswitch>