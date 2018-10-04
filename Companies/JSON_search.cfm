<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 2 >
		<cfset cleanString = URLDecode(url.term) >

            <cfquery datasource="#gpp#" name="qryCompany">
<!---            SELECT TOP 25
                     [companyID]
                    ,[companyName]
                    ,[companyURL]
  			FROM 
  					[companies]
            WHERE
            		companyName LIKE '%#cleanString#%'  
            ORDER 
            		BY companyName--->

              SELECT TOP 25
                  companyID
                  ,companyName
                  ,companyURL
                  ,'(C)' as companyType
              FROM 
              	companies 
              WHERE
              	companyName LIKE '%#cleanString#%'
              
              UNION
              
              SELECT TOP 25
                  companyID
                  ,AKA_companyName as companyName
                  ,AKA_companyURL as comapnyURL
                  ,'(L)' as companyType
              FROM 
              	companyAKA
              WHERE
              	AKA_companyName LIKE '%#cleanString#%'
              
              UNION
              
              SELECT TOP 25
                  companyID
                  ,[branchName] AS companyName
                  ,[branchURL] AS comapnyURL
                  ,CASE 
                  WHEN branchType = 500 THEN '(Pub)'
                  WHEN branchType != 500 THEN '(B)' 
                  END AS companyType
              FROM 
              	[branch]
              WHERE 
              	[branchName] LIKE '%#cleanString#%'
              AND 
              	companyID <> 0
              ORDER BY 
              	companyName
            </cfquery>
            
            <cfif qryCompany.recordcount GTE 1 >
                    <cfloop query="qryCompany">
						<cfset contentString = '{ "label": "#qryCompany.companyType# #trim(qryCompany.companyName)# (#qryCompany.companyURL#)", "companyName" : "#trim(qryCompany.companyName)#", "companyID": #qryCompany.companyID# }'>
                        <cfset content = ListAppend(content, contentString, ",")>
                    </cfloop>
                    
				<cfset content = ListAppend(content, '{ "label": "#cleanString# is not on our company list - click here to create Company", "companyName" : "#cleanString#", "companyID": 0 }' , ',') >
                <cfset fullReturn = start & content & end >
                <cfoutput>#fullReturn#</cfoutput>
            <cfelse>
            		<cfoutput>[{ "label": "#cleanString# is not on our company list - click here to create Contact", "companyName" : "#cleanString#", "companyID": 0 }]</cfoutput>
            </cfif>
<cfelse>

<cfoutput>[{ "label": "no letters where detected for the search", "companyName" : "", "companyID": "" }]</cfoutput>
</cfif>