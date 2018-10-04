<CFINCLUDE template="../Application.cfm">

<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(form.tag) GT 2 >
		<cfset cleanString = URLDecode(form.tag) >
        <cfquery datasource="#gpp#" name="get">
        SELECT
        		 [countryPhoneCode]
      			,[countryNameEN]
      			,[countryID]
  		FROM
        		[CRM_Countries_List]
        WHERE
        		[countryNameEN] LIKE '%#cleanString#%'
<!---    SELECT id,  country, countryPhoneCode  FROM CRM_Countries_List
        WHERE country LIKE '%#cleanString#%'
        ORDER BY country--->
        </cfquery>

        <cfif get.recordcount GT 0 >
                <cfloop query="get">
                <cfset contentString = '{ "tag": "#trim(get.countryNameEN)#", "id": "#trim(get.countryID)#", "code" : "#trim(get.countryPhoneCode)#", "countryNameEN" : "#Trim(get.countryNameEN)#"  }' >
                <cfset content = ListAppend(content, contentString, ",") >
                </cfloop>
                <cfset fullReturn = start & content & end >
                <cfoutput>#fullReturn#</cfoutput>
        <cfelse>
        		<cfoutput>[{ "tag": "you must selectt from the list", "id": "0" , "code" : "0" , "countryNameEN" : "#cleanString#" }]</cfoutput>
        </cfif>
<cfelse>
		<cfoutput>[{ "tag": "you must selectt from the list", "id": "0" , "code" : "0", "countryNameEN" : "#cleanString#"  }]</cfoutput>
</cfif>