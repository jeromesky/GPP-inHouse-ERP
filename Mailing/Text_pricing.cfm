<cfinclude template="../Application.cfm">
<cftry>
<cfsilent>
<!--- get the template details --->
        <cfquery name="get_event" DATASOURCE="#dsnP21#" cachedWithin=#CreateTimeSpan(0,0,30,0)#>
            SELECT id, event_year, groupby
            FROM events
            WHERE  id =  #getjob.eventid# 
        </cfquery>
        <cfquery name="get_group" DATASOURCE="#dsnP21#" cachedWithin=#CreateTimeSpan(0,0,30,0)#>
            SELECT event_name, event_days, event_month, event_year, event_cost_currency, event_cost_us, event_type
            FROM events
            WHERE  groupby = #get_event.groupby# AND event_year = #get_event.event_year# AND  LIVE = 1 <cfif getjob.eventExact NEQ 1>AND id = #get_event.id#</cfif>
            ORDER BY event_expire desc
        </cfquery>
</cfsilent>
<cfoutput>
<br />
<div style="border:1px solid ##CC6600; background-color:##FFFFDB; padding:20px; color:##CC3300">
<h3>Registration Fees: Separately Bookable Events </h3>
<cfloop query="get_group" > <cfif get_group.event_type NEQ "week">
#get_group.event_days# #get_group.event_month# #get_group.event_year#: #get_group.event_name# Registration Fees: #get_group.event_cost_currency# #numberformat(get_group.event_cost_us, "_____.__")# <br></cfif></cfloop>
</div>
</cfoutput>
<cfcatch type="any">
 <cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in: #cfcatch.Type# <br> error Native :<cfif parameterexists(cfcatch.NativeErrorCode)>#cfcatch.NativeErrorCode#</cfif><br>
 SQL state: <cfif parameterexists(cfcatch.SQLState)>#cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br >#cgi.script_name#</cfoutput></cfmail>
 
</cfcatch>
</cftry>