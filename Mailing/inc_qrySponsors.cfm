<cfquery datasource="#gpp#" name="qrySponsors">
 SELECT 
 	  [mediaLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
   ,[sponsorTypeID]
   ,[typeOrder]
   ,[leadSponsorLogo]
   ,[packageLabel]
 FROM 
 		[PM_events_page_sponsors]
 WHERE 
 		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#WeekID#">
    AND 
    [mediaLogo] != ''
</cfquery>

<cfquery dbtype="query" name="qrySponsorsLead">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (20) 
</cfquery>

<cfquery dbtype="query" name="qrySponsorsTitanium">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (35) 
</cfquery>

<cfquery dbtype="query" name="qrySponsorsDiamond">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (37) 
</cfquery>

<cfquery dbtype="query" name="qrySponsorsPlatinum">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (21) 
</cfquery>

<cfquery dbtype="query" name="qrySponsorsRhodium">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (38) 
</cfquery>

<cfquery dbtype="query" name="qrySponsorsGold">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (22) 
</cfquery>
 
<cfquery dbtype="query" name="qrySponsorsSilver">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (23) 
</cfquery>
 
<cfquery dbtype="query" name="qrySponsorsBronze">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[typeLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (24) 
</cfquery>
 
<cfquery dbtype="query" name="qrySponsorsExentendable">
 SELECT 
 		[leadSponsorLogo]
   ,[url]
   ,[companyName]
   ,[packageLabel]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (25) 
</cfquery>
 
<cfquery dbtype="query" name="qrySponsorsMain">
 SELECT 
 	  [mediaLogo]
   ,[url]
   ,[companyName]
   ,[typeOrder]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (28, 29, 30,31) 
 ORDER BY typeOrder ASC
</cfquery>

<cfquery dbtype="query" name="qrySponsorsSup">
 SELECT 
 	  [mediaLogo]
   ,[url]
   ,[companyName]
   ,[typeOrder]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (27) 
 ORDER BY typeOrder ASC
</cfquery>

<cfquery dbtype="query" name="qrySponsorsCont">
 SELECT 
 	  [mediaLogo]
   ,[url]
   ,[companyName]
   ,[typeOrder]
 FROM 
 		[qrySponsors]
 WHERE 
 		[sponsorTypeID] IN (26) 
 ORDER BY typeOrder ASC
</cfquery>