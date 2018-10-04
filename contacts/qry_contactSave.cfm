<cfset contactID = form.contactID>

<cfif form.contactID EQ 0>
	<cfquery name="new_contact" datasource="#gpp#">
        INSERT INTO contacts (ContactType)
        VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#form.ContactType#">)
        SELECT @@IDENTITY AS contactID
	</cfquery>
    <cfset contactID = new_contact.contactID>
</cfif>

<cfquery datasource="#gpp#">
UPDATE contacts
SET 
		[companyID]						= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
      ,[branchID]					= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchID#">
      ,[ContactType]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.ContactType#">
      ,[contactName]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactName#">
      ,[contactEmail]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactEmail#">
      ,[contactPhoneAreaCode]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactPhoneAreaCode#">
      ,[contactPhoneNumber]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactPhoneNumber#">
      ,[contactPhoneExt]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactPhoneExt#">
      ,[contactAddress]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactAddress#">
      ,[countryID]				= <cfif form.countryID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.countryID#"></cfif>
      ,[cityID]						= <cfif form.cityID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.cityID#"></cfif>
      ,[contactNote]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactNote#">
      ,[contactPosition]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contactPosition#"> 
      ,[contactScope]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactScope#">
WHERE 
		[contactID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#contactID#">
</cfquery>