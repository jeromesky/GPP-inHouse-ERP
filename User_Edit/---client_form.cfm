<cfinclude template="../application.cfm">
<!----<cftry> GET ALL DATA --->
<cfquery datasource="#gpp#" name="get">
 	select top 1 *
	from 
 		[CRM_Individual_Details]
	WHERE id = #form.id# <!---<cfqueryparam cfsqltype="cf_sql_integer" value=""><cfqueryparam cfsqltype="cf_sql_integer" value="">--->
</cfquery>

<script type="text/javascript">
var Client_ID = <cfoutput>#form.id#</cfoutput>;
var userID = <cfoutput>#form.id#</cfoutput>;

 $(document).ready(function() {
 	//show hide pinboard	
 
 $('<cfif get.Black_Listed EQ 1>.menu_BlackList, </cfif><cfif get.chkMail EQ 1> .menu_RegionIntPost, </cfif><cfif get.chkRecAlerts EQ 1>.menu_RegionIntMail, </cfif><cfif get.chkP21 EQ 1> .menu_newsletter, </cfif ><cfif get.status EQ "a"> .menu_status </cfif>').css( 'background-color' , '#FF6633' );
 //display archived in red
 <cfif get.status EQ "c">
 $('.archived').css({"visibility" : "hidden" })
 </cfif>

$('.Title').editable('../user_edit/Update_Individual.cfm', { 
	//		onblur: "ignore",
			width		: 179,
			height	 : 20,
			onblur 	: 'submit',
			style		: 'display: inline',
			//submit	: '<img src="../img/CRM_button_OK.jpg">', 
 			indicator : '<img src="../img/indicator.gif">',
			type : 'TagDragonTitle',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									var newvalue = $('#Title').val();
 								return {"fieldname": fieldname, "oldValue" : oldvalue, "value": newvalue, };
 								}
});
 <!---.strCity, --->
$('.intCode, .Addr_State, .strMobile_No, .userPhoNumbInt, .strEmail, .strEmail_Alt, .email_web, .strSecretary_Email, .strSurname, .strFirst_Name, .strDesignation, .password, .userMidlename ').editable('../user_edit/Update_Individual.cfm', { 
			height : 20,
			width		:200,
 			indicator : '<img src="../img/indicator.gif">',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
 									return {"fieldname": fieldname, "oldValue" : oldvalue };
 								},
			onblur 	: 'submit',
			style: 'display: inline'
 		});

$('#Black_Listed').live('click', function(){
	var get_Black_Listed		= $(this).attr("checked") ? $(this).val() : 0
			if(get_Black_Listed == 0 ){
				//alert("this should be 0");
				$('#area_blackList').css( 'background-color' , 'ffe5e5' );
				$.post("../user_edit/Update_Individual.cfm", {id : userID, 'value': 0, 'fieldname' : 'Black_Listed', "oldValue" : 1 });
			}else{
				//alert("this should be 1");
				$('#area_blackList').css( 'background-color' , 'ffffff' );
				$.post("../user_edit/Update_Individual.cfm", {id : userID, 'value': 1, 'fieldname' : 'Black_Listed', "oldValue" : 0 });
			}
}); 

 $('.strPostal_Adress, .strStreet_Adress, .Black_Listed_comment, .strPersonal_Info, .Perasonal_info_public').editable('../user_edit/Update_Individual.cfm', { 
			type : "textarea",
			height : 43,
			width		:190,
			style: 'display: inline',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
 								return {"fieldname": fieldname, "oldValue" : oldvalue };
 								},
 	indicator : '<img src="../img/indicator.gif">',
			onblur 	: 'submit'
});
			
 $('.strPhDirect_No, .strFaxDirect_No, .strPhSwitchboard_No, .strPhAlt1_No, .strFaxSwitchBoard_No, .strFaxAlt1_No').editable('../user_edit/Update_Individual.cfm', { 
			width		: 106,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
 								return {"fieldname": fieldname, "oldValue" : oldvalue };
 								},
 	indicator : '<img src="../img/indicator.gif">'
 		});
			
$('.AreaCodeTel, .AreaCodeTelSwitch, .AreaCodeTelAlt, .AreaCodeFax, .AreaCodeFaxSwitch, .AreaCodeFaxAlt').editable('../user_edit/Update_Individual.cfm', { 
			width		: 35,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
 								return {"fieldname": fieldname, "oldValue" : oldvalue };
 								},
 	indicator : '<img src="../img/indicator.gif">'
 		});

<!--- $('.CountryName').editable('../user_edit/Update_Individual.cfm', { 
	//		onblur: "ignore",
			width		: 179,
			height	 : 20,
			onblur 	: 'submit',
			style		: 'display: inline',
 			indicator : '<img src="../img/indicator.gif">',
			type : 'autoComleteCountry',
			submitdata : function(value, settings) {
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
									//$('.CountryName').html(newcountryname);
									$('#country_ID').val(newcountryid);
									//alert(newcountryname)
 								return {"fieldname": 'Countryid', "oldValue" : oldvalue, "value": newcountryid, };
								
 								}
});--->

