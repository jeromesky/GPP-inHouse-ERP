<cfinclude template="qry_PersonalNote.cfm"><cfoutput>
<div class="ui-corner-all ui-widget ui-widget-content podForm marginBottom15">
<form action="../user_edit/Update_Individual.cfm" method="post"><fieldset>
    <legend>Personal Note (internal)</legend>
    <i class="NoFormat" ><textarea name="value" class="ui-corner-all">#Trim(get.strPersonal_Info)#</textarea></i>
    <i class="field_button_container NoFormat" id="SaveProcess"></i>
    <input type="hidden" name="oldValue" value="#Trim(get.strPersonal_Info)#" />
    <input type="hidden" name="fieldname" value="strPersonal_Info" />
    <input type="hidden" name="id" value="#get.userid#" />
    <b></b>
    <i class="NoFormat" > <button class="ui-corner-all">Save</button></i>
</fieldset>
</form></div></cfoutput>