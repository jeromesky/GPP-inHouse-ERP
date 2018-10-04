
<cfparam name="form.noteID" default="0" type="integer">
<cfparam name="form.noteTable" default="" type="string">
<cfparam name="form.noteTableID" default="0" type="integer">

<cfquery datasource="#gpp#" name="qry_notes">
	SELECT 
    	[staffName]
      ,[noteTable]
      ,[noteTableID]
      ,[noteDate]
      ,[noteComment]
      ,[noteID]
  FROM 
  	[CRM_notes]
 WHERE 
 	[noteTable] 		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.noteTable#"> AND
    [noteTableID]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.noteTableID#">
    <cfif form.noteID NEQ 0>
    AND
 	[noteID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.noteID#">
 	</cfif>
 ORDER BY
 	[noteDate] 
</cfquery>