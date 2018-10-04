
<cfquery datasource="#gpp#" name="qry_files">
SELECT
	   [libraryID]
      ,[libraryTitle]
  FROM 
  		[library]
  WHERE
  		[speakerID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qry_program.speakerID#">
</cfquery>