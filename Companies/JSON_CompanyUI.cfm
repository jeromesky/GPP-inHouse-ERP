<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(url.term) GTE 2 >
	<cfset cleanString = URLDecode(url.term) >
    
    <cfquery datasource="#gpp#" name="get">
        SELECT *  
        FROM 
                CRM_company_newUser
        WHERE 
                strCompany_Name LIKE '#cleanString#%'
        ORDER 
                BY strCompany_Name
    </cfquery>

        <cfif get.recordcount GT 0 >
          <cfloop query="get">
          <cfset contentString = '{ "label": "#trim(get.strCompany_Name)# - (#Lcase(get.holdingCompanyName)#)", "companyid": "#trim(get.IngCompany_ID)#", "indCod" : "#trim(lngIndustry_ID)#" }'>
          <cfset content = ListAppend(content, contentString, ",")>
          </cfloop>
          <cfset content = ListAppend(content, '{ "label": "#cleanString# select to create as a new company", "companyid": "0" , "indCod" : "no industry" }' , ',')>
          <cfset fullReturn = start & content & end >
          <cfoutput>#fullReturn#</cfoutput>
        <cfelse>
		  <!--- return JSON Empty from New company command --->
          <cfoutput>[{ "label": "#cleanString# select to create as a new company", "companyid": "0" , "indCod" : "no industry" }]</cfoutput>
        </cfif>
<cfelse>
		<cfoutput>[{ "label": "no letters where detected for the search", "companyid": "0" , "indCod" : "no industry" }]</cfoutput>
</cfif>