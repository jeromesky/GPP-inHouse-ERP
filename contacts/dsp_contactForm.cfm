<cfparam default="0" name="form.contactID">
<!---<cfparam default="0" name="form.companyID">--->
<cfparam default="0" name="form.userID">
<cfparam default="0" name="form.branchID">
<cfinclude template="qry_contactForm.cfm">
<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>

<cfif form.contactID EQ 0>
	<cfset contactOperation = "Add">
<cfelse>
	<cfset contactOperation = "Edit">
</cfif>

<script type="text/javascript">
$(document).ready(function() {

    $('#saveContact').submit(function() { 
		$(this).ajaxSubmit( { clearForm: false, success: actionSaveContact}); 
		return false; 
    }); 
	
<cfif  qryContacts.ContactType EQ 307>	
	$('#saveContact input, #saveContact textarea, #saveContact select, #saveContact button').attr("disabled", true);
</cfif>

<!---<cfif form.contactID EQ 0>
	$('#contactScope').attr("disabled", true);// .css({"visibility" : 'hidden' });
</cfif>--->
 });

$( ".accordion" ).accordion(accordionDefault);
</script>
<cfoutput>
<form action="../contacts/qry_contactSave.cfm" method="post" id="saveContact">
<input type="hidden" name="contactID" id="contactID" value="#form.contactID#">
<cfif form.contactID EQ 0>
    <input type="hidden" name="branchID" id="branchID" value="#form.branchID#" />
    <input type="hidden" name="companyID" id="companyID" value="#form.companyID#">
    <!---<input type="hidden" name="userID" id="userID" value="#form.userID#">--->
<cfelse>
    <input type="hidden" name="branchID" id="branchID" value="#trim(qryContacts.branchID)#" />
    <input type="hidden" name="companyID" id="companyID" value="#qryContacts.companyID#">
    <!---<input type="hidden" name="userID" id="userID" value="#qryContacts.userID#">--->
</cfif>
    </i>
<div class="accordion">
	<h2>#contactOperation# Contact</h2>
<div>
	<b>for company</b>
    <i class="NoFormat">#qryContacts.companyName#</i>
    <!---<cf_contact_type name="ContactType" id="#qryContacts.ContactType#">--->
    <b>Contact Type</b>
    <i class="NoFormat">
    	<cf_types cat="contacts" catid="0" id="#qryContacts.ContactType#" name="ContactType">
    </i>
    
    <b>Name</b><i class="NoFormat">
    	<input type="text" class="ui-corner-all" name="contactName" id="contactName" value="#qryContacts.contactName#">
    </i>
    
    <b>Email</b><i class="NoFormat">
    	<input type="text" class="ui-corner-all" name="contactEmail" id="contactEmail" value="#qryContacts.contactEmail#">
    </i>
    
    <b>Position</b><i class="NoFormat">
    	<input type="text" class="ui-corner-all" name="contactPosition" id="contactPosition" value="#qryContacts.contactPosition#" maxlength="35">
    </i>
    <b>Contact Reason</b>
    <i class="NoFormat">
    	<cf_types cat="contact Reason" catid="0" id="#qryContacts.contactScope#" name="contactScope">
    	<!---<input type="text" class="ui-corner-all" name="contactScope" id="contactScope" value="#qryContacts.contactScope#" maxlength="35">--->
    </i>
</div>
	<h2>Adress and Contact</h2>
