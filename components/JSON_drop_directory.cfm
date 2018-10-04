<CFINCLUDE template="../Application.cfm">

<cfquery datasource="#gpp#" name="get" >
SELECT 
		TOP 20
		IngSource_Code_ID AS id,  strSource_Code_Description AS data 
FROM 
		crm_tblSource_Code
ORDER
		BY IngSource_Code_ID DESC
</cfquery>

<cfset open = "{" >
<cfset close = "}" >
<cfset TheValues = "" >

<cfoutput query="get">
	<cfset getVal =  "'" & #trim(get.id)# & "' : '" & #trim(get.data)# & "'" >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset  result = open & TheValues & close >
<cfoutput>#result#</cfoutput>