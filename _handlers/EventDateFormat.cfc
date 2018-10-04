<cfcomponent>
	<cffunction name="eventDate" access="public" returntype="string">
  		<cfargument name="eventID" type="numeric" required="yes" default="1"/>
  		<cfset gpp = 'GPP'> 

        <cfquery name="get_date" datasource="#gpp#">
        	SELECT 
            	eventDateEnd
                ,event_expire
			FROM 
				tblAnnual_Conf
			WHERE webid = #eventID#
		</cfquery>

		<cfif DatePart("m", get_date.event_expire) NEQ DatePart("m", get_date.eventDateEnd)>

    		<cfscript>
            	eventFormatedStringDate = '#DatePart("d", get_date.event_expire)# #MonthAsString(DatePart("m", get_date.event_expire))# to #DatePart("d", get_date.eventDateEnd)# #MonthAsString(DatePart("m", get_date.eventDateEnd))# #DatePart("yyyy", get_date.event_expire)#';
            </cfscript>

		<cfelseif DatePart("d", get_date.event_expire) NEQ DatePart("d", get_date.eventDateEnd)>

      		<cfscript>
            	eventFormatedStringDate = '#DatePart("d", get_date.event_expire)# - #DatePart("d", get_date.eventDateEnd)# #MonthAsString(DatePart("m", get_date.event_expire))# #DatePart("yyyy", get_date.event_expire)#';
			</cfscript>

		<cfelse>

      		<cfscript>
            	eventFormatedStringDate = '#DatePart("d", get_date.eventDateEnd)# #MonthAsString(DatePart("m", get_date.event_expire))# #DatePart("yyyy", get_date.event_expire)#';
			</cfscript>

    	</cfif>
 
		<cfreturn eventFormatedStringDate>
	</cffunction>
</cfcomponent>