<!--- $('.strCity').editable('../user_edit/Update_Individual.cfm', { 
	//		onblur: "ignore",
			width		: 179,
			height	 : 20,
			onblur 	: 'submit',
			style		: 'display: inline',
 			indicator : '<img src="../img/indicator.gif">',
			type : 'autoComleteCity',
			submitdata : function(value, settings) {
									//var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									var getCoutry_ID = $('#country_ID').val();
									
									$("#pinBoardArea").append(oldvalue + "<br />");
									//alert(newcountryname)
 								return {"fieldname": 'cityID', "oldValue" : oldvalue, "value": newcityID, "country_id" : getCoutry_ID, "strCity" : newcityName  };
								
 								}
});
 
 });--->
 
 $('form').live( 'submit', function() { 
 $(this).ajaxSubmit(); 
 return false; 
 }); 
</script>
<cfif get.recordCount eq 0 >
No results found
</cfif>
<cfinclude template="../user_functions/dsp_index.cfm">
<cfoutput query="get">
 <div id="rec_#get.id#">
	<table border="0" cellspacing="8" cellpadding="0" id="table">
 <tr>
 <td valign="top">
    <ul id="userMenu">
    <cfif get.fileName NEQ "">
    	<li style="text-align:center; padding:0px"><img src="http://www.petro21.com/_files/client/#get.fileName#" /></li>
    </cfif>
    <li ><a href="javascript:NewWindow('../files/index.cfm', 'tblIndividual', #form.id#, 0, 800, 500, 'Manage files');">Client Files</a></li>
      <li class="menu_status"><a href="javascript:loader('../user_functions/dsp_status.cfm', 'areaEditFunctions' , #get.id#, 0 );">Status</a></li>
      <li><a href="javascript:ExternalModalOpen('../User_Edit/User_print.cfm', #form.id#, 0, 920, 620, 'Manage Events');">Print this User</a></li>
 	<li><a href="javascript:loader('../user_functions/dsp_UserloginDetails.cfm', 'areaEditFunctions' , #get.id#, 0 );">User Login Details</a></li>
 <li ><a href="javascript:loader('../Industry_Sector/industry_sector.cfm', 'areaEditFunctions' , #get.id#, 0 );" style="color:##990000">Industry Sector</a></li>
  <li><a href="javascript:loader('../roles/dsp_roles.cfm', 'areaEditFunctions' , #get.id#, 0 );">User Role</a></li>
  <li><a href="javascript:loader('../user_functions/dsp_dataClasification.cfm', 'areaEditFunctions' , #get.id#, 0 );">Data classification</a></li>
 <li class="menu_newsletter"><a href="javascript:loader('../user_functions/dsp_Newsletters.cfm', 'areaEditFunctions' , #get.id#, 0 );" style="color:##990000">Newsletters</a></li>
 <li class="menu_RegionIntMail"><a href="javascript:loader('../user_functions/dsp_RegionInterest_email.cfm', 'areaEditFunctions' , #get.id#, 0 );" style="color:##990000">Region Interest email</a></li> <!---style="background-color:<cfif get.status EQ "a">##FF6633<cfelse>##66CC66</cfif>"--->
 <li class="menu_RegionIntPost"><a href="javascript:loader('../user_functions/dsp_RegionInterest_post.cfm', 'areaEditFunctions' , #get.id#, 0 );" style="color:##990000">Region Interest post</a></li>
 <li><a href="javascript:loader('../user_functions/dsp_PersonalNoteInternal.cfm', 'areaEditFunctions' , #get.id#, 0 );">Perrsonal Note (internal)</a></li>
 <li><a href="javascript:loader('../user_functions/dsp_PersonalNotePublic.cfm', 'areaEditFunctions' , #get.id#, 0 );">Perrsonal Note (public)</a></li>
 <li><a href="javascript:loader('../user_functions/dsp_Sposorship_Interest.cfm', 'areaEditFunctions' , #get.id#, 0 );">Sponsorship Interest</a></li>
 <li><a href="javascript:loader('../user_functions/dsp_Memberships.cfm', 'areaEditFunctions' , #get.id#, 0 );">Club Membership</a></li>
 <li><a href="javascript:ExternalModalOpen('../user_functions/dsp_userChanges.cfm', #get.id#, 0, 920, 620, 'View Changes');">User Changes</a></li>
 <li class="menu_BlackList"><a href="javascript:loader('../user_functions/dsp_black_listed.cfm', 'areaEditFunctions' , #get.id#, 0 );">Black Listed</a></li>
 <cfif  Listcontains("jerome,jason, babette, tanya",  trim(Session.username), ",")>
 <li><a href="javascript:loader('../user_functions/dsp_AdminRecord.cfm', 'areaEditFunctions' , #get.id#, 0 );">Edit Record</a></li></cfif>
 </ul> 

</td>
 <td valign="top">

<fieldset id="client" >
<legend>Personal Details</legend>
<b>Title</b>
<i class="Title" id="#get.id#">#get.title#</i>
<b>Name</b>
<i class="strFirst_Name" id="#get.id#">#get.name#</i>
<b>Middle name</b>
<i class="userMidlename" id="#get.id#">#get.userMidlename#</i>
<b>Surname</b>
<i class="strSurname" id="#get.id#">#get.surname#</i>
<b>Position</b> 
<i class="strDesignation" id="#get.id#">#get.position#</i>
<b>Company</b> 
<i class="company">#get.companyName#</i>
<i class="field_button_container NoFormat"><img src="../img/blue_But_Plus.jpg" border="0" onclick="$('##tabs_crm').tabs('select', 1);" /></i>
</fieldset>
 <!--- <i class="Title" id="#get.id#">#get.title#</i> 
		<i class="strFirst_Name" id="#get.id#">#get.name#</i> 
		<i class="strSurname" id="#get.id#">#get.surname#</i><br><br>--->
