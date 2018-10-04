<cfinclude template="../application.cfm">
<cfquery datasource="#gppServer#" name="get">
 	select *
	from CRM_Individual_Communications
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<cfquery datasource="#gppdata#" name="getUnreg">
 SELECT RecordDetails
 FROM tblGlopacHistory
	WHERE RecordWorked = <cfqueryparam value="#form.id#">
</cfquery>
<cfset unresitered = #valueList(getUnreg.RecordDetails, ",")#>
<!---<script type="text/javascript">

$('.area_option_mail :checkbox').change(function(){

	var get_Newsletters = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
			if(get_Newsletters == 1 ){
				//alert(get_fieldName);
				$.post("Update_Options.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0, "value" : 1 });
			}else{
				//alert(get_fieldName);
				$.post("Update_Options.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1, "value" : 0 });
			}
});

$('#areaPostalInterest :checkbox').change(function(){

	var get_PostalInt = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
			if(get_PostalInt == 1 ){
				
				$.post("Update_Individual.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0, "value" : 1 });
			}else{
				
				$.post("Update_Individual.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1, "value" : 0 });
			}
});

$('#AreaSeInterest :checkbox').change(function(){

	var get_Se = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
			if(get_Se == 1 ){
				
				$.post("Update_Options.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0, "value" : 1 });
			}else{
				
				$.post("Update_Options.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1, "value" : 0 });
			}
});

</script>
--->
<fieldset style="width:380px; display:block; float:left" class="area_option_mail">
<legend>Newsletters</legend>
<table border="0" cellspacing="5" cellpadding="0" width="100%" >
 <tr>
 <td valign="top"><label>
 <input type="checkbox" name="chkW" value="1" <cfif get.chkW EQ 1>checked="checked"</cfif> />
 <cfif ListFindNoCase( unresitered, "chkW" )>
 <em style="color:#FF0000">Petro21 Worldwide Daily</em>
 <cfelse>
 Petro21 Worldwide Daily
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkNOCNews" value="1" <cfif get.chkNOCNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkNOCNews" )>
 <em style="color:#FF0000">National Oil Companies </em>
 <cfelse>
 National Oil Companies
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkPCapNews" value="1" <cfif get.chkPCapNews EQ 1>checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkPCapNews" )>
 <em style="color:#FF0000">PetroCapital Weekly </em>
 <cfelse>
 PetroCapital Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkWorldIndNews" value="1" <cfif get.chkWorldIndNews EQ 1>checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkWorldIndNews" )>
 <em style="color:#FF0000">Worldwide Independents </em>
 <cfelse>
 Worldwide Independents
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkCaNews" value="1" <cfif get.chkCaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkCaNews" )>
 <em style="color:#FF0000">Worldwide Independents </em>
 <cfelse>
 PetroCaribbean Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkFrontierNews" value="1" <cfif get.chkFrontierNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkFrontierNews" )>
 <em style="color:#FF0000">Frontier Exploration </em>
 <cfelse>
 Frontier Exploration
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkSuperNews" value="1" <cfif get.chkSuperNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkSuperNews" )>
 <em style="color:#FF0000">Super-Majors Oil & Gas</em>
 <cfelse>
 Super-Majors Oil & Gas
 </cfif>
 </label>
 </label>
 <div style="clear:both"></div>
 <hr />
 <label>
 <input type="checkbox" name="chkME" value="1" <cfif get.chkME EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkME" )>
 <em style="color:#FF0000">PetroArabian Weekly </em>
 <cfelse>
 PetroArabian Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkIraqNews" value="1" <cfif get.chkIraqNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkIraqNews" )>
 <em style="color:#FF0000">Iraq Oil, Gas & Energy</em>
 <cfelse>
 Iraq Oil, Gas & Energy
 </cfif>
 </label>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkMedNews" value="1" <cfif get.chkMedNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkMedNews" )>
 <em style="color:#FF0000">PetroMediterranean </em>
 <cfelse>
 PetroMediterranean
 </cfif>
 </label>
 <div style="clear:both"></div>
 <hr />
 <label>
 <input type="checkbox" name="chkBrazilNews" value="1" <cfif get.chkBrazilNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkBrazilNews" )>
 <em style="color:#FF0000">Brazil Oil, Gas Weekly </em>
 <cfelse>
 Brazil Oil, Gas Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkLA" value="1" <cfif get.chkLA EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkLA" )>
 <em style="color:#FF0000">PetroLatino Weekly </em>
 <cfelse>
 PetroLatino Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkUSANews" value="1" <cfif get.chkUSANews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkUSANews" )>
 <em style="color:#FF0000">USA Oil, Gas Weekly </em>
 <cfelse>
 USA Oil, Gas Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <hr />
 <label>
 <input type="checkbox" name="chkAtlanticNews" value="1" <cfif get.chkAtlanticNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkAtlanticNews" )>
 <em style="color:#FF0000">Atlantic Ocean Oil & Gas </em>
 <cfelse>
 Atlantic Ocean Oil & Gas
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkPetEurasNews" value="1" <cfif get.chkPetEurasNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkPetEurasNews" )>
 <em style="color:#FF0000">PetroEurasia Weekly</em>
 <cfelse>
 PetroEurasia Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkE" value="1" <cfif get.chkE EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkE" )>
 <em style="color:#FF0000">PetroEuropa Weekly</em>
 <cfelse>
 PetroEuropa Weekly
 </cfif>
 </label>
 <div style="clear:both"></div></td>
 <td valign="top"><label>
 <input type="checkbox" name="chkWAENews" value="1" <cfif get.chkWAENews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkWAENews" )>
 <em style="color:#FF0000">Western African Energy </em>
 <cfelse>
 Western African Energy
 </cfif>
 </label>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkEAENews" value="1" <cfif get.chkEAENews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkEAENews" )>
 <em style="color:#FF0000">Eastern African Energy</em>
 <cfelse>
 Eastern African Energy
 </cfif>
 </label>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkSAENews" value="1" <cfif get.chkSAENews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkSAENews" )>
 <em style="color:#FF0000">Southern African Energy </em>
 <cfelse>
 Southern African Energy
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkAF" value="1" <cfif get.chkAF EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkAF" )>
 <em style="color:#FF0000">PetroAfricanus Weekly </em>
 <cfelse>
 PetroAfricanus Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkPetMagNews" value="1" <cfif get.chkPetMagNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkPetMagNews" )>
 <em style="color:#FF0000">PetroMaghreb Weekly</em>
 <cfelse>
 PetroMaghreb Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkNigerNews" value="1" <cfif get.chkNigerNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkNigerNews" )>
 <em style="color:#FF0000">Nigeria Oil, Gas Weekly </em>
 <cfelse>
 Nigeria Oil, Gas Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkAngolaNews" value="1" <cfif get.chkAngolaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkAngolaNews" )>
 <em style="color:#FF0000">Worldwide Independents </em>
 <cfelse>
 Angola Oil, Gas Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <hr />
 <label>
 <input type="checkbox" name="chkA" value="1" <cfif get.chkA EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkA" )>
 <em style="color:#FF0000">PetroAsiana Weekly</em>
 <cfelse>
 PetroAsiana Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkOzNews" value="1" <cfif get.chkOzNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkOzNews" )>
 <em style="color:#FF0000">PetroAustralasia Weekly </em>
 <cfelse>
 PetroAustralasia Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkRussiaNews" value="1" <cfif get.chkRussiaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkRussiaNews" )>
 <em style="color:#FF0000">Russia Oil, Gas Weekly</em>
 <cfelse>
 Russia Oil, Gas Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkIndiaNews" value="1" <cfif get.chkIndiaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkIndiaNews" )>
 <em style="color:#FF0000">India Oil, Gas Weekly </em>
 <cfelse>
 India Oil, Gas Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkChinaNews" value="1" <cfif get.chkChinaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkChinaNews" )>
 <em style="color:#FF0000">China Oil, Gas Weekly </em>
 <cfelse>
 China Oil, Gas Weekly
 </cfif>
 </label>
 <div style="clear:both"></div>
 <hr />
 <label>
 <input type="checkbox" name="chkP21" value="1" <cfif get.chkP21 EQ 1 EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkP21" )>
 <em style="color:#FF0000">Do Not send Newsletters </em>
 <cfelse>
 Do Not send Newsletters
 </cfif>
 </label>
 </label>
 </td>
 </tr>
