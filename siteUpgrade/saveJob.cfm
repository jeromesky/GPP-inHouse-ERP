<cfinclude template="../Application.cfm">

<cfquery datasource="#dsnP21#" name="get">
INSERT INTO jobstodo ( title,	insertdate,	postedby)
VALUES ('#form.title#', #now()#, #Session.username# )
SELECT @@IDENTITY AS newid
</cfquery>

<cfoutput>
title = 
//
comment = #form.comment# //
insertdate = #now()# //
postedby = #Session.username# //
</cfoutput>

	
	