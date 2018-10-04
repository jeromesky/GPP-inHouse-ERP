<cfinclude template="../application.cfm">
<!--- <cftry> GET ALL DATA --->
<cfquery datasource="#gpp#" name="qryUser">
 	select top 1 *
	from 
   [CRM_Individual_Details]
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#"> 
</cfquery>

<cfquery name="contacts" datasource="#gpp#">
SELECT   TOP 8
		 dbo.Types.typeLabel, dbo.contacts.contactName, dbo.contacts.contactEmail
FROM         
		dbo.user2contact INNER JOIN
                      dbo.contacts ON dbo.user2contact.contactID = dbo.contacts.contactID INNER JOIN
                      dbo.Types ON dbo.contacts.ContactType = dbo.Types.typeID
WHERE
		dbo.user2contact.userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<!---<cfqueryparam cfsqltype="cf_sql_integer" value=""><cfqueryparam cfsqltype="cf_sql_integer" value="">--->
<cfset branches = 0>
<cfif qryUser.branchID GT 0>
  <cfset branches = 1>
</cfif>
<script type="text/javascript"><cfoutput>
<!---var individual = {};
individual.userID = 0;
individual.companyID = 0;
individual.branchID = 0;
individual.AKA_companyID = 0;--->

var individual = {};
individual.userID = #form.id#;
individual.companyID = #qryUser.companyID#;
individual.branchID = #qryUser.branchID#;
individual.AKA_companyID = #qryUser.AKA_companyID#;

function openUserWindows(url,modal ){
	openWindow({ 'url': url, 'param': {'companyID' : individual.companyID, 'AKA_companyID' : individual.AKA_companyID, 'userID' : individual.userID, 'branchID' : individual.branchID }, 'Args': modals[modal] });
}