</table>
</fieldset>
<fieldset style=" display:block; float:left" class="area_option_mail">
<legend>Regions of Interest email</legend>
<INPUT TYPE="checkbox" NAME="chkWebIntAf" value="1" id="chkWebIntAf" <cfif get.chkWebIntAf EQ 1> checked="checked" </cfif>>
<cfif ListFindNoCase( unresitered, "chkWebIntAf" )>
 <em style="color:#FF0000">Africa </em>
 <cfelse>
 Africa
</cfif>
<br />
<input type="checkbox" name="chkWebIntNaf" value="1" id="chkWebIntNaf" <cfif get.chkWebIntNaf EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntNaf" )>
 <em style="color:#FF0000">North Africa </em>
 <cfelse>
 North Africa
</cfif>
<br />
<input type="checkbox" name="chkWebIntSAE" value="1" id="chkWebIntSAE" <cfif get.chkWebIntSAE EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntSAE" )>
 <em style="color:#FF0000">Southern Africa </em>
 <cfelse>
 Southern Africa
</cfif>
<br />
<input type="checkbox" name="chkWebIntEAf" value="1" id="chkWebIntEAf" <cfif get.chkWebIntEAf EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntEAf" )>
 <em style="color:#FF0000">Eastern Africa </em>
 <cfelse>
 Eastern Africa
