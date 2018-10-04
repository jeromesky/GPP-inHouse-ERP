<CFINCLUDE template="../Application.cfm">

<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(form.tag) GT 3 >
		<cfset cleanString = URLDecode(form.tag) >
            <cfquery datasource="#gpp#" name="get" >
            SELECT 
            		[branchID]
      				,[branchName]
                    ,[CityNameEN]
                    ,[countryNameEN]
  			FROM 
  					[CRM_Branch]
            WHERE
            		branchName LIKE '%#cleanString#%' AND companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
            ORDER 
            		BY branchName
            </cfquery>
            
			<cfif get.recordcount GTE 1 >
                    <cfloop query="get">
                    <cfset contentString = '{ "tag": "#trim(get.branchName)# (#trim(get.CityNameEN)#, #Lcase(get.countryNameEN)#)", "branchid": "#trim(get.brachid)#" , "searchStr" : "#trim(get.branchName)#"}' >
                    <cfset content = ListAppend(content, contentString, ",") >
                    </cfloop>
                    <cfset content = ListAppend(content, '{ "tag": "I want to add a new Branch, click here to keep to create",  "branchid": "0", "searchStr" : "#cleanString#"  }' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>
                    
            <cfelse>
            		<cfoutput>[{ "tag": "no such branch is system, click here to keep on going", "branchid": "0", "searchStr" : "#cleanString#" }]</cfoutput>
            </cfif>
<cfelse>

<cfoutput>[{ "tag": "no letters where detected for the search", "name": "", "surname": "", "userid" : 0  }]</cfoutput>
</cfif>