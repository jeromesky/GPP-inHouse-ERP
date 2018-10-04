<CFINCLUDE template="../Application.cfm">
<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(form.tag) GTE 1 >
<cfset cleanString = URLDecode(form.tag)>

<cfquery datasource="#gpp#" name="get" >
    SELECT 
        id,  
        data 
    FROM 
		CRM_Titles
    WHERE 
    	data LIKE '%#cleanString#%'
    ORDER BY 
    	data
</cfquery>

<cfloop query="get">
<cfset contentString = '{ "tag": "#trim(get.data)#", "id": "#trim(get.id)#"  }'>
<cfset content = ListAppend(content, contentString, ",") >
</cfloop>
<cfset fullReturn = start & content & end >
<cfoutput>#fullReturn#</cfoutput>
<cfelse>
<cfoutput>[{ "tag": "no letters where detected for the search", "id": "0"  }]</cfoutput>
</cfif>