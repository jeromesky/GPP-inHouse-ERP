<cfinclude template="../Application.cfm">

	<cfif parameterexists(form.event_expire)>
   			<cfset setID = right(form.id, 12)  > 
    <cfelseif parameterexists(form.event_name)>
    		<cfset setID = right(form.id, 10)  >
    <cfelseif parameterexists(form.event_days)>
    		<cfset setID = right(form.id, 10)  >
    <cfelseif parameterexists(form.event_cost_us)>
    		<cfset setID = right(form.id, 13) >
    <cfelseif parameterexists(form.event_abbr)>
    		<cfset setID = right(form.id, 10) >
    <cfelseif parameterexists(form.event_cost_eu)>
    		<cfset setID = form.id >
    <cfelseif parameterexists(form.live)>
    		<cfset setID = right(form.id, 4) >
	</cfif>


<cfquery datasource="#dsnP21#" name="get">

UPDATE events
SET  

<cfif parameterexists(form.event_expire)>
	event_expire = <cfqueryparam cfsqltype="cf_sql_date" value="#form.event_expire#" >
</cfif>
<cfif parameterexists(form.event_name)>
	event_name = '#form.event_name#'
</cfif>
<cfif parameterexists(form.event_days)>
	event_days = '#form.event_days#'
</cfif>
<cfif parameterexists(form.event_abbr)>
	event_abbr = '#form.event_abbr#'
</cfif>
<cfif parameterexists(form.event_cost_us)>
	event_cost_us = <cfqueryparam cfsqltype="cf_sql_money" value="#form.event_cost_us#" >
</cfif>
<cfif parameterexists(form.event_cost_eu)>
	event_cost_eu = <cfif form.event_cost_eu eq "£"><cfqueryparam cfsqltype="cf_sql_char" value="£"><cfelse>'#form.event_cost_eu#'</cfif>
</cfif>

<cfif parameterexists(form.live)>
	live = <cfif form.live EQ 1 or form.live EQ "yes">1<cfelseif form.live EQ 0 or form.live EQ "no">0</cfif>
</cfif>
	, last_updated = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#setID#">
</cfquery>

<cfoutput>


<cfif parameterexists(form.live)>
	 <cfif form.live EQ 1 or form.live EQ "yes">Live<cfelseif form.live EQ 0 or form.live EQ "no">Not Live</cfif>
</cfif>
<cfif parameterexists(form.event_expire)>#DateFormat(form.event_expire, "dd mmm yyyy")#</cfif>
<cfif parameterexists(form.event_name)>#form.event_name# </cfif>
<cfif parameterexists(form.event_days)>#form.event_days#</cfif>
<cfif parameterexists(form.event_abbr)>#form.event_abbr#</cfif>
<cfif parameterexists(form.event_cost_us)>#numberFormat(form.event_cost_us, "9999.99")#</cfif>

<cfif parameterexists(form.event_cost_eu)><cfif form.event_cost_eu eq "£">£<cfelse>#form.event_cost_eu#</cfif> </cfif>
 
</cfoutput>
<!---
<cfquery datasource="#dsnP21#" name="getevent">
SELECT id, webdisp, event_cost_eu, econf_cost, econf_descr, event_name FROM events WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
</cfquery>
<cfloop collection="#form#" item="fname">#fname#=#form[fname]#,</cfloop>
--->