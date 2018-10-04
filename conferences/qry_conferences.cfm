<cfquery datasource="#gpp#" name="qryConferences">
 	SELECT  
	   [confID]
      ,[gppID]
      ,[conferenceName]
      ,[headlineTag]
      ,[confAbbreviation]
      ,[primaryColor]
      ,[secondaryColor]
      ,[keyWords]
      ,[domainID]
  FROM
  		[conferences]
  ORDER BY
    	[conferenceName]
</cfquery>