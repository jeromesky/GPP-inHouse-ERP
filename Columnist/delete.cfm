<cfinclude template="../Application.cfm">

<cfquery name="get" datasource="#dsnP21#">
   SELECT Filename
   FROM Columnist_list
   WHERE id = #form.id#
	</cfquery>
	

<!--- check 4 existing file  and delete --->
	<cfif get.Filename NEQ "" AND FileExists("G:\Websites\petro21\htdocs\Columnist\files\#get.Filename#")>
		<CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\Columnist\files\#trim(get.Filename)#">
	</CFIF>
	
    <cfquery datasource="#dsnP21#">
   DELETE FROM Columnist_list
   WHERE id = #form.id#
	</cfquery>