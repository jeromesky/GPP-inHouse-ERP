<cfinclude template="../Application.cfm">
<cfquery name="clubs" datasource="#gpp#">
   SELECT country
   FROM ViewCountries
   order by country 
</cfquery>
<!---<cfinclude template="json.cfc">--->
<cfset open = "{" >
<cfset close = "}" >
<cfset TheValues = "" >

<cfoutput query="clubs">
	<cfset getVal =  "'" & #trim(clubs.country)# & "' : '" & #trim(clubs.country)# & "'">
	<cfset TheValues = ListAppend(TheValues, getVal, ",") >
</cfoutput>
<cfset result = open & TheValues & close >

<cfoutput>#result#</cfoutput>