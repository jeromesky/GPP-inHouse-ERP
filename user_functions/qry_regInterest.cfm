<cfsilent>
<!--- debug next 1 line <cfset form.userID='23720'>--->

<cfquery name="qry_areas" datasource="#gpp#">
  SELECT distinct
   [areaID], 
   [areaName],
   (
          SELECT TOP 1 user2area.user2areaID  
          FROM 
             user2area 
          WHERE 
             (user2area.userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">)
          AND 
             (user2area.areaActive = 1)
          AND 
             (user2area.deliveryFormat = <cfqueryparam cfsqltype="cf_sql_integer" value="#deliveryFormat#">)
          AND 
             (user2area.areaID = areas.areaID)
   ) AS value 
  FROM 
      [areas]          
  WHERE 
  <cfswitch expression="#deliveryFormat#">
      <cfcase value="1">
          areaID NOT IN (1)
      </cfcase>
      <cfcase value="2">
          areaID NOT IN (1, 13, 14)
      </cfcase>
  </cfswitch>
  ORDER BY 
      [areaID];
</cfquery>
<!--- debug next 2 lines<cfdump var="#qry_areas#"><cfabort>--->

<cfswitch expression="#deliveryFormat#">

<cfcase value="1">
    <cfquery datasource="#gpp#" name="qryUser">
      SELECT  
          [chkRecAlerts]
      FROM 
          [CRM_users]
      WHERE 
          [userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
    </cfquery>
</cfcase>

<cfcase value="2">
    <cfquery datasource="#gpp#" name="qryUser">
      SELECT  
          [chkMail]
          ,[chkPrioPost]
          ,[chkSecPost]
      FROM 
          [CRM_users]
      WHERE 
          [userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
    </cfquery>
</cfcase>

</cfswitch>

</cfsilent>