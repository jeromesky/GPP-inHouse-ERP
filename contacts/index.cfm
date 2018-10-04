<cfparam name="form.userID" default="0">
<cfparam name="form.companyID" default="0">
<cfparam name="form.branchID" default="0">
<cfoutput>
<script type="text/javascript" >
var contacts = {};
	contacts.companyID = #form.companyID#;
	contacts.userID = #form.userID#;
	contacts.branchID = #form.branchID#;
	
	
$(document).ready(function(){
		loadContact(0, contacts.companyID, contacts.userID, contacts.branchID);
		loadContacts(contacts.companyID, 299, contacts.userID);
});

$('##ContactType :selected').val();
		$("##ContactType").change(function(){
			var fetch_contactType = $(this).val() ;
			loadContacts(contacts.companyID, fetch_contactType, contacts.userID);
		});

</script>
<style type="text/css">
.manageBranch{cursor:pointer;}
##contacts{height:420px; overflow:auto;}
##contact{height:465px;}
</style>
<div class="c7">
	<div class=" ui-widget ui-widget-content podBgFade" style="padding:5px 10px"  >
    	<cf_types cat="contacts" catid="0" id="0" name="ContactType">
    	<button class="manageContacts ui-corner-all" id="0">Create Contact</button>
    </div>
    <div id="contacts" class="ui-corner-bottom ui-widget ui-widget-content"></div>
</div>

<div class="c4" id="contact">

</div></cfoutput>
<!---<cf_contact_search  contactID="0" value="" open="0">
<cf_contact_type name="ContactType" id="0">
<cfinclude template="../contacts/dsp_search_user.cfm"><cfinclude template="../contacts/dsp_contact_Type.cfm">--->
<!---
$(".manageContacts").live('click', function(){
	var fetch_contactID = $(this).attr("id");
	loadContact(fetch_contactID, contacts.companyID, contacts.userID, contacts.branchID);
});

function actionSaveContact(){
	loadContact(0, contacts.companyID, contacts.userID, contacts.branchID);
	loadContacts(contacts.companyID, 300, contacts.userID);
}

function loadContact(contactID, companyID, userID, branchID){
		loadPageToPlaceHolder({ url:'../contacts/dsp_contactForm.cfm', placeHolder:'contact', textareaID:'no', Args: {"contactID": contactID, "companyID": companyID}  });
}
function loadContacts(companyID, contactType, userID){
	loadPageToPlaceHolder({ url:'../contacts/dsp_contacts.cfm', placeHolder:'contacts', textareaID:'no', Args: {"companyID": contacts.companyID, "contactType":contactType, "userID": userID }  });
}

$("input[name='contact2user']").live('change', function(){
	var fetch_contactID 		= $(this).attr("id");
	var fetch_contactIDVal 	= $(this).attr("checked") ? $(this).val() : 0
	$(this).parent().css('background-color', bgColor(fetch_contactIDVal));
	//alert("value on contact select is: " + fetch_contactIDVal + " contactID is: " + fetch_contactID);
	postData({ url:'../contacts/qry_contact2user_update.cfm', callfunction:'actionContact2userAdded',  Args: {"contactID" : fetch_contactID, "userID":  contacts.userID, "value": fetch_contactIDVal }  });
});

function actionContact2userAdded(data){
		//alert("contact linked");
}--->