<div>    
      <b>Phone</b>
      <i class="NoFormat">
            <input maxlength="30"  style="width:35px" TYPE="text" class="countryCode ui-corner-all" value="#qryContacts.countryPhoneCode#" disabled="disabled">
            <input maxlength="5" class="ui-corner-all" style="width:35px" TYPE="text" id="contactPhoneAreaCode" NAME="contactPhoneAreaCode" value="#qryContacts.contactPhoneAreaCode#">
             <input type="text" class="ui-corner-all" id="contactPhoneNumber" name="contactPhoneNumber" style="width:85px" maxlength="16" value="#qryContacts.contactPhoneNumber#" >
      </i>
      
      <b>Phone Ext</b>
      <i class="NoFormat">
      		<input type="text" class="ui-corner-all" maxlength="5" id="contactPhoneExt" name="contactPhoneExt" value="#qryContacts.contactPhoneExt#">
      </i>
      <b>Note</b>
      <i class="NoFormat">
      		<textarea class="ui-corner-all" name="contactNote" id="contactNote">#qryContacts.contactNote#</textarea>
      </i>
       <cf_country_suggest country="#qryContacts.countryNameEN#" countryfieldname="CountryName" countryID="#qryContacts.countryID#" fieldname="countryID" random="#randomID#">
 <!---  <b>Country</b>
      <i class="NoFormat">
          <div id="search_Country" class="tagbox"><input class="ui-corner-all" type="text" id="CountryName" value="#qryContacts.countryNameEN#" > </div>
      </i>
      <input type="hidden" id="countryID" name="countryID" value="<cfif qryContacts.countryID EQ "">0<cfelse>#qryContacts.countryID#</cfif>"  />
      <i class="field_button_container NoFormat" id="processCountry"></i>--->
      <cf_city_suggest city="#qryContacts.CityNameEN#" cityfieldname="cityName" cityID="#qryContacts.cityID#" fieldname="cityID" countryFieldname="countryID" random="#randomID#">
<!---  <b>City</b>
      <i class="NoFormat" id="city">
          <div id="search_City" class="tagbox"><input class="ui-corner-all" type="text" maxlength="50" id="strCity" value="#qryContacts.CityNameEN#"></div>City names in English only
      </i>
      <input type="hidden" name="cityID" id="cityID" value="<cfif qryContacts.cityID EQ "">0<cfelse>#qryContacts.cityID#</cfif>" />
      <i class="field_button_container NoFormat" id="processCity"></i>--->
      
      <b>Address</b>
      <i class="NoFormat">
      	<textarea class="ui-corner-all" name="contactAddress" id="contactAddress">#qryContacts.contactAddress#</textarea>
      </i>
      <i class="NoFormat">
      	<button class="ui-corner-all" id="buttonSaveContact">Save</button>
      </i>
 </div>
</div>
</form></cfoutput>

<!---$('#search_Country').tagdragon({
		'field':'CountryName',
		//'url':'../components/JSON_country_TagDragon.cfm',
		'url':'../components/JSON_country_table.cfm',
		'charMin' : 3, 
		'cache' : true,
		'max' : 100,
		onSelectItem: function(val) { 
				$('.countryCode').val(val.code); 
				$('#countryID').val(val.id);
				$('#strCity').removeAttr("disabled");//.attr("disabled", false);//.css({"visibility" : 'visible' });
				},
				//show loading gif
				onLoadList: function() { $('#processCountry').html("<img src=../img/indicator.gif>"); },
				//remove gif
				onLoadedList: function() { $('#processCountry').html("");}
});
$('#search_City').tagdragon({
			'field':'strCity',
			'url':'../components/JSON_Cities.cfm',
			'postData' : {'countryid' : function(){ var get_C =  $('#countryID').val(); return(get_C); } },
			'charMin' : 3, 
			'cache' : true,
			'max' : 20,
			onSelectItem: function(val) { $('#cityID').val(val.cityid); },
			onSelectedItem: function(val) {	$('#strCity').val(val.cityname); },
			//show the loading gif
			onLoadList: function() { $('#processCity').html("<img src=../img/indicator.gif>"); },
			//remove gif
			onLoadedList: function() { $('#processCity').html("");}
});--->
<!---$('#search_branch').tagdragon({
			'field':'Search_branch_Name',
			'url':'../branches/JSON_search_Branches.cfm',
			'postData' : {'companyID' : function(){ var get_C =  $('#companyID').val(); return(get_C); } },
			'charMin' : 3, 
			'cache' : true,
			'max' : 20,
			onSelectItem: function(val) { $('#branchID').val(val.branchid); },
			onSelectedItem: function(val) {	$('#Search_branch_Name').val(val.searchStr); },
			//show the loading gif
			onLoadList: function() { $('#processBranch').html("<img src=../img/indicator.gif>"); },
			//remove gif
			onLoadedList: function() { $('#processBranch').html("");} 
});--->