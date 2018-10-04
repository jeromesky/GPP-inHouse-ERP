<cfquery datasource="#gpp#" name="qryUserChanges">
  SELECT
       [UserID] AS GppUser
      ,[UserName] AS EditedBy
      ,UserDateNum 	AS EditedDate		
      ,[RecordDetails] AS Field		
      ,[RecordORGValue] AS OriginalValue	
      ,[RecordNEWValue] AS NewValue	
  FROM 
       tblGlopacHistory
 WHERE 
    RecordWorked = <cfqueryparam value="#form.id#">
 ORDER BY 
 	RecIDX DESC
</cfquery>
<!---<cfdump var="#qryUserChanges#">--->