<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cfparam name="attributes.name" default="packagesID" type="string">
<cfparam name="attributes.packagesID" default="0" >
<cfparam name="attributes.parentID" default="0" type="integer">
<cfparam name="attributes.packageTypeID" default="201" type="integer">
<cfquery name="qryContracts" datasource="#gpp#">
SELECT
        [companyName]
        ,[contractID]
        ,[packagesID]
FROM 
		[CRM_Contracts]
WHERE
		[packageTypeID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.packageTypeID#">        
AND
		[eventID] = <cfqueryparam cfsqltype="cf_sql_char" value="#attributes.parentID#">  
ORDER 
		BY companyName 
</cfquery> 
<select name="#attributes.name#" id="#attributes.name#" class="ui-corner-all">
	<cfoutput query="qryContracts">
	<option value="#qryContracts.packagesID#" <cfif #qryContracts.packagesID# EQ attributes.packagesID>selected="selected"</cfif>>#qryContracts.companyName#</option>
	</cfoutput>
</select>
</body>
</html>