<CFINCLUDE template="../Application.cfm">

<cfquery datasource="#dsnP21#" name="get">
SELECT * FROM CRM_event_types
</cfquery>

<cfset open = "{">
<cfset close = "}">
<cfset TheValues = "">

<cfoutput query="get">
	<cfset getVal =  "'" & #trim(get.name)# & "' : '" & #trim(get.description)# & "'" >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset  result = open & TheValues & close >
<cfoutput>#result#</cfoutput>