var Client_ID = #form.id#;
var userID = #form.id#</cfoutput> ;

 $(document).ready(function() {
 	//show hide pinboard	
	$('#showIDsHere').html("userID: " + individual.userID + "<br> companyID: " + individual.companyID + "<br> branchID: " + individual.branchID + "<br> labelID: " + individual.AKA_companyID ); <!------>
 
 $('<cfif qryUser.Black_Listed EQ 1>.menu_BlackList, </cfif><cfif qryUser.posting eq 0> .menu_RegionIntPost, </cfif><cfif qryUser.anouncements eq 0>.menu_RegionIntMail, </cfif><cfif qryUser.newsletters eq 0> .menu_newsletter, </cfif ><cfif qryUser.active EQ "0"> .menu_status </cfif>').css( 'background-color', '#FF6633' );
 //display archived in red
 <cfif qryUser.active EQ "1">
 $('.archived').css({"visibility" : "hidden" })
 </cfif>

$('#posting').live('change', function(){
    $.post("../user_edit/Update_Individual.cfm", {id : individual.userID, 'value': $('#posting').val(), 'fieldname' : 'posting' });
}); 

$('#anouncements').live('click', function(){
	var status  = $(this).attr("checked") ? $(this).val() : 0
  	if(status == 0 ){
    $.post("../user_edit/Update_Individual.cfm", {id : individual.userID, 'value': 0, 'fieldname' : 'anouncements', "oldValue" : 1 });
  	}else{
    $.post("../user_edit/Update_Individual.cfm", {id : individual.userID, 'value': 1, 'fieldname' : 'anouncements', "oldValue" : 0 });
  	}
}); 

$('#newsletters').live('click', function(){
	var status  = $(this).attr("checked") ? $(this).val() : 0
  	if(status == 0 ){
    $.post("../user_edit/Update_Individual.cfm", {id : individual.userID, 'value': 0, 'fieldname' : 'newsletters', "oldValue" : 1 });
  	}else{
    $.post("../user_edit/Update_Individual.cfm", {id : individual.userID, 'value': 1, 'fieldname' : 'newsletters', "oldValue" : 0 });
  	}
}); 

<cfif qryUser.active NEQ 5>
$('#Black_Listed').live('click', function(){

	var get_Black_Listed = $(this).attr("checked") ? $(this).val() : 0
  	if(get_Black_Listed == 0 ){
    //alert("this should be 0");
    $('#area_blackList').css( 'background-color', 'ffe5e5' );
    $.post("../user_edit/Update_Individual.cfm", {id : userID, 'value': 0, 'fieldname' : 'Black_Listed', "oldValue" : 1 });
  	}else{
    //alert("this should be 1");
    $('#area_blackList').css( 'background-color', 'ffffff' );
    $.post("../user_edit/Update_Individual.cfm", {id : userID, 'value': 1, 'fieldname' : 'Black_Listed', "oldValue" : 0 });
  	}
}); 

  var textAreas = '.strPostal_Adress, .strStreet_Adress, .Black_Listed_comment, .strPersonal_Info, .Perasonal_info_public';

  $(textAreas).editable(submitEdit, { 
    height   : 49,
  	width  : 202,
  	type   : "textarea",
  	indicator  : '<img src="../img/indicator.gif">',
          tooltip    : "Click to edit...",
            onblur   : 'submit',
  	style  : 'display: inline'
  });
  	
  var fieldText200 = '.intCode, .Addr_State, .mobileNo, .ph_intNo, .strEmail, .strEmail_Alt, .email_web, .email_subs, .strSecretary_Email, .strSurname, .strFirst_Name, .strDesignation, .password, .userMidlename';
  $(fieldText200).editable(submitEdit, { 
            height   : 12,
  	width  : 200,
  	type   : "text",
  	indicator  : '<img src="../img/indicator.gif">',
            tooltip    : "Click to edit...",
            onblur   : 'submit',
  	style  : 'display: inline'
  	});
  	
  var fieldText100 = '.ph_No, .fax_No, .strPhSwitchboard_No, .ph_NoAlt, .strFaxSwitchBoard_No, .fax_NoAlt';
   $(fieldText100).editable(submitEdit, { 
            height   : 12,
  	width  : 106,
  	type   : "text",
  	indicator  : '<img src="../img/indicator.gif">',
    tooltip    : "Click to edit...",
    onblur   : 'submit',
  	style  : 'display: inline'
  	});
  	
  ///NEW METHOD HERE 
  var fieldText35 = '.ph_Code, .AreaCodeTelSwitch, .ph_CodeAlt, .fax_Code, .AreaCodeFaxSwitch, .fax_CodeAlt';
   
   $(fieldText35).editable(submitEdit, { 
    height   : 12,
  	width   : 35,
  	type    : "text",
  	indicator  : '<img src="../img/indicator.gif">',
     tooltip : "Click to edit...",
    onblur   : 'submit',
  	style   : 'display: inline'
  	});
  	
  function submitEdit(value, settings)
  	{ 
     var postValue 	= new Object();
     var newValue 	= value;
     var oldvalue 	= this.revert;
     var fieldname 	= $(this).attr("class");
     var id     = $(this).attr("id");
     postValue = {"id" : id, "value": value,  "fieldname" : fieldname, "oldvalue" : oldvalue, "nocache": randomnumber}; 
     var returned = $.ajax({
  	   url   : "../User_Edit/Update_Individual.cfm", 
  	   type  : "POST",
  	   data   : postValue,
  	   cache  : "false",
  	   dataType : "json",
  	   success	: function(data, textStatus, jqXHR) {
     	var jsonData = eval(data);
     	if ( jsonData.status == 1 ) {
       <!---$("#pinBoardArea").append(oldvalue + "<br />");--->
       growl("Update", 'data updated successfully', 'message', 'ui-icon ui-icon-check', 'notice');
     	}
     	if ( jsonData.status == 2 ) {
       //do growl here  growl("Message", growlMessage, 'callback', 'ui-icon ui-icon-signal-diag', 'error');
       growl("communication error", 'data change not saved', 'message', 'ui-icon ui-icon-check', 'error');
       $("."+fieldname).html(oldvalue);
     	}
  	     	},
  	   error  : function(jqXHR, textStatus, errorThrown){
  	       //do growl here  growl("Message", growlMessage, 'callback', 'ui-icon ui-icon-signal-diag', 'error');
   	$("."+fieldname).html(oldvalue);
  	     	}
  	});
	   return(newValue);
  }

//IN TEST MODE NEED TO RETURN VALUE AS IS TO PASS TO submitEdit, currentlly passing selected item from drop down
 $('.prefixID').editable(function(value, settings){ return (value); }, { 
  	width	: 235,
  	height : 20,
  	onblur : 'submit',
  	style	: 'display: inline',
   	indicator : '<img src="../img/indicator.gif">',
  	type : 'autoComleteTitle'
});

//'../user_edit/Update_Individual.cfm
 $('.CountryName').editable(function(value, settings){ return (value); }, { 
	//  onblur  : 'submit',
  	width	: 235,
  	height	: 20,
  	onblur  : 'submit',
  	style  : 'display: inline',
   	indicator : '<img src="../img/indicator.gif">',
  	type : 'autoComleteCountry'
});

 $('.strCity').editable(function(value, settings){ return (value); }, {  
	//  onblur: "ignore",
  	width  : 235,
  	height	 : 20,
  	onblur  : 'submit',
  	style  : 'display: inline',
   	indicator : '<img src="../img/indicator.gif">',
  	type : 'autoComleteCity'
});
 });
 
 function clearCityField(){
  $('.strCity').html("");
  $('#cityID').val("");
 }
 function NewCountryName(){
  $('.CountryName').html(newCountryName);  
 }
  function NewCityName(){
   $('.strCity').html(newCityName); 
  }
  </cfif>
  
 $('form').live( 'submit', function() { 
 $(this).ajaxSubmit(); 
 return false; 
 }); 
 
 $('#rec_checked').change(function(){
	$.post("../user_Edit/Update_Individual.cfm", {"id" : userID, "fieldname": "rec_checked", "oldValue" : 0,  "value" : JavaDateToday }, function(rdata){ 
  	var jsonData = eval(rdata);
  	if ( jsonData.status == 1) {
      growl("Update", 'data updated successfully', 'message', 'ui-icon ui-icon-check', 'notice');
      $(this).parent().css('background-color', bgColor(1));
  	}
  	if ( jsonData.status == 0 ) {
      growl("communication error", 'data change not saved', 'message', 'ui-icon ui-icon-check', 'error');
      $(this).parent().css('background-color', bgColor(0));
  	}
	});
});
 
