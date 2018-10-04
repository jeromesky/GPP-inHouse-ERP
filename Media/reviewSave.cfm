<cfquery datasource="#dsnP21#">
		INSERT INTO MediaReview(bookid, title, content, source, link, utube, publishdate )
		VALUES('#form.bookid#', '#form.title#', '#form.content#', '#form.source#',  '#form.link#', '#form.utube#' ,<cfqueryparam cfsqltype="cf_sql_date" value="#form.publishdate#">)
	</cfquery>
    
    <cfoutput>Media review added to database</cfoutput>