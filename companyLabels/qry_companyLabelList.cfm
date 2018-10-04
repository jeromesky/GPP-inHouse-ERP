
<cfsilent>
<cfquery datasource="#GPP#" name="qryLabelList">
SELECT
		[AKA_companyID]
      ,[AKA_companyName]
      ,[companyName]
  FROM 
  		[CRM_companyAKA]
  WHERE 
  		1 =1 
        AND
        [companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">    
ORDER BY
		[AKA_companyName]

</cfquery></cfsilent>