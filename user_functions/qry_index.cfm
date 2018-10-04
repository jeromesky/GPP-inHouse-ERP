<cfquery name="get_update" datasource="#gpp#">
SELECT TOP (1)
		[updateStaff]
      ,[updateDate]
      ,[userID]
      ,[dtmCaptured]
      ,[CapBy]
      ,[status]
      ,[active]
  FROM 
  	[CRM_LastUpdate]
WHERE 
	 [userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
ORDER BY 
	[RecIDX] desc
</cfquery>
 
<cfif get_update.updateDate NEQ "">
 	<cfset updatedDate = DateFormat(CreateDate(left(get_update.updateDate, 4), left(right(get_update.updateDate, 4), 2), right(get_update.updateDate, 2)), "dd mmm yyyy") >
<cfelse>
	<cfset updatedDate= "no Update">
</cfif>

<cfquery name="get_attandedEvent" datasource="#gpp#">
SELECT DISTINCT [chkDelegate]
  FROM 
  	[tblConference_Registration]
WHERE 
	 [lngIndividual_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#"> AND [chkDelegate] = 1
</cfquery>
 
<cfquery name="get_attandedSpeaker" datasource="#gpp#">
SELECT DISTINCT [chkSpeaker]
  FROM 
  	[tblConference_Registration]
WHERE 
	 [lngIndividual_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#"> AND
     [chkSpeaker] = 1
</cfquery>
 
<cfquery name="qryIndexUser" datasource="#gpp#">
SELECT [strFirst_Name] AS userName, [strSurname] AS userSurname, active AS status
  FROM 
  	[tblIndividual]
WHERE 
	 [IngIndividual_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>