<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 1 >
	<cfset cleanString = URLDecode(url.term) >
        <cfquery datasource="#gpp#" name="get">
        SELECT
                [namePrefixLabel]
               ,[namePrefixID]
        FROM
                [namePrefix]
        WHERE
                [namePrefixLabel] LIKE '%#cleanString#%'
        </cfquery>

        <!---<cfif get.recordcount GT 0 >--->
                <cfloop query="get">
                <cfset contentString = '{ "label": "#trim(get.namePrefixLabel)#", "id": "#trim(get.namePrefixID)#" }'>
                <cfset content = ListAppend(content, contentString, ",") >
                </cfloop>
                <cfset fullReturn = start & content & end >
                <cfoutput>#fullReturn#</cfoutput>
        <!---<cfelse>
        		<cfoutput>[{ "label": "you must selectt from the list", "id": "0"}]</cfoutput>
        </cfif>--->
<cfelse>
		<cfoutput>[{ "label": "you must selectt from the list", "id": "0" }]</cfoutput>
</cfif>