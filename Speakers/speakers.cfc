<cfcomponent>
	<cffunction name="speakers" access="public" returntype="query">
		<cfargument name="eventID" type="string" required="yes" default="0"/>
        
            <cfquery datasource="#gpp#" name="qrySpeakers">
                SELECT  distinct
                    [speakerName]
                    ,[userPosition]
                    ,[companyName]
                    ,[eventID]
                    ,[speakerID]
                    ,[fileName]
                    ,[userID]
                    ,[speakerTopic] 
                    ,[speakerType]
                    ,[speakerTime]
                    ,[speakerOrder]
                    ,[speakerKeyNote]
                FROM
                	[CRM_program]
                WHERE 
                	[eventID] IN ( <cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#eventID#">) 
                AND
                	[speakerType] = 1 
                AND
                ( 
                	[speakerStatus] >= 3 
                    AND [speakerStatus] <= 6
                )
            </cfquery>
			<!---ORDER BY [speakerOrder], [speakerKeyNote], [fileName]--->
		<cfreturn qrySpeakers>
	</cffunction>
</cfcomponent>