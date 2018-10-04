<cfinclude template="../areas/qry_areas.cfm">

<cfquery name="qry_audienceList" datasource="#mainDSN#"> 
  SELECT
    AUDIENCEBUSINESSECTOR,
    AUDIENCECOMPANYLIST, 	
    AUDIENCECOUNTRYLIST, 	
    AUDIENCEEVENTLIST, 	
    AUDIENCEEVENTLISTEXCLUDE, 	
    AUDIENCEID, 	
    AUDIENCENAME, 	
    AUDIENCEREGIONS, 	
    AUDIENCEROLELIST, 	
    AUDIENCETOTAL,
    DATEADDED, 	
    DATEUPDATED, 	
    STAFFIDCREATED, 	
    STAFFIDUPDATED
  FROM
    GPP.dbo.ann_audiences
  ORDER BY
    AUDIENCENAME;
</cfquery>

<!--- <cfdump var="#qry_AudienceList#"> ---->

<cfscript>
 listAttendendance="Delegate|Speakers|Guest|Moderator|Press|Research|Exhibitor|Sponsor";
</cfscript>


<cfloop query="qry_audienceList">

<cfquery datasource="#mainDSN#" name="qryRole">
  SELECT 
      [roleName]
  FROM 
      GPP.dbo.[roles]
  WHERE roleID in (#qry_AudienceList.AUDIENCEROLELIST[qry_audienceList.currentRow]#);
</cfquery>

<cfquery datasource="#mainDSN#" name="qrySectors">
  SELECT  
      [sectorName]
	FROM 
    	GPP.dbo.[CRM_sectors]
  WHERE sectorID in (#qry_AudienceList.AUDIENCEBUSINESSECTOR[qry_audienceList.currentRow]#);
</cfquery>

<cfquery datasource="#gpp#" name="qry_areas">
  SELECT 
      [areaName]
  FROM 
  		GPP.dbo.[CRM_Areas]
  WHERE areaID in (#qry_AudienceList.AUDIENCEREGIONS[qry_audienceList.currentRow]#);
</cfquery>

<cfquery datasource="#gpp#" name="qry_areas">
  SELECT 
      [areaName]
  FROM 
  		GPP.dbo.[CRM_Areas]
  WHERE areaID in (#qry_AudienceList.AUDIENCEREGIONS[qry_audienceList.currentRow]#);
</cfquery>


<cfif len(qry_AudienceList.AUDIENCECOMPANYLIST[qry_audienceList.currentRow]) LT 1>
  <cfset qry_AudienceList.AUDIENCECOMPANYLIST[qry_audienceList.currentRow] = '-99'>
</cfif>

<cfquery datasource="#gpp#" name="qry_companylist">
  SELECT 
      [strCompany_Name]
  FROM 
      GPP.dbo.[CRM_company_newUser]
  WHERE 
      IngCompany_ID in (#qry_AudienceList.AUDIENCECOMPANYLIST[qry_audienceList.currentRow]#);
</cfquery>

<cfquery datasource="#gpp#" name="qry_countries">
  SELECT 
      [CountryNameEN]
  FROM 
  		GPP.dbo.[Countries]
  WHERE 
      countryID in (#qry_AudienceList.AUDIENCECOUNTRYLIST[qry_audienceList.currentRow]#);
</cfquery>

<cfquery datasource="#gpp#" name="qry_events">
	SELECT
    	[event_name]
    FROM
    	GPP.dbo.[CRM_events]
    WHERE
      eventID in (#qry_AudienceList.AUDIENCEEVENTLIST[qry_audienceList.currentRow]#);
</cfquery>

<cfquery name="qry_staffCreated" datasource="#mainDSN#"> 
	SELECT 
    name
 	FROM 
    Petro21.dbo.GPPusers
  WHERE 
    id IN (#qry_AudienceList.STAFFIDCREATED[qry_audienceList.currentRow]#);     		
</cfquery>

<cfquery name="qry_staffUpdated" datasource="#mainDSN#"> 
	SELECT 
    name
 	FROM 
    Petro21.dbo.GPPusers
  WHERE 
    id IN (#qry_AudienceList.STAFFIDUPDATED[qry_audienceList.currentRow]#);     		
</cfquery>

<cfscript>
  qry_AudienceList.AUDIENCEBUSINESSECTOR = ValueList(qrySectors.sectorName, '&nbsp;+<br> ');
  qry_AudienceList.AUDIENCEROLELIST = ValueList(qryRole.roleName, '&nbsp;+<br> ');
  qry_AudienceList.AUDIENCEREGIONS = ValueList(qry_areas.areaName, '&nbsp;+<br> ');
  qry_AudienceList.AUDIENCEREGIONS = ValueList(qry_areas.areaName, '&nbsp;+<br> ');
  qry_AudienceList.AUDIENCECOMPANYLIST = ValueList(qry_companylist.strCompany_Name, '&nbsp;+<br> ');
  qry_AudienceList.AUDIENCECOUNTRYLIST = ValueList(qry_countries.CountryNameEN, '&nbsp;+<br> ');
  qry_AudienceList.AUDIENCEEVENTLIST= ValueList(qry_events.event_name, '&nbsp;+<br> '); 
</cfscript>

</cfloop>

<!--- <cfdump var="#qry_AudienceList#"> ---->