<!--- $("#pinBoardHeader").click(function(){
	 	//alert("toggle");
	$("#pinBoardArea").toggle(); 
 });--->
</script>
<style type="text/css">
.ph_Code, .ph_CodeAlt, .fax_Code, .fax_CodeAlt{
	width : 35px;
}
.ph_No, .ph_NoAlt, .fax_No, .fax_NoAlt{
	width : 85px;
}
#areaContracts i{
	border-color:#fff}
#areaContracts span {color:#999}
<!---input[type="text"].phoneCode {
width : 35px;
margin-right : 5px;}
input[type="textarea"].phoneNumber {
width : 85px;
margin-right : 5px;
}--->
</style>

<cfif qryUser.recordCount eq 0 >
  No results found
</cfif>
<cfinclude template="../user_functions/dsp_index.cfm">
<cfoutput query="qryUser">
<div id="rec_#qryUser.id#">
  <table border="0" cellspacing="8" cellpadding="0" id="table">
    <tr>
      <td valign="top"><ul id="userMenu" class="ui-corner-all">
          <cfif qryUser.fileName NEQ "">
            <li style="text-align:center; padding:0px"><img src="http://www.petro21.com/_files/client/#qryUser.fileName#" /></li>
          </cfif>
         <!---<cfif qryUser.Curriculum NEQ "">
          <li><a href="../_files/client/#qryUser.Curriculum#" target="_blank">Download CV</a></li>
          </cfif> ---->
          <li><a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'tblIndividual', 'fileTableID': #form.id#}, Args:{  title : 'Manage files', height:500, width:900, modal:false}});">Client Files</a></li>
          <li><a href="javascript:openWindow({ url:'../contacts/index.cfm', param: {'companyID': #qryUser.companyID#, 'userID':#qryUser.id#}, Args: modals.contacts});">Contacts</a></li>
          <!---<li class="menu_status"><a href="javascript:loader('../user_functions/dsp_status.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Status</a></li>--->
          <li class="menu_status"><a href="javascript:loadPageToPlaceHolder({ url:'../user_functions/dsp_active.cfm', placeHolder:'areaEditFunctions', textareaID:'no', Args: {'userID': #qryUser.id#, 'active': #qryUser.active#} });">Status</a></li>
          <!---<li><a href="javascript:ExternalModalOpen('../User_Edit/User_print.cfm', #form.id#, 0, 920, 620, 'Manage Events');">Print this User</a></li>--->
          <li><a href="javascript:openWindow({ url:'../User_Edit/User_print.cfm', param: {'id': #form.id#}, Args:{  title : 'Print User', height:620, width:920, modal:false}});">Print this User</a></li>
          <li><a href="javascript:loader('../user_functions/dsp_UserloginDetails.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">User Login Details</a></li>
          <li><a href="javascript:loader('../Industry_Sector/industry_sector.cfm', 'areaEditFunctions', #qryUser.id#, 0 );" style="color:##990000">Industry Sector</a></li>
          <li class="menu_newsletter"><a href="javascript:loader('../user_functions/dsp_Newsletters.cfm', 'areaEditFunctions', #qryUser.id#, 0 );" style="color:##990000">Newsletters</a></li>
          <li class="menu_RegionIntMail"><a href="javascript:loader('../user_functions/dsp_RegionInterest_email.cfm', 'areaEditFunctions', #qryUser.id#, 0 );" style="color:##990000">Region Interest email</a></li>
          <li class="menu_RegionIntPost"><a href="javascript:loader('../user_functions/dsp_RegionInterest_post.cfm', 'areaEditFunctions', #qryUser.id#, 0 );" style="color:##990000">Region Interest post</a></li>
          <li><a href="javascript:loader('../roles/dsp_roles.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">User Role</a></li>
          <li><a href="javascript:loader('../user_functions/dsp_dataClasification.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Data source</a></li>
          <li><a href="javascript:loader('../user_functions/dsp_PersonalNoteInternal.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Personal Note (internal)</a></li>
          <li><a href="javascript:loader('../user_functions/dsp_PersonalNotePublic.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Personal Note (public)</a></li>
          <li><a href="javascript:loader('../user_functions/dsp_Sposorship_Interest.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Sponsorship Interest</a></li>
          <li><a href="javascript:loader('../user_functions/dsp_Memberships.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Club Membership</a></li>
          <li ><a href="javascript:openWindow({ url:'../user_functions/dsp_userChanges.cfm', param: {'id': #qryUser.id#}, Args:{  title : 'View Changes', height:620, width:920, modal:false}});">User Changes</a></li>
          <!---<li><a href="javascript:ExternalModalOpen('../user_functions/dsp_userChanges.cfm', #qryUser.id#, 0, 920, 620, 'View Changes');">User Changes</a></li>--->
          <li class="menu_BlackList"><a href="javascript:loader('../user_functions/dsp_black_listed.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Black Listed</a></li>
          <cfif  Listcontains("jerome,jason, babette, tanya, jodee",  trim(Session.staffName), ",")>
            <li><a href="javascript:loader('../user_functions/dsp_AdminRecord.cfm', 'areaEditFunctions', #qryUser.id#, 0 );">Edit Record</a></li>
          </cfif>
        </ul></td>
      <td valign="top"><fieldset>
          <legend>Personal Details</legend>
          <b>Title</b> <i class="prefixID" id="#qryUser.id#">#qryUser.title#</i> <b>Name</b> <i class="strFirst_Name" id="#qryUser.id#">#qryUser.name#</i> <b>Middle name</b> <i class="userMidlename" id="#qryUser.id#">#qryUser.userMidlename#</i> <b>Surname</b> <i class="strSurname" id="#qryUser.id#">#qryUser.surname#</i> <b>Position</b> <i class="strDesignation" id="#qryUser.id#">#qryUser.position#</i> 
          <!--- new fields --->
        </fieldset>
        <fieldset >
          <legend>Company</legend>
          <b>Company</b> <i id="companyName" class="fl_comboLong NoFormat">#qryUser.companyName#</i> <i class="field_button_container NoFormat"> <img src="../img/blue_But_Plus.jpg" border="0" onclick="javascript:openUserWindows('../companies/index.cfm', 'company');" /></i>
          <input type="hidden" name="companyID" value="#qryUser.companyID#" />
          <b>Label</b> <i id="AKA_companyName" class="fl_comboLong NoFormat">#qryUser.AKA_companyName#</i> <i class="field_button_container NoFormat"> <img src="../img/blue_But_Plus.jpg" border="0" onclick="javascript:openUserWindows('../companyLabels/index.cfm', 'AKAcompany');" /></i>
          <input type="hidden" id="AKA_companyID" value="#qryUser.AKA_companyID#" />
          <b class="warningText">Old Ref.</b> <i class="fl_comboLong NoFormat">#qryUser.OLD_companyName#</i>
          <cfif branches EQ 0 AND #qryUser.companyID# Neq 0>
            <b class="warningText">Branches</b> <i class="fl_comboLong NoFormat"></i> <i class="field_button_container NoFormat"> <img src="../img/blue_But_Plus.jpg" border="0" onclick="javascript:openUserWindows('../branches/?fa=modal', 'branch');" /> </i>
          </cfif>
        </fieldset>
        <cfif branches EQ 1>
          <cfif qryUser.streetAddress NEQ "">
            <fieldset >
              <legend>Physical Address</legend>
              <b>Street</b> <i id="streetAddress" class="fl_comboLong NoFormat">#qryUser.streetAddress#</i> <i class="field_button_container NoFormat">
              <cfif #qryUser.companyID# Neq 0>
                <img src="../img/blue_But_Plus.jpg" border="0" onclick="javascript:openUserWindows('../branches/?fa=modal', 'branch');" />
              </cfif>
              </i> <b>City</b> <i id="streetAddress" class="NoFormat">#qryUser.streetCityName#</i> <b>ZIP</b> <i id="streetAddress" class="NoFormat">#qryUser.StreetCode#</i> <b>Region</b> <i id="streetAddress" class="NoFormat">#qryUser.streetRegionName#</i> <b>Country</b> <i id="streetAddress" class="NoFormat">#qryUser.streetCountryName#</i> <b>Switch Tel</b> <i class="NoFormat">#qryUser.branchCountryPhoneCode# #qryUser.branchAreaPhone# #qryUser.branchPhoneNo#</i> <b>Switch Fax</b> <i class="NoFormat">#qryUser.branchCountryPhoneCode# #qryUser.branchAreaFax# #qryUser.branchFaxNo#</i>
            </fieldset>
          </cfif>
          <cfif qryUser.postalAddress NEQ "">
            <fieldset >
              <legend>Postal Address</legend>
              <b>Street</b> <i id="postalAddress" class="fl_comboLong NoFormat">#qryUser.postalAddress#</i> <i class="field_button_container NoFormat">
              <cfif #qryUser.companyID# Neq 0>
                <img src="../img/blue_But_Plus.jpg" border="0" onclick="javascript:openUserWindows('../branches/index.cfm', 'branch');" />
              </cfif>
              </i> <b>City</b> <i id="postalAddress" class="NoFormat">#qryUser.postalCityName#</i> <b>ZIP</b> <i id="postalAddress" class="NoFormat">#qryUser.postalCode#</i> <b>Region</b> <i id="postalAddress" class="NoFormat">#qryUser.postalRegionName#</i> <b>Country</b> <i id="postalAddress" class="NoFormat">#qryUser.PostalCountryName#</i>
            </fieldset>
          </cfif>
        </cfif>
        <input type="hidden" id="branchID" value="#qryUser.branchID#" />
        <cfif branches EQ 0>
          <fieldset style="background-color:##FFEAF4">
            <legend>Address</legend>
            <b>Country</b> <i class="CountryName" id="#qryUser.id#">#qryUser.country# </i>
            <input type="hidden" name="countryID" id="country_ID" value="#qryUser.countryid#" />
            <b>City</b> <i class="strCity" id="#qryUser.id#">#qryUser.city# </i>
            <input type="hidden" id="cityID" value="#qryUser.cityID#" />
            <b>Address </b> <i class="strStreet_Adress" id="#qryUser.id#">#qryUser.strStreet_Adress#</i> <b>Postal</b> <i class="strPostal_Adress" id="#qryUser.id#">#qryUser.strPostal_Adress# </i> <b>State</b> <i class="Addr_State" id="#qryUser.id#">#qryUser.Addr_State#</i> <b>ZIP/Code</b> <i class="intCode" id="#qryUser.id#">#Ucase(qryUser.intCode)#</i>
          </fieldset>
        </cfif></td>
      <td valign="top"><fieldset >
          <legend>Communication</legend>
          <b class="vtip" title="no need for country code">Tel</b> <i class="phoneCode vtip" title="country code is selected with country name">#qryUser.countryPhoneCode#</i> <i class="ph_Code" title="ares code" id="#qryUser.id#">#qryUser.ph_Code#</i> <i class="ph_No" id="#qryUser.id#">#qryUser.ph_No#</i>
          <cfif branches EQ 0>
            <b class="vtip" title="no need for country code">Switchboard</b> <i class="phoneCode vtip" title="country code is selected with country name">#qryUser.countryPhoneCode#</i> <i class="AreaCodeTelSwitch" title="ares code" id="#qryUser.id#">#qryUser.AreaCodeTelSwitch#</i> <i class="strPhSwitchboard_No" id="#qryUser.id#">#qryUser.strPhSwitchboard_No#</i>
            <cfelseif branches EQ 1>
             <b class="vtip" title="no need for country code">Listed No</b> <i class="phoneCode vtip" title="country code is selected with country name">#qryUser.countryPhoneCode#</i> <i class="AreaCodeTelSwitch" title="ares code" id="#qryUser.id#">#qryUser.AreaCodeTelSwitch#</i> <i class="strPhSwitchboard_No" id="#qryUser.id#">#qryUser.strPhSwitchboard_No#</i>
          </cfif>
          <b class="vtip" title="no need for country code">Tel alt</b> <i class="phoneCode vtip" title="country code is selected with country name">#qryUser.countryPhoneCode#</i> <i class="ph_CodeAlt" title="ares code" id="#qryUser.id#">#qryUser.ph_CodeAlt#</i> <i class="ph_NoAlt" id="#qryUser.id#">#qryUser.ph_NoAlt#</i> 
          <b class="vtip" title="no need for country code">Fax </b> <i class="phoneCode vtip" title="country code is selected with country name">#qryUser.countryPhoneCode#</i> <i class="fax_Code" title="ares code" id="#qryUser.id#">#qryUser.fax_Code#</i> <i class="fax_No" id="#qryUser.id#">#qryUser.fax_No#</i>
          <cfif branches EQ 0>
            <b class="vtip" title="no need for country code">Switchboard</b> <i class="phoneCode vtip" title="country code is selected with country name">#qryUser.countryPhoneCode#</i> <i class="AreaCodeFaxSwitch" title="ares code" id="#qryUser.id#">#qryUser.AreaCodeFaxSwitch#</i> <i class="strFaxSwitchBoard_No" id="#qryUser.id#">#qryUser.strFaxSwitchBoard_No#</i>
            <cfelseif branches EQ 1></cfif>
          <b class="vtip" title="no need for country code">Fax alt</b> <i class="phoneCode vtip" title="country code is selected with country name">#qryUser.countryPhoneCode#</i> <i class="fax_CodeAlt" title="ares code" id="#qryUser.id#">#qryUser.fax_CodeAlt#</i> <i class="fax_NoAlt" id="#qryUser.id#">#qryUser.fax_NoAlt#</i> <b class="vtip" title="mobile number add international code">Mobile</b> <i class="mobileNo" id="#qryUser.id#">#qryUser.mobileNo#</i> <b class="vtip" title="International number add international code">Int. number</b> <i class="ph_intNo" id="#qryUser.id#">#qryUser.ph_intNo#</i>
        </fieldset>
        <fieldset >
          <legend>Email</legend>
          <b>Email</b> <i class="strEmail" id="#qryUser.id#" style="display:inline">#lcase(qryUser.strEmail)#</i> <b>Email alt</b> <i class="strEmail_Alt" id="#qryUser.id#" style="display:inline">#lcase(qryUser.strEmail_Alt)#</i> <b>Email sec</b> <i class="strSecretary_Email" id="#qryUser.id#" style="display:inline">#lcase(qryUser.strSecretary_Email)#</i> <b>Subscrip</b> <i class="email_subs" id="#qryUser.id#" style="display:inline">#lcase(qryUser.email_subs)#</i> <b>Password</b> <i class="password" id="#qryUser.id#" style="display:inline">#qryUser.password#</i>
        </fieldset>
