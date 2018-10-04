<cfquery name="get_newsletters" datasource="#gpp#">
  SELECT distinct
    newsletters.newsletterid, 
    newsletters.newsletterName,
    subs.subscriptionID, 
    subs.userID,
    subs.subActive,
    areas.areaName
  FROM
    newsletters INNER JOIN areas 
    ON newsletters.areaID = areas.areaID LEFT OUTER JOIN
    (SELECT
            subscriptionID, 
            newsletterID, 
            userID,
            subActive
          FROM
        	subscriptions
          WHERE      
        	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
			AND
			[subscriptionType] = 1
    ) AS subs 
      ON newsletters.newsletterid = subs.newsletterID
  ORDER BY 
    areas.areaName,
    newsletters.newsletterName;
</cfquery>

<cfquery name="userAllowSubscription" datasource="#gpp#">
SELECT 
	[userAllowSubs]
  FROM 
  	[tblIndividual]
  WHERE 
  	[IngIndividual_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
</cfquery>
<cfset area = "">
<!---<cfquery datasource="#gpp#" name="get">
 	select *
	from CRM_Individual_Newsletters
	WHERE userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#" >
</cfquery>
<cfquery datasource="#gpp#" name="getUnreg">
    SELECT RecordDetails
    FROM tblGlopacHistory
	WHERE RecordWorked = <cfqueryparam value="#form.userid#">
</cfquery>
<cfset unresitered = #valueList(getUnreg.RecordDetails, ",")# >--->