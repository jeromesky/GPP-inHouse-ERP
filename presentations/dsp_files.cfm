<cfinclude template="qry_files.cfm">
<cfoutput>
<cfloop query="qry_files">
<div class="loadedfile" id="f_#qry_files.libraryID#">#qry_files.libraryTitle#</div>
</cfloop>
</cfoutput>