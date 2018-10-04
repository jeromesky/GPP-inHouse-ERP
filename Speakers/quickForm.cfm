<cfinclude template="../Application.cfm">
<fieldset >
	<legend >Add Delegate </legend>   
<table width="100%" border="0" cellspacing="3" cellpadding="0">
  <tr>
    <td>Name / Surname</td>
    <td>Delegation / Company</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="text" name="textfield"  maxlength="35"></td>
    <td><input type="text" name="textfield2" maxlength="90"></td>
    <td><form name="form1" method="post" action="">
      <input type="submit" name="button" id="button" value="save">
    </form>
    </td>
  </tr>
</table>
</fieldset>