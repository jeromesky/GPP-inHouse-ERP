<cfparam default="0" name="url.company">
<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">

<cfif len(url.term) GTE 3 >
<cfset cleanString = URLDecode(url.term)>
<cfset displayReturn = url.displayReturn>

<cfquery datasource="#gpp#" name="qry_contact">
	EXEC CRM_SP_contacts @contactName = '#cleanString#'<cfif url.companyID NEQ 0>, @companyID = '#url.companyID#'</cfif>;
</cfquery>
 
<!--- <cfquery datasource="#gpp#" name="qry_contact">
SELECT 
		[contactName]
		,[companyID]
		,[companyName]
		,[contactID]
		,[typeLabel]
		,companyName + '<br />tel: ' + countryPhoneCode + ' ' + contactPhoneAreaCode + ' ' + contactPhoneNumber + '<br />email: ' + contactEmail AS contact
FROM 
		[CRM_contact]
WHERE
		contactName LIKE '%#cleanString#%'  
		<cfif url.companyID NEQ 0>
		AND
		[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.companyID#">
		</cfif>
ORDER 
		BY contactName
 </cfquery> --->
            
	<cfif qry_contact.recordcount GTE 1 >
          <cfloop query="qry_contact">
          <cfset var.contact = '#companyName#<br />tel: #countryPhoneCode# #contactPhoneAreaCode# #contactPhoneNumber#<br />email: #contactEmail#'><!------>
          <cfset contentString = '{ "label": "#trim(qry_contact.contactName)# - (#trim(qry_contact.typeLabel)#) - (#trim(qry_contact.companyName)#)", "contactName" : "#evaluate("qry_contact.#displayReturn#")#",  "contactID": "#trim(qry_contact.contactID)#" , "companyID" : "#trim(qry_contact.companyID)#", "contact" : "#trim(var.contact)#"}'>
          <cfset content = ListAppend(content, contentString, ",")>
          </cfloop>
          <cfset content = ListAppend(content, '{ "label": "#cleanString# is not on our contact list - click here to creat Contact", "contactName" : "#evaluate("qry_contact.#displayReturn#")#", "contactID": "0" , "companyID" : "0", "contact" : ""}' , ',') >
          <cfset fullReturn = start & content & end >
          <cfoutput>#fullReturn#</cfoutput>
    <cfelse>
          <cfoutput>[{ "label": "#cleanString# is not on our contact list - click here to create new record", "contactName" : "#cleanString#", "contactID": "0" , "companyID" : "0", "contact" : "" }]</cfoutput>
    </cfif>
<cfelse>

<cfoutput>[{ "label": "no letters where detected for the search", "contactName" : "", "contactID": "", "companyID": "", "contact" : "" }]</cfoutput>
</cfif>