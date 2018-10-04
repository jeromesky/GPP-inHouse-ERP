<cfoutput>
<div id="modalCacellEvent"></div>
<div id="modalActivateEvent"></div>
<div id="modalExternal"></div>
<div id="modalPopUp"></div>
<div id="openWindow"></div>
<div id="openSlaveWindow"></div>
<div id="alertUI"></div>
<div id="openModal"></div>

<script type="text/javascript">
////global vars
var $loading = $('<div class="loadingGif"><img src="../img/loaderBar_blue.gif" alt="loading"></div>');
var randomnumber = Math.floor(Math.random()*100002);
var accordionDefault = {autoHeight: false, animated: false, collapsible: true};

//var modal = {};
//modal.companyHeight = 490;
//modal.companyWidth  = 690;
//modal.AKAcompanyHeight = 330;
//modal.AKAcompanyWidth  = 670;
//modal.branchHeight = 550;
//modal.branchWidth  = 880;

var modals = { 
	  "branch"		: {"height": 550, "width":925, "title" : 'Manage Branches', "modal":false} , 
	  "company" 	: {"height": 490, "width":690, "title" : 'Manage company' , "modal":false} , 
	  "AKAcompany"	: {"height": 330, "width":665, "title" : 'Manage company Labels', "modal":false } , 
	  "packages"	: {"height": 600, "width":990, "title" : 'Manage  Packages', "modal":false } ,
	  "files"		: {"height": 500, "width":850, "title" : 'Manage  files', "modal":false } ,
	  "contacts"	: {"height": 505, "width":940, "title" : 'Manage  contacts', "modal":false } ,
	  "tasks"		: {"height": 500, "width":770, "title" : 'Manage  tasks', "modal":false } ,
	  "labelsMove"	: {"height": 340, "width":705, "title" : 'Move labels to new company', "modal":false } ,
	  "eventLocation"		:{"height": 240, "width":340, "title" : 'Manage Event locations', "modal":false } ,
	  "branch2userCountry"	:{"height": 240, "width":340, "title" : 'Select user country', "modal":false },
	  "notes"		: {"height": 550, "width":430, "title" : 'Notes',  "modal":false } 
			};

$(document).ready(function(){
	<!---$("#openWindow").dialog({ 
			autoOpen: false,
			bgiframe: true,
			draggable: true,  
  			resizable: true,
			position: 'center',
			forcePlaceholderSize: true,
			//open: function() {  
    			//$(this).find("textarea").ckeditor(editor_config).dialog( "close" );  
  			//},  
  			close: function() {  				
				var instanceName = CKEDITOR.instances.name;
				var instance = CKEDITOR.instances[instanceName];
				//alert(instance);
					if( instance ) { 
					instance.destroy(true);
					}
				//clear the modal window
				$(this).html("");
  			}
	});--->
	$('##form_task').live('submit', function() { 
		$(this).ajaxSubmit({ success: function(){ loadTasks();  } }); 
		return false; 
    });
	
	//hide branch name field
	$("##branchType").live('change', function(){
			
			if($(this).val() == 503 || $(this).val() == 504 || $(this).val() == 505){
				$("##branch_banchName").css("display", "none");	
			} else{
				$("##branch_banchName").css("display", "block");	
			}
	});
	
	/* ///////////// SETTING FOR  FILES  MODAL */
	$("select##fileType").live('change', function(){
			postData({ url:'../types/JSON_search.cfm', callfunction:'popolateFilePurposeID',  Args: {"typeID" : $(this).val() } });
	});


});<!--- /document ready --->

function popolateFilePurposeID(data){
				jData = jQuery.parseJSON(data);
				var name, select, option;
				select = document.getElementById('FilePurposeIDX');
				select.options.length = 0;
				for (var i = 0; i < jData.length; i++) {
				  select.options.add(new Option(jData[i].optionDisplay,  jData[i].optionValue));
				}	
}
<!---

$.getJSON("../types/JSON_search.cfm", {typeID: $(this).val() }, function(data){
				alert(data);
				var name, select, option;
				select = document.getElementById('FilePurposeIDX');
				select.options.length = 0;
				for (var i = 0; i < data.length; i++) {
				  select.options.add(new Option(data[i].optionDisplay,  data[i].optionValue));
				}				
		});
var FilePurposeIDOptions = '';
				for (var i = 0; i < jrt.length; i++) {
				FilePurposeIDOptions += '<option value="' + jrt[i].optionValue + '">' + jrt[i].optionDisplay + '</option>';
				}
				//alert(FilePurposeIDOptions);
				$("##FilePurposeIDX").html(FilePurposeIDOptions);--->

function createDialog(modal){

	$("##"+modal).dialog({ 
			autoOpen: false,
			bgiframe: true,
			draggable: true,  
  			resizable: true,
			position: 'center',
			forcePlaceholderSize: true,
			//open: function() {  
    			//$(this).find("textarea").ckeditor(editor_config).dialog( "close" );  
  			//},  
  			close: function() { 
				//var instanceName = CKEDITOR.instances.name;
				//var instance = CKEDITOR.instances[instanceName];
					//if( instance ) { 
						//instance.destroy(true);
					//}
				destroyCKE();
				$(this).html("");
  			}
	});	
}

