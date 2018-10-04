<!---<cfquery name="getNewsletterCounts" datasource="#gpp#" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
SELECT  [PetroLatino_News]
      ,[PetroArabian_News]
      ,[PetroEuropean_News]
      ,[PetroAfricanus_News]
      ,[PetroAsiana_News]
      ,[Petro21_Worldwide_News]
      ,[Southern_African_Energy_News]
      ,[National_Oil_Companies_News]
      ,[PetroCapital_News]
      ,[Western_African_Energy_News]
      ,[Eastern_African_Energy_News]
      ,[PetroMediterranean_News]
      ,[PetroAustralasia_News]
      ,[PetroCaribbean_News]
      ,[United_States_Oil_Gas_Energy_Weekly_News]
      ,[PetroEurasia_Weekly_News]
      ,[Angola_Oil_Gas_Energy_Weekly_News]
      ,[Russia_Oil_Gas_Energy_Weekly_News]
      ,[China_Oil_Gas_Energy_Weekly_News]
      ,[Brazil_Oil_Gas_Energy_Weekly_News]
      ,[India_Oil_Gas_Energy_Weekly_News]
      ,[Nigeria_Oil_Gas_Energy_Weekly_News]
      ,[PetroMaghreb_News]
      ,[Iraq_Oil_Gas_Energy_Weekly_News]
      ,[Worldwide_Independents_News]
      ,[Frontier_Exploration_News]
      ,[Super_Majors_Oil_Gas_News]
      ,[Atlantic_Ocean_Oil_Gas_News]
  FROM [DashPod_NewsletterCount]</cfquery>--->
<cfquery name="getNewsletterCounts" datasource="#gpp#" cachedWithin="#CreateTimeSpan(1,0,0,0)#">
SELECT 
	[newslettername]
    ,[recipientCount]
FROM
	newsletters;
</cfquery>