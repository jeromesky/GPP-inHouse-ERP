    <div class="sectionHeader">Select Dates</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
<cfif parameterexists(url.company)>
<cfquery datasource="stats" name="getComp">SELECT distinct event FROM counter WHERE company = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.company#"></cfquery>
<ul>
    <cfloop query="getComp">
    <cfquery datasource="#dsnP21#" name="event">SELECT event_name FROM events WHERE id = '#getComp.event#' </cfquery>
	<li><cfoutput><a href="" ><img src="../img/new_delete.gif" /></a> <a href="javascript:statsLoad(#url.company#, #getComp.event#); " >#event.event_name#</a> </cfoutput></li>
</cfloop> 
</ul> 
</cfif>