//Create Alert////
function alertUI(params){ 
		
		$("##alertUI").html(alertMessage);
		var alertTitle 				= params.title;
		var alertMessage		= params.message;
		var alertfunction			= params.callfunction;
		var alertParam			= params.param;
		var alertType				= params.type;

		$("##alertUI").html(alertMessage);
		
		$( "##alertUI" ).dialog({
					//resizable	: false,
					//height		:140,
					modal		: true,
					title			: alertTitle,
					buttons:	 {
							"OK": function() { 
										if( alertType== 'confirmation' ){
												window[alertfunction](alertParam);
										}
										$(this).dialog("close");
							},
							Cancel: function() {
								$(this).dialog("close");
							}
			}
		});
}

///////////////////////
//CONTROL CKEDITOR ////
function createCKE(num) {
	destroyCKE();
    var CKfoo = CKEDITOR.instances[num];
    //if (CKfoo) {
       // CKfoo.destroy(num);   
   // }
    CKfoo = CKEDITOR.replace(num, {
			width : 212,
			height : 120,
			toolbar : 'Basic',
			toolbar_Basic : [['Bold', 'Italic','NumberedList','BulletedList' ]],
			toolbarStartupExpanded : false,
			language : 'en',
			removePlugins : 'elementspath'
			//customConfig: '/path/to/yourconfig.js'
		});
	
}

function removalCKE(num){
  var o=CKEDITOR.instances[num];
  if (o) o.destroy();
}

function destroyCKE(){
   KillAllCKE(CKEDITOR.instances);
}

function KillAllCKE(obj) {// This is the magic function
  	for(prop in obj)
		  {
			CKEDITOR.instances[prop].destroy();
		  }
}

///////////////////
//LOAD PAGE TO PLACEHOLDER  SITE WIDE ////
function loadPageToPlaceHolder(params){
		
		var url 						= params.url;
		var placeHolder		= params.placeHolder;
		var textareaID			= params.textareaID;
		var Args					= params.Args;

		$("##"+placeHolder).html($loading);
		
		
		$.post(url, Args, function(data){
				$("##"+placeHolder).html(data);
			//check if we load ckeditor
			if (textareaID.length == 0 || textareaID == "no"){
			} else {
				
				createCKE(textareaID);
			}
		});
}

<!---var basicEditor = CKEDITOR.config.toolbar_Basic[[ 'Source','-','Bold','Italic','Underline','NumberedList','BulletedList', ]];
var basicEditoeer = CKEDITOR.replace('interp3',{toolbarStatus:'hide', scayt_autoStartup:true,disableNativeSpellChecker:false,skin:'kama',uiColor:'##e6edf3',toolbar:[['Bold','Italic','Underline','-','SelectAll','-','SpellChecker','Scayt',]]});--->
////////////////////
///////////////Pop Up Opener  SITE WIDE////
function openWindow(params){
		
		//createDialog("openWindow");
		var url 						= params.url;
		var Args					= params.Args;
		var param				= params.param;
		var openeModal 		= 'openWindow';
		
		//check to see if first window already open
		if( $("##openWindow").dialog("isOpen")== true ){
			var openeModal = 'openSlaveWindow';
		}
		$("##"+openeModal).dialog("open").html($loading).load(url, param).dialog(Args);		//, 'stack' : true
}

