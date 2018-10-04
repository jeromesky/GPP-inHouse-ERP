<cfinclude template="qry_Newsletters.cfm">

<script type="text/javascript">
$('.SelectNewsletter :checkbox').change(function(){
	var fetch_newsletterAction = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
	var get_newsletterID = $(this).attr("id");
			<!---if(get_Newsletters == 1 ){
				//alert(get_fieldName);
				$.post("../user_functions/qry_Newsletters_Update.cfm", {userid : <cfoutput>#form.userid#</cfoutput>, "newsletterID": $(this).attr("id"), "value" : 1 }, function(rdata){ $('#UpdateStatus').html(rdata);  });
				 $(this).parent().css('background-color', '#66FF99'); 
			}else{
				//alert(get_fieldName);
				$.post("../user_functions/qry_Newsletters_Update.cfm", {userid : <cfoutput>#form.userid#</cfoutput>, "newsletterID": $(this).attr("id"), "value" : 0 }, function(rdata){ $('#UpdateStatus').html(rdata); });
				$(this).parent().css('background-color', '#FFCC66');
			}--->
	$.post("../user_functions/qry_Newsletters_Update.cfm", {userid : <cfoutput>#form.userid#</cfoutput>, "newsletterID": $(this).attr("id"), "value": fetch_newsletterAction }, function(rdata){ $('#UpdateStatus').html(rdata); });
});

$('#userAllowSubs').change(function(){
	  var get_AllowSub = $(this).attr("checked") ? $(this).val() : 0
	  if(get_AllowSub == 1 ){
		  $.post("../User_Edit/Update_Individual.cfm", {id: <cfoutput>#form.userid#</cfoutput>, "fieldname": "userAllowSubs", "oldValue": 0, "value": 1 });
		  $(this).parent().css('background-color', '#66FF99');
	  }else{
		  $.post("../User_Edit/Update_Individual.cfm", {id: <cfoutput>#form.userid#</cfoutput>, "fieldname": "userAllowSubs", "oldValue": 1, "value": 0 });
		  $(this).parent().css('background-color', '#FFCC66');
	  }
});

	<!--- if page called for new user hide button --->
	$(document).ready(function() { 
		$('#area_option_mail').css({"width": '280px' });
		$('#newsletter_pane').css({"height": '460px', 'overflow': 'auto'});
	});
	$( ".accordion" ).accordion({autoHeight: false, animated: false, collapsible: true, active: false});
</script>

<div id="newsletter_pane">
<fieldset id="area_option_Newsletters" >
<legend>Newsletters <span id="UpdateStatus"> </span></legend>

<!---<label id="labelUserAllowSubs"></label>--->
<!---<input type="checkbox" name="userAllowSubs" id="userAllowSubs" value="1" <cfif userAllowSubscription.userAllowSubs EQ 1> checked="checked" </cfif>/>
<em <cfif userAllowSubscription.userAllowSubs EQ 1>style="color:##FF0000"</cfif>>Do not send any Newsletters</em>--->

<div class="accordion"><cfoutput query="get_newsletters"><cfif get_newsletters.currentrow NEQ 1 AND area NEQ get_newsletters.areaName><cfset area = "#get_newsletters.areaName#">
</div>
<h2>#get_newsletters.areaName#</h2>
<div><cfelseif get_newsletters.currentrow EQ 1><cfset area = "#get_newsletters.areaName#">
<h2>#get_newsletters.areaName#</h2><div></cfif>
<label class="SelectNewsletter" <cfif subActive EQ 0>style="color:##FF3300"</cfif>><input type="checkbox" name="newsletterID" id="#get_newsletters.newsletterid#" value="1" <cfif subActive EQ 1>checked=checked</cfif> />#get_newsletters.newsletterName#</label>
<cfif get_newsletters.currentrow EQ get_newsletters.recordcount></div></cfif></cfoutput></div>

</fieldset>
</div>
<!---<cfif  parameterexists(form.newuser) >
	<cfinclude template="../--New_User/Bread_crum.cfm">
</cfif>--->
<!---<b ></b>
<i class="NoFormat"><button id="button_next">Next</button></i>
<cfif  parameterexists(form.newuser)>
<input type="hidden" name="step" value="7" />
<input type="hidden" name="userid" id="userid" value="<cfoutput>#userid#</cfoutput>" />
<input type="hidden" name="page" id="page" value="../user_functions/dsp_dataClasification.cfm" />
</cfif>--->