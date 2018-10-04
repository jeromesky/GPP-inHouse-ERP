<cfinclude template="../areas/qry_areas.cfm">
 	
<cfquery datasource="#mainDSN#" name="qryRole">
  SELECT 
      [roleID]
      ,[roleLabel]
      ,[roleName]
      ,[roleOrder]
  FROM GPP.dbo.[roles];
</cfquery>

<cfquery datasource="#mainDSN#" name="qrySectors">
  SELECT  
    	[sectorID]
    	,[sectorName]
      ,[sectorFieldNameOld]
	FROM 
    	GPP.dbo.[CRM_sectors]
</cfquery>

<cfscript>
 listAttendendance="Delegate|Speakers|Guest|Moderator|Press|Research|Exhibitor|Sponsor";
</cfscript>