//SCRIPTS FOR  TO DESTROY CKEDITOR ON THE FLY////	
function destroyCKeditor(textareaID){	
	var instanceName = textareaID;
	var editor = CKEDITOR.instances[instanceName];
				if( editor ) { 
					//alert(editor);
					editor.destroy(true);
				}
}
//POST DATA TO PAGE ////////////////////////////
function postData(params){
	
		var url 						= params.url;
		var Args					= params.Args;
		var callfunction		= params.callfunction;
		
		$.post(url, Args, function(data){
			
			if((callfunction.length)){
			window[callfunction](data);
			}
		});
}
//REMOVE A ROW FROM A TABLE//////////////////////
function removeRow(rowName, rowID){
		$("##"+rowName+rowID).animate( { backgroundColor: "##fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast"); 	
}

//BIT RETURNE ////////////
function bitReturn(x){
	var switched;
	if ( x == 1){
		var switched = 0;
	}else if (x == 0){
		var switched = 1;	
	}
	return switched
}

//BIT RETURNE ////////////
function bgColor(x){
	var bg;
	if(x ==1){
		var bg = '##66FF99';
	}else if(x ==0){
		var bg = '##FFCC66';
	}
	return bg
}

//RADIO BUTTON SELECT ACTION//////////////////////
<!---$('.radio').live('change', function(){
		var fetch_table 	= $(this).attr("src");
		var fetch_tableID 	= $(this).attr("title");
		var fetch_value		= $(this).attr("id");
		var fetch_function	= $(this).attr("alt");
		window[fetch_function](fetch_table, fetch_tableID, fetch_value);
}); --->

/////////////////Pnotify Growl messages/////////////
var stack_message = {"dir1": "right", "dir2": "down", "firstpos1": 400, "firstpos2": 85};
var stack_topleft = {"dir1": "down", "dir2": "right", "push": "top"};
function growl(title, message, type, icon, noticetype){
	// noticetype = notice/error
	// type = error/master/message
	// icon = picon picon-object-order-raise/picon picon-mail-unread-new/ui-icon ui-icon-mail-closed/picon picon-32 picon-fill-color/ ui-icon ui-icon-comment/picon picon-task-complete

	if (type == 'error'){
		$.pnotify({ 
						pnotify_title: title, 
						pnotify_text: message, 
						pnotify_type: 'error' ,
						pnotify_hide: false,
						pnotify_stack: stack_message
					});
	}
	if (type == 'master'){
		$.pnotify({ 
						pnotify_title: title, 
						pnotify_text: message, 
						pnotify_type: 'error' ,
						pnotify_hide: false,
						pnotify_stack: stack_message,//,
						//pnotify_before_open: function(pnotify){
								//"left": (  $(window).width() / 2) - (pnotify.width() / 2);  )     
						//}
						pnotify_after_close: function(){
							masterCRMMessage(<cfoutput>#session.staffID#</cfoutput>);
						}
					});
	}
	if (type == 'message'){
		$.pnotify({
						pnotify_title: title,
						pnotify_text: message,
						pnotify_hide: true,
						pnotify_stack: stack_topleft,
						pnotify_notice_icon: icon,
						pnotify_type: noticetype ,
					});
	}
}
function masterCRMMessage(staffID){
	//do some stuff here	
}

//////////////////////MODALS OPENERS////////
function openTasksWindow(packageID, eventID){
		openWindow({ url:'../tasks/index.cfm', param: {'packageID': packageID, 'eventID': eventID}, Args: modals.tasks});	
}

function openEventLocationWindow(eventID){
		openWindow({ url:'../conferences/dsp_location.cfm', param: {'eventID': eventID}, Args: modals.eventLocation});	
}

//////////////////////SCRIPTS FOR SPEAKERS PROGRAM/////////////////
//SET VARIABLES
var url_loadProgram 		= "../program/dsp_program.cfm";
var url_updateProgram 	= "../program/qry_updateProgram.cfm";
var url_updateSpeaker 	= "../program/qry_updateSpeaker.cfm";
var url_deleteSpeaker 	= "../program/qry_deleteSpeaker.cfm";

  function postUpdateSlot(speakerID, fieldName, value){
	$.post(url_updateSpeaker, {"speakerID" : speakerID , "fieldname": fieldName,  "value" : value }, function(){
			growl("well done", 'update successfull', 'message', 'ui-icon ui-icon-check', 'notice');
			//pr_showMessage('');
			closeProgramExtraDetailsPannels();
	});
}

function postDeleteSlot(speakerID, status){
	$.post(url_deleteSpeaker, {"speakerID" : speakerID, "status" : status }, function(){
			$("##slot_"+speakerID).fadeOut(300, function(){ $(this).remove();});
			growl("Speaker removed", 'update successfull', 'message', 'ui-icon ui-icon-check', 'notice');
	});
}

function saveProgram(programOrder){
	$.post(url_updateProgram, {"programOrder" : programOrder, "eventID" : eventID}, function(data){
		var searchStatus = returnSearchStatus();
		var get_printStatus 	= $(".print:checked").val();
		loadProgram(url_loadProgram, eventID, searchStatus, get_printStatus);
	
	}  );
}

//loads function for the return event speakers, 
function loadProgram(url, eventID, searchStatus, printStatus)
	{	
		var get_printStatus   = printStatus;
		var get_searchStatus  = searchStatus;
		$("##programList").html($loading);//show loading bar
		$.post(url, {"eventID": eventID, "searchStatus" : get_searchStatus, "printStatus" : printStatus }, function(data){  		
				if (get_printStatus == 'screan'){
						//alert("sreaansnsns");
					$("##programList").html(data);  
					$('##programList').sortable(sortableOptions).disableSelection(); 
					$(".units").editable(url_updateSpeaker, EIPselectOptions); 
					$(".speakerOrder").editable(url_updateSpeaker, EIPpositionOptions);
					$(".speakerTopic").editable(url_updateSpeaker, EIPtopicOptions);
					$('.collapsiblePanel').hide();
					
				}else if (get_printStatus == 'basic' | printStatus == 'full' | printStatus == 'excel') {
						//alert("otherrrs");
					growl("File available for download", data, 'message', 'ui-icon ui-icon-check', 'notice');
					$("##programList").html("");
				}
		  }, "text");
	}
	
//Load extra info into the div for speaker
$(".speakerLoadExtraInfo").live('click', function()
	{
			//alert("sdsdsdsd");
		var speakerID 	= $(this).attr("id");
		var field 		= $(this).attr("title");
		var userID 		= $(this).attr("alt");
			var instanceName = field+speakerID;
			var instance = CKEDITOR.instances[instanceName];
				if( instance ) { 
					instance.destroy(true);
				}
		loadSpeakerDetails(speakerID, field, userID);
		//$(this).parent().addClass('programEditingSlot');
});

function loadSpeakerDetails(speakerID, field, userID)
	{
		$.post("../program/dsp_speakerDetails.cfm", {"speakerID": speakerID, "field" : field, "userID" : userID }, function(data){  
								closeProgramExtraDetailsPannels(); 
								//$("##speakerExtraInfo_"+speakerID).html(data).slideDown('fast'); 
								$("##speakerExtraInfo_").html(data).toggle('fast');  
								$( '.fl_area' ).ckeditor({toolbar: 'Basic', width : 250, height: 100, toolbarStartupExpanded : false, removePlugins : 'elementspath' });
					}, "text");
}

//this destroy works FOR INDEX ////
function loadProgramMenu(eventID){
<!---	$(".ui-dialog-titlebar").load("../program/dsp_menu.cfm", {"eventID": eventID}, function(){
			var instanceName = 'extraDetails';
			var instance = CKEDITOR.instances[instanceName];
				if( instance ) { 
					instance.destroy(true);
				}
				//set editor in slot manager
			$( '##extraDetails' ).ckeditor({toolbar: 'Basic', width : 465, height: 250, removePlugins : 'elementspath'});
			$("##extraDetailsPain").css({display: 'none' });	
	});	--->
	openWindow({ url:'../program/dsp_menu.cfm', param: {"eventID": eventID}, Args:{  title : 'Manage program', height:600, width:390, modal:false}});
}

$(".loadContent").live('click', function(){
	var get_url 		= $(this).attr("href");
	var get_place	= $(this).attr("title");
	var get_value	= $(this).attr("id");
	
	$("##"+get_place).load(get_url,{"value": get_value }, function(){
			
	});
	return false; 
});

<!---function loadBranch(get_branchID, branchCompanyID, branchUserID){
		$("##branch").load("../branches/dsp_branche_Form.cfm",{"branchID": get_branchID, "companyID": branchCompanyID, "userID": branchUserID}, function(){
				//destroyCKeditor('branchBios');
				$("fieldset.Collapsible").collapse({closed: true});		
				$("##branchBios").ckeditor({toolbar: 'basic', toolbarStartupExpanded : false, removePlugins : 'elementspath' });	
		});
}--->

/* ////// EDIT IN PLACE WITH SUGGEST PLUGIN*/
$.editable.addInputType('autoComleteTitle', {
    element : function(settings, original) {
        var input = $('<input type="text" id="prefixID" name="prefixID" />');        
        $(this).append(input);
        return(input);
    },

    /* attach 3rd party plugin to input element */
    plugin : function(settings, original) {
        	settings.onblur = 'submit';
			$('##prefixID').autocomplete({
					source: function(request, response) {
							$.ajax({
							url: "../prefix/JSON_prefix_UI.cfm",
							dataType: "json",
							data: { term : request.term, nocache: randomnumber },
							success: function(data) { response(data); }
							});
						},
					minLength: 1,
					select:function( event, ui ) { 
							postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'',  Args: {"id" : userID, "fieldname": 'prefixID', "oldValue" : original.revert, "value": ui.item.id, "nocache": randomnumber}  });
					}
			});
	}
});

