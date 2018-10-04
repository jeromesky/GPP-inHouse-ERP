<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(url.term) GT 3 >
		<cfset cleanString = URLDecode(url.term) >
            <cfquery datasource="#gpp#" name="get" >
            SELECT 
            		[strEmail]
                    ,strFirst_Name + ' ' + strSurname AS Name
  			FROM 
  					[tblIndividual]
            WHERE
            		[strEmail] LIKE '%#cleanString#%' 
            ORDER 
            		BY strEmail
            </cfquery>
            
			<cfif get.recordcount GTE 1 >
                    <cfloop query="get">
                    <cfset contentString = '{ "label": "#trim(get.strEmail)# - (#trim(get.Name)#)", "email" : "#trim(get.strEmail)#"}' >
                    <cfset content = ListAppend(content, contentString, ",") >
                    </cfloop>
                    <cfset content = ListAppend(content, '{ "label": "#cleanString# is not on our system", "email" : "#trim(cleanString)#"}' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>
                    
            <cfelse>
            		<cfoutput>[{ "label": "#cleanString# is not on our system", "email" : "#trim(cleanString)#" }]</cfoutput>
            </cfif>
<cfelse>
<cfoutput>[{ "label": "no letters where detected for the search",  "email" : "" }]</cfoutput>
</cfif>
