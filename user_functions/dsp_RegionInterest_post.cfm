<cfset deliveryFormat = 2>
<cfinclude template="qry_regInterest.cfm">

<script type="text/javascript">
$('.postArea:checkbox').change(function(){
	var get_ThisArea = $(this).attr("checked") ? $(this).val() : 0
	$.post("../user_functions/qry_areas_Update.cfm", {"userid": <cfoutput>#form.userid#</cfoutput>, "areaID": $(this).attr("id"), "value": get_ThisArea, "deliveryFormat": 2 }, function(rdata){ 
		  var jsonData = eval(rdata);
		  if ( jsonData.update == 'successfull' ) {
			growl("Update", 'data updated successfully', 'message', 'ui-icon ui-icon-check', 'notice');
			$(this).parent().css('background-color', bgColor(1));
		  }
		  if ( jsonData.update == 'error' ) {
			growl("communication error", 'data change not saved', 'message', 'ui-icon ui-icon-check', 'error');
			$(this).parent().css('background-color', bgColor(0));
		  }
	}); 
});

$('#MailAllowArea :checkbox').change(function(){
		var get_OptionMail = $(this).attr("checked") ? $(this).val() : 0
		$.post("../user_Edit/Update_Individual.cfm", {id: <cfoutput>#form.userid#</cfoutput>, "fieldname": $(this).attr("name"), "oldValue": bitReturn(get_OptionMail),  "value": get_OptionMail }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
});
</script>
<div class="ui-corner-top ui-widget ui-widget-content">
<fieldset>
	<legend>Region of Interest Post</legend>
<ul class="listMenu" id="newsletter_pane">
<cfoutput query="qry_areas"><li>
<input type="checkbox" class="postArea" name="areaID" id="#qry_areas.areaID#" value="1" <cfif qry_areas.value NEQ ""> checked="checked" </cfif> />#qry_areas.areaName#
</li></cfoutput>
</ul>
    <!---    <div id="MailAllowArea">
        <label><INPUT TYPE="checkbox" NAME="chkMail" value="1" id="chkMail" <cfif qryUser.chkMail EQ 1>checked="checked"</cfif>> Do not Post</label>
        <label><INPUT TYPE="checkbox" NAME="chkPrioPost" value="1" id="chkPrioPost" <cfif qryUser.chkPrioPost EQ 1>checked="checked"</cfif>>Primary Post</label>
        <label><INPUT TYPE="checkbox" NAME="chkSecPost" value="1" id="chkSecPost" <cfif qryUser.chkSecPost EQ 1>checked="checked"</cfif>>Secondry Post</label>
		</div>--->
</fieldset></div>

<!---		var get_areaID = $(this).attr("id");
			if(get_ThisArea == 1 ){
				//alert(get_areaID);
			$.post("../user_functions/qry_areas_Update.cfm", {"userid" : <cfoutput>#form.userid#</cfoutput>, "areaID": get_areaID, "value" : 1, "deliveryFormat" : 2 }, function(rdata){ $('#UpdateStatus').html(rdata);  });
				 $(this).parent().css('background-color', '#66FF99'); 
			}else{
				//alert(get_areaID);
				$.post("../user_functions/qry_areas_Update.cfm", {"userid" : <cfoutput>#form.userid#</cfoutput>, "areaID": get_areaID, "value" : 0, "deliveryFormat" : 2 }, function(rdata){ $('#UpdateStatus').html(rdata); });
				$(this).parent().css('background-color', '#FFCC66');
			}--->
<!---			
           var get_fieldName = $(this).attr("name");
				if(get_OptionMail == 1 ){
					//alert(get_fieldName);
					$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0,  "value" : 1 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
				}else{
					//alert(get_fieldName);
					$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1,  "value" : 0 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
				}
--->