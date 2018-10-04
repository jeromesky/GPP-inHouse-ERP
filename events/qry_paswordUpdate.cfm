

<cfquery datasource="GPP" name="qryAttendenceList"  >
SELECT 		
        * 
FROM 		
        [SITE_Mailer_SendTo_AttendingEvent]
WHERE 		
        [EventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.gppID#"> 
    	AND
        	(chkDelegate = 1 OR
            chkSpeaker = 1 OR
            chkModerator = 1)
</cfquery>
<cfset total = 0>



<cfloop query="qryAttendenceList">
	<cfif qryAttendenceList.password EQ "" OR  qryAttendenceList.password EQ "gpp">
    
            <cfset newPass = "gpp" &  randrange(0001, 9999) >
            
            <cfquery DATASOURCE="GPP" >
            UPDATE tblIndividual
            SET
            password = <cfqueryparam cfsqltype="cf_sql_char" value="#newPass#">
             
            WHERE  IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qryAttendenceList.id#">
            </cfquery>
    
    <cfset total = total  +1 >
    </cfif>

</cfloop>
<cfoutput>
Total Delegates: #qryAttendenceList.recordcount#<br>
Total passwords set: #total# <br>

</cfoutput>