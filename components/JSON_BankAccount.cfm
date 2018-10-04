<CFINCLUDE template="../Application.cfm">

<cfset open = "{">
<cfset close = "}">
<cfset TheValues = "">

<cfquery datasource="#gpp#" name="get">
SELECT id, data FROM CRM_BankAccounts
</cfquery>

<cfoutput query="get">
	<cfset getVal =  "'" & #trim(get.id)# & "' : '" & #trim(get.data)# & "'" >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset result = open & TheValues & close>
<cfoutput>#result#</cfoutput>