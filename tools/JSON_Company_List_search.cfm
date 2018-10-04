<CFINCLUDE template="../Application.cfm">

<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(form.tag) GTE 1 >
		<cfset cleanString = URLDecode(form.tag) >
        
        <cfquery datasource="#gppData#" name="get" >
        SELECT TOP 10 
        			[companyName]
        			,[companyID]  
        FROM 
        		TEMP_company_list
        WHERE 
        		companyName LIKE '#cleanString#%'
        ORDER 
        		BY companyName
        </cfquery>
        
        	<cfif get.recordcount GT 0 >
                <cfloop query="get">
                <cfset contentString = '{ "tag": "#trim(get.companyName)#", "companyid": "#trim(get.companyID)#"  }' >
                <cfset content = ListAppend(content, contentString, ",") >
                </cfloop>
        
				<cfset fullReturn = start & content & end >
                <cfoutput>#fullReturn#</cfoutput>
        <cfelse>
        	<!--- return JSON Empty from New company command --->
        		<cfoutput>[{ "tag": "No more companies starting with the latter #cleanString#, search on next letter", "companyid": "0" }]</cfoutput>
        </cfif>
        
<cfelse>

		<cfoutput>[{ "tag": "no letters where detected for the search", "companyid": "0" }]</cfoutput>
</cfif>