<cfinclude template="fbx_settings.cfm">

<cfset fusebox = structNew()>

<cfif isDefined('url.fa')>
  <cfset fusebox.fuseaction = url.fa>
<cfelseif isDefined('form.fa')>
  <cfset fusebox.fuseaction = form.fa>
<cfelse>
  <cfset fusebox.fuseaction = defaultFuseAction>
</cfif>

<cfoutput>
<cfinclude template="../_display/dsp_document_head.cfm">
<cfinclude template="fbx_switch.cfm">
<cfinclude template="../_display/dsp_document_foot.cfm">
</cfoutput>