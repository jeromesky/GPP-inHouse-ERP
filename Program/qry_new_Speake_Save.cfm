
<cfswitch expression="#form.speakerType#">
	<cfcase value="1">
    	<cfset unit = 4>
    </cfcase>
    
    <cfcase value="5">
    	<cfset unit = 1>
    </cfcase>
</cfswitch>



<cfquery datasource="#gpp#" >
        INSERT INTO speakers (
        	userid, 
            eventid, 
            speakerDateAdded, 
            speakerType, 
            speakerUnit
        <cfif parameterexists(form.speakerTopic)>, speakerTopic</cfif>
        )
        VALUES
        		(
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
                ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerType#">
                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#unit#">
                <cfif parameterexists(form.speakerTopic)>, <cfqueryparam cfsqltype="cf_sql_char" value="#form.speakerTopic#"></cfif>
                )
</cfquery>