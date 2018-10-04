<cfquery datasource="#dsnP21#">
		INSERT INTO bookreview(bookid, title, content, source, link, publishdate)
		VALUES('#form.bookid#', '#form.title#', '#form.content#', '#form.source#', '#form.link#', <cfqueryparam cfsqltype="cf_sql_integer" value="#form.publishdates#">)
	</cfquery>