</cfif>
<br />
<input type="checkbox" name="chkWebIntWAf" value="1" id="chkWebIntWAf" <cfif get.chkWebIntWAf EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntWAf" )>
 <em style="color:#FF0000">Western Africa </em>
 <cfelse>
 Western Africa
</cfif>
<br>
<INPUT TYPE="checkbox" NAME="chkWebIntAs" value="1" id="chkWebIntAs"<cfif get.chkWebIntAs EQ 1> checked="checked" </cfif> >
<cfif ListFindNoCase( unresitered, "chkWebIntAf" )>
 <em style="color:#FF0000">Asia </em>
 <cfelse>
 Asia
</cfif>
<br />
<INPUT TYPE="checkbox" NAME="chkWebIntAus" value="1" id="chkWebIntAus"<cfif get.chkWebIntAus EQ 1> checked="checked" </cfif> >
<cfif ListFindNoCase( unresitered, "chkWebIntAus" )>
 <em style="color:#FF0000">Australia </em>
 <cfelse>
 Australia
</cfif>
<br />
<input type="checkbox" name="chkWebIntMe" value="1" id="chkWebIntMe"<cfif get.chkWebIntMe EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntMe" )>
 <em style="color:#FF0000">Middle East </em>
 <cfelse>
 Middle East
</cfif>
<br />
<input type="checkbox" name="chkWebIntNa" value="1" id="chkWebIntNa" <cfif get.chkWebIntNa EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntNa" )>
 <em style="color:#FF0000">North America </em>
 <cfelse>
 North America
</cfif>
<br />
<input type="checkbox" name="chkWebIntLa" value="1" id="chkWebIntLa" <cfif get.chkWebIntLa EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntLa" )>
 <em style="color:#FF0000">Latin America </em>
 <cfelse>
 Latin America
</cfif>
<br />
<input type="checkbox" name="chkWebIntEu" value="1" id="chkWebIntEu" <cfif get.chkWebIntEu EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntEu" )>
 <em style="color:#FF0000">Europe </em>
 <cfelse>
 Europe
</cfif>
<br />
<input type="checkbox" name="chkWebIntWo" value="1" id="chkWebIntWo" <cfif get.chkWebIntWo EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntWo")>
 <em style="color:#FF0000">Worldwide</em>
 <cfelse>
 Worldwide
</cfif>
<br />
<input type="checkbox" name="chkWebIntGen" value="1" id="chkWebIntGen" <cfif get.chkWebIntGen EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntGen")>
 <em style="color:#FF0000">General</em>
 <cfelse>
 General
</cfif>
<br />
<input type="checkbox" name="chkWebIntAdvertising" <cfif get.chkWebIntAdvertising EQ 1 EQ 1> checked="checked" </cfif> />
<cfif ListFindNoCase( unresitered, "chkWebIntAdvertising" )>
 <em style="color:#FF0000">3rd party</em>
 <cfelse>
 3rd party
