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
        FROM
                [CRM_users]
        WHERE
        		userName + ' ' + userSurname LIKE '%#cleanString#%'
               <!--- [user] LIKE '%#cleanString#%'--->
         AND
         		[status] = <cfqueryparam cfsqltype="cf_sql_char" value="#url.status#">
</cfquery>

<cfif get.recordcount GT 0 >
  <cfloop query="get">
  <cfset contentString = '{ "label": "#trim(get.userName)# #trim(get.userSurname)#", "userID": "#trim(get.userID)#" }'>
                <cfset content = ListAppend(content, contentString, ",")>
                </cfloop>
                <cfset fullReturn = start & content & end >
  <cfoutput>#fullReturn#</cfoutput>
<cfelse>
  <cfoutput>[{ "label": "no such name on system", "id": "0" }]</cfoutput>
</cfif>