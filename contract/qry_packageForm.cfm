
<cfquery datasource="#gpp#" name="qryPackage">
SELECT
		[typeLabel]
      ,[event_name]
      ,[eventID]
      ,[staffName]
      ,[packageLabel]
      ,[boothLabel]
      ,[boothwidth]
      ,[boothdepth]
      ,[boothSpaceDiscount]
      ,[boothSpace]
      ,[boothLocation]
      ,[bookedDated]
      ,[boothFloor]
      ,[packagesDateAdded]
      ,[limitPasses]
      
      ,[limitSpeakers]
      ,[discountValueLimit]
      ,[discountAmountValue]
      ,[limitBoothOperators]
      ,[limitGuest]
      ,[Comments]
      ,[bookedDated]
      ,[currencyCode]
      ,[contractCost]
      <!---,[packageCost]--->
      ,[packagePassComments]
      ,[sponsorTypeID]
      ,[packageTypeID]
      ,[notes]
      ,[promoCode]
      ,[eventPricePercent]
      ,[eventPriceID]
      ,[tasks]
  FROM 
  		[CRM_packages] 
 WHERE
    	[packagesID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.packagesID#">
</cfquery>