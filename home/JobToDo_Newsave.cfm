<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get" >
INSERT INTO jobstodo(title, insertdate, postedby)
VALUES ('#form.title#', #now()#, '#Session.staffName#')
SELECT @@identity AS jobid
</cfquery>
<cfquery datasource="#dsnP21#">
INSERT INTO jobstodoItem (jobid, comment, insertdate, postby)
VALUES ( #get.jobid#, '#form.comment#', #now()#, '#Session.staffName#' )
</cfquery>
<cfoutput>
<h3><a href="##">#form.title#</a></h3>
	<div><p>#form.comment#</p>
		<div class="clear"></div>
	</div>
</cfoutput>