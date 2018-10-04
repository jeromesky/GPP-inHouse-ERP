<cfsilent>

<cfinclude template="../Application.cfm">
<cftry>
<!--- get the template details -------------------------------------->
        <cfquery name="get_event" DATASOURCE="#dsnP21#"  cachedWithin=#CreateTimeSpan(0,0,30,0)# >
            SELECT id, event_year, groupby
            FROM events
            WHERE  id =  #getjob.eventid# 
        </cfquery>
        <cfquery name="get_group" DATASOURCE="#dsnP21#" cachedWithin=#CreateTimeSpan(0,0,30,0)# >
            SELECT events.event_cost_currency, events.event_cost_us, events.event_type, hotels.hotelname, hotels.address, hotels.city, hotels.country, events.event_month, events.event_days, events.event_year
            FROM events
            LEFT JOIN hotels ON events.hotel = hotels.id
            WHERE  events.groupby = #get_event.groupby# AND events.event_year = #get_event.event_year# AND  LIVE = 1 AND events.id = #get_event.id#
            ORDER BY event_expire desc
        </cfquery>
</cfsilent>
<cfoutput>
<br />
<div style="border:1px solid ##CC6600; background-color:##FFFFDB; padding:20px; color:##CC3300">
<strong>Organised & Hosted By</strong>: Global Pacific & Partners<br />
<strong>Contact</strong>:  Babette van Gessel:  <a href="mailto:babette@glopac-partners.com">babette@glopac-partners.com</a>   - or Tel: + 31 70 324 6154<br />
<strong>Date</strong>:  #get_group.event_days# #get_group.event_month# #get_group.event_year# <br />
<strong>Venue</strong>: #get_group.hotelname#, #get_group.address#, #get_group.city#, #get_group.country#<br />
<strong>Website</strong>:  <a href="http://www.petro21.com">www.petro21.com</a> 
<http://www.petro21.com/>  <br />
<strong>Registration Fees</strong>: #get_group.event_cost_currency# #get_group.event_cost_us# (+VAT). <br />
<strong>Payment</strong>: Payment is required before Dinner.  All payments must be online by Credit Card.<br />
<strong>Corporate Tables</strong>: of 6, 8 or 10 can also be booked:  Contact <a href="mailto:babette@glopac-partners.com">babette@glopac-partners.com </a><br />
<strong>Right of Admission</strong>:  No Press</div>
</cfoutput>
<cfcatch type="any">
	<cfmail to="#contactAdmin#"  FROM="web@glopac.com" SUBJECT="error sending on :#cgi.script_name# " type="html">user ID: #sendlist.id# <br> #lcase(email)# <br>#CFCATCH.Message# <br>#cfcatch.Detail#<br >#cgi.script_name#</cfmail>
</cfcatch>
</cftry>