<cfcomponent>
	<cffunction name="presentationTopic" access="public" returntype="string">
    <cfargument name="speakerID" type="numeric" required="yes" default="1"/>

        <cfquery datasource="gpp" name="qry_topic">
            SELECT
                [speakerTopic]
                ,[eventID]
                ,[speakerSession]
            FROM
                [speakers]
            WHERE
                [speakerID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#speakerID#">
        </cfquery>
 
 		<cfscript>
				topic = REReplace(qry_topic.speakerTopic,"[^A-Za-z0-9 ]", "", "ALL");
            	topic = '#left(replace(topic, " ", "_", "ALL"), 46)#';
        </cfscript>    
        
        <cfif qry_topic.speakerTopic EQ "">

            <cfquery datasource="gpp" name="qry_checkFileEx">
            	SELECT
                	[libraryID]
                 FROM
                 	[library]
                 WHERE
                 	[speakerID]= <cfqueryparam cfsqltype="cf_sql_integer" value="#speakerID#">
            </cfquery>
        	<cfquery datasource="gpp" name="qry_evName">
            SELECT
            	[event_name]
            FROM
            	[PM_events]
             WHERE
             	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qry_topic.eventID#">
        	</cfquery>

			 <cfscript>
                    if(qry_checkFileEx.recordcount GT 0){
                        file_part = qry_checkFileEx.recordcount;
                    }else{
                        file_part = qry_checkFileEx.recordcount;
                    }
					topic = REReplace(qry_evName.event_name,"[^A-Za-z0-9 ]", "", "ALL");
					topic = '#left(replace(qry_evName.event_name, " ", "_", "ALL"), 40)#_s#qry_topic.speakerSession#_#file_part#';
            </cfscript>
        </cfif>

	<cfreturn topic>
	</cffunction>
</cfcomponent>