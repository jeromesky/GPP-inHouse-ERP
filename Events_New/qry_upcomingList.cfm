<cfquery name="get" datasource="#gpp#" >
SELECT	
		[strConference_Name]
		,[event_Name]
		,[strConference_Code]
        ,[event_expire]
        
      , CASE                   
            WHEN event_Name IS NULL 
            THEN strConference_Name  
            ELSE event_Name
      END AS conferenceName
      
FROM
		[tblAnnual_Conf]
WHERE    
		[event_expire] > <cfqueryparam cfsqltype="cf_sql_date"  value="#now()#"> 
ORDER 
 		BY event_expire
</cfquery>