<fieldset >
<legend>Address</legend> 

<cf_Country_search_eip id="#get.id#" countryID="#get.countryid#" fildName="CountryName" country="#get.country#"  path="../user_edit/Update_Individual.cfm">
<!--- <b>Coutry</b> <i class="CountryName" id="#get.id#">#get.country# </i><input type="hidden" name="countryID" id="country_ID" value="#get.countryid#" />--->
<cf_city_search_eip id="#get.id#" cityID="#get.cityID#" fildName="strCity" cityName="#get.city#"  path="../user_edit/Update_Individual.cfm">
<!--- <b>City</b> <i class="strCity" id="#get.id#">#get.city# </i><input type="hidden" id="cityID" value="#get.cityID#" />--->
 <b>Address </b> <i class="strStreet_Adress" id="#get.id#">#get.strStreet_Adress#</i> 
 <b>Postal</b> <i class="strPostal_Adress" id="#get.id#">#get.strPostal_Adress# </i>
 <b>State</b> <i class="Addr_State" id="#get.id#">#get.Addr_State#</i> 
 <b>ZIP/Code</b> <i class="intCode" id="#get.id#">#Ucase(get.intCode)#</i> 
</fieldset>
</td>
 <td valign="top">
<fieldset >
		<legend>Communication</legend> 
 <b class="vtip" title="no need for country code">Tel</b>
 <i class="phoneCode vtip" title="country code is selected with country name">#get.countryPhoneCode#</i>
 <i class="AreaCodeTel" title="ares code" id="#get.id#">#get.AreaCodeTel#</i> 
 <i class="strPhDirect_No" id="#get.id#">#get.strPhDirect_No#</i>
 <b class="vtip" title="no need for country code">switchboard</b>
 		<i class="phoneCode vtip" title="country code is selected with country name">#get.countryPhoneCode#</i> 
 <i class="AreaCodeTelSwitch" title="ares code" id="#get.id#">#get.AreaCodeTelSwitch#</i> 
 <i class="strPhSwitchboard_No" id="#get.id#">#get.strPhSwitchboard_No#</i>
 <b class="vtip" title="no need for country code">Tel alt</b>
 		<i class="phoneCode vtip" title="country code is selected with country name">#get.countryPhoneCode#</i> 
 <i class="AreaCodeTelAlt" title="ares code" id="#get.id#">#get.AreaCodeTelAlt#</i> 
 <i class="strPhAlt1_No" id="#get.id#">#get.strPhAlt1_No#</i>
 <b class="vtip" title="no need for country code">Fax </b>
 		<i class="phoneCode vtip" title="country code is selected with country name">#get.countryPhoneCode#</i>
 <i class="AreaCodeFax" title="ares code" id="#get.id#">#get.AreaCodeFax#</i> 
 <i class="strFaxDirect_No" id="#get.id#">#get.strFaxDirect_No#</i>
 <b class="vtip" title="no need for country code">switchboard</b>
 		<i class="phoneCode vtip" title="country code is selected with country name">#get.countryPhoneCode#</i>
 <i class="AreaCodeFaxSwitch" title="ares code" id="#get.id#">#get.AreaCodeFaxSwitch#</i> 
 <i class="strFaxSwitchBoard_No" id="#get.id#">#get.strFaxSwitchBoard_No#</i>
 <b class="vtip" title="no need for country code">Fax alt</b>
 		<i class="phoneCode vtip" title="country code is selected with country name">#get.countryPhoneCode#</i> 
 <i class="AreaCodeFaxAlt" title="ares code" id="#get.id#">#get.AreaCodeFaxAlt#</i> 
 <i class="strFaxAlt1_No" id="#get.id#">#get.strFaxAlt1_No#</i>
 <b class="vtip" title="mobile number add international code">Mobile</b> 
 		<i class="strMobile_No" id="#get.id#">#get.strMobile_No#</i>
 <b class="vtip" title="International number add international code">Int. number</b> 
 		<i class="userPhoNumbInt" id="#get.id#">#get.userPhoNumbInt#</i> 
</fieldset>

<fieldset >
		<legend>Email</legend> 
 <b>Email</b> <i class="strEmail" id="#get.id#" style="display:inline">#lcase(get.strEmail)#</i>
 <b>Email alt</b> <i class="strEmail_Alt" id="#get.id#" style="display:inline">#lcase(get.strEmail_Alt)#</i>
 <b>Email sec</b> <i class="strSecretary_Email" id="#get.id#" style="display:inline">#lcase(get.strSecretary_Email)#</i>
 <b>Email web</b> <i class="email_web" id="#get.id#" style="display:inline">#lcase(get.email_web)#</i>
 <b>Password</b> <i class="password" id="#get.id#" style="display:inline">#get.password#</i>
</fieldset>
 </td>
 <td valign="top">
 <div id="areaEditFunctions"><cfinclude template="../user_functions/dsp_PersonalNoteInternal.cfm"></div>
 </td>
