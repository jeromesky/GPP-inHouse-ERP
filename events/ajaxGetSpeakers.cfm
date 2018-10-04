<cfinclude template="../Application.cfm">
<cfquery name="speaker" datasource="#dsnP21#">
   SELECT  id, name, surname, company
   FROM email_news
   WHERE name LIKE '#url.q#%' OR surname LIKE '#url.q#%'
   order by name, surname
</cfquery>
<!---<cfinclude template="json.cfc">
<cfset open = "{ results: [" >
<cfset close = "] }" >
<cfset TheValues = "" >
<cfoutput query="speaker">
	<cfset getVal =  "{ id: " & " #speaker.id#" & ", value: " & "#speaker.name# #speaker.surname#" & ", info: " & "#speaker.company#"& " } "   >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset  result = open & TheValues & close >
<!--- { id: #id#, value: #name#, info: #company# }  
--->
<cfoutput>#result#</cfoutput>
--->

<cfoutput query="speaker">
"#speaker.id# | #speaker.name# #speaker.surname#"

</cfoutput>