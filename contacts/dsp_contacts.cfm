<cfparam name="form.contactID" default="0">
<cfinclude template="qry_contacts.cfm">
<cfif qryContacts.recordcount EQ 0>No Results, please <button id="0" class="manageContacts ui-corner-all">Create Contact</button></cfif>
<cfoutput><ul class="listMenu">
    <cfloop query="qryContacts"><li><cfif qryContacts.ContactType NEQ 307>
    <input type="checkbox" name="contact2user" id="#qryContacts.contactID#" value="1" <cfif qryContacts.linked NEQ "">checked="checked"</cfif> /></cfif> <span class="manageContacts" id="#qryContacts.contactID#">#qryContacts.contactName# (#qryContacts.typeLabel#)</span></li></cfloop>
	</ul>
<!---</fieldset>--->* User self records cant be edited here</cfoutput>