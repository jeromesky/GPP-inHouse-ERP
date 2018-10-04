<cfparam default="0" name="form.companyID">
<cfparam default="0" name="form.contactID">
<cfparam default="0" name="form.userID">
<cfparam default="299" name="form.ContactType">

<cfquery name="qryContacts" datasource="#gpp#">
SELECT 
	   [contactID]
      ,[branchID]
      ,[companyID]
      ,[ContactType]
      ,[contactName]
      ,[contactEmail]
      ,[contactPhoneAreaCode]
      ,[contactPhoneNumber]
      ,[contactPhoneExt]
<!---      ,[countryPhoneCode]--->
      ,[branchName]
      ,[companyName]
      ,[contactAddress]
      ,[countryID]
      ,[cityID]
<!---      ,[contactNote]--->
      ,[CityNameEN]
      ,[countryNameEN]
<!---      ,[contactPosition]
      ,[contactScope]--->
      ,[typeLabel]
      ,(SELECT TOP 1 userID FROM user2contact WHERE contactID = CRM_contact_modal.contactID AND userID = #form.userID# ) AS linked
FROM 
  		[CRM_contact_modal]
WHERE
		[companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">

        <cfif form.ContactType EQ 299><!---ifexists contactID --->
        AND
        1 = (SELECT TOP 1 count(userID) FROM user2contact WHERE contactID = CRM_contact_modal.contactID AND userID = #form.userID# )
        </cfif>
        
        <cfif form.ContactType GT 300>
        AND 
        [ContactType] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.ContactType#">
        </cfif>
ORDER BY
		[ContactType], [contactName]
</cfquery>

<!--- <cfquery datasource="#gpp#" name="qry_contact">
 EXEC CRM_SP_contacts @contactName = '#cleanString#'<cfif url.companyID NEQ 0>, @companyID = '#url.companyID#'</cfif>;
</cfquery>--->