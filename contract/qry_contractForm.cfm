
<cfset contractID = form.contractID>

<!---<cfif form.contractID EQ 0>
	<cfquery name="new_contract" datasource="#gpp#">
        INSERT INTO [contracts] (contractDateAdded,  staffIDAdded )
        VALUES  ( <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,  <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#"> )
        SELECT @@IDENTITY AS contractID        
	</cfquery>
    <cfset contractID = new_contract.contractID > 
</cfif>--->


<cfquery name="qryContract" datasource="#gpp#">
SELECT
		[companyName]
        ,[contactName]
        ,[statusInternal]
        ,[staffName]
        ,[contractID]
        ,[contactID]
        ,[contractDateAdded]
        ,[contractComment]
        ,[staffIDUpdated]
        ,[staffIDAdded]
        ,[contractDateUpdated]
        ,[contractURL]
        ,[companyID]
        ,[staffNameUpdated]
        ,[contractTypeGroup]
        ,[statusInternalID]
        ,[contractCompanyComment]
        ,[branchID]
        ,[branchName]
        ,[companyName]
        ,[currencyCode]
        ,[contractCost]
        ,[contractType]
        ,[contractBookedDated]
        ,[contractFile]
        ,[AKA_companyID]
        ,[AKA_companyName]
        ,[contact]

  FROM [CRM_Contracts]
  WHERE 
  		[contractID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#contractID#">
</cfquery>
        <!---,companyName + '<br />' + countryPhoneCode + ' ' + contactPhoneAreaCode + ' ' + contactPhoneNumber + '<br />' + contactEmail AS contact--->
<!---CASE 
WHEN dbo.contracts.contactID < 0 THEN 
		(SELECT strFirst_Name + ' ' + strSurname + '<br />' + AreaCodeTel + '' + strPhDirect_No  + '<br />' + strEmail AS contact FROM tblIndividual WHERE (0 - IngIndividual_ID) = dbo.contracts.contactID) 
WHEN dbo.contracts.contactID > 0 THEN 
		(SELECT dbo.contacts.contactName + '<br />' + contactPhoneAreaCode + '' + contactPhoneNumber  + '<br />' + contactEmail AS contact FROM contacts WHERE contatID = dbo.contracts.contactID)  
END
CASE 
WHEN dbo.contracts.contactID < 0 THEN 
		(SELECT strFirst_Name + ' ' + strSurname AS contact FROM tblIndividual WHERE (0 - IngIndividual_ID) = dbo.contracts.contactID) 
WHEN dbo.contracts.contactID > 0 THEN 
		(SELECT dbo.contacts.contactName FROM contacts WHERE contactID = dbo.contracts.contactID)  
END
---->