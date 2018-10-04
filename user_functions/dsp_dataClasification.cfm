<cfinclude template="qry_dataClasification.cfm">
<cfinclude template="../roles/qry_roles.cfm">
<script type="text/javascript">
 $(document).ready(function() {
<!--- <cfif  parameterexists(form.newuser) >
 		breadCrum(<cfoutput>#form.step#</cfoutput>);<cfelse>
		$('#button_next').css({"display" : 'none' });</cfif>--->
 $(".strIndSource").editable("../user_Edit/Update_Individual.cfm", { 
		  width	:205,
		  height:20,
		  indicator : '<img src="../img/indicator.gif">',
		  loadurl : '../components/JSON_Source.cfm',
		  type 	: "select",
		  style	: 'display: inline',
		  onblur : 'submit',
		  submitdata : function(value, settings) {
			var fieldname = $(this).attr("class");
			var oldvalue = this.revert;
			$("#pinBoardArea").append(oldvalue + "<br />");
			return {"fieldname": fieldname, "oldValue" : oldvalue, id: <cfoutput>#form.userid#</cfoutput>};
		  }
 });
 
  $(".lngSource_Code_ID").editable("../user_Edit/Update_Individual.cfm", { 
		indicator : '<img src="../img/indicator.gif">',
		loadurl : '../components/JSON_drop_directory.cfm',
		type : "select",
		width:205,
		height:20,
		style	: 'display: inline',
		onblur 	: 'submit',
		submitdata : function(value, settings) {
		  var fieldname = $(this).attr("class");
		  var oldvalue = this.revert;
		  $("#pinBoardArea").append(oldvalue + "<br />");
		  return {"fieldname": fieldname, "oldValue" : oldvalue, id: <cfoutput>#form.userid#</cfoutput>};
		}
 });
  });
<!---  $("#areaRole input[name='Role']").change(function(){
	var get_Role = $(this).val();
	//alert(get_Role );
	$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": "RoleID",  "value" : get_Role }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
});--->
</script>
<!---<cfif  parameterexists(form.newuser) >
	<cfinclude template="../--New_User/Bread_crum.cfm">
</cfif>--->
<cfoutput>
<fieldset id="areaRole">
<legend>Data classification <span id="UpdateStatus"></span></legend>
<b>Source</b>                                    
<i class="strIndSource" id="#getDataSource.userid#"><cfif getDataSource.recordSourced EQ "">Select Source<cfelse>#trim(getDataSource.recordSourced)#</cfif></i>           
<b>Directories</b>
<i class="lngSource_Code_ID" id="#getDataSource.userid#"><cfif getDataSource.directoriesName EQ "">Select Directory<cfelse>#getDataSource.directoriesName#</cfif></i>
<input type="hidden" name="lngSource_Code_ID" id="lngSource_Code_ID" value="#getDataSource.directoriesID#" />
<cfif parameterexists(form.newuser)>
<del class="ui-state-highlight ui-corner-all" style="margin-top: 5px; padding: 0pt 0.7em;">
<del class="ui-icon ui-icon-info" style="float: left; margin-right: 0.3em;"></del>Always Select a directory if possible</del>
</cfif>
<!---  <b>Role (BPA Desig)</b>
<i class="NoFormat"><cfloop query="qryRole">
<label><input type="radio" name="Role" value="#roleID#" <cfif qryRole.RoleID EQ get.roleID>checked=checked</cfif> >#roleLabel#</label></cfloop>
</i>--->
<!---<b ></b>
<i class="NoFormat"><button id="button_next">Next</button></i><cfif parameterexists(form.newuser) >
<input type="hidden" name="step" value="8" />
<input type="hidden" name="userid" id="userid" value="<cfoutput>#userid#</cfoutput>" />
<input type="hidden" name="page" id="page" value="../user_functions/dsp_RegionInterest_email.cfm" />
</cfif>--->
</fieldset></cfoutput>