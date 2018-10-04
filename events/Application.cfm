<!---
<cfset request.appName = "CFEIP" />
<cfset request.prefix = GetCurrentTemplatePath() />
<cfset request.prefix = ReReplace(request.prefix, "[^a-zA-Z]","","all") />
<cfset request.prefix = Right(request.prefix, 64 - Len(request.appName)) />

<cfapplication name="#request.prefix##request.appName#" 
	clientmanagement="no" 
	applicationtimeout="#CreateTimeSpan(0,1,0,0)#" 
	sessionmanagement="yes" 
	sessiontimeout="#CreateTimeSpan(0,1,0,0)#" 
	setclientcookies="yes" 
/>

<cfif NOT IsDefined("application.init") OR IsDefined("url.reinit")>
	<cfset application.dsn = "eipdb" />
	<cfset application.init = TRUE />
</cfif> --->

<cfinclude template="../application.cfm">