<cfquery name="get_files" datasource="#gpp#">
SELECT
	  [fileID]
      ,[typeLabel]
      ,[fileComment]
      ,[staffName]
      ,[fileQuality]
      ,[filePurposeLabel]
      ,[fileTableID]
      ,[fileTable]
      ,[fileDate]
      ,[fileName]
      ,[FilePurposeID]
      ,[fileType]
FROM 
  		[CRM_files]
WHERE
		[fileTable] 	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileTable#" > AND
        [fileTableID]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileTableID#" >
</cfquery> 

