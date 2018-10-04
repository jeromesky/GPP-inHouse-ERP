<cfinclude template="qry_eventsDisplay_current.cfm">
<select name="eventID" multiple="multiple" size="8" style="width:300px">
<cfoutput query="qryEvents">	<option value="#eventID#">#eventName# #eventYear#</option></cfoutput>
</select>

