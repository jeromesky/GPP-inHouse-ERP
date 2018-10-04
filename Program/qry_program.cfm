


<cfif  len(trim(form.searchStatus))  EQ 0 >
	<cfparam name="form.searchStatus" default="0" >
    
<cfelse><!---if len(trim(form.searchStatus))  EQ 0 OR trim(form.searchStatus) EQ "" len(trim(form.searchStatus))  GT 0 --->
	<cfparam name="form.searchStatus" default="#form.searchStatus#" > 
</cfif>

<cfparam name="form.eventID" default="543" max="200000" min="0" type="integer"> 
<cfparam name="form.speakerID" default="0" max="200000" min="0" type="integer">
<cfparam name="form.userID" default="0" type="integer"> 

<cfquery datasource="#gpp#" name="qry_program">
SELECT 
	 	[speakerName]
      ,[userPosition]
      ,[companyName]
      ,[eventID]
      ,[speakerStatus]
      ,[speakerDateAdded]
      ,[speakerID]
      ,[fileName]
      ,[speakerOrder]
      ,[speakerKeyNote]
      ,[speakerUnit]
      ,[userID]
      ,[cvFileName]
      ,[speakerTopic] 
      ,[speakerType]
      ,[extraDetails]
      ,[speakerTime]
      ,[comment]
      ,[arragements]
      ,[speakerSession]
      ,[speakerDate]
FROM
	[CRM_program]
WHERE 
	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#">
    
    
	<cfif len(trim(form.searchStatus))  NEQ 0>
     AND
    [speakerStatus] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.searchStatus#">)
    <cfelse>
    AND
    [speakerStatus] NOT IN (10,11)
  
	</cfif>
    
    <cfif form.printStatus EQ "excel"><!--- speakers only for excel --->
    AND
    [speakerType] = 1
    </cfif>
    
    <cfif form.printStatus EQ "presentations"><!--- speakers and sessions slots only--->
            AND
            (speakerType = 1 AND speakerStatus = 6 OR speakerType = 1 AND speakerStatus = 3) 
            OR
            (eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#"> AND speakerType = 2  )
            OR
            (eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#"> AND speakerType = 4  ) 
    </cfif>
    
    <cfif form.printStatus EQ "speakerTime"><!--- get speaker slot details--->
            AND
            (speakerType = 1 AND userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#"> OR
            speakerType = 5  AND userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#"> ) 
    </cfif>
   
    
    <cfif form.speakerID NEQ 0>
    AND
    [speakerID] = <cfqueryparam cfsqltype="cf_sql_integer" list="no" value="#form.speakerID#">
    </cfif>

ORDER BY   
		[speakerOrder]<!---,
		[speakerDate],
		[speakerSession], 
		[speakerTime],
		CHARINDEX(','+CONVERT(varchar, speakerTYPE)+',', ',6,4,2,1,3,5,')--->	
</cfquery>   
 