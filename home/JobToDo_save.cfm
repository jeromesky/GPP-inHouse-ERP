<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#">
INSERT INTO jobstodo(title, insertdate, postedby)
VALUES ('#form.title#', #now()#, '#session.name#')
SELECT @@identity AS jobid
</cfquery>