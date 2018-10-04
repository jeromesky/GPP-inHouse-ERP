<cfinclude template="../Application.cfm">
<cfquery datasource="#gpp#" name="get">
SELECT country 
FROM ViewCountries
ORDER BY Country
</cfquery>
<cfset open = "{" >
<cfset close = "}" >
<cfset TheValues = "" >

<cfoutput query="get">
	<cfset getVal =  "'" & #rereplace(Lcase(get.country), '^\w', '\u\0')# & "' : '" & #rereplace(Lcase(get.country), '^\w', '\u\0')# & "'" >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset result = open & TheValues & close >

<cfoutput>#result#</cfoutput>