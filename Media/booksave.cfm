
	<cfquery datasource="#dsnP21#">
		INSERT INTO media(title, author, subtitle)
  		VALUES('#form.title#', '#Left(form.author, 80)#', '#Left(form.subtitle, 500)#')
	</cfquery>
    <cfoutput>Media category added to database</cfoutput>