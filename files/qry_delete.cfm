<cfsilent>
<cfquery name="qryFiles" datasource="#gpp#">
SELECT
	   [fileName]
      ,[FilePurposeID]
      ,[fileType]
FROM 
  		[CRM_files]
WHERE
		[fileID] 	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileID#" >
</cfquery> 


<cfscript>
 edf = createObject("component", "Officecfc.fileLocation");
 qry_filePath = edf.fileServerPath(qryFiles.fileType, qryFiles.FilePurposeID);
</cfscript>


<!---<cfmail to="jerome@glopac.com" from="web@petro21.com" subject="del file" type="html">

#qryFiles.fileName#<br>
#form.fileID#<br>
#qry_filePath#\#qryFiles.fileName#
</cfmail>--->


<cfif FileExists(ExpandPath("#qry_filePath#\#qryFiles.fileName#"))></cfif>
	<CFFILE ACTION="DELETE" FILE="#qry_filePath#\#qryFiles.fileName#">



<cfquery datasource="#gpp#">
DELETE 
FROM 
  		[files]
WHERE
		[fileID] 	= <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileID#" >
</cfquery> 


</cfsilent>
<cfoutput>#form.fileID#</cfoutput>