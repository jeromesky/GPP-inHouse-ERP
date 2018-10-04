<CFINCLUDE template="../Application.cfm">

<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >
<cfset userSurName ="">

<cfif len(url.term) GTE 4 >
		<cfset cleanString =  URLDecode(url.term)>
        <cfset nameLenght = listlen(cleanString, " ")>
        <cfset userName = listgetat(cleanString, 1, " ")>
        <cfset userSurName = listDeleteat(cleanString, 1, " ")>
        
            <cfquery datasource="#gpp#" name="get">
            SELECT 
            		[company]
      				,[holdingCompanyName]
                    ,[strFirst_Name]
                    ,[strSurname]
                    ,[IngIndividual_ID]
  			FROM 
  					[CRM_Individual_Search]
            WHERE
            		(strFirst_Name + ' ' + strSurname) LIKE '%#cleanString#%'
            ORDER 
            		BY strSurname
            </cfquery>

			<cfif get.recordcount GTE 1 >
<!---                    <cfloop query="get">
                    <cfset contentString = '{ "label": "#trim(get.strFirst_Name)# #trim(get.strSurname)# ", "name": "#trim(cleanString)#", "surname": "#trim(get.strSurname)#", "userid" : #get.IngIndividual_ID#  }' >
                    <cfset content = ListAppend(content, contentString, ",") >
                    </cfloop>--->
                    <cfset content = ListAppend(content, '{ "label": "#trim(cleanString)# - Select to continue", "name": "#trim(userName)#", "surname": "#trim(userSurName)#", "userid" : 1   }' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>
                    
            <cfelse>
            		<cfoutput>[{ "label": "#trim(cleanString)#", "name": "#trim(userName)#", "surname": "#trim(userSurName)#", "userid" : 0   }]</cfoutput>
            </cfif>
<cfelse>

<cfoutput>[{ "label": "no letters where detected for the search", "name": "#trim(userName)#", "surname": "#trim(userSurName)#", "userid" : 0  }]</cfoutput>
</cfif>

<!---
<cfif len(form.tag) GT 4 >
		<cfset cleanString = URLDecode(form.tag) >
            <cfquery datasource="#gpp#" name="get">
            SELECT 
            		[company]
      				,[holdingCompanyName]
                    ,[strFirst_Name]
                    ,[strSurname]
                    ,[IngIndividual_ID]
  			FROM 
  					[CRM_Individual_Search]
            WHERE
            		(strFirst_Name + ' ' + strSurname) LIKE '%#cleanString#%'
            ORDER 
            		BY strSurname
            </cfquery>

			<cfif get.recordcount GTE 1 >
                   <cfloop query="get">
                    <cfset contentString = '{ "tag": "#trim(get.strFirst_Name)# #trim(get.strSurname)# (#Lcase(get.company)# - #get.holdingCompanyName#) this name already in system", "name": "#trim(cleanString)#", "surname": "#trim(get.strSurname)#", "userid" : #get.IngIndividual_ID# }' >
                    <cfset content = ListAppend(content, contentString, ",") >
                   </cfloop>
                    <cfset content = ListAppend(content, '{ "tag": "I want to add this user anyway, click here to keep on going", "name": "#trim(cleanString)#", "surname": "", "userid" : 1   }' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>

            <cfelse>
            		<cfoutput>[{ "tag": "no such name is system, click here to keep on going", "name": "#trim(cleanString)#", "surname": "", "userid" : 0 }]</cfoutput>
            
            </cfif>
<cfelse>

<cfoutput>[{ "tag": "no letters where detected for the search", "name": "", "surname": "", "userid" : 0  }]</cfoutput>
</cfif>
--->