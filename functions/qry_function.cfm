<cfparam name="form.functionID" default="0">

<cfquery datasource="#gpp#" name="qryFunction">
	SELECT  
        [functionID]
        ,[functionTrack]
        ,[functionTime]
        ,[functionDate]
        ,[functionDetails]
        ,[functionTitle]
        ,[companyName]
        ,[functionType]
        ,[companyID]
        ,[menuOptions]
        ,[parentID]
        ,[eventID]
        ,[packagesID]
        ,[functionVenue]
        ,[mediaFile]
        ,[functionTimeEnd]
  FROM [PM_functions]
 WHERE   
        	[functionID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.functionID#">
</cfquery>

<cfif form.functionID EQ 0>
	<cfset formLabel = "Add a new function">
<cfelse>
	<cfset formLabel = "Edit function">
</cfif>