<cfinclude template="../Application.cfm">
<!--- get the template details --->
<cftry>
<cfquery name="get_event" DATASOURCE="#gpp#" cachedWithin=#CreateTimeSpan(0,0,30,0)# >
   	SELECT 
      event_year, groupby, FocusOn, events.ColorD, events.ColorL
    FROM 
       tblAnnual_Conf
    WHERE IngConference_ID = #getjob.eventid# 
</cfquery>

<cfif getjob.eventExact NEQ 1>

    <cfquery name="get_event" DATASOURCE="#gpp#" cachedWithin=#CreateTimeSpan(0,0,30,0)#>
        SELECT 
          FocusOn, events.ColorD, events.ColorL
        FROM 
         tblAnnual_Conf
        WHERE groupby = #get_event.groupby# 
        AND event_year = #get_event.event_year# 
        AND  LIVE = 1 
        AND event_type = 'week'
    </cfquery>
</cfif>
<cfoutput><br>
<h3 style="color: rgb(255, 0, 0);">With Focus On</h3>
#get_event.FocusOn#</cfoutput>
<cfcatch type="any">
 <cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in:  #cfcatch.Type# <br> error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
 SQL state:<cfif parameterexists(cfcatch.SQLState)>#cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br >#cgi.script_name#</cfoutput></cfmail>
 
</cfcatch>
</cftry>