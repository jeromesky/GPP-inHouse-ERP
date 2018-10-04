<!------><cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 3 >
		<cfset cleanString = URLDecode(url.term) >
        
        <cfquery datasource="#gpp#" name="get">
        SELECT
                 [countryPhoneCode]
                ,[countryNameEN]
                ,[countryID]
        FROM
                [CRM_Countries_List]
        WHERE
                [countryNameEN] LIKE '%#cleanString#%'
        </cfquery>

        <cfif get.recordcount GT 0 >
                <cfloop query="get">
                <cfset contentString = '{ "label": "#trim(get.countryNameEN)#", "id": "#trim(get.countryID)#", "code" : "#trim(get.countryPhoneCode)#" }' >
                <cfset content = ListAppend(content, contentString, ",") >
                </cfloop>
                <cfset fullReturn = start & content & end >
                <cfoutput>#fullReturn#</cfoutput>
        <cfelse>
        		<cfoutput>[{ "label": "you must selectt from the list", "id": "0" , "code" : "0" }]</cfoutput>
        </cfif>
<cfelse>

		<cfoutput>[{ "label": "you must selectt from the list", "id": "0" , "code" : "0" }]</cfoutput>
</cfif>
