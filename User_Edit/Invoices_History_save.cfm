<cfsilent>
<cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="get">
 	INSERT INTO   InvoiceNotes
    (InvoiceNoteDate, InvoiceNoteComment, InvoiceID, staffID)
	VALUES
    (<cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >, <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(form.InvoiceNoteComment, 600)#" >, <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >, <cfqueryparam cfsqltype="cf_sql_integer" value="#session.staffID#">) 
</cfquery>
</cfsilent>
<cfoutput><tr>
  <td class="header">#DateFormat(now(), "dd mm yyyy")# / #Session.staffName#</td>
</tr>
<tr>
  <td class="comment">#form.InvoiceNoteComment#</td>
</tr></cfoutput>