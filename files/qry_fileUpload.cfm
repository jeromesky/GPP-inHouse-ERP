<cfquery name="get_file" datasource="#gpp#">
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
        [fileTableID]	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileTableID#" > AND
        [fileID]			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileID#" >
</cfquery> 

