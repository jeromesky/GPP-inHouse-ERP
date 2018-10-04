<cfinclude template="qry_roles.cfm">
<script type="text/javascript">
 $(document).ready(function() {
   
  $("#areaRole input[name='Role']").change(function(){
	var get_Role = $(this).val();
	//alert(get_Role );
				$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": "RoleID",  "value" : get_Role }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
});

});
 </script>

<cfoutput>
<div  class="ui-corner-top ui-widget ui-widget-content  podForm">
<fieldset  id="areaRole">
<legend>User Role <span id="UpdateStatus"></span></legend>

                
<b>Role<br /> (BPA Desig)</b>
<i class="NoFormat">
<cfloop query="qryRole">
<label><input type="radio" name="Role"  value="#roleID#" <cfif qryRole.RoleID EQ get.roleID>checked=checked</cfif> >#roleLabel#</label>
</cfloop>
</i>
</fieldset></div></cfoutput>