</tr>
 </table>
 </div></cfoutput> 
 
<script type="text/javascript">
$(document).ready(function() { 	
		
	 $('#changeDetails').submit(function() { 
			$(this).ajaxSubmit({ success: function() { $('#tabs').tabs('select', 0); },  clearForm: false 	}); 
			return false; 
		}); 

});
<!---function() { $('#tabs').tabs('select', 0); }--->
</script>
<!----- PIN BOARD DIV ---->
<div id="pinBoard">
	<div id="pinBoardHeader"></div>
	<div id="pinBoardArea"></div>
</div>

<!---$('#AreaClientIndustraySector :checkbox').change(function(){

	var get_ClientIndustraySector = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
			if(get_ClientIndustraySector == 1 ){
				
				$.post("Update_Individual.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 0, "value" : 1 });
			}else{
				$.post("Update_Individual.cfm", {id : <cfoutput>#form.id#</cfoutput>, "fieldname": get_fieldName, "oldValue" : 1, "value" : 0 });
			}
}); --->
<!--- $("#strPersonal_Info").charCounter(2000, {	format: "%1 of 2000"});
 $("#Perasonal_info_public").charCounter(1000, { format: "%1 of 1000"});--->
 <!--- $(".BPA_Designation").editable("../user_edit/Update_Individual.cfm?fieldname=BPA_Designation", { 
			indicator : '<img src="../img/indicator.gif">',
			loadurl 	: '../components/JSON_BPA-Designation.cfm',
			type 	: "select",
			width		:205,
			height	:20,
			style		: 'display: inline',
			onblur 	: 'submit',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
 								return {"fieldname": fieldname, "oldValue" : oldvalue, id : <cfoutput>#form.id#</cfoutput> };
 					}
 });--->
 <!---$(".STATUS").editable("Update_Individual.cfm", { 
			indicator : '<img src="../img/indicator.gif">',
			data : "{'C' : 'Current','A' : 'ARCHIVED' }",
			type : "select",
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									$("#pinBoardArea").append(oldvalue + "<br />");
										if(oldvalue == 'C' ){
											//alert('C');
											$('#area_status').css( 'background-color' , 'ffe5e5' );
										}else{
											//alert('A');
											$('#area_status').css( 'background-color' , '33CCCC' );
										}
 								return {"fieldname": fieldname, "oldValue" : oldvalue };
 								}
});	--->
<!---
		var options = {
					script:"../New_User/company_Suggest.cfm?json=true&",
					varname:"input",
					json:true,
					minchars: 5,
					timeout: 5500,
					delay: 100,
					callback: function (obj) { document.getElementById('lngCompany_ID').value = obj.id; }
				};
				var as_json = new AutoSuggest('SearchCompany', options);	

<cfcatch type="any">
<cfoutput>#cfcatch.Detail#<br>
#cfcatch.Message#<br>
#cfcatch.Type#
</cfoutput>
</cfcatch>
</cftry>--->
 <!---</form>--->
 <!---<form id="changeDetails" action="saveChanges.cfm" method="post">--->
<!--- <fieldset>
		<legend>Personal Note (internal)</legend>
 				<i class="strPersonal_Info" id="#get.id#">#Trim(get.strPersonal_Info)#</i>
</fieldset>

<fieldset>
		<legend>Personal Note (public) </legend>
 				<i class="Perasonal_info_public" id="#get.id#">#get.Perasonal_info_public#</i>
</fieldset>--->

 <!--- AREA LOAD CONTENT TO EDIT ------>
 
<!---<fieldset id="AreaClientIndustraySector">
		<legend>Industry Sector</legend>
 <label><input type="checkbox" name="chkExploration" id="IndustrySector" <cfif get.chkExploration EQ 1 > checked</cfif> > 
 Exploration&nbsp;&amp;&nbsp;Production</label><br />
 <label><input type="checkbox" name="chkPower" id="IndustrySector" <cfif get.chkPower EQ 1 > checked</cfif>> Power</label><br />
 <label> <input type="checkbox" name="chkRefining" id="IndustrySector" <cfif get.chkRefining EQ 1 > checked</cfif>> Down, Ref, PetroChem</label><br />
 <label> <input type="checkbox" name="chkGas" id="IndustrySector" <cfif get.chkGas EQ 1 > checked</cfif>>
 Gas</label>
 <br />
 <label> <input type="checkbox" name="chkRenBio" id="IndustrySector" <cfif get.chkRenBio EQ 1 > checked</cfif>>
 Renewable, Biofuel</label> 
 <br />
 <label> <input type="checkbox" name="industrySecEconomy" id="IndustrySector" <cfif get.industrySecEconomy EQ 1 > checked</cfif>> Economy</label> 
 </fieldset>--->
<!---

 $('.strSurname, .strFirst_Name').editable('Update_Individual.cfm?fieldname=strSurname', { 
				height : 20,
				width: 220,
 	indicator : '<img src="../img/indicator.gif">',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = $(this).val();
 								return {"fieldname": fieldname, "oldValue" : oldvalue };
 								},
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.Title').editable('Update_Individual.cfm?fieldname=Title', { 
 	id : 'id',
 	name : 'Title',
			height : 20,
			width: 220,
 	indicator : '<img src="../img/indicator.gif">',
 	loadurl 	: '../components/JSON_Titles.cfm',
			type 	: "select",
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function() {
			 return {id : <cfoutput>#form.id#</cfoutput>};
			}
 		});
 
 $('.strFirst_Name').editable('Update_Individual.cfm?fieldname=strFirst_Name', { 
 	id : 'id',
 	name : 'strFirst_Name',
			height : 20,
			width: 220,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline',
 		});
 $('.strSurname').editable('Update_Individual.cfm?fieldname=strSurname', { 
 	id : 'id',
 	name : 'strSurname',
				height : 20,
				width: 220,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
			
 $('.strDesignation').editable('Update_Individual.cfm?fieldname=strDesignation', { 
 	id : 'id',
 	name : 'strDesignation',
			type : "textarea",
			height : 48,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.intCode').editable('Update_Individual.cfm?fieldname=intCode', { 
 	id : 'id',
 	name : 'intCode',
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.strCity').editable('Update_Individual.cfm?fieldname=strCity', { 
 	id : 'id',
 	name : 'strCity',
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.strEmail').editable('Update_Individual.cfm?fieldname=strEmail', { 
 	id : 'id',
 	name : 'strEmail',
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
			style: 'display: inline',
			onblur 	: 'submit',
 	tooltip : 'Click to add'

 		});
 $('.strEmail_Alt').editable('Update_Individual.cfm?fieldname=strEmail_Alt', { 
 	id : 'id',
 	name : 'strEmail_Alt',
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});			
 $('.email_web').editable('Update_Individual.cfm?fieldname=email_web', {
 	id : 'id',
 	name : 'email_web',
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});	
 $('.strSecretary_Email').editable('Update_Individual.cfm?fieldname=strSecretary_Email', { 
 	id : 'id',
 	name : 'strSecretary_Email',
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});				
 $('.password').editable('Update_Individual.cfm?fieldname=password', { 
 	id : 'id',
 	name : 'password',
				height : 20,
				width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.strStreet_Adress').editable('Update_Individual.cfm?fieldname=strStreet_Adress', { 
 	id : 'id',
 	name : 'strStreet_Adress',
			type : "textarea",
			height : 48,
			width		:172,
			style: 'display: inline',
 	indicator : '<img src="../img/indicator.gif">',
			onblur 	: 'submit',
 	tooltip : 'Click to add'
 		});
 $('.Black_Listed_comment').editable('Update_Individual.cfm?fieldname=Black_Listed_comment', { 
 	id : 'id',
 	name : 'Black_Listed_comment',
			type : "textarea",
			height : 48,
			width		:172,
			style: 'display: inline',
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			callback : function(value) {
					$(".Black_Listed_Date").html(JavaDateToday);
				 }
 		});
$('#Black_Listed').change(function(){

	var get_Black_Listed		= $(this).attr("checked") ? $(this).val() : 0
			if(get_Black_Listed == 1 ){
				//alert("this is 1");
				$('#area_blackList').css( 'background-color' , 'ffe5e5' );
				$.post("Update_Individual.cfm?fieldname=Black_Listed", {id : <cfoutput>#form.id#</cfoutput>, Black_Listed : 1});
			}else{
				//alert("this is on 0f");
				$('#area_blackList').css( 'background-color' , 'ffffff' );
				$.post("Update_Individual.cfm?fieldname=Black_Listed", {id : <cfoutput>#form.id#</cfoutput>, Black_Listed : 0 });
			}
});
			
 $('.strPostal_Adress').editable('Update_Individual.cfm?fieldname=strPostal_Adress', { 

			type : "textarea",
			height : 48,
			width		:172,
			style: 'display: inline',
 	indicator : '<img src="../img/indicator.gif">',
			onblur 	: 'submit',
 	tooltip : 'Click to add'
 		});
 $('.strPhDirect_No').editable('Update_Individual.cfm?fieldname=strPhDirect_No', { 
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = $(this).val();
 								return {"fieldname": fieldname, "oldValue" : oldvalue };
 								},
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});
 $('.strFaxDirect_No').editable('Update_Individual.cfm?fieldname=strFaxDirect_No', { 
 	id : 'id',
 	name : 'strFaxDirect_No',
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});
 $('.strPhSwitchboard_No').editable('Update_Individual.cfm?fieldname=strPhSwitchboard_No', { 
 	id : 'id',
 	name : 'strPhSwitchboard_No',
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});
 $('.strPhAlt1_No').editable('Update_Individual.cfm?fieldname=strPhAlt1_No', { 
 	id : 'id',
 	name : 'strPhAlt1_No',
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});			
 $('.strFaxSwitchBoard_No').editable('Update_Individual.cfm?fieldname=strFaxSwitchBoard_No', { 
 	id : 'id',
 	name : 'strFaxSwitchBoard_No',
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});	
 $('.strFaxAlt1_No').editable('Update_Individual.cfm?fieldname=strFaxAlt1_No', { 
 	id : 'id',
 	name : 'strFaxAlt1_No',
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});			
 $('.strMobile_No').editable('Update_Individual.cfm?fieldname=strMobile_No', { 
 	id : 'id',
 	name : 'strMobile_No',
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});	
 		
			
$(".STATUS").editable(".cfm", { 
			id : 'id',
			name : 'STATUS',
			indicator : '<img src="../img/indicator.gif">',
			data : "{'C' : 'Current','A' : 'ARCHIVED' }",
			type : "select",
			style: 'display: inline',
			submitdata : function() {
				var getRecID = $(this).attr("id") ;
			 	return {id : getRecID };
 			}
 	 });	
	 
$(".country").editable("Update_Individual.cfm?fieldname=CountryName", { 
			id 		: 'id',
			name 	: 'CountryName',
			indicator : '<img src="../img/indicator.gif">',
			loadurl 	: '../components/JSON_country.cfm',
			type 	: "select",
			width		:172,
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function() {
			 return {id : <cfoutput>#form.id#</cfoutput>};
			}
 });
 $(".strIndSource").editable("Update_Individual.cfm?fieldname=strIndSource", { 
			id 		: 'id',
			name 	: 'strIndSource',
			width		:172,
			indicator : '<img src="../img/indicator.gif">',
			loadurl 	: '../components/JSON_Source.cfm',
			type 	: "select",
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function() {
			 return {id : <cfoutput>#form.id#</cfoutput>};
			}
 });
 $(".BPA_Designation").editable("Update_Individual.cfm?fieldname=BPA_Designation", { 
			id 		: 'id',
			name 	: 'BPA_Designation',
			indicator : '<img src="../img/indicator.gif">',
			loadurl 	: '../components/JSON_BPA-Designation.cfm',
			type 	: "select",
			width		:172,
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function() {
			 return {id : <cfoutput>#form.id#</cfoutput>};
			}
 });
 
 });
 ////////
--->
 <!----
 $('.strFaxDirect_No').editable('Update_Individual.cfm?fieldname=strFaxDirect_No', { 
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});
 $('.strPhSwitchboard_No').editable('Update_Individual.cfm?fieldname=strPhSwitchboard_No', { 
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});
 $('.strPhAlt1_No').editable('Update_Individual.cfm?fieldname=strPhAlt1_No', { 
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});			
 $('.strFaxSwitchBoard_No').editable('Update_Individual.cfm?fieldname=strFaxSwitchBoard_No', { 
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});	
 $('.strFaxAlt1_No').editable('Update_Individual.cfm?fieldname=strFaxAlt1_No', { 
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});			
 $('.strMobile_No').editable('Update_Individual.cfm?fieldname=strMobile_No', { 
			width		: 121,
			height	: 20,
			type : "text",
			style: 'display: inline',
			onblur 	: 'submit',
<!---			type : "masked",
				mask : "999 999 999 999",--->
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add'
 		});	
 		
			--->
			<!--- $('.strStreet_Adress').editable('Update_Individual.cfm?fieldname=strStreet_Adress', { 
			type : "textarea",
			height : 48,
			width		:172,
			style: 'display: inline',
 	indicator : '<img src="../img/indicator.gif">',
			onblur 	: 'submit',
 	tooltip : 'Click to add'
 		});
 $('.Black_Listed_comment').editable('Update_Individual.cfm?fieldname=Black_Listed_comment', { 
			type : "textarea",
			height : 48,
			width		:172,
			style: 'display: inline',
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			callback : function(value) {
					$(".Black_Listed_Date").html(JavaDateToday);
				 }
 		});--->
			 <!---
 $('.strFirst_Name').editable('Update_Individual.cfm?fieldname=strFirst_Name', { 
			height : 20,
			width: 220,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline',
 		});--->
<!---			
 $('.strDesignation').editable('Update_Individual.cfm?fieldname=strDesignation', { 
			type : "textarea",
			height : 48,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.intCode').editable('Update_Individual.cfm?fieldname=intCode', { 
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.strCity').editable('Update_Individual.cfm?fieldname=strCity', { 
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});
 $('.strEmail').editable('Update_Individual.cfm?fieldname=strEmail', { 
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
			style: 'display: inline',
			onblur 	: 'submit',
 	tooltip : 'Click to add'

 		});
 $('.strEmail_Alt').editable('Update_Individual.cfm?fieldname=strEmail_Alt', { 
 	id : 'id',
 	name : 'strEmail_Alt',
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});			
 $('.email_web').editable('Update_Individual.cfm?fieldname=email_web', {
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});	
 $('.strSecretary_Email').editable('Update_Individual.cfm?fieldname=strSecretary_Email', { 
			height : 20,
			width		:172,
 	indicator : '<img src="../img/indicator.gif">',
 	tooltip : 'Click to add',
			onblur 	: 'submit',
			style: 'display: inline'
 		});				--->
<!---$(".CountryName").editable("Update_Individual.cfm", { 
			indicator : '<img src="../img/indicator.gif">',
			loadurl 	: '../components/JSON_country.cfm',
			type 	: "select",
			width		:172,
			style: 'display: inline',
			onblur 	: 'submit',
			submitdata : function(value, settings) {
									var fieldname = $(this).attr("class");
									var oldvalue = this.revert;
									//split the return value
									var array_contryCode = value.split("|");
									//add country code to fields
									//alert(array_contryCode[1] );
									$(".phoneCode").html(array_contryCode[1]);
									//add old value to pin board
									$("#pinBoardArea").append(oldvalue + "<br />");
 								return {"fieldname": fieldname, "oldValue" : oldvalue, id : <cfoutput>#form.id#</cfoutput> };
 								}
 });--->			
 <!--- 
 <INPUT TYPE="checkbox" NAME="chkAF" id="chkAF" <cfif get.chkAF EQ 1> checked="checked" </cfif> >
 Africa
 <br /> 
 <input type="checkbox" name="chkMag" id="chkMag" <cfif get.chkMag EQ 1> checked="checked" </cfif> />
 North Africa <br />

 <input type="checkbox" name="chSAE" id="chSAE" <cfif get.chSAE EQ 1> checked="checked" </cfif> />
 Southern Africa
 <br />

 <input type="checkbox" name="chkEAF" id="chkEAF" <cfif get.chkEAF EQ 1> checked="checked" </cfif> />
 Eastern Africa <br />
 <input type="checkbox" name="chkWA" id="chkWA" <cfif get.chkWA EQ 1> checked="checked" </cfif> />
 Western Africa <br>
 <INPUT TYPE="checkbox" NAME="chkA" id="chkA" <cfif get.chkA EQ 1> checked="checked" </cfif> > 
 Asia <br />
 <INPUT TYPE="checkbox" NAME="chkIntPostAus" id="chkIntPostAus" <cfif get.chkIntPostAus EQ 1> checked="checked" </cfif> > 
 Australia <br />
<input type="checkbox" name="chkME" id="chkME"<cfif get.chkME EQ 1> checked="checked" </cfif> />
Middle East<br />

<input type="checkbox" name="chkNA" id="chkNA" <cfif get.chkNA EQ 1> checked="checked" </cfif> />
North America<br />

<input type="checkbox" name="chkL" id="chkL" <cfif get.chkL EQ 1> checked="checked" </cfif> />
Latin America<br />

<input type="checkbox" name="chkE" id="chkE" <cfif get.chkE EQ 1> checked="checked" </cfif> />
Europe<br />

<input type="checkbox" name="chkW" id="chkW" <cfif get.chkW EQ 1> checked="checked" </cfif> />
Worldwide <br />
<hr />
<INPUT TYPE="checkbox" NAME="chkMail" id="chkMail" <cfif get.chkMail EQ 1> checked="checked" </cfif>>
 Do not Post <br>
<INPUT TYPE="checkbox" NAME="chkPrioPost" id="chkPrioPost" <cfif get.chkPrioPost EQ 1> checked="checked" </cfif>>
 Primary Post<br>
<INPUT TYPE="checkbox" NAME="chkSecPost" id="chkSecPost" <cfif get.chkSecPost EQ 1> checked="checked" </cfif>>
 Secondary Post<br /><br /><input type="submit" value="save" name="save ">--->
 
 <!--- <table cellpadding="6" cellspacing="2" border="0">
 <tr>
<!--- <td class="JustRight" width="250"><strong>Companies</strong></td>--->
<!--- <td class="JustRight"><strong>BPA Designation</strong></td>--->
 <td class="JustRight"><strong></td>
 </tr>
 <tr>
<!--- <td valign="top" class="JustRight">
 <b>Company</b> 
 <cfif get.company EQ ""><i><input type="text" name="SearchCompany" id="SearchCompany" style="width:100px" class="inputField"> <input type="text" id="lngCompany_ID" name="lngCompany_ID" style="width:1px" class="inputField" /></i> <cfelse><i class="company"> #get.company#</i>
 <i class="button_New_Company"><a href="javascript:ExternalModalOpen('../companies/index.cfm', #get.id#);"><img src="../img/blue_But_Plus.jpg" border="0" /></a></i></cfif> 
 <b>Holding Company</b>
 <i >#get.Holding_Company#</i> </td>--->
<!--- <td class="JustRight">
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="SnrManagement" <cfif get.BPA_Designation EQ "SnrManagement"> checked</cfif> >Senior Management<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="Professional" <cfif get.BPA_Designation EQ "Professional"> checked</cfif>>Professional<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="Consultant" <cfif get.BPA_Designation EQ "Consultant"> checked</cfif>>Consultant<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="OpsManagement" <cfif get.BPA_Designation EQ "OpsManagement"> checked</cfif>>Operating Management<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="Marketing" <cfif get.BPA_Designation EQ "Marketing"> checked</cfif>>Marketing<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="MinistriesGov" <cfif get.BPA_Designation EQ "MinistriesGov"> checked</cfif>>Ministries / Government<br />
<input type="radio" name="BPA_Designation" id="BPA_Designation" value="HR_Training" <cfif get.BPA_Designation EQ "HR_Training"> checked</cfif>>Training / HR</td>--->
<td valign="top" class="JustRight">
 </td>
 </tr>
</table> --->

 	<!---<table border="0" cellspacing="5" cellpadding="0">
 <tr>
 <td valign="top">
 <label>
 <input type="checkbox" name="NL_W" <cfif get.NL_W EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkW" )><em style="color:##FF0000">Petro21 Worldwide Daily </em><cfelse>Petro21 Worldwide Daily</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkNOCNews" <cfif get.chkNOCNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkNOCNews" )><em style="color:##FF0000">National Oil Companies </em><cfelse>National Oil Companies</cfif> </label> </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkPCapNews" <cfif get.chkPCapNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkPCapNews" )><em style="color:##FF0000">PetroCapital Weekly </em><cfelse>PetroCapital Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="NL_LA" <cfif get.NL_LA EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkLA" )><em style="color:##FF0000">PetroLatino Weekly </em><cfelse>PetroLatino Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkCaNews" <cfif get.chkCaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkCaNews" )><em style="color:##FF0000">Worldwide Independents </em><cfelse>PetroCaribbean Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="NL_ME" <cfif get.NL_ME EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkME" )><em style="color:##FF0000">PetroArabian Weekly </em><cfelse>PetroArabian Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkMedNews" <cfif get.chkMedNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkMedNews" )><em style="color:##FF0000">PetroMediterranean </em><cfelse>PetroMediterranean </cfif> </label> </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="NL_EU" <cfif get.NL_EU EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkE" )><em style="color:##FF0000">PetroEuropa Weekly</em><cfelse>PetroEuropa Weekly</cfif> </label></label>
 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkNigerNews" <cfif get.chkNigerNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkNigerNews" )><em style="color:##FF0000">Nigeria Oil, Gas Weekly </em><cfelse>Nigeria Oil, Gas Weekly</cfif> </label></label>
 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkIndiaNews" <cfif get.chkIndiaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkIndiaNews" )><em style="color:##FF0000">India Oil, Gas Weekly </em><cfelse>India Oil, Gas Weekly</cfif> </label></label>
 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkBrazilNews" <cfif get.chkBrazilNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkBrazilNews" )><em style="color:##FF0000">Brazil Oil, Gas Weekly </em><cfelse>Brazil Oil, Gas Weekly</cfif> </label></label>
 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkChinaNews" <cfif get.chkChinaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkChinaNews" )><em style="color:##FF0000">China Oil, Gas Weekly </em><cfelse>China Oil, Gas Weekly</cfif> </label></label> 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkSuperNews" <cfif get.chkSuperNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkSuperNews" )><em style="color:##FF0000">Super-Majors Oil & Gas</em><cfelse>Super-Majors Oil & Gas</cfif> </label> </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkFrontierNews" <cfif get.chkFrontierNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkFrontierNews" )><em style="color:##FF0000">Frontier Exploration </em><cfelse>Frontier Exploration</cfif> </label> </label> </td>
 <td valign="top"><label>
 <input type="checkbox" name="chkWAENews" <cfif get.chkWAENews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkWAENews" )><em style="color:##FF0000">Western African Energy </em><cfelse>Western African Energy</cfif> </label> </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkEAENews" <cfif get.chkEAENews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkEAENews" )><em style="color:##FF0000">Eastern African Energy</em><cfelse>Eastern African Energy</cfif> </label> </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkSAENews" <cfif get.chkSAENews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkSAENews" )><em style="color:##FF0000">Southern African Energy </em><cfelse>Southern African Energy </cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="NL_AF" <cfif get.NL_AF EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkAF" )><em style="color:##FF0000">PetroAfricanus Weekly </em><cfelse>PetroAfricanus Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="NL_AS" <cfif get.NL_AS EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkA" )><em style="color:##FF0000">PetroAsiana Weekly</em><cfelse>PetroAsiana Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkPetMagNews" <cfif get.chkPetMagNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkPetMagNews" )><em style="color:##FF0000">PetroMaghreb Weekly</em><cfelse>PetroMaghreb Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkOzNews" <cfif get.chkOzNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkOzNews" )><em style="color:##FF0000">PetroAustralasia Weekly </em><cfelse>PetroAustralasia Weekly</cfif> </label></label>
 
<div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkRussiaNews" <cfif get.chkRussiaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkRussiaNews" )><em style="color:##FF0000">Russia Oil, Gas Weekly</em><cfelse>Russia Oil, Gas Weekly</cfif> </label></label>
 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkAngolaNews" <cfif get.chkAngolaNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkAngolaNews" )><em style="color:##FF0000">Worldwide Independents </em><cfelse>Angola Oil, Gas Weekly</cfif> </label></label>
 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkPetEurasNews" <cfif get.chkPetEurasNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkPetEurasNews" )><em style="color:##FF0000">PetroEurasia Weekly</em><cfelse>PetroEurasia Weekly</cfif> </label></label>
 
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkUSANews" <cfif get.chkUSANews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkUSANews" )><em style="color:##FF0000">USA Oil, Gas Weekly </em><cfelse>USA Oil, Gas Weekly</cfif> </label></label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkIraqNews" <cfif get.chkIraqNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkIraqNews" )><em style="color:##FF0000">Iraq Oil, Gas & Energy</em><cfelse>Iraq Oil, Gas & Energy</cfif> </label> </label>
 <div style="clear:both"></div>
 <label>
 <input type="checkbox" name="chkWorldIndNews" <cfif get.chkWorldIndNews EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkWorldIndNews" )><em style="color:##FF0000">Worldwide Independents </em><cfelse>Worldwide Independents</cfif> </label>
 <div style="clear:both; margin-top:10px; border-bottom:1px solid ##666666"></div> 
 <label>
 <input type="checkbox" name="chkP21" <cfif get.chkP21 EQ 1 EQ 1> checked="checked" </cfif> />
 <cfif ListFindNoCase( unresitered, "chkP21" )><em style="color:##FF0000">Do Not send Newsletters </em><cfelse>Do Not send Newsletters</cfif> </label> </label> </td>
 </tr>
 </table>--->