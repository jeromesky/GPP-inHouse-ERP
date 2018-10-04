<CFINCLUDE template="../Application.cfm">

<cfset start = "{ results: [" >
<cfset end = "] }" >
<cfset content = "" >
<cfset contentString = "" >

<cfquery datasource="#gpp#" name="get" >
SELECT id, country, areaCode FROM ViewCountries
</cfquery>

<cfloop query="get">
<cfset contentString = "{ id: '#trim(get.id)#', value: '#trim(get.country)#', info: '#trim(get.areaCode)#' }" >
<cfset content = ListAppend(content, contentString, ",") >
</cfloop>
<cfset fullReturn = start & content & end >
<cfoutput>#fullReturn#</cfoutput>