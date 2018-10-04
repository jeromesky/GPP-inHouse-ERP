<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 3 >
		<cfset cleanString = URLDecode(url.term) >
            <cfquery datasource="#gpp#" name="qryLabels" >
            SELECT 
            		[AKA_companyID]
                    ,[AKA_companyName]
  			FROM 
  					[companyAKA]
            WHERE
            		[AKA_companyName] LIKE '%#cleanString#%'  
                    AND
                    [companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.companyID#">
            ORDER 
            		BY [AKA_companyName]
            </cfquery>
		  <cfif qryLabels.recordcount GTE 1 >
                  <cfloop query="qryLabels">
					  <cfset contentString = '{ "label": "#trim(qryLabels.AKA_companyName)#", "AKA_companyID" : "#trim(qryLabels.AKA_companyID)#"}' >
                      <cfset content = ListAppend(content, contentString, ",") >
                  </cfloop>
                  
                  <cfset fullReturn = start & content & end >
                  <cfoutput>#fullReturn#</cfoutput>
                  
          <cfelse>
                  <cfoutput>[{ "label": "#cleanString# is not on our labels list", "AKA_companyID" :0 }]</cfoutput>
          
          </cfif>
<cfelse>

<cfoutput>[{ "label": "no letters where detected for the search",  "AKA_companyID" : 0 }]</cfoutput>
</cfif>