$.editable.addInputType('autoComleteCountry', {
    element : function(settings, original) {
        var input = $('<input type="text" id="CountryName" name="CountryName" />');        
        $(this).append(input);
        return(input);
    },

    /* attach 3rd party plugin to input element */
    plugin : function(settings, original) {
        	settings.onblur = 'submit';
			
			$('##CountryName').autocomplete({
					source: function(request, response) {
									$.ajax({
									url: "../countries/JSON_country_UI.cfm",
									dataType: "json",
									data: { term : request.term, nocache: randomnumber },
									success: function(data) { response(data); }
									});
								},
					minLength: 3,
					select:function( event, ui ) { 
							newCountryName = '';//set  the field with new country
							//var oldCountryID = $('##country_ID').val();//get old country ID for backup
							$(".phoneCode").html(ui.item.code);
							postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'NewCountryName',  Args: {"id" : userID, "fieldname": 'Countryid', "oldValue" : $('##country_ID').val(), "value": ui.item.id, "nocache": randomnumber}  });
							$('##country_ID').val(ui.item.id);///set country_ID on form
							postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'clearCityField',  Args: {"value": 0, "fieldname" : "cityID" , "id" : userID, "nocache": randomnumber}  });///clear city after change of Country
							newCountryName = ui.item.label;//set  the field with new country
					},
					change:function(event, ui) { 
							//$('##strCity').val(ui.item.cityname); 
					},
					open: function() {
					},
					close: function() {
					}
			});
	}
});


