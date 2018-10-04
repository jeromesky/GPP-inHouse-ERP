<cfinclude template="qry_RegionInterest_email.cfm">
<script type="text/javascript">
	$('#areaOptionMail :checkbox').change(function(){
	
		var get_OptionMail = $(this).attr("checked") ? $(this).val() : 0
		var get_fieldName = $(this).attr("name");
				if(get_OptionMail == 1 ){
					//alert(get_fieldName);
					$.post("../user_Edit/Update_Options.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0,  "value" : 1 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
				}else{
					//alert(get_fieldName);
					$.post("../user_Edit/Update_Options.cfm", {id : <cfoutput>#form.userid#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1,  "value" : 0 }, function(rdata){ $('#UpdateStatus').html(rdata.status); }, "json");
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

<fieldset style=" display:block; float:left" id="areaOptionMail">
	<legend>Regions of Interest email <span id="UpdateStatus"></span></legend>
<INPUT TYPE="checkbox" NAME="chkWebIntAf" value="1"  id="chkWebIntAf" <cfif get.chkWebIntAf  EQ 1>  checked="checked"  </cfif>>
<cfif ListFindNoCase( unresitered, "chkWebIntAf" )>
  <em style="color:#FF0000">(Africa) </em> 
  <cfelse>
  Africa
</cfif> <em style="color:#FF0000">only use specific Africa region from now</em>
<br />
<input type="checkbox" name="chkWebIntNaf" value="1"    id="chkWebIntNaf" <cfif get.chkWebIntNaf  EQ 1>  checked="checked"  </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntNaf" )>
  <em style="color:#FF0000">North Africa </em>
  <cfelse>
  North Africa
</cfif>
<br />
<input type="checkbox" name="chkWebIntSAE" value="1"   id="chkWebIntSAE" <cfif get.chkWebIntSAE  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntSAE" )>
  <em style="color:#FF0000">Southern Africa </em>
  <cfelse>
  Southern Africa
</cfif>
<br />
<input type="checkbox" name="chkWebIntEAf" value="1"   id="chkWebIntEAf" <cfif get.chkWebIntEAf  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntEAf" )>
  <em style="color:#FF0000">Eastern Africa </em>
  <cfelse>
  Eastern Africa
</cfif>
<br />
<input type="checkbox" name="chkWebIntWAf" value="1"   id="chkWebIntWAf" <cfif get.chkWebIntWAf  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntWAf" )>
  <em style="color:#FF0000">Western Africa </em>
  <cfelse>
  Western Africa
</cfif>
<br>
<INPUT TYPE="checkbox" NAME="chkWebIntAs" value="1"   id="chkWebIntAs"<cfif get.chkWebIntAs  EQ 1>  checked="checked"  </cfif>  >
<cfif ListFindNoCase( unresitered, "chkWebIntAf" )>
  <em style="color:#FF0000">Asia </em>
  <cfelse>
  Asia
</cfif>
<br />
<INPUT TYPE="checkbox" NAME="chkWebIntAus" value="1"   id="chkWebIntAus"<cfif get.chkWebIntAus  EQ 1>  checked="checked"  </cfif>  >
<cfif ListFindNoCase( unresitered, "chkWebIntAus" )>
  <em style="color:#FF0000">Australia </em>
  <cfelse>
  Australia
</cfif>
<br />
<input type="checkbox" name="chkWebIntMe" value="1"  id="chkWebIntMe"<cfif get.chkWebIntMe  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntMe" )>
  <em style="color:#FF0000">Middle East </em>
  <cfelse>
  Middle East
</cfif>
<br />
<input type="checkbox" name="chkWebIntNa" value="1"   id="chkWebIntNa"  <cfif get.chkWebIntNa  EQ 1>  checked="checked"  </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntNa" )>
  <em style="color:#FF0000">North America </em>
  <cfelse>
  North America
</cfif>
<br />
<input type="checkbox" name="chkWebIntLa"  value="1"  id="chkWebIntLa" <cfif get.chkWebIntLa  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntLa" )>
  <em style="color:#FF0000">Latin America </em>
  <cfelse>
  Latin America
</cfif>
<br />
<input type="checkbox" name="chkWebIntEu"   value="1" id="chkWebIntEu" <cfif get.chkWebIntEu  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntEu" )>
  <em style="color:#FF0000">Europe </em>
  <cfelse>
  Europe
</cfif>
<br />
<input type="checkbox" name="chkWebIntWo"  value="1" id="chkWebIntWo" <cfif get.chkWebIntWo  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntWo" )>
  <em style="color:#FF0000">Worldwide </em>
  <cfelse>
  Worldwide
</cfif>
<br />
<input type="checkbox" name="chkWebIntGen"   value="1"  id="chkWebIntGen" <cfif get.chkWebIntGen  EQ 1>  checked="checked"  </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntGen" )>
  <em style="color:#FF0000">General </em>
  <cfelse>
  General
</cfif>
<br />
<input type="checkbox" name="chkWebIntAdvertising" <cfif get.chkWebIntAdvertising EQ 1  EQ 1>  checked="checked"  </cfif>  />
<cfif ListFindNoCase( unresitered, "chkWebIntAdvertising" )>
  <em style="color:#FF0000">3rd party </em>
  <cfelse>
  3rd party
</cfif>


<!---<cfif  parameterexists(form.newuser) >
<input type="hidden" name="step" value="9" />
<input type="hidden" name="userid" id="userid" value="<cfoutput>#userid#</cfoutput>" />
<input type="hidden" name="page" id="page" value="../user_functions/dsp_RegionInterest_post.cfm" />
<cfelse>--->
<hr />
<input type="checkbox" name="chkRecAlerts"  value="1" <cfif get.chkRecAlerts EQ 1 >  checked="checked"  </cfif>  />Do Not send emails
<!---</cfif>--->

<!---<b ></b>
				<i class="NoFormat"><button id="button_next">Next</button></i>--->
</fieldset>