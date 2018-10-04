<cfsilent>
<cfquery datasource="#gpp#" name="qryUpdatePackage">
	UPDATE 
    	[packages]
    SET
       [Comments]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.Comments#">
        <cfif parameterexists(form.boothwidth)>
       ,[boothLabel]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.boothLabel#">
      ,[boothwidth]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothwidth#">
      ,[boothdepth]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothdepth#">
      ,[boothLocation]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.boothLocation#">
      ,[boothFloor]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothFloor#">
      ,[boothSpaceDiscount]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.boothSpaceDiscount#">
      ,[boothSpace]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothSpace#">
      </cfif>
      <cfif parameterexists(form.packageLabel)>
       ,[packageLabel]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.packageLabel#">
       </cfif>
      <cfif parameterexists(form.bookedDated)>
      		,[bookedDated]	= <cfqueryparam cfsqltype="cf_sql_date" value="#form.bookedDated#">
      </cfif>
      ,[limitPasses]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.limitPasses#">
      ,[limitSpeakers]			= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.limitSpeakers#">
      ,[discountValueLimit]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.discountValueLimit#">
      ,[discountAmountValue]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.discountAmountValue#">
      ,[limitBoothOperators]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.limitBoothOperators#">
      ,[limitGuest]				= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.limitGuest#">
      ,[packagePassComments]= <cfqueryparam cfsqltype="cf_sql_char" value="#form.packagePassComments#">
<!---      ,[currencyCode]		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.currencyCode#">
      ,[packageCost]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.packageCost#">--->
       <cfif parameterexists(form.sponsorTypeID)>
       		,[sponsorTypeID]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sponsorTypeID#">
       </cfif>
	WHERE
    	[packagesID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.packagesID#">
 </cfquery>
 </cfsilent>
 <cfoutput>#form.packagesID#</cfoutput>

 <cfif form.eventPriceID NEQ "" AND form.eventPricePercent NEQ 0>
            
        <cfquery datasource="#gpp#" name="qryPromoUpdate">
                UPDATE 
                        [eventPrices]
                SET
                        [eventPricePercent] = <cfqueryparam cfsqltype="cf_sql_numeric" value="#form.eventPricePercent#">
                WHERE
                        [eventPriceID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventPriceID#">
        </cfquery>
                
<cfelseif form.eventPriceID EQ "" AND  form.eventPricePercent NEQ 0 >
        <cfquery datasource="#gpp#" name="qryPromoInsert">
                INSERT INTO [eventPrices]
                        (
                             eventPricePercent
                            ,promoCode
                            ,packagesID
                            ,eventParentID
                        )
                VALUES
                        (
                             <cfqueryparam cfsqltype="cf_sql_numeric" value="#form.eventPricePercent#">
                            ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.promoCode#">
                            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.packagesID#">
                            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
                        )   
        </cfquery>              
</cfif>