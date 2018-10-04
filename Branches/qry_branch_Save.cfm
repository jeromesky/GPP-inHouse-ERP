<cftry>
<cfif form.branchid EQ 0>

	<cfset form.branchidx = ''>

	<cfquery datasource="#gpp#" name="get_branch">
        INSERT INTO Branch (companyID)
        VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">) 
        SELECT @@IDENTITY AS branchID
	</cfquery>
    <cfset form.branchid = #get_branch.branchID#>
</cfif>

<cfif postalCountryID NEQ 0 AND postalCityID EQ -1>
	<cfscript>
	  findPostal = createObject("component", "my-office._handlers.FindCity");
	  qry_postalCity = findPostal.FindCity(#form.postalCityID#, #form.postalCityName#, #form.postalCountryID# );
	</cfscript>	
	<cfset form.postalCityID = #qry_postalCity#>
</cfif>	

<cfif streetCountryID NEQ 0 AND streetCityID EQ -1>
  <cfscript>
      findStreet = createObject("component", "my-office._handlers.FindCity");
      qry_streetCity = findStreet.FindCity(#form.streetCityID#, #form.streetCityName#, #form.streetCountryID# );
  </cfscript>	
  <cfset form.streetCityID = #qry_streetCity#>
</cfif>

<cfquery datasource="#gpp#">
 	UPDATE Branch
    SET 
    	[companyID]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#" >
      ,[postalCountryID]	= <cfif form.postalCountryID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.postalCountryID#"></cfif>
      ,[postalRegionID]		= <cfif form.postalRegionID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.postalRegionID#"></cfif>
      ,[postalAddress]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.postalAddress#" maxlength="150">
      ,[postalCityID]		= <cfif form.postalCityID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.postalCityID#"></cfif>
      ,[PostalCode]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.PostalCode#" maxlength="20">
     <!--- <cfif parameterexists(form.branchType)> </cfif> --->
      ,[branchType]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchType#">
      ,[branchEmail]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchEmail#" maxlength="45">
      ,[streetCountryID]	= <cfif form.streetCountryID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.streetCountryID#"></cfif>
      ,[streetRegionID]		= <cfif form.streetRegionID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.streetRegionID#"></cfif>
      ,[streetAddress]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.streetAddress#" maxlength="150">
      ,[streetCityID]		= <cfif form.streetCityID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.streetCityID#"></cfif>
      ,[StreetCode]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.StreetCode#" maxlength="20">
      ,[branchVatNO]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchVatNO#" maxlength="20">
      ,[branchURL]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchURL#" maxlength="152">
      ,[contactID]			= <cfif form.contactID EQ "">0<cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactID#"></cfif>
      ,[branchBios]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchBios#" maxlength="1200">
      
      <cfif structKeyExists(form, "billingAddress")>
      ,[billingAddress]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.billingAddress#"> 
      <cfelse>
       ,[billingAddress]		= 1
      </cfif>
      
      <cfif parameterexists(form.branchName)>
      ,[branchName]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchName#">
      </cfif>
      ,[branchAreaPhone]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchAreaPhone#" maxlength="6">
      ,[branchPhoneNo]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchPhoneNo#" maxlength="12">
      ,[branchAreaFax]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchAreaFax#" maxlength="6">
      ,[branchFaxNo]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchFaxNo#" maxlength="12">
      <cfif parameterexists(form.branchUserName)>
      ,[branchUserName]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchUserName#" maxlength="26">
      ,[branchPassword]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.branchPassword#" maxlength="10">
      ,[publicationURL]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.publicationURL#" maxlength="80">
      
		</cfif>
   WHERE
   		[branchID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchid#">
</cfquery>
<cfcatch>
	<cfmail to="jerome@glopac.com" from="error@petro21.com" subject="eror on save branch" type="html">
	<cfdump var="#cfcatch#">
    <cfdump var="#form#">
    </cfmail>
 </cfcatch></cftry>