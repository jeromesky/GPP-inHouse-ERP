<cfparam name="form.noteTable" default="">
<cfparam name="form.noteTableID" default="0">
<cfquery datasource="#gpp#" name="qry_newNote">
	INSERT INTO notes
    	(
            [noteTable]
          ,[noteTableID]
          ,[noteDate]
          ,[noteComment]
          ,[staffID]
        )
     VALUES
     	(
        <cfqueryparam cfsqltype="cf_sql_char" value="#form.noteTable#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.noteTableID#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.noteComment#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.staffID#">        
        )

  SELECT @@IDENTITY AS noteID
  
</cfquery>

<cfparam name="form.noteID" default="#qry_newNote.noteID#" type="integer">
<cfparam name="form.noteTable" default="#form.noteTable#" type="string">
<cfparam name="form.noteTableID" default="#form.noteTableID#" type="integer">
<cfinclude template="dsp_notes.cfm">