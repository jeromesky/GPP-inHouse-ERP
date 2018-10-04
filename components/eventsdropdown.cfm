<cfinclude template="../application.cfm">
<cfset datenow =#CreateODBCDate(Now())#>
<cfquery name=qry_events datasource="#dsnP21#" >
   SELECT id, event_name, event_type, event_year, event_abbr
   FROM events 
  WHERE event_expire > #datenow# 
  AND event_type = 'Event' OR event_type = 'EB' OR event_type = 'DIN' OR event_type = 'RE' OR event_type = 'week' OR event_type = 'EB' OR event_type = 'book' OR event_type = 'club' OR event_type = 'cm' OR event_type = 'Advis'
   ORDER BY event_expire desc
</cfquery>
<!---<cfquery name=qry_eventsEB datasource=#dsntwo# >
   SELECT * 
   FROM events
   WHERE event_type = 'EB'
</cfquery> --->

<select name="RedirectURL">
<option value="events/Quickregister.cfm">Quick links</option>
<option value="">----------Week----------</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "week"><option value="events/index.cfm?id=#qry_events.id#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">--------conferences ------</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "Event"><option value="events/index.cfm?id=#qry_events.id#&tc=#qry_events.event_abbr#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">--------------Briefings</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "EB"><option value="events/index.cfm?id=#qry_events.id#&tc=#qry_events.event_abbr#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">-----------------Dinners</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "DIN"><option value="events/index.cfm?id=#qry_events.id#&tc=#qry_events.event_abbr#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">---------------Research</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "RE"><option value="research/index.cfm?id=#qry_events.id#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">---------------Books</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "book"><option value="research/index.cfm?id=#qry_events.id#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">---------------Clubs</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "club"><option value="research/index.cfm?id=#qry_events.id#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">---------------Advisory</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "Advis"><option value="research/index.cfm?id=#qry_events.id#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value="">---------------Content Manangement</option>
<cfoutput query=qry_events>
<cfif qry_events.event_type EQ "CM"><option value="research/index.cfm?id=#qry_events.id#">#qry_events.event_name#, #qry_events.event_year#</option></cfif></cfoutput>
<option value=""></option>
<option value="conference/index.cfm">Link to e-Conferences</option>
</select> 