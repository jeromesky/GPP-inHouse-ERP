<cfinclude template="qry_Sposorship_Interest.cfm">
<script type="text/javascript">
$('#AreaSeInterest :checkbox').change(function(){
	var get_Se = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
	  if(get_Se == 1 ){
		  $.post("Update_Options.cfm", {id: <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue": 0,  "value": 1 });
	  }else{
		  $.post("Update_Options.cfm", {id: <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue": 1,  "value": 0 });
	  }
});
</script>
<fieldset id="AreaSeInterest" style=" display:block; float:left">
<legend>S&E Potential</legend>
<label>
<input type="checkbox" id="chkSE" name="chkSE" value="1" <cfif get.chkSE EQ 1 >checked="checked"</cfif> />S&E Potential</label><br />
<label>
<input type="checkbox" id="chkSEW" name="chkSEW" value="1" <cfif get.chkSEW EQ 1 >checked="checked"</cfif> />Worldwide</label><br />
<label>
<input type="checkbox" id="chkSENA" name="chkSENA" value="1" <cfif get.chkSENA EQ 1 >checked="checked"</cfif> />North America</label><br />
<label>
<input type="checkbox" id="chkSELA" name="chkSELA" value="1" <cfif get.chkSELA EQ 1 >checked="checked"</cfif> />Latin America</label><br />
<label>
<input type="checkbox" id="chkSEME" name="chkSEME" value="1" <cfif get.chkSEME EQ 1 >checked="checked"</cfif> />Middle East</label><br />
<label>
<input type="checkbox" id="chkSEE" name="chkSEE" value="1" <cfif get.chkSEE EQ 1 >checked="checked"</cfif> />Europe</label><br />
<label>
<input type="checkbox" id="chkSEA" name="chkSEA" value="1" <cfif get.chkSEA EQ 1 >checked="checked"</cfif> />Asia</label><br />
<label>
<input type="checkbox" id="chkSEAF" name="chkSEAF" value="1" <cfif get.chkSEAF EQ 1 >checked="checked"</cfif> />Africa</label><br />
<label>
<input type="checkbox" id="chkSMag" name="chkSMag" value="1" <cfif get.chkSMag EQ 1 >checked="checked"</cfif> />North Africa</label><br />
<label>
<input type="checkbox" id="chkSEEAF" name="chkSEEAF" value="1" <cfif get.chkSEEAF EQ 1 >checked="checked"</cfif> />East Africa</label><br />
<label>
<input type="checkbox" id="chkSEWA" name="chkSEWA" value="1" <cfif get.chkSEWA EQ 1 >checked="checked"</cfif> />West Africa</label><br />
</fieldset>