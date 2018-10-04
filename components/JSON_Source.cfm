<CFINCLUDE template="../Application.cfm">

<cfquery datasource="#gpp#" name="get">
	SELECT id, data 
    FROM CRM_Source
</cfquery>

<cfset open = "{">
<cfset close = "}">
<cfset TheValues = "">

<cfoutput query="get">
	<cfset getVal = "'" & #trim(get.data)# & "' : '" & #trim(get.data)# & "'">
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset result = open & TheValues & close >
<cfoutput>#result#</cfoutput>