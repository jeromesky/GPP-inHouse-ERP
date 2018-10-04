<cfcomponent>
	<cffunction name="eventName" access="public" returntype="string">
    <cfargument name="eventID" type="numeric" required="yes" default="1"/>

        <cfquery datasource="gpp" name="qry_eventName">
            SELECT
                [event_name]
            FROM
                [CRM_events]
            WHERE
                [eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventID#">
        </cfquery>

		<cfscript>
            	eventName = '#qry_eventName.event_name#';
        </cfscript>

	<cfreturn eventName>
	</cffunction>
</cfcomponent>