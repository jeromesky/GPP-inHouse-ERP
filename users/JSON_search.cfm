<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

		<cfset cleanString = URLDecode(url.term) >
        
        <cfquery datasource="#gpp#" name="get">
        SELECT
                 [userID]
                ,[userName]
                ,[userSurname]
                ,[strEmail]
                ,[AKA_companyName]
        FROM
                [CRM_users]
        WHERE
        		userName + ' ' + userSurname LIKE '%#cleanString#%'
               <!--- [user] LIKE '%#cleanString#%'--->
         <cfif url.active NEQ 0>
         AND
         		[active] = <cfqueryparam cfsqltype="cf_sql_char" value="#url.active#">
         </cfif>
        </cfquery>

        <cfif get.recordcount GT 0 >
                <cfloop query="get">
                <cfset contentString = '{ "label": "#trim(get.userName)# #trim(get.userSurname)# ( #trim(get.strEmail)# ) ( #trim(AKA_companyName)# )", "userID": "#trim(get.userID)#", "userName" : "#trim(get.userName)# #trim(get.userSurname)#" }' >
                <cfset content = ListAppend(content, contentString, ",") >
                </cfloop>
                <cfset fullReturn = start & content & end >
                <cfoutput>#fullReturn#</cfoutput>
        <cfelse>
        		<cfoutput>[{ "label": "no such name on system", "userID": "0" , "userName" : "" }]</cfoutput>
        </cfif>

