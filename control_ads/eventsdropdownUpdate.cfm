<cfinclude template="../application.cfm">
<cfquery name=qry_events datasource="#dsnP21#" cachedwithin="#CreateTimeSpan(0, 1, 0, 0)#" >
   SELECT * 
   FROM events
  WHERE (event_expire > #datenow#) AND (event_type = 'Event') OR (event_type = 'EB')
   ORDER BY event_expire asc
</cfquery>
<!---<cfquery name=qry_eventsEB datasource=#dsntwo# >
   SELECT * 
   FROM events
   WHERE event_type = 'EB'
</cfquery>  #q[fieldname][q.currentrow]#--->

        <select name="RedirectURL">
		<option value="">----------Events and Strategy Breifings---------</option>
<cfloop query=qry_events>
<cfoutput><option value="events/index.cfm?id=#qry_events.id#" <cfif qGetBanner.vchRedirectURL EQ #[events/index.cfm?id=]qry_events.id#>selected</cfif>>#qry_events.event_name#</option></cfoutput></cfloop>
<!--- <option value="">--------Strategy Breifings----------</option>
<cfloop query=qry_eventsEB><cfoutput><option value="events/index.cfm?id=#qry_events.id#">#qry_eventsEB.event_name#</option></cfoutput></cfloop>--->
<option value=""></option>
<option value="">------------Advisory----------</option>
<option value="research/index.cfm?id=1&client=leonardo"></option>Global Research Suite</option>
<option value="wrr/index.asp">Leonardo Client Research</option>
<option value="research/index.cfm?id=2&client=vision&show=1">Worldwide Strategy Databank</option>
<option value="research/index.cfm?id=8&client=africa&show=1">Scramble for Africa</option>
<option value="news/index.cfm">Oil & Gas News</option>
<option value="research/index.cfm?id=31&client=none&show=1">Conference Gold Card</option>
<option value="http://www.petrotrekker.com">PetroTrekker</option>
<option value="cm/index.cfm?id=55">Research Clients</option>
<option value="cm/index.cfm?id=13">Senior Partners</option>
<option value="cm/index.cfm?id=5">Advisory Practice</option>
<option value="cm/index.cfm?id=6">Advisory Retainers</option>
<option value="cm/index.cfm?id=7">Competitor Intelligence</option>
<option value="cm/index.cfm?id=12">National Oil Companies</option>
<option value="cm/index.cfm?id=11">In-House Workshops</option>
<option value="cm/index.cfm?id=10">Hydrocarbon Industry Risks</option>
<option value="cm/index.cfm?id=14">Training Programs</option>
<option value="research/index.cfm?id=30&client=petroAfricanus?show=1">PetroAfricanus</option>
<option value="research/index.cfm?id=6&client=none&show=1">National Oil Companies</option>
<option value="research/index.cfm?id=4&client=none&show=1">Global Petroleum Trends</option>
<option value="research/index.cfm?id=8&client=africa&show=1">Scramble For Africa</option>
<option value="research/index.cfm?id=23&client=none&show=1">Corporate Oil-Global Enemies</option>
<option value="research/index.cfm?id=31&client=none&show=1">Conference Gold Card</option>
<option value="conference/index.cfm">Link to e-Conferences</option>
		</select> 