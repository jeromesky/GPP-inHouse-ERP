<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 3 >
		<cfset cleanString = URLDecode(url.term) >

            <cfquery datasource="#gpp#" name="qry_branch" >
            SELECT 
            		[branchName]
                    ,[branchID]
                    ,[companyName]
                    ,[companyID]
  			FROM 
  					[CRM_Branch]
            WHERE
            		[branchName] LIKE '%#cleanString#%'  
                    AND
                    [branchType] IN (500, 501, 502)
            <cfif url.companyID NEQ "">
            		AND
                    [companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.companyID#">
            </cfif>
            ORDER 
            		BY [branchName]
            </cfquery>

		  <cfif qry_branch.recordcount GTE 1 >
                  <cfloop query="qry_branch">
					  <cfset contentString = '{ "label": "#trim(qry_branch.branchName)# - (#trim(qry_branch.companyName)#)", "branchName" : "#trim(qry_branch.branchName)#",  "branchID": #qry_branch.branchID#, "companyID": #qry_branch.companyID# }' >
                      <cfset content = ListAppend(content, contentString, ",") >
                  </cfloop>
                  
                  <cfset fullReturn = start & content & end >
                  <cfoutput>#fullReturn#</cfoutput>
                  
          <cfelse>
                  <cfoutput>[{ "label": "#cleanString# is not on our branch list", "branchName" : "#cleanString#", "branchID": 0, "companyID": 0 }]</cfoutput>
          
          </cfif>
<cfelse>

<cfoutput>[{ "label": "no letters where detected for the search",  "branchName" : "", "branchID": "" , "companyID": "" }]</cfoutput>
</cfif>