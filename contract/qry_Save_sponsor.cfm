
<cfset sponsorID = form.sponsorID>

<cfif form.sponsorID EQ 0>
    <cfquery name="new_sponsor" datasource="#gpp#">
        INSERT INTO [sponsors] (contractID)
        VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractID#">)
        SELECT @@IDENTITY AS sponsorID
	</cfquery>
    <cfset sponsorID = new_sponsor.sponsorID>




<cfswitch expression="#form.contractTypeGroup#">
    <cfcase value="media">
            
    </cfcase>
    <cfcase value="exhibitor">
            <cfquery  datasource="#gpp#">
            INSERT INTO [booths] (boothDateAdded,  staffIDAdded, sponsorID )
            VALUES  ( <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,  <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#sponsorID#"> )
            </cfquery>
    </cfcase>
    
    <cfcase value="sponsor">
    
    </cfcase>
</cfswitch>
</cfif>


<cfquery name="get_sponsor" datasource="#gpp#">
UPDATE [sponsors]
SET 
      	[eventID]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
      ,[contractID]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.contractID#">
<!---      ,[companyID]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">--->
      ,[sponsorTypeID]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sponsorTypeID#">
      ,[sponsorLabel]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.sponsorLabel#">
<!---      ,[promoCode]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.contractCost#">--->
      ,[limitPasses]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.limitPasses#">
      ,[limitBooths]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.limitBooths#">
      ,[limitSpeakers]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.limitSpeakers#">
      ,[discountValueLimit]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.discountValueLimit#">
      ,[discountAmountValue]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.discountAmountValue#">
      ,[limitBoothOperators]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.limitBoothOperators#">
      ,[limitGuest] 					= <cfqueryparam cfsqltype="cf_sql_char" value="#form.limitGuest#">
  WHERE 
  		[sponsorID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#sponsorID#">
</cfquery>



