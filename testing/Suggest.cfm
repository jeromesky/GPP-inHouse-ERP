

<cfset start = "{ results: [" >
<cfset end = "] }" >
<cfset content = "" >
<cfset contentString = "" >

<cfquery datasource="petro21" name="get" >
SELECT id,  name + ' ' + surname AS fullname,  company FROM email_news
WHERE name LIKE '%#url.input#%' or surname LIKE '%#url.input#%'

</cfquery>

<cfloop query="get">
<cfset contentString = "{ id: '#get.id#', value: '#get.fullname#', info: '#get.company#' }" >
<cfset content = ListAppend(content, contentString, ",") >
</cfloop>
<cfset fullReturn = start & content & end >
<cfoutput>#fullReturn#</cfoutput>