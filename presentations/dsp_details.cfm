<cfinclude template="qry_details.cfm">
<cfoutput>
<b>event</b>
<i class="NoFormat">
 #qry_event.event_name#
</i>

<b>cost</b>
<i class="NoFormat econf_cost">
<input type="text" id="presentationCost" value="#qry_event.presentationCost#" />
</i>

<b>currency</b>
<i class="NoFormat">
	<select id="presentationCurrency" name="presentationCurrency">
        <option value="USD" <cfif qry_event.presentationCurrency eq 'USD'>selected</cfif>>USD</option>
        <option value="GBP" <cfif qry_event.presentationCurrency eq 'GBP'>selected</cfif>>GBP</option>
        <option value="EUR" <cfif qry_event.presentationCurrency eq 'EUR'>selected</cfif>>EUR</option>
        <option value="ZAR" <cfif qry_event.presentationCurrency eq 'ZAR'>selected</cfif>>ZAR</option>
        <option value="AUD" <cfif qry_event.presentationCurrency eq 'AUD'>selected</cfif>>AUD</option>
	</select>
</i>
<b></b>
<i class="NoFormat">
	<button onclick="javascript:presentationDetailsSave();">save</button>
</i>
<input type="hidden" id="event_type" value="#qry_event.event_type#" >
<input type="hidden" id="eventID" value="#qry_event.eventID#">
<input type="hidden" id="event_abbr" value="#qry_event.event_abbr#">
<div class="clear"></div></cfoutput>