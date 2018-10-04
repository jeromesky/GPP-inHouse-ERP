<cfinclude template="../Application.cfm">

<CFFILE ACTION="Upload" 
	FILEFIELD="form.schedule" 
	DESTINATION="G:\websites\petro21\htdocs\advertising" 
	nameconflict="overwrite">
    <cfset newname = "#replace(File.ServerFile, " ", "_", "ALL")#" >
    <cffile action="rename" 
		source="G:\websites\petro21\htdocs\advertising\#File.ServerFile#" 
		destination="G:\websites\petro21\htdocs\advertising\#newname#">

<cfquery datasource="#dsnP21#" >
UPDATE home
SET 
upload = '#newname#'
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>