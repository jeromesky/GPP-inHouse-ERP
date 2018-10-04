
	<cfquery datasource="#dsnP21#">
		INSERT INTO books(title, author, subtitle, publisher, publishdate)
  		VALUES('#form.title#', '#form.author#', '#form.subtitle#', '#form.publisher#', <cfqueryparam cfsqltype="cf_sql_date" value="#form.publishdate#">)
	</cfquery>
