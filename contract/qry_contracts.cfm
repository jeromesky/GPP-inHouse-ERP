<cfparam name="form.packageTypeID" default="0">
<cfparam name="form.eventID" default="0">

<!---<cfquery name="get_contracts" datasource="#gpp#">
EXEC sp_crm_contracts 
	<cfif not listcontains("0, 200", form.packageTypeID)>
    		@packageTypeID = <cfqueryparam cfsqltype="cf_sql_char" value="#form.packageTypeID#">
     </cfif>
	 <cfif not listcontains("0, 200", form.packageTypeID) AND form.eventID NEQ 0>
    		,
    </cfif> 
	<cfif form.eventID NEQ 0>
    		@eventID = <cfqueryparam cfsqltype="cf_sql_char" value="#form.eventID#">
    </cfif>
</cfquery>--->






<cfquery name="get_contracts" datasource="#gpp#">

SELECT DISTINCT 
		[statusInternal]
      ,[contractID]
      ,[companyID]
      ,CASE
      		WHEN branchID <> 0 THEN branchName
            WHEN branchID = 0 THEN companyName
       END AS companyName
      ,[branchName]
<!---      ,[packageTypeID]
      ,[eventID]--->
      ,[contractType]
      ,[packagesID]
      ,[AKA_companyID]
      ,[AKA_companyName]
      ,[statusInternalID]
      ,[contractDateAdded]
      ,[contractFile]
      ,CASE 
      	WHEN packageTypeID = 201 THEN companyLogo
        WHEN packageTypeID = 202  THEN branchLogo
        WHEN packageTypeID = 203  THEN companyLogo
        END AS logo
  FROM 
  		[CRM_Contracts_List]
WHERE
		1 = 1 
<cfif not listcontains("0, 200", form.packageTypeID)> 
AND
		[packageTypeID] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.packageTypeID#"></cfif>
<cfif form.eventID NEQ 0> 
AND
		[eventID] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.eventID#"></cfif>
ORDER 
		BY companyName, contractDateAdded DESC
</cfquery> 

<!---
<cfquery name="get_contracts" datasource="#gpp#">
SELECT  DISTINCT
        [companyName]
        ,[contactName]
        ,[statusInternal]
        ,[contractID]
        ,[contractDateAdded]
        ,[statusInternalID]
        ,[statusInternal]
<!---        ,( SELECT count(*) FROM packages WHERE packages.contractID = CRM_Contracts.contractID  ) AS packagesCount--->
FROM 
		[CRM_Contracts]
WHERE
		1 = 1      
        
<cfif not listcontains("0, 200", form.packageTypeID)>        
AND
		[packageTypeID] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.packageTypeID#"> 
</cfif>
<cfif form.eventID NEQ 0 >        
AND
		[eventID] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.eventID#"> 
</cfif>

		<!---AND
		[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">--->
ORDER 
		BY companyName, contractDateAdded DESC
</cfquery> 
--->