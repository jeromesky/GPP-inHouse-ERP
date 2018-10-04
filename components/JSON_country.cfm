<CFINCLUDE template="../Application.cfm">

<cfquery datasource="#gpp#" name="get">
	SELECT id, country, areaCode 
    FROM ViewCountries
</cfquery>

<cfset open = "{" >
<cfset close = "}" >
<cfset TheValues = "" >

<cfoutput query="get">
	<cfset getVal =  "'" & #trim(get.country)#& "|" &#trim(get.areaCode)# & "' : '" & #trim(get.country)# &  "'">
	<cfset TheValues = ListAppend(TheValues, getVal, ",")>
</cfoutput>
<cfset result = open & TheValues & close >
<cfoutput>#result#</cfoutput>