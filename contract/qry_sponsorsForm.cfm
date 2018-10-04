
<cfset sponsorID = form.sponsorID>

<cfif form.sponsorID EQ 0>
	<cfquery name="new_sponsor" datasource="#gpp#">
        SELECT TOP 1
        		[sponsorID]
        FROM  
        		[sponsors]
        ORDER
        		BY sponsorID DESC
	</cfquery>
    <cfset sponsorID = (new_sponsor.sponsorID + 1)> 
</cfif>


<cfquery name="get_sponsor" datasource="#gpp#">
SELECT
		[sponsorID]
      ,[eventID]
      ,[contractID]
      ,[companyID]
      ,[sponsorTypeID]
      ,[sponsorLabel]
      ,[promoCode]
      ,[limitPasses]
      ,[limitBooths]
      ,[limitSpeakers]
      ,[discountValueLimit]
      ,[discountAmountValue]
      ,[limitBoothOperators]
      ,[limitGuest]
  FROM 
  		[sponsors]
  WHERE 
  		[sponsorID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#sponsorID#">
</cfquery>