</cfif>
<hr />
<input type="checkbox" name="chkRecAlerts" value="1" <cfif get.chkRecAlerts EQ 1 > checked="checked" </cfif> />
Do Not send emails
</fieldset>
<fieldset id="areaPostalInterest" style=" display:block; float:left">
<legend>Regions of Interest Post</legend>
<INPUT TYPE="checkbox" NAME="chkAF" value="1" id="chkAF" <cfif get.PostWorld EQ 1> checked="checked" </cfif> >
Africa <br />
<input type="checkbox" name="chkMag" value="1" id="chkMag" <cfif get.PostMag EQ 1> checked="checked" </cfif> />
North Africa <br />
<input type="checkbox" name="chSAE" value="1" id="chSAE" <cfif get.PostSAE EQ 1> checked="checked" </cfif> />
Southern Africa <br />
<input type="checkbox" name="chkEAF" value="1" id="chkEAF" <cfif get.PostEAF EQ 1> checked="checked" </cfif> />
Eastern Africa <br />
<input type="checkbox" name="chkWA" value="1" id="chkWA" <cfif get.PostWA EQ 1> checked="checked" </cfif> />
Western Africa <br>
<INPUT TYPE="checkbox" NAME="chkA" value="1" id="chkA" <cfif get.PostAsia EQ 1> checked="checked" </cfif> >
Asia <br />
<INPUT TYPE="checkbox" NAME="chkIntPostAus" value="1" id="chkIntPostAus" <cfif get.PostAustralia EQ 1> checked="checked" </cfif> >
Australia <br />
<input type="checkbox" name="chkME" value="1" id="chkME"<cfif get.PostMideast EQ 1> checked="checked" </cfif> />
Middle East<br />
<input type="checkbox" name="chkNA" value="1" id="chkNA" <cfif get.PostNorthAmerica EQ 1> checked="checked" </cfif> />
North America<br />
<input type="checkbox" name="chkL" value="1" id="chkL" <cfif get.PostLatin EQ 1> checked="checked" </cfif> />
Latin America<br />
<input type="checkbox" name="chkE" value="1" id="chkE" <cfif get.PostEurope EQ 1> checked="checked" </cfif> />
Europe<br />
<input type="checkbox" name="chkW" value="1" id="chkW" <cfif get.PostWorld EQ 1> checked="checked" </cfif> />
Worldwide <br />
<hr />
<INPUT TYPE="checkbox" NAME="chkMail" value="1" id="chkMail" <cfif get.chkMail EQ 1> checked="checked" </cfif>>
Do not Post <br>
<INPUT TYPE="checkbox" NAME="chkPrioPost" value="1" id="chkPrioPost" <cfif get.chkPrioPost EQ 1> checked="checked" </cfif>>
Primary Post<br>
<INPUT TYPE="checkbox" NAME="chkSecPost" value="1" id="chkSecPost" <cfif get.chkSecPost EQ 1> checked="checked" </cfif>>
Secondary Post
</fieldset>
<fieldset id="AreaSeInterest" style=" display:block; float:left">
<legend>S&E Potential</legend>
<label>
<input type="checkbox" id="chkSE" name="chkSE" value="1" <cfif get.chkSE EQ 1 >checked="checked"</cfif> />
S&E Potential</label>
<br />
<label>
<input type="checkbox" id="chkSEW" name="chkSEW" value="1" <cfif get.chkSEW EQ 1 >checked="checked"</cfif> />
Worldwide</label>
<br />
<label>
<input type="checkbox" id="chkSENA" name="chkSENA" value="1" <cfif get.chkSENA EQ 1 >checked="checked"</cfif> />
North America</label>
<br />
<label>
<input type="checkbox" id="chkSELA" name="chkSELA" value="1" <cfif get.chkSELA EQ 1 >checked="checked"</cfif> />
Latin America</label>
<br />
<label>
<input type="checkbox" id="chkSEME" name="chkSEME" value="1" <cfif get.chkSEME EQ 1 >checked="checked"</cfif> />
Midle East</label>
<br />
<label>
<input type="checkbox" id="chkSEE" name="chkSEE" value="1" <cfif get.chkSEE EQ 1 >checked="checked"</cfif> />
Europe</label>
<br />
<label>
<input type="checkbox" id="chkSEA" name="chkSEA" value="1" <cfif get.chkSEA EQ 1 >checked="checked"</cfif> />
Asia</label>
<br />
<label>
<input type="checkbox" id="chkSEAF" name="chkSEAF" value="1" <cfif get.chkSEAF EQ 1>checked="checked"</cfif> />
Africa</label>
<br />
<label>
<input type="checkbox" id="chkSMag" name="chkSMag" value="1" <cfif get.chkSMag EQ 1>checked="checked"</cfif> />
North Africa</label>
<br />
<label>
<input type="checkbox" id="chkSEEAF" name="chkSEEAF" value="1" <cfif get.chkSEEAF EQ 1>checked="checked"</cfif> />
East Africa</label>
<br />
<label>
<input type="checkbox" id="chkSEWA" name="chkSEWA" value="1" <cfif get.chkSEWA EQ 1>checked="checked"</cfif> />
West Africa</label>
<br />
</fieldset>
<div style="clear:both"></div>