$.editable.addInputType('autoComleteCity', {
    element : function(settings, original) {
        var input = $('<input type="text" id="strCity" style="width:170px" class="ui-autocomplete-loading"  />');        
        $(this).append(input);
        return(input);
    },

    /* attach 3rd party plugin to input element */
    plugin : function(settings, original) {
			//settings.onblur = 'cancel';
        	settings.onblur = 'submit';
			
   			$('##strCity').autocomplete({
					source: function(request, response) {
							$.ajax({
							url: "../cities/JSON_CitiesUI.cfm",
							dataType: "json",
							data: { term : request.term, countryID : $('##country_ID').val(), nocache: randomnumber },
							success: function(data) { response(data);  }
							});
						},
					minLength: 3,
					select:function( event, ui ) {
							newCityName = '';
							postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'NewCityName',  Args: {"id" : userID, "fieldname": "cityID", "oldValue" : original.revert, "value": ui.item.cityid, "country_id" : $('##country_ID').val(), "strCity" : ui.item.cityname, "nocache": randomnumber}  });
							$('##cityID').val(ui.item.cityid);
							newCityName = ui.item.cityname;
					},
					change:function(event, ui) { 
							//$('##strCity').val(ui.item.cityname); 
					}

		});
	}
});

/* /////////
/////// SETTING FOR  TASKS MODAL */
function loadTaskForm(data){
	loadPageToPlaceHolder({ url:'../tasks/dsp_taskForm.cfm', placeHolder:'taskForm', textareaID:'no', Args: {"taskID": data, "packageID":tasks.packageID, "eventID": tasks.eventID}  }); 
}
function loadTasks(packageID){
	loadPageToPlaceHolder({ url:'../tasks/dsp_taskList.cfm', placeHolder:'taskList', textareaID:'no', Args: {"packageID": tasks.packageID}  }); 
}
function loadTask(data){
	$("##taskList").prepend(data);
}

/* ////////////
/////// SETTING FOR  CONTACTS MODAL */
<!---$('##ContactType :selected').val();
$("##ContactType").change(function(){
	  var fetch_contactType = $(this).val();
	  alert("alert contact menu");
	  loadContacts(contacts.companyID, fetch_contactType, contacts.userID);
});--->

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
}
/* END SETTING FOR CONTACTS MODAL/////////////////////// */

/* ////// SETTING FOR EVENTS LOCATION MODAL */
function actionEventLocationSave(randomID){
			//alert(eventLocation.thisWindow);
			$("##countryName").html($("##"+randomID+"eventLocation_countryName").val() );
			$("##cityName").html($("##"+randomID+"eventLocation_cityName").val() );
			$("##venuRoom").html($("##"+randomID+"eventLocation_venuRoom").val() );
		$('##'+eventLocation.thisWindow).dialog('close');
	}
	
/* END SETTING FOR EVENTS LOCATION MODAL///////// /////////////////// */

/* //////// SETTING FOR AKA LEBELS MODAL */
$(".aka_companyLabel").live('change', function(){
	var fetch_OldAKA_companyName = $("##AKA_companyName").html();
	var fetch_aka_companyName = $(this).attr("id");
	var fetch_aka_companyID = $(this).val();
	var fetch_userid = $(this).attr("title");
	$("##AKA_companyName").html(fetch_aka_companyName);
	$("##AKA_companyID").html(fetch_aka_companyID);
	postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'actionEditLabel2User',  Args: {id : fetch_userid, "fieldname": "AKA_companyID",  "value" : fetch_aka_companyID, "oldvalue": fetch_OldAKA_companyName }  });
	individual.AKA_companyID 	= fetch_aka_companyID;
});

function actionEditLabel2User(data){
	growl("Update", 'Label changed for user', 'message', 'ui-icon ui-icon-check', 'notice');
	$('##'+companyLabels.thisWindow).dialog('close');
}

function loadCompanyLables(companyID, AKA_companyID, userID){
		loadPageToPlaceHolder({ url:'../companyLabels/dsp_companyLabels.cfm', placeHolder:'AKA_companyList', textareaID:'', Args: {"companyID": companyID, "AKA_companyID": AKA_companyID, "userID" : userID}  }); 
}

function loadCompanyLableForm(companyID, AKA_companyID ){
		loadPageToPlaceHolder({ url:'../companyLabels/dsp_companyLabelForm.cfm', placeHolder:'AKA_companyForm', textareaID:'', Args: {"companyID": companyID, "AKA_companyID": AKA_companyID}  }); 
}