</cfoutput>   
        <cfif contacts.recordcount GT 0>
        <fieldset id="areaContracts">
          <legend>Contacts</legend>
        	<cfoutput query="contacts" group="typeLabel" >
            <b>#typeLabel#</b>
            <i style="display:inline"><cfoutput>#contacts.contactName#<br /> <span>#contacts.contactEmail#</span><hr /></cfoutput></i></cfoutput>
        </fieldset></cfif>
 <cfoutput></td>
      <td valign="top">
      	<div class="ui-corner-all ui-widget ui-widget-content podForm marginBottom15">
        	<b>Posting</b>
            <i class="NoFormat">
                <select name="posting" id="posting" class="ui-corner-all">
                    <option value="0" <cfif qryUser.posting eq 0>selected</cfif>>Do Not Post</option>
                    <option value="1" <cfif qryUser.posting eq 1>selected</cfif>>Primary post</option>
                    <option value="2" <cfif qryUser.posting eq 2>selected</cfif>>Secondary post</option>
                </select>
            </i>
            <b>Anouncements</b>
            <i class="NoFormat" ><input type="checkbox" name="anouncements" id="anouncements" <cfif qryUser.anouncements eq 1>checked="checked"</cfif> value="1" /></i>
            <b>Newsletters</b>
            <i class="NoFormat"><input type="checkbox" name="newsletters" id="newsletters" <cfif qryUser.newsletters eq 1>checked="checked"</cfif> value="1" /></i>
            <div class="clear"></div>
        </div>
      	<div class="ui-corner-all ui-widget ui-widget-content podForm marginBottom15">
        	<cfif qryUser.rec_checked NEQ "">Record checked and updated on<br />#dateFormat(qryUser.rec_checked, "ddd, dd mmm yyyy")#
            <cfelse><input type="checkbox" name="rec_checked" id="rec_checked" value="1" /> Click here<br /> when you have done a full check,<br />and updated this user
            </cfif>
  </div>
      <div id="areaEditFunctions">
          <cfinclude template="../user_functions/dsp_PersonalNoteInternal.cfm">
          <cfinclude template="../user_functions/dsp_activeStatus.cfm">
        </div>
        <cfif Listcontains("jerome,jason", trim(Session.staffName), ",")>
          <div id="showIDsHere"></div>
        </cfif><!--- <img src="../img/blue_But_Plus.jpg" border="0" onclick="javascript:checkUserDet();" />---></td>
    </tr>
  </table>
</div></cfoutput>