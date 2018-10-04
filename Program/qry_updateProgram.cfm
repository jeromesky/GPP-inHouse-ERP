<cfset updateString = replace(form.programOrder, "&slot[]=", ",", "ALL")>
<cfset updateString = replace(updateString, "slot[]=", "", "ALL")>

<!---GEt EVENT INFO -------------------------------------------->
<cfquery datasource="#gpp#" name="qry_event">
	SELECT TOP 1
    	[timereg]
       ,[event_expire]
    FROM
    	[CRM_events]
    WHERE
    	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
</cfquery>

<!---<cfdump var="#updateString#">--->
<cfscript >
 slotDate = qry_event.event_expire;
 slotTime = TimeFormat(qry_event.timereg , "HH:MM");
 inSession = 0;
 

</cfscript>

    <cfquery datasource="#gpp#" name="qry_Order">
    SELECT 
          [speakerID]
          ,[speakerType]
          ,[speakerUnit]
    FROM
        [CRM_program]
    WHERE 
        [speakerID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#updateString#">) 
        
    ORDER BY 
        CHARINDEX(','+CONVERT(varchar, speakerID)+',', ',#updateString#,')
    </cfquery>   
 
<cfoutput query="qry_Order">

	<cfif qry_Order.speakerType EQ 2>
        <cfset inSession = incrementvalue(inSession)>
    </cfif>
	
        <cfquery datasource="#gpp#">
        UPDATE 
            [speakers]
        SET 
            [speakerTime] 			=  <cfqueryparam cfsqltype="cf_sql_time" value="#slotTime#">
            ,[speakerDate]			= <cfqueryparam cfsqltype="cf_sql_date" value="#slotDate#">
            ,[speakerSession] 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#inSession#">
            ,[speakerOrder]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#qry_Order.currentRow#">
        WHERE
        	[speakerID] 			= <cfqueryparam cfsqltype="cf_sql_integer" value="#qry_Order.speakerID#">
        </cfquery>
        
        <cfset slotTime =  #TimeFormat(DateAdd("n", (qry_Order.speakerUnit*5), "#slotTime#"), "HH:MM")#>
        
		 <cfif qry_Order.speakerType EQ 6>
            <cfset slotTime = TimeFormat(#qry_event.timereg#, "HH:MM")>
            <cfset slotDate = DateAdd("d", 1,  #qry_event.event_expire#)>
    	 </cfif>
 
 </cfoutput>
 <!---
        #slotTime#  #inSession#
        <cfswitch expression="#speakerType#">
            <cfcase value="1">Presentation</cfcase>
            <cfcase value="2">Session</cfcase>
            <cfcase value="3">Information</cfcase>
            <cfcase value="4">File</cfcase>
            <cfcase value="5">Moderator</cfcase>
        </cfswitch><br />--->
