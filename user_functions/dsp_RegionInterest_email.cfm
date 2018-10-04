<cfset deliveryFormat = 1>
<cfinclude template="qry_regInterest.cfm">
<script type="text/javascript">
$('.emailArea:checkbox').change(function(){
	var fetch_emailAreaID = $(this).attr("checked") ? $(this).val() : 0
	$.post("../user_functions/qry_areas_Update.cfm", {"userid" : <cfoutput>#form.userid#</cfoutput>, "areaID": $(this).attr("id"), "value": fetch_emailAreaID, "deliveryFormat": 1 }, function(rdata){ $('#UpdateStatus').html(rdata); });
	$(this).parent().css('background-color', bgColor(fetch_emailAreaID)); 
});

$('#chkRecAlerts:checkbox').change(function(){
	var get_OptionMail = $(this).attr("checked") ? $(this).val() : 0
	$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": $(this).attr("name"), "oldValue": bitReturn(get_OptionMail), "value": get_OptionMail }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
});
</script>
<div class="ui-corner-top ui-widget ui-widget-content">
<fieldset id="area_option_Newsletters"><legend>Region of Interest e-mail <span id="UpdateStatus"></span></legend>
<div id="newsletter_pane">
<ul class="listMenu">
<cfoutput query="qry_areas"><li><input type="checkbox" name="areaID" class="emailArea" id="#qry_areas.areaID#" value="1" <cfif qry_areas.value NEQ "">checked="checked"</cfif> />
#qry_areas.areaName#</li></cfoutput>
</ul>
<!---<input type="checkbox" name="chkRecAlerts" id="chkRecAlerts" value="1" <cfif qryUser.chkRecAlerts EQ 1>checked="checked"</cfif> />Do Not send email announcements--->
</div>
</fieldset></div>
<!---<cfif qry_areas.areaDateEnd NEQ "">style="color:##FF0000"</cfif>--->
<!---			
	var get_fieldName = $(this).attr("name");
	if(get_OptionMail == 1 ){
			//alert(get_fieldName);
			$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0,  "value" : 1 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
				}else{
		//alert(get_fieldName);
			$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1,  "value" : 0 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
				}--->			
		<!---	if(get_ThisArea == 1 ){
		//alert(get_fieldName);
			$.post("../user_functions/qry_areas_Update.cfm", {"userid" : <cfoutput>#form.userid#</cfoutput>, "areaID": get_areaID, "value" : 1, "deliveryFormat" : 1 }, function(rdata){ $('#UpdateStatus').html(rdata);  });
				 $(this).parent().css('background-color', '#66FF99'); 
			}else{
		//alert(get_fieldName);
			$.post("../user_functions/qry_areas_Update.cfm", {"userid" : <cfoutput>#form.userid#</cfoutput>, "areaID": get_areaID, "value" : 0, "deliveryFormat" : 1 }, function(rdata){ $('#UpdateStatus').html(rdata); });
			$(this).parent().css('background-color', '#FFCC66');
			}--->