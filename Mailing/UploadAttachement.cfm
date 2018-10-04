<cfif parameterexists(form.id)>
	<cfset id = #form.id# >
<cfelse>
	<cfset id = #url.id# >
 </cfif>
<cfinclude template="../Application.cfm">

<CFFILE ACTION="Upload" FILEFIELD="form.Upload" DESTINATION="G:\websites\my-office\Mailing\attachements" nameconflict="MAKEUNIQUE">

	<CFQUERY datasource="#dsnP21#">
    	INSERT INTO MailOut_attachment (filename, emailid, insertdate)
    	VALUES ( <cfqueryparam value="#File.ServerFile#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#id#">, <cfqueryparam cfsqltype="cf_sql_date" value="#now()#"> )
	</cfquery>

File is loaded to server