function SaveCompanyLabel(){
		var get_AKA_companyName = $("##companyAKA_AKA_companyName").val();  
		var get_AKA_companyURL 	= $("##companyAKA_AKA_companyURL").val();
		var get_AKA_companyID	 = $("##companyAKA_AKA_companyID").val();
		postData({ url:'../companyLabels/qry_addLabel.cfm', callfunction:'actionSaveLabel',  Args: {"AKA_companyID": get_AKA_companyID, "AKA_companyName": get_AKA_companyName,  "AKA_companyURL": get_AKA_companyURL,  "companyID": companyLabels.companyID }  });
}

function actionSaveLabel(){
	loadLabelForms();
	growl("Update", 'New Label added or Edited for company', 'message', 'ui-icon ui-icon-check', 'notice');
}

$(".manageLabel").live('click', function(){
	var fetch_labelID = $(this).attr("id");
	loadLabelForm(fetch_labelID);
});

function loadLabelForms(){
		loadCompanyLables(companyLabels.companyID , companyLabels.AKA_companyID, companyLabels.userID);
		loadCompanyLableForm(companyLabels.companyID , companyLabels.AKA_companyID);
}
function loadLabelForm(aka_companyID){
		loadCompanyLableForm(companyLabels.companyID , aka_companyID);
}

////////////////////////MOVE LABELS TO OTHER COMPANY
$("##buttonMoveLabels").live('click', function(){
		var selected = new Array();
		var newCompanyID = $("##newCompanyID").val();
	
		$(".labels2move:checked").each(function() {
			selected.push($(this).val());  
	  });		  
	  
	  if (selected.length){
		postData({ url:'../companyLabels/qry_labels2move.cfm', callfunction:'actionMoveLabelsSave',  Args: {"labelID": selected, "companyID" :newCompanyID}  });
	}else{
		alert("no labels selected to ove");
	}
		
});

function actionMoveLabelsSave(Rdata){
	$("##company2move2").html(Rdata);
}

/* ///END SETTING FOR AKA LABELS MODAL///////// */

/* ///////////////////////////SETTING FOR BRANCHES MODAL */

//edit branch link

$(".manageBranch").live('click', function(){
	var fetch_branchID = $(this).attr("id");
	var fetch_switchaction= $(this).attr("alt");
	$("##branch2area").html("");
	loadBranche(fetch_branchID, branches.companyID, branches.userID, fetch_switchaction);
});
//add add branch to user
$(".branche2user").live('change', function(){///nput[name='branche2user']
	var fetch_branchID = $(this).val();
	//branch2userCountry
	openWindow({ url:'../branches/dsp_coutry2user.cfm', param: {'branchID': fetch_branchID  }, Args:modals.branch2userCountry});
	
	postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'actionBranch2userAdded',  Args: {id : branches.userID, "fieldname": "branchid",  "value" : fetch_branchID, "oldvalue": branches.branchID }  });
});

// link branch to user
$("input[name='country2user']").live('change', function(){
	var fetch_countryID = $(this).val();
	postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'',  Args: {id : branches.userID, "fieldname": "countryID",  "value" : fetch_countryID }  });
	$('##'+country2user.thisWindow).dialog('close');
});

function actionBranch2userAdded(params){
	growl('Update', 'branch added to user or company', 'message', 'ui-icon ui-icon-check', 'notice');
	var jsonData = jQuery.parseJSON(params);
	//alert(jsonData.data);
	$("##postalAddress, ##streetAddress").html("branch details updated <br> branch id: "+ jsonData.data);
	$('##'+branches.thisWindow).dialog('close');
}

function actionSaveBranche(params){
	loadBranches(branches.branchID, branches.companyID, branches.userID,  'list-modal');
	loadBranche(0, branches.companyID, branches.userID, 'form-editable-modal');
}

function loadBranche(branchID, companyID, userID, switchAction ){
	loadPageToPlaceHolder({ url:'../branches/?fa='+switchAction, placeHolder:'branch', textareaID:'', Args: {"branchID": branchID, "companyID": companyID, "userID": userID}  });
}

function loadBranches(branchID, companyID, userID, switchAction){
	loadPageToPlaceHolder({ url:'../branches/?fa='+switchAction, placeHolder:'branches', textareaID:'', Args: {"branchID": branchID, "companyID": companyID, "userID": userID}  });
}

/////Branch2area 
$('.branch2area:checkbox').live('change', function(){
			var get_ThisArea 	= $(this).attr("checked") ? $(this).val() : 0
			var get_areaID 		= $(this).val();
			var get_branchID 	= $(this).attr("id");
			//alert(get_areaID);
				$.post("../areas/qry_branch2area_update.cfm", {"branchID" : get_branchID, "areaID": get_areaID, "value" : get_ThisArea }, function(rdata){ 
						//growl  
						if(get_ThisArea != 0 ){
						 $(this).parent().css('background-color', '##66FF99'); 
						 $(this).parent().css('background-color', '##FFCC66');
						}else{
								
						}
						
						});
});

