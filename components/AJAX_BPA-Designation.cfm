<CFINCLUDE template="../Application.cfm">

<cfset start = "{ results: [" >
<cfset end = "] }" >
<cfset content = "" >
<cfset contentString = "" >

<cfquery datasource="#gpp#" name="get" >
SELECT id,  data FROM CRM_BPA_Designation
</cfquery>

<cfloop query="get">
<cfset contentString = "{ id: '#trim(get.id)#', value: '#trim(get.data)#'  }" >
<cfset content = ListAppend(content, contentString, ",") >
</cfloop>
<cfset fullReturn = start & content & end >
<cfoutput>#fullReturn#</cfoutput>