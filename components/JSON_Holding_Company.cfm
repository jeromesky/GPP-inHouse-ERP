<CFINCLUDE template="../Application.cfm">

<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(form.tag) GT 2 >
	<cfset cleanString = URLDecode(form.tag) >
    <cfquery datasource="#gpp#" name="get">
    SELECT IngHoldingCompany_ID, strHoldingCompany_Name  
    FROM tblHoldingCompany
    WHERE strHoldingCompany_Name LIKE '%#cleanString#%'
    ORDER BY strHoldingCompany_Name
    </cfquery>

    <cfif get.recordcount GT 0 >
            <cfloop query="get">
            <cfset contentString = '{ "tag": "#trim(get.strHoldingCompany_Name)#", "id": "#trim(get.IngHoldingCompany_ID)#"  }' >
            <cfset content = ListAppend(content, contentString, ",") >
            </cfloop>
            <cfset fullReturn = start & content & end >
            <cfoutput>#fullReturn#</cfoutput>
    <cfelse>
            [<!---{ "tag": "no shuch holding company Click here to make new Holding Company", "id": ""  },---> { "tag": "I dont have a have a hoding company, or holding company not available, click here.", "id": "0"  }]
    </cfif>
<cfelse>
<cfoutput>[{ "tag": "no letters where detected for the search", "id": "" }]</cfoutput>
</cfif>
