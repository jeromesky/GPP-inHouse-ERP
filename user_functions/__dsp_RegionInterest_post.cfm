<cfinclude template="qry_RegionInterest_post.cfm">
<script type="text/javascript">
$('#areaPostalInterest :checkbox').change(function(){
	var get_PostalInt = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
			if(get_PostalInt == 1 ){
				$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0, "value" : 1 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
			}else{
				$.post("../user_Edit/Update_Individual.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1, "value" : 0 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
			}
});

<!--- if page called for new user hide button --->
<!---$(document).ready(function() { 
<cfif  parameterexists(form.newuser) >
				breadCrum(<cfoutput>#form.step#</cfoutput>);
<cfelse>
				$('#button_next').css({"display" : 'none' });
</cfif>
});--->
</script>
<!---<cfif  parameterexists(form.newuser) >
	<cfinclude template="../--New_User/Bread_crum.cfm">
</cfif>--->

<fieldset id="areaPostalInterest" style=" display:block; float:left">
<legend>Regions of Interest Post <span id="UpdateStatus"></span></legend>
<INPUT TYPE="checkbox" NAME="chkAF" value="1" id="chkAF" <cfif get.PostAfrica EQ 1>checked="checked"</cfif> >
(Africa) <em style="color:#FF0000">only use specific Africa region from now</em><br />
<input type="checkbox" name="chkMag" value="1" id="chkMag" <cfif get.PostMag EQ 1>checked="checked"</cfif> />
North Africa<br/>
<input type="checkbox" name="chSAE" value="1" id="chSAE" <cfif get.PostSAE EQ 1>checked="checked"</cfif> />
Southern Africa<br/>
<input type="checkbox" name="chkEAF" value="1" id="chkEAF" <cfif get.PostEAF EQ 1>checked="checked"</cfif> />
Eastern Africa<br/>
<input type="checkbox" name="chkWA" value="1" id="chkWA" <cfif get.PostWA EQ 1>checked="checked"</cfif> />
Western Africa <br>
<INPUT TYPE="checkbox" NAME="chkA" value="1" id="chkA" <cfif get.PostAsia EQ 1>checked="checked"</cfif> >
Asia<br/>
<INPUT TYPE="checkbox" NAME="chkIntPostAus" value="1" id="chkIntPostAus" <cfif get.PostAustralia EQ 1>checked="checked"</cfif> >
Australia<br/>
<input type="checkbox" name="chkME" value="1" id="chkME"<cfif get.PostMideast EQ 1>checked="checked"</cfif> />
Middle East<br />
<input type="checkbox" name="chkNA" value="1" id="chkNA" <cfif get.PostNorthAmerica EQ 1>checked="checked"</cfif> />
North America<br />
<input type="checkbox" name="chkL" value="1" id="chkL" <cfif get.PostLatin EQ 1>checked="checked"</cfif> />
Latin America<br />
<input type="checkbox" name="chkE" value="1" id="chkE" <cfif get.PostEurope EQ 1>checked="checked"</cfif> />
Europe<br />
<input type="checkbox" name="chkW" value="1" id="chkW" <cfif get.PostWorld EQ 1>checked="checked"</cfif> />
Worldwide<br/>
<hr />
<INPUT TYPE="checkbox" NAME="chkMail" value="1" id="chkMail" <cfif get.chkMail EQ 1>checked="checked"</cfif>><!---<cfif  parameterexists(form.newuser) > checked="checked"</cfif>--->
Do not Post<br>
<INPUT TYPE="checkbox" NAME="chkPrioPost" value="1" id="chkPrioPost" <cfif get.chkPrioPost EQ 1>checked="checked"</cfif>>
Primary Post<br>
<INPUT TYPE="checkbox" NAME="chkSecPost" value="1" id="chkSecPost" <cfif get.chkSecPost EQ 1>checked="checked"</cfif>>
Secondary Post<br />

<!---<b ></b>
				<!---<i class="NoFormat"><Input type="button" value="Finish" onclick="javascript:finalStep();" id="button_next"  ></i>--->
                <i class="NoFormat"><button id="button_next">Next</button></i>
<cfif  parameterexists(form.newuser) >
<input type="hidden" name="step" value="10" />
<input type="hidden" name="userid" id="userid" value="<cfoutput>#userid#</cfoutput>" />
<input type="hidden" name="page" id="page" value="../--New_User/dsp_userReview.cfm" />
</cfif>--->
</fieldset>