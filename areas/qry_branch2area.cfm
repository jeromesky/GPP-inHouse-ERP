<!-- debug next 1 line --->
<cfparam name="form.value" default="0">

<cfquery name="qry_areas" datasource="#gpp#">
SELECT
 [areaID], 
 [areaName],
 (
SELECT 
   branch2area.branch2areaID  
FROM 
   [branch2area] 
WHERE 
   (branch2area.branchID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.value#">)
AND 
   (branch2area.areaID = areas.areaID)
 ) AS area 
FROM 
		[areas]          
WHERE 
			areaID NOT IN (1, 13, 14)
ORDER BY 
		[areaID];
</cfquery>
