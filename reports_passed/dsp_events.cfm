<cfinclude template="qry_Events.cfm" >

<ul class="checklist cl2">
<cfloop query="get_Events"><cfoutput>
<li><label for="#get_Events.eventId#"><input value="#get_Events.eventId#" id="#get_Events.eventId#" type="checkbox" name="events"> (#get_Events.eventCode#) #get_Events.eventName#</label></li>
</cfoutput></cfloop></ul>