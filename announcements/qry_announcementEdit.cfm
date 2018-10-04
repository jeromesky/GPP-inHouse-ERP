<cfquery name="qryEdit" datasource="#mainDSN#"> 
  SELECT
    *
  FROM
    GPP.dbo.[announcements]
  WHERE
    announcementID = #url.ID#
</cfquery>

<cfquery name="qryDomain" datasource="#mainDSN#"> 
       		SELECT  
            		id, domain_name
 			FROM 
            		GPP.dbo.domain_names
        	WHERE 
            		id NOT IN (12,13)
        	Order 
            		BY domain_name
</cfquery>

<cfquery name="qrySignature" datasource="#mainDSN#"> 
	SELECT 
       				id, name
 			FROM 
            		Petro21.dbo.GPPusers
              	WHERE 
            		id NOT IN (#var.staffLimited#)      		
        	Order BY 
              name
</cfquery>

<!--- or include from other qry...page--->
<cfquery name="qryTemplate" datasource="#mainDSN#"> 
  SELECT
    *
  FROM
   GPP.dbo.[announcements]
  WHERE
    announcementID = #url.ID#
</cfquery>

<cfquery name="qryStaffAdd" dbtype="query">
  SELECT
    name
  FROM
    qrySignature
  WHERE
    ID = #qryEdit.announcementID#
</cfquery>

<cfquery name="qryStaffUpdate" dbtype="query">
  SELECT
    name
  FROM
    qrySignature
  WHERE
    ID = #qryEdit.announcementID#
</cfquery>

<cfscript>
staffadded =qryStaffAdd.name;
staffupdated =qryStaffUpdate.name;
</cfscript>