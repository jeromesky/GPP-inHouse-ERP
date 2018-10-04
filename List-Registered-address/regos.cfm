<cfparam name='url.v2' default='no'>

<cfinclude template="qry_regos.cfm">

<cfif url.v2 EQ 'yes'>
  <cfinclude template="dsp_regos_v2.cfm">
<cfelse>
  <cfinclude template="dsp_regos.cfm">
</cfif>