<cfquery datasource="#gpp#" name="qrySpeakers">
SELECT distinct
	 	[speakerName]
      ,[userPosition]
      ,[companyName]
 <!---     ,[eventID]
      ,[speakerID]--->
      ,[fileName]
<!---      ,[userID]
    ,[speakerTopic] 
      ,[speakerType]
      ,[speakerTime]--->
     ,[speakerOrder]
      ,[speakerKeyNote]
FROM
	[CRM_program]
WHERE 
	(
    [eventID] IN ( <cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#network#">) AND
    [speakerType] = 1 AND
    		( 
    		[speakerStatus] = 3 OR [speakerStatus] = 6
        )	
    )	
ORDER BY [speakerOrder], [speakerKeyNote], [fileName] DESC;
</cfquery>
<!---ORDER BY   
	[speakerDate],
	[speakerSession], 
	[speakerTime],
	CHARINDEX(','+CONVERT(varchar, speakerTYPE)+',', ',4,2,1,3,5,6,')	--->