/* ///END SETTING FOR BRANCHES MODAL///////////////////////// */
/* ///START FILE UPLOAD MODAL MODAL///////////////////////// */
function deleteFile(fileID){  
		alertUI({ title:"Warning", callfunction:'actionDeleteFile', type: "confirmation", param: {"fileID": fileID } , message: "To delete file select OK" })
}

function actionDeleteFile(data){	
		postData({ url:'../files/qry_delete.cfm', callfunction:'returnDeleteFile',  Args: {"fileID": data.fileID}  });	
}

function returnDeleteFile(data){
	removeRow('fileRow_', data );
}

function deleteFileRecord(fileID){  
		alertUI({ title:"Warning", callfunction:'actionDeleteFileRecord', type: "confirmation", param: {"fileID": fileID } , message: "To delete file select OK" })
}

function actionDeleteFileRecord(data){	
		postData({ url:'../files/act_removeRecord.cfm', callfunction:'returnDeleteFileRecord',  Args: {"fileID": data.fileID}  });	
}

function returnDeleteFileRecord(data){
	removeRow('fileRow_', data );
}


///////////Invoice details page
<!---$('##invoiceSent').live("click", function(){

	var get_Invoice_Sent		= $(this).attr("checked") ? $(this).val() : 0
			if(get_Invoice_Sent == 1 ){
				//alert("this is 1");
				$.post("Update_Invoice.cfm", {id : invoice.invoiceID, Invoice_Sent : JavaDateToday, fieldname:"Invoice_Sent_Date",  "value" : JavaDateToday});
				$('.Invoice_Sent_Date').html(JavaDateToday);
				$('##invoiceSent').css({'display' : 'none'});
			}else{
				//alert("this is on 0f");
				$.post("../user_edit/Update_Invoice.cfm?fieldname=Invoice_Sent_Date", {id : invoice.invoiceID, Invoice_Sent : 0 });
			}
});  --->

</script>
</body>
</html>
</cfoutput>
<!---	CKEDITOR.replaceAll( function( textarea, config ){
			  if (textarea.className=="noEditor") return false;
			  config.toolbar_Basic = [['Bold', 'Italic','NumberedList','BulletedList' ]]; 
			  config.toolbar = 'Basic';
			  config.toolbarStartupExpanded = false;
			  config.width = '200px';
			  config.height = '55px';
			  config.removePlugins = 'elementspath';
			  config.language = 'en';
			  //config.autoGrow_maxHeight = 200;
								});--->

<!---//SCRIPTS FOR INDEX ///////////////
$('[class^=indexPanel]').live('click', function() {
		var panel = $(this).attr("className");

		//$('[class^=indexDivPanel]').hide();
		$('#' + panel).toggle();
		//if (panel == 'indexPanel2' ){
				$("#speakerTopic").focus();
				
			//}
		//$('[class^=indexPanel]').not(this).hide("fast");
		//$(this).toggle();
		return false;
	});--->
<!---$.editable.addInputType('TagDragonTitle', {
    element : function(settings, original) {
        var input = $('<div id="Search_title" class="tagbox"><input type="text" name="Title" id="Title" style="width:170px"  /><input type="image" src="../img/CRM_button_OK.jpg" class="crm_button_OK"  /></div>');        
        $(this).append(input);
        return(input);
    },

    /* attach 3rd party plugin to input element */
    plugin : function(settings, original) {
			//settings.onblur = 'cancel';
        	settings.onblur = 'submit';
			
           $('#Search_title', this).tagdragon({
				'field':'prefixID',
				'url':'../components/JSON_Titles.cfm',
				'charMin' : 1, 
				'cache' : true,
				'max' : 10,
				onSelectedItem: function(val) { 
						//var oldvalue = this.revert;
						//var newvalue = $('#Title').val();
       					//return {"value": newvalue, "oldValue" : oldvalue };
				}
		});
	}
});--->

<!---<script>

TO TEST OUT
converteditor = function()
{
    $("#convertyes").unbind().click(function()
    {
        //turn our description into the ckeditor WYSIWIG
        CKEDITOR.replace('myeditor',
        {
            toolbar :   'Basic',
            width   :   600,
            height  :   400,
            forcePasteAsPlainText   :   true,
            startupFocus    :   true,
            resize_enabled  :   true,
            resize_maxHeight    :   450,
            resize_maxWidth :   650,
            resize_minHeight    :   300,
            resize_minWidth :   500
        });
    });
 
    $("#convertno").unbind().click(function()
    {
        //get editor instance
        var editor = CKEDITOR.instances.myeditor;
 
        //remove the editor instance
        CKEDITOR.remove(editor);
 
        //remove it from DOM
        $("#cke_myeditor").remove();
    });
}
 
