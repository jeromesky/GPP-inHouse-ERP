<cfinclude template="../Application.cfm">
<!--- get the template details --->
<cftry>
<cfsilent>
<cfquery name="get_event" DATASOURCE="#dsnP21#" cachedWithin=#CreateTimeSpan(0,0,30,0)# >
   	SELECT id, event_year, groupby, events.ColorD, events.ColorL
	FROM events
	WHERE id = #getjob.eventid# 
</cfquery>

<cfif getjob.eventExact NEQ 1>
      <cfquery name="get_event" DATASOURCE="#dsnP21#">
          SELECT id, events.ColorD, events.ColorL
          FROM events
          WHERE groupby = #get_event.groupby# AND event_year = #get_event.event_year# AND LIVE = 1 
          ORDER BY event_type desc
      </cfquery>
</cfif>

<cfset i = 0>

<cfquery name="get_speakers" datasource="#dsnP21#"  >
	SELECT speakers.name, speakers.delegation, speakers.photo
	FROM speakers 
	LEFT outer JOIN speakers_program
	ON speakers_program.clientid = speakers.id
	WHERE <cfloop query="get_event"><cfif i NEQ 0 >OR</cfif> speakers_program.eventid = #get_event.id#<cfset i = i + 1 ></cfloop>
	ORDER BY speakers_program.pos
</cfquery>
</cfsilent>
<cfoutput><br><h3 style="color: rgb(255, 0, 0);">Confirmed Speakers Include</h3>
<ul>
<cfloop query="get_speakers">
<li><cfif get_speakers.recordcount LTE 2 ><img src="http://www.petro21.com/speakers/photos/#get_speakers.photo#" /></cfif> <b>#get_speakers.name#</b>#get_speakers.delegation#</li>
</cfloop></ul></cfoutput>
<cfcatch type="any">
 <cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error on #CGI.SERVER_NAME# - #CGI.PATH_INFO#" type="html"><cfoutput>error message: #cfcatch.Message# <br>error Details: #cfcatch.Detail# <br>error in: #cfcatch.Type# <br> error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
 SQL state:<cfif parameterexists(cfcatch.SQLState)>  #cfcatch.SQLState#</cfif><br> 
 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif>
 <br >#cgi.script_name#</cfoutput></cfmail>
 
</cfcatch>
</cftry>