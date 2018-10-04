<CFINCLUDE template="../Application.cfm">

<cfset start = "[" >
<cfset end = "]" >
<cfset content = "" >
<cfset contentString = "" >

<cfif len(form.tag) GT 3 >
		<cfset cleanString = URLDecode(form.tag) >
            <cfquery datasource="#gpp#" name="get" >
            SELECT 
            		[contactName]
                    ,[companyID]
                    ,[companyName]
                    ,[contactID]
                    ,companyName + '<br />tel: ' + countryPhoneCode + ' ' + contactPhoneAreaCode + ' ' + contactPhoneNumber + '<br />email: ' + contactEmail AS contact
  			FROM 
  					[CRM_contact]
            WHERE
            		contactName LIKE '%#cleanString#%' 

            ORDER 
            		BY contactName
            </cfquery>
            

			<cfif get.recordcount GTE 1 >
                    <cfloop query="get">
                    <cfset contentString = '{ "tag": "#trim(get.contactName)# - (#trim(get.companyName)#)", "contactName" : "#trim(get.contactName)#",  "contactID": "#trim(get.contactID)#" , "companyID" : "#trim(get.companyID)#", "contact" : "#trim(get.contact)#"}' >
                    <cfset content = ListAppend(content, contentString, ",") >
                    </cfloop>
                    <cfset content = ListAppend(content, '{ "tag": "#cleanString# is not on our contact list - click here to creat Contact", "contactName" : "#trim(get.contactName)#", "contactID": "0" , "companyID" : "0", "contact" : ""}' , ',') >
                    <cfset fullReturn = start & content & end >
                    <cfoutput>#fullReturn#</cfoutput>
                    
            <cfelse>
            		<cfoutput>[{ "tag": "#cleanString# is not on our contact list - click here to creat Contact", "contactName" : "#cleanString#", "contactID": "0" , "companyID" : "0", "contact" : ""  }]</cfoutput>
            
            </cfif>
<cfelse>

<cfoutput>[{ "tag": "no letters where detected for the search",  "contactName" : "", "contactID": "", "companyID": "", "companyName" : 0  }]</cfoutput>
</cfif>