getvalue = function()
{
    $("#getvalue").unbind().click(function()
    {
        //get editor object
        var editor = CKEDITOR.instances.myeditor;
 
        //check if we have an editor
        if(editor == undefined)
        {
            alert("Convert to editor first.");
        }
        else
        {
            //get the value in the editor
            var value = editor.getData();
 
            alert(value);
        }
    });

function showHtmlEditor(return_element){
	var ckoptions = { 	langCode: 'en', skin : 'office2003',
						width:600,
						toolbar:
						[
							['Source', '-', 'Bold', 'Italic', 'Underline', 'Strike', 'LeftJustify' ],
							['Image', 'Link', 'Unlink', 'Anchor'],
							['Cut','Copy','Paste','PasteText','PasteFromWord','-','Find','Replace'],
							['Undo','Redo','-','SelectAll','RemoveFormat'],
							['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
							['NumberedList','BulletedList'],
							['Format'],
							['TextColor','BGColor'],
							['Font','FontSize'],
						],
						filebrowserBrowseUrl:'ckfinder/ckfinder.html',
						// note that i use ckfinder for browsing images 
						filebrowserImageBrowseUrl:'ckfinder/ckfinder.html?type=Images',
						filebrowserFlashBrowseUrl:'ckfinder/ckfinder.html?type=Flash',
						filebrowserUploadUrl:'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
						filebrowserImageUploadUrl:'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
						filebrowserFlashUploadUrl:'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'  
					}
	
	var $dialog = $('<div class="ckeditor_dialog"></div>')
	.dialog({
		autoOpen: false,
		resizable:true,
		open: function(){
			$(this).append('<textarea class="editor"></textarea>');
			$(this).find('textarea.editor').ckeditor(ckoptions);
		},
		close: function(){
			// i binded the close event of the dialog
			//var editor = $('textarea.editor').ckeditorGet(); 
			//editor.destroy();
		},
		width:'auto',
		height: 430,
		buttons:{
			'Save' : function() {
						var editor = $('textarea.editor').ckeditorGet(); 
						var data = editor.getData()
				
	                    if( $('body').find('#'+return_element).length!=0 ){
	                            $('#'+return_element).val( data );
								//$('textarea.editor').ckeditorGet().destroy(); 
	                            $(this).dialog('close');
	                    }
	                },
	                'Cancel' : function(){
							//$('textarea.editor').ckeditorGet().destroy(); 
	                        $(this).dialog('close');
	                        
	                }
	            }
		});
		
		$dialog.bind("dialogclose", function(){
			$('textarea.editor').ckeditorGet().destroy(); 
			$(this).dialog('destroy');
			$('.ckeditor_dialog').remove();
		});
		$dialog.dialog('open');
		$("#cke_5").livequery( function(){
            $("#cke_5").bind('click', function(){
                 if( $(":button:contains('Save')", ".ui-dialog").is(":disabled") ){
                     $(":button:contains('Save')").button("enable");
                 }
                 else{
                     $(":button:contains('Save')").button("disable");
                 }
                if( $(":button:contains('Cancel')", ".ui-dialog").is(":disabled") ){
                     $(":button:contains('Cancel')").button("enable");
                 }
                 else{
                     $(":button:contains('Cancel')").button("disable");
                 }
            });
        });
}
</script>--->

<!---//SCRIPTS FOR BRANCHES/////////
				//alert( CKEDITOR.instances.instanceName );
			//var instance = CKEDITOR.instances[instanceName];
			//var instance = CKEDITOR.instances;
				//var editor = $('#openWindow textarea.editor').ckeditorGet(); 
				//editor.destroy();
				//if(CKEDITOR.instances.ckeditor){
			          //CKEDITOR.instances.ckeditor.destroy();
        		//}
				
				//$(this).find('textarea').ckeditorGet().destroy();
				//var myinstances = [];
				//if (CKEDITOR.instances){
					//for(var i in CKEDITOR.instances) {
				   //alert(CKEDITOR.instances[i]);
					//}
				//}
$(".manageBranch").live('click', function(){
		
		var get_branchID = $(this).attr("id");
		$("#branch").load("../branches/dsp_branche_Form.cfm",{"branchID": get_branchID, "companyID": branchCompanyID, "userID": branchUserID  }, function(){
				destroyCKeditor('branchBios');
				$( '#branchBios' ).ckeditor({toolbar: 'none', toolbarStartupExpanded : false, removePlugins : 'elementspath' });	
		});
});	
$("")--->
<!---	$("#openWindow").dialog("open").html($loading).load(URLToLoad, {
					"param1": param1, 
					"param2": param2, 
					"param3" : param3
					}).dialog({ forcePlaceholderSize: true , title : title, height  : height, width : width, modal : modal , position: 'center'});		//, 'stack' : true--->
<!---

    //CKEDITOR.instances[i]; 
    /* this returns the names of the textareas/id of the instances. */
    //CKEDITOR.instances[i].name;
    /* returns the initial value of the textarea */
    //CKEDITOR.instances[i].value;  
   /* this updates the value of the textarea from the CK instances.. */
   //CKEDITOR.instances[i].updateElement();
   /* this retrieve the data of each instances and store it into an associative array with
       the names of the textareas as keys... */
   //myinstances[CKEDITOR.instances[i].name] = CKEDITOR.instances[i].getData(); 
--->