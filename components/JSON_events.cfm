<CFINCLUDE template="../Application.cfm">

<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(form.tag) GT 2 >
<cfset cleanString = URLDecode(form.tag)  >

<cfquery datasource="#gpp#" name="get" >
SELECT *
FROM 
		CRM_Events_Search
WHERE 
		eventName LIKE '%#cleanString#%'
</cfquery>

<cfloop query="get">
<cfset contentString = '{ "tag": "#trim(get.eventName)# #datepart("yyyy", get.eventDate)#", "id": "#trim(get.eventID)#"  }' >
<cfset content = ListAppend(content, contentString, ",") >
</cfloop>
<cfset fullReturn = start & content & end >
<cfoutput>#fullReturn#</cfoutput>
<cfelse>

<cfoutput>[{ "tag": "no letters where detected for the search", "id": "0"  }]</cfoutput>
</cfif>