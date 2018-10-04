<CFINCLUDE template="../Application.cfm">

<cfset start = "{ results: [" >
<cfset end = "] }" >
<cfset content = "" >
<cfset contentString = "" >

<cfquery datasource="#gpp#" name="get" >
SELECT IngIndividual_ID AS id, strFirst_Name + ' ' +  strSurname AS name , 'Status( ' +  STATUS + ' )  ' + CountryName AS country
FROM tblIndividual
WHERE strFirst_Name LIKE '%#url.input#%'  OR strSurname LIKE '%#url.input#%'

</cfquery>

<cfloop query="get">
<cfset contentString = "{ id: '#get.id#', value: '#get.name#', info: '#get.country#' }" >
<cfset content = ListAppend(content, contentString, ",") >
</cfloop>
<cfset fullReturn = start & content & end >
<cfoutput>#fullReturn#</cfoutput>