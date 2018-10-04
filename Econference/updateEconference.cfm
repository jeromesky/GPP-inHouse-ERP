
<cfquery datasource="#gpp#" name="get">

UPDATE tblAnnual_Conf
SET  


<cfif parameterexists(form.econf_descr)>
	econf_descr = '#form.econf_descr#'
</cfif>


<cfif parameterexists(form.webdisp)>
	webdisp = <cfif form.webdisp EQ 1 OR form.webdisp EQ "yes" >1 <cfelse> 0</cfif>
</cfif>



<cfif parameterexists(form.event_name)>
	event_name = '#frm.event_name#'
</cfif>

<!------- -------------------->
<cfif parameterexists(form.econf_cost)>
	econf_cost = <cfqueryparam cfsqltype="cf_sql_money" value="#form.econf_cost#" >
</cfif>

<cfif parameterexists(form.event_cost_eu)>
	event_cost_eu = <cfif form.event_cost_eu eq "£"><cfqueryparam cfsqltype="cf_sql_char" value="£"><cfelse>'#form.event_cost_eu#'</cfif>
</cfif>

WHERE webID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<cfoutput>


<cfif parameterexists(form.event_name)>#form.event_name# </cfif>
<cfif parameterexists(form.econf_descr)>#form.econf_descr# </cfif>
<cfif parameterexists(form.webdisp)><cfif form.webdisp EQ 1 OR form.webdisp EQ "yes" >Yes<cfelse> No</cfif></cfif>
<cfif parameterexists(form.econf_cost)>#numberFormat(form.econf_cost, "9999.99")#</cfif>

<cfif parameterexists(form.event_cost_eu)><cfif form.event_cost_eu eq "£">£<cfelse>#form.event_cost_eu#</cfif> </cfif>
 
</cfoutput>
<!---
<cfquery datasource="#dsnP21#" name="getevent">
SELECT id, webdisp, event_cost_eu, econf_cost, econf_descr, event_name FROM events WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#">
</cfquery>
<cfloop collection="#form#" item="fname">#fname#=#form[fname]#,</cfloop>
--->