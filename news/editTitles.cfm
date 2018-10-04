<cfinclude template="../Application.cfm">

<cfif parameterexists(form.newsletterid) >

<cfquery  datasource="#dsnP21#" name="get">
	   	INSERT INTO  MoreOverTitles (toplevel, newsName) VALUES(#form.newsletterid#, '#form.newsName#')	
        SELECT @@IDENTITY AS NEWID
</cfquery>
<cfoutput>
<div id="SearchTitle_#get.NEWID#"><a href="javascript:deleteSearchTitle(#get.NEWID#);"><img src="../img/new_delete_mini.gif" border="0"></a> #form.newsName# (0)</div>
</cfoutput>
</cfif>

<cfif parameterexists(form.id) >

	<cfquery datasource="#dsnP21#"> 
    DELETE 
    FROM 
      MoreOverTitles WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" ></cfquery>
</cfif>

