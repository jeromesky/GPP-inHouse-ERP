<cfinclude template="../application.cfm">
<cfinclude template="fbx_settings.cfm">

<cfset fusebox = structNew()>

<cfif isDefined('url.fa')>
  <cfset fusebox.fuseaction = url.fa>
<cfelseif isDefined('form.fa')>
  <cfset fusebox.fuseaction = form.fa>
<cfelse>
  <cfset fusebox.fuseaction = defaultFuseAction>
</cfif>

<cfinclude template="dsp_htmlHeader.cfm">
<cfinclude template="dsp_menu.cfm">
<cfinclude template="fbx_switch.cfm">
<cfinclude template="dsp_htmlFooter.cfm">