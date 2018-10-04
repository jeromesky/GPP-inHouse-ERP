<!--- this page will handle ALL static based content --->
<!---
************************************************************************************************************************
* "Lite" version of Fusebox framework. This version has less indirection than the "formal" version and is far less code.
************************************************************************************************************************
--->

<cfset fusebox = structNew()>
<!--- Get fuseaction from either url or form --->
<cfif isDefined('url.fa')>
	<cfset fusebox.fuseaction = url.fa>
<cfelseif isDefined('form.fa')>
	<cfset fusebox.fuseaction = form.fa>
<cfelse>
	<cfset fusebox.fuseaction = defaultFuseAction>
</cfif>
<cfif traceOn> <!--- Output to HTML comment --->
	<!-- TRACE: using fuseaction: <cfoutput>#fusebox.fuseaction#</cfoutput> -->
</cfif>
<cfinclude template="fbx_utils.cfm"> <!--- optional --->
<cfinclude template="fbx_switch.cfm">