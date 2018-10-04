<CFINCLUDE template="../Application.cfm">
<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(form.tag) GT 2 >
		<cfset cleanString = URLDecode(form.tag)>
        <cfquery datasource="#gpp#" name="get" >
            SELECT *  
            FROM CRM_company_newUser
            WHERE strCompany_Name LIKE '#cleanString#%'
            ORDER BY strCompany_Name
        </cfquery>

        <cfif get.recordcount GT 0 >
                <cfloop query="get">
                <cfset contentString = '{ "tag": "#trim(get.strCompany_Name)#", "id": "#trim(get.IngCompany_ID)#", "indCod" : "#trim(lngIndustry_ID)#" }' >
                <cfset content = ListAppend(content, contentString, ",") >
                </cfloop>
				<cfset fullReturn = start & content & end >
                <cfoutput>#fullReturn#</cfoutput>
        <cfelse>
        	<!--- return JSON Empty from New company command <cfoutput>[{ "tag": "#cleanString# select to creat new company", "id": "0" , "indCod" : "no industry" }]</cfoutput>--->
        </cfif>
<cfelse>
		<cfoutput>[{ "tag": "no letters where detected for the search", "id": "0" , "indCod" : "no industry" }]</cfoutput>
</cfif>