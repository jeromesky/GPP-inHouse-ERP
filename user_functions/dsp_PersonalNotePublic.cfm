<cfinclude template="qry_PersonalNote.cfm"><cfoutput>
<form action="../user_edit/Update_Individual.cfm" method="post">
<fieldset>
  <legend>Personal Note (public)</legend>
  <i class="strPersonal_Info" ><textarea name="value">#Trim(get.Perasonal_info_public)#</textarea></i>
  <input type="hidden" name="oldValue" value="#Trim(get.Perasonal_info_public)#" />
  <input type="hidden" name="fieldname" value="Perasonal_info_public" />
  <input type="hidden" name="id" value="#form.userid#" />
  <button style="">Save</button>
</fieldset>
</form></cfoutput>