<cfparam default="1114" name="url.fileID">

<cfquery datasource="#gpp#" name="qryFile">
SELECT TOP 1
     [fileType]
    ,[fileName]
    ,[FilePurposeID]
FROM 
  	[files]
WHERE
	[fileID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.fileID#">
 </cfquery>
 
 <cfscript>
 edf = createObject("component", "Officecfc.webFileLocation");
 qry_filePath = edf.fileServerPath(qryFile.fileType, qryFile.FilePurposeID);
</cfscript>