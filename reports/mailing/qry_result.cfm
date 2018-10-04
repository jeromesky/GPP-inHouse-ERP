<cfparam  name="url.countryID" default="0">
<cfparam  name="url.countryName" default="">
<cfparam  name="url.areaID" default="0">
<cfparam  name="url.posting" default="0">

<cfquery datasource="#gpp#" name="qryResult">
   
    SELECT distinct
        [userID]
        ,[Title] 			AS userTitle
        ,[name] 		AS userName
        ,[surname] 	AS userSurname
        ,[possition] 	AS userPossition
        ,[company]	AS userCompanyName
        ,[address]	
        ,[city]
        ,[zip] 			AS postCode
        ,[countryName] AS country
    FROM 
        [Temp_report_regions] 
    WHERE 
        areaID IN ( #url.areaID# ) 
    AND
    	[posting] =  <cfqueryparam cfsqltype="cf_sql_integer" value="#url.posting#">
    AND userID not in (
        SELECT DISTINCT [userID] FROM [CRM_Reports_mailing] WHERE areaID IN ( #url.areaID# )  
    )  	

    UNION
    
    SELECT DISTINCT
        (0 - [userID])
        ,[userTitle]
        ,[userName]
        ,[userSurname]
        ,[userPossition]
        ,[userCompanyName]
        ,[address]
        ,CASE 
        WHEN switch = 'street' THEN streetCity
        WHEN switch = 'postal' THEN postCity
        END AS city
        ,CASE 
        WHEN switch = 'street' THEN StreetCode
        WHEN switch = 'postal' THEN postCode
        END AS postCode
        ,CASE 
        WHEN switch = 'street' THEN streetCountry
        WHEN switch = 'postal' THEN postCountry
        END AS country
    FROM 
    	[CRM_Reports_mailing]
    WHERE 
    	[posting] =  <cfqueryparam cfsqltype="cf_sql_integer" value="#url.posting#">
        AND
    	[areaID] IN (#url.areaID# ) 
    
    ORDER BY 
        company, surname, name
</cfquery>
<!---

	SELECT DISTINCT
    	[userID]
       ,[userTitle]
	   ,[userName]
      ,[userSurname]
      ,[address]
      ,[userCompanyName]
      ,[userPossition]
      
      ,CASE 
      WHEN switch = 'street' THEN streetCity
      WHEN switch = 'postal' THEN postCity
      END AS city
      
      ,CASE 
      WHEN switch = 'street' THEN StreetCode
      WHEN switch = 'postal' THEN postCode
      END AS postCode
      
      ,CASE 
      WHEN switch = 'street' THEN streetCountry
      WHEN switch = 'postal' THEN postCountry
      END AS country
  FROM 
  		[CRM_Reports_mailing]
  WHERE
  	1 = 1
    <cfif parameterexists(url.areaID)>AND areaID IN (#url.areaID#)</cfif>

 [countryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.countryID#"> --->