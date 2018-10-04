<cfinclude template="../Application.cfm">
<!--- get the template details --->
<cftry>
<cfquery name="get_event" DATASOURCE="#dsnP21#" cachedWithin=#CreateTimeSpan(0,0,30,0)#>
   	SELECT id, event_blurb, ColorD, ColorL, groupby, event_year
	FROM events
	WHERE  id = #getjob.eventid# 
</cfquery>

<cfif getjob.eventExact NEQ 1>
      <cfquery name="get_event" DATASOURCE="#dsnP21#" cachedWithin=#CreateTimeSpan(0,0,30,0)#>
          SELECT event_blurb,  ColorD, ColorL
          FROM events
          WHERE groupby = #get_event.groupby# 
          AND event_year = #get_event.event_year# 
          AND  LIVE = 1  
          AND event_type = 'week'
      </cfquery>
</cfif>

<cfoutput><font color="###get_event.ColorD#"><h3>Overview</h3></font>
#get_event.event_blurb#</cfoutput>
<cfcatch type="any">
 <cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in:  #cfcatch.Type# <br> error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
 SQL state:<cfif parameterexists(cfcatch.SQLState)> #cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br>#cgi.script_name#</cfoutput></cfmail>
</cfcatch>
</cftry>