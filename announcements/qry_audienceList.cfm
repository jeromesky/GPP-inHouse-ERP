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
  WHERE
    AUDIENCEID = #url.id#
</cfquery>

<cfinclude template="qry_AudienceCreate.cfm">

<cfdump var="#qry_audienceList#">