<cfinclude template="../Application.cfm">
<cfquery name="clubs" datasource="#dsnP21#">
   SELECT *
   FROM groupby
   order by groupby desc
</cfquery>
<cfinclude template="json.cfc">
<cfset open = "{" >
<cfset close = "}" >
<cfset TheValues = "" >

<cfoutput query="clubs">
	<cfset getVal =  "'" & #clubs.id# & "' : '" & #clubs.groupby# & "'" >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset  result = open & TheValues & close >


<cfoutput>#result#</cfoutput>
