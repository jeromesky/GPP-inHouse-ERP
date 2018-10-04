<cfquery name="qry_Check_files" datasource="#Application.datasource.gpp#">
  	select top 1000 *
    from [dbo].[library]
    where libraryID in (
            SELECT [libraryID]
            FROM [Portal_event_program]
        )
        order by libraryTitle;
</cfquery>

<cfloop query="qry_Check_files">

	<cfset var.newFileName = #listDeleteAt(qry_Check_files.libraryTitle, 1, "_")#>
	<cfset var.checkFile = 'G:\files\library\#qry_Check_files.libraryTitle#'>
	
	<cfif fileExists(var.checkFile)>
	   .
	<cfelse>   
	   <br><cfoutput>#var.newFileName#</cfoutput> is missing
	</cfif>

</cfloop>
<hr>
Done