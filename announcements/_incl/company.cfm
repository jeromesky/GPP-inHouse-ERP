<cfset start = "[">
<cfset end = "]">
<cfset content = "">
<cfset contentString = "">

<cfif len(form.term) GTE 2>
		<cfset cleanString = URLDecode(form.term)>
        
        <cfquery datasource="#mainDSN#" name="get">
        SELECT *  
        FROM 
        		GPP.dbo.CRM_company_newUser
        WHERE 
        		strCompany_Name LIKE '#cleanString#%'
        ORDER 
        		BY strCompany_Name
        </cfquery>

        	<cfif get.recordcount GT 0>
                <cfloop query="get">
                <cfset contentString = '{ "title": "#trim(get.strCompany_Name)# - (#Lcase(get.holdingCompanyName)#)", "id": "#trim(get.IngCompany_ID)#" }' >
                <cfset content = ListAppend(content, contentString, ",") >
                </cfloop>
        		<cfset content = ListAppend(content, '{ "label": "#cleanString# select to create as a new company", "companyid": "0" , "indCod" : "no industry" }' , ',') >
				<cfset fullReturn = start & content & end>
                <cfoutput>#fullReturn#</cfoutput>
        <cfelse>
        		<!--- return JSON Empty from New company command --->
        		<cfoutput>[{ "label": "#cleanString#  select to create as a new company", "companyid": "0" , "indCod" : "no industry" }]</cfoutput>
        </cfif>
<cfelse>
		<cfoutput>[{ "label": "no letters where detected for the search", "companyid": "0" , "indCod" : "no industry" }]</cfoutput>
</cfif>