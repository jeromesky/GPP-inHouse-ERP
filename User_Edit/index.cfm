<cfinclude template="../application.cfm"><cfset numrecords = 0 >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../javascript/Jeditable.js"></script>
<script type="text/javascript" src="../javascript/interface.js"></script>
 <script type="text/javascript" src="../javascript/jqprint.js"></script>
<!---<script type="text/javascript" src="../javascript/jquery.maskedinput.js"></script>
<script type="text/javascript" src="../javascript/jquery.jeditable.masked.js"></script>--->
<script type="text/javascript" src="http://www.petro21.com/my-office/_js/json.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/_js/jquery.CRM.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.pnotify.min.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/_js/uploadFive/jquery.uploadifive.min.js"></script>
<script src="../_js/sorttable.js"></script>
<link rel="stylesheet" type="text/css" href="../javascript/Vtip/vtip.css" />
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
var JavaDateToday = new Date();
var JavaDateToday = "<cfoutput>#dateformat(now(),"dd mmmm yyyy")#</cfoutput>" ;
jQuery.ajaxSettings.traditional = true;

function RemoveFromList(RemoveFromList_id) {
		 $("#rec_"+RemoveFromList_id).animate( { backgroundColor: "#0b860b" }, "fast").animate({ opacity: "hide" }, "fast");	  
}

function DeleteRecord(delete_id) {
		$.post("delete.cfm", { id: delete_id }, function() { $("#event_"+delete_id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast"); }  ); 	 
}

function HighLightSelected() {
	 $(this).parent().addClass('backSelected');
}

 $(document).ready(function() {
	 
	 $("#InvPDBankNumber, #InvoiceNo_LNK").focusout(function(){
		var whatsThis  = $(this).attr("id");
		
		if ( whatsThis == 'InvPDBankNumber') {
			$("#InvoiceNo_LNK").val("");
		}else if ( whatsThis == 'InvoiceNo_LNK'){
			$("#InvPDBankNumber").val("");
		}
		
		//if not empty clear field
		if ( whatsThis != '' ) {
			$("#strEmail, #company, #surname, #name").val("");
		}
		
	});
	 
	 	$("[title]").tooltip();
 
 		<!---$("div#slidepanel").slideDown("slow");--->
 	    $('#formSearchUser').submit(function() { 
			var get_excel = $('#excel').attr("checked") ? $('#excel').val() : 0 ;
			var get_pdf = $('#pdf').attr("checked") ? $('#pdf').val() : 0 ;
			
			$( '#areaSearchResult').html($loading);
			///CLEAR THE FORMS
			$("#areaSearchDetails, #areaConference, #areaInvoice, #areaCompany").html("");
			$(this).ajaxSubmit({ success: loadSearch,  	clearForm: false  }); 
						if ( get_excel != 0 || get_pdf != 0 ){
							
						//if yes go to the page
						}else{
						//if no load to ID
						return false; 
						}
		}); 

	//TOLLBAR AND BUTTON
	$("a, a.button", ".toolbar").button();
	$("button, input:submit, input:reset, a.button").button();
	
	// SLIDE MENU TOGGLE
	$("#slideOpen").click(function(){
		$("div#slidepanel").slideDown("fast");
	});	
	// Collapse slidepanel
	$("#slideClose").click(function(){
		$("div#slidepanel").slideUp("fast");	
	});		
	// Switch buttons from "Log In | Register" to "slideClose slidepanel" on click
	$("#slideToggle a").click(function () {
		$("#slideToggle a").toggle();
	});	
	
	//Clear search form
	$('#clearSearch').click(function(){
		$("#searchUserCountryID").val(0); 
	});
 			
	$('#tabs_crm').tabs();
	$('#tabs_invoice').tabs();

var countryCache = {};
$( "#searchUserCountry" ).autocomplete({
	minLength: 2,
	select: function(event, ui) { $('#searchUserCountryID').val(ui.item.id); },
	source: function(request, response) {
		if ( request.term in countryCache ) {
			response( countryCache[ request.term ] );
			return;
		}
	$.ajax({ url: "../countries/JSON_country_UI.cfm", dataType: "json", data: request,
		success: function( data ) {countryCache[ request.term ] = data; response( data ); }
	});
	}
});

});
///load usewrs from contact
function loadContactUsers(contactID){
	//$( '#').html($loading).html(data);
		loadPageToPlaceHolder({ url:"qry_searchUsers.cfm", placeHolder:"areaSearchResult", textareaID:"no", Args: {"contactID": contactID }  });
}

//// LOAD USER LIST FROM FORM USER SEARCH
function loadSearch(data){
	$( '#areaSearchResult').html($loading).html(data);
	$('#tabs_crm').tabs('select', 0);
}

/// LOAD USER FROM SELECTED LIST
function loadTabs(id){
		//First lets clean the Pane Content
		$('#areaSearchDetails, #areaConference, #areaInvoice, #areaCompany, #areaSecondary').html("");
		// SET USER ID to GLOBAL VAr
		userID = id ;
		$("#areaSearchDetails").load("client_form.cfm" , { id: id }).fadeIn("fast"); 
		$("#areaConference").load("Conference.cfm" , { id: id }); 
		$("#areaInvoice").load("Invoices.cfm" , { id: id }); 
		<!---$("#areaCompany").load("client_form_Company.cfm" , { id: id });--->
		$("#areaSecondary").load("client_form_ContactSecondary.cfm" , { id: id }); 
		$('#tabs_crm').tabs('select', 1);
}
///FUNCTION LOAD FUNCTION
function loader(url, holder, userid, companyid){
		$("#"+holder).load(url , { 'userid': userid, 'companyid': companyid }).fadeIn("fast");
}

function Edit_Invoice(id){
		$("#areaEdit_Invoice").load("Invoices_details.cfm" , { id: id }).fadeIn("fast"); 
		$("#area_invoice_cancel").load("Invoices_Cancelations.cfm" , { id: id }).fadeIn("fast");
		$("#area_invoice_History").load("Invoices_History.cfm" , { id: id });   
}	

 //////////////REACTIVATE ACCOUNT
function ReActivateEvent(activatID){		
					var activatID = activatID;
					$("#modalPopUp").dialog("open");
					$("#modalPopUp").html("This will reactivate the event for this user").dialog( {
					'title' : 'Re Activate Event for User', 
					'modal' : true, 
					buttons : { OK: function() { 
						var ActivateEventString = 'id='+ activatID;
						//alert(CancellEventString);
						$.ajax({
							  type: "POST",
							  url: "conference_ReActivate.cfm",
							  data: ActivateEventString,
							  success: function() {
									  alert("here is the cancel true" +activatID );
									  $("#button_Cancel_"+activatID).removeClass('display').addClass('blueBut');
									  $("#button_Activate_"+activatID).removeClass('blueBut').addClass('display');
									  $("#event_"+ activatID ).css( 'background-color' , 'ffffff' );
									  var activatID = '';
									  },
							  error: function() { }
							  }); 
						  $(this).dialog('close');
					  } ,
					  Cancel: function(){ $(this).dialog('close');  }
				}}
		 );		
}	

 /////////////////ALERT MODAL 
function OpenAlert(URLToLoad, URLToEdit, id, width, height, title){		
		$("#modalExternal").dialog("open");
		$("#modalExternal").load(URLToLoad, {id:id, secondaryid: otherid }).dialog( {
				'modal' : true,
				'title' : title, 
				forcePlaceholderSize: true , 
				height : height, 
				width : width
				});		
}	

 /////////////////MODAL EXTERNAL CONTENT 
function ExternalModalOpen(URLToLoad, id, otherid, width, height, title){		
		$("#modalExternal").dialog("open");
		$("#modalExternal").load(URLToLoad, {id:id, secondaryid: otherid }).dialog( {
				'modal' : true,
				'title' : title, 
				forcePlaceholderSize: true , 
				height : height, 
				width : width
				});		
}	
 ///////////////MODAL Pop UP CONTENT 
function OpenPopUp(URLToLoad, id, companyid, width, height, title ){
		var get_company_id = $('#lngCompany_ID').val();	
		$("#modalPopUp").dialog("open");
		$("#modalPopUp").load(URLToLoad, {id: get_company_id, "companyid": companyid}).dialog({ forcePlaceholderSize: true , 'title' : title ,  height : height,  width : width });		
}		

 ///////////////File Uploader loader  
function NewWindow(URLToLoad, filetable, filetableID, fileID, width, height, title ){
		$("#modalPopUp").dialog("open");
		$("#modalPopUp").load(URLToLoad, {'filetable': filetable, 'filetableID': filetableID, 'fileID' : fileID }).dialog({ forcePlaceholderSize: true , 'title' : title ,  height : height,  width : width });		
}	

function DeleteNewRecord(id){
		$.get("deleteRegisteredConference.cfm", {id : id}, function(){ $('#table_attended_events tr:first').remove(); });
}

///////DELETE USER FROM THE DATABASE
function DeleteUser(userID){
		$.post("../User_Edit/deleteRegisteredUser.cfm", {DeleteID : userID}, function(){ 
				alert("User Removed from the database"); 
				$('#tabs_crm').tabs('select', 0); 
				$('#newReg_'+userID).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow");
				$('#area_newUserEdit').html("");
				});
}

///FUNCTIONS FOR ROLLOVER ROW
$('.tableRow').live("mouseover", function(){
		$(this).addClass("rowHover");
});
$('.tableRow').live("mouseout", function(){
		$(this).removeClass("rowHover");
});

///NEW REGISTRATION USERS FUNCTIONS
///FUNCTIONS CLICK UPDATE CURRENT FIELD FROM NEW USER REGISTRATION
$('.update-current-field').live("click", function(){
		var get_field 			= $(this).attr("name");
		var get_data 			= $("#"+get_field).val();
		var get_fieldTitle		= $(this).attr("title");
		var get_fieldValue 		= $("#"+get_fieldTitle).val();
		
		if ( typeof( window[ 'userID' ] ) == "undefined" ) {
			//not exists
			alert("you first need to search a current user before you can update from this record");
		} else {
					//exists
				if (get_fieldTitle == 0  ){
					$.post("../user_edit/Update_Individual.cfm" , {'id' : userID, 'fieldname': get_field, 'value' : get_data } , function() {  $("."+get_field).html(get_data);  } );
					}else if (get_fieldTitle != 0){
					$.post("../user_edit/Update_Individual.cfm" , {'id' : userID, 'fieldname': get_field, 'value' : get_data } , function() {  $("."+get_fieldTitle).html(get_fieldValue);  } );
					}
		}
});

///FUNCTION LOAD THE NEW USER RECORD
function loadNewUser(userID) {
	$("#area_newUserEdit").load("../user_registrations/dsp_newUserCheck.cfm", {"userID" : userID });
	$('#area_newUserList').animate({ height: 80}, 500);
	$('#area_newUserEdit').animate({ height: 480}, 500);
}

///FUNCTION LOAD  NEW USER LIST
function loadNewUserList() {
	$("#area_newUserList").load("../user_registrations/dsp_registerList.cfm");
	$('#area_newUserList').animate({ height: 560}, 500);
}

///FUNCTION ADD NEW USER FORM MANAGE NEW USERS
$('#newUserAddForm').live("submit", function(){
			var get_newUserID = $('#NewUserID').val();
			$(this).ajaxSubmit( {  success: function(){   $("#newUserAddForm").html(""); loadNewUserList();  } });
			return false;
}); 

//SECTION FOR CONTRACTS
//LOADING NEW CONTRACT FORM
function loadSponsorForm(contractID, contractTypeGroup, sponsorID){
		$('#area_sponsors').fadeIn("fast").load("../contract/dsp_sponsorsForm.cfm" , { 'contractID' : contractID, 'contractTypeGroup' : contractTypeGroup, 'sponsorID' : sponsorID }); 
}
function loadSponsors(contractID){
		$('#area_sponsors').fadeIn("fast").load("../contract/dsp_sponsors.cfm" , { 'contractID' : contractID }); 
}
</script>
<style type="text/css">
/* Sortable tables */
table.sortable thead {
    background-color:#eee;
    color:#666666;
    font-weight: bold;
    cursor: default;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">

<div id="outer">
	<div id="iner"><form action="../User_Edit/search_client.cfm" name="formSearchUser" id="formSearchUser" method="post" >
<div id="CRM_Legend" >
       <div class="container">
        <b class="userSeachLabel">Name</b>
        <i class="NoFormat"><input type="text" name="name" id="name" style="width:100px" class="ui-corner-all"/><input type="checkbox" name="prepercentName" value="" title="select to search name starting with your input "></i>
        <b class="userSeachLabel">Surname</b>
        <i class="NoFormat"><input type="text" name="surname" id="surname" style="width:100px" class="ui-corner-all"/><input type="checkbox" name="prepercentSname" value="" title="select to search surname starting with your input"></i>
        </div>
        <div class="container">
        <b class="userSeachLabel">Company</b>
        <i class="NoFormat"><input type="text" name="company" id="company" style="width:100px" class="ui-corner-all"/><input type="checkbox" name="prepercentComp" value="" title="select to search company starting with your input"> </i>

        <b class="userSeachLabel">Email</b>
        <i class="NoFormat"><input type="text" name="strEmail" id="strEmail" style="width:100px" class="ui-corner-all"/><input type="checkbox" name="prepercentEmail" value="" title="select to search email starting with your input"></i>
        </div>
		<div class="container">
            <b class="userSeachLabel">Invoice</b>
            <i class="NoFormat"><input type="text" name="InvoiceNo_LNK" id="InvoiceNo_LNK" style="width:100px" class="ui-corner-all"/> </i>
            <b class="userSeachLabel">Status</b>
            <i class="NoFormat">
                <select name="STATUS" id="STATUS" style="width:100px; min-width:100px" class="ui-corner-all">
                    <option value="1" selected>Current</option>
                    <option value="0">Archived</option>
                    <option value="*">ANY</option>
                </select>
            </i>
       </div> 
        
        <div class="container">
        <b class="userSeachLabel">Payment ref</b>
        <i class="NoFormat"><input type="text" name="InvPDBankNumber" id="InvPDBankNumber" style="width:100px" class="ui-corner-all"/> </i>
        <b class="userSeachLabel">Add a</b>
        <i class="NoFormat"><a href="http://www.petro21.com/my-officex/newUser/?fa=newUser-form" target="_blank" >New User</a></i>
        </div>
        <div class="container">
        <b class="userSeachLabel">Country</b>
        <i class="NoFormat">
        <input type="text" id="searchUserCountry" style="width:100px" class="ui-corner-all"/>
        <input type="hidden" name="searchUserCountryID" id="searchUserCountryID" value="0" >
        </i>
       <b class="userSeachLabel"></b>
        <i class="NoFormat">	<input name="search" value="Search" type="submit"><input type="reset" value="Clear" id="clearSearch" class="marginLeft5"></i>
        </div>
       <div class="container">
       		<label style="margin:0px; padding:0px"><input type="radio" name="format" id="screen" value="screen" checked="checked" />screen</label>
            <label style="margin:0px; padding:0px"><input type="radio" name="format" id="pdf" value="pdf" />PDF</label>
            <label style="margin:0px; padding:0px"><input type="radio" name="format" id="excel" value="excel" />Excel</label>
        </div>
       
       <!--- <div class="container" id="crm_button_NewUser"><br />
			<!---<a href="javascript:openWindow('../DashPods/dsp_newRegistrations.cfm', 0, 0, 0, 400, 620, 'New Registrations');" >View new Registrations</a><br />
            <a href="javascript:openWindow({ url:'../User_registrations/registrations.cfm', param: {}, Args:{  title : 'Manage New Users', height:620, width:670, modal:false}});">Manage New Users</a>--->
            <br /><a href="http://www.petro21.com/my-officex/newUser/?fa=newUser-form" target="_blank" >New User</a><!---../NewUser/index.cfm--->
        </div>--->
        <div style="clear:both"></div>
</div></form>

<div id="tabs_crm" style="min-height:573px">
			<ul>
        		<li><a href="#result">Search Results</a></li>
				<li><a href="#details" id="">Individual  Details</a></li>
        		<!---<li><a href="#Company" id="companyTab">Company Details</a></li>--->
        		<li><a href="#Secondary" id="secondaryTab">Secondary Contacts</a></li>
				<li><a href="#conference" id="conTab">Registrations</a></li>
        		<li><a href="#invoicing" id="invoiceTab">Payment Details / Invoicing</a></li>
			</ul>
            <div id="result">
                    <div id="areaSearchResult"></div>
            </div>
            <div id="details">
                    <div id="areaSearchDetails"></div>
            </div>
<!---            <div id="Company" >
                    <div id="areaCompany"></div>
            </div>--->
            <div id="Secondary">
                    <div id="areaSecondary"></div>
            </div>
            <div id="conference">
                    <div id="areaConference"></div>
                    <div class="clear"></div>
            </div>
            <div id="invoicing">
            		<div id="areaInvoice"></div>
                    <div class="clear"></div>
            </div>
</div>  
</div>
</div>
<cfinclude template="../_display/dsp_footer.cfm">