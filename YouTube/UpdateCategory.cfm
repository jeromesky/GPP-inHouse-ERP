<cfif isDefined("form.id")>
	<!--- Perform the update depending on the content editted --->
	<cfquery datasource="#dsnP21#">
		UPDATE youTubCategory
		<cfif form.id CONTAINS "pos">
		SET	pos = <cfqueryparam cfsqltype="cf_sql_integer" value=" #Trim(form.content)#" >
		WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#Trim(Right(form.ID, Len(form.ID)-3))#" />
		</cfif>
	</cfquery>
	<!--- Output the form field's content --->
	<cfoutput>#form.content#</cfoutput>
<cfelse>
	<p>Form id not found.</p>
</cfif>