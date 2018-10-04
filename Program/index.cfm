
<style>
	
	/*#program_infoMessage {border:1px solid #1a850b; background-color:#f2fff2; color:#1a850b; visibility:hidden}*/
	#programList .editing { border:1px solid #6fa1d9}
<!---	#programList .i .fl_area{ width:285px }
	.index button{padding:2px 8px; margin:0 0 0 6px}
	#programList label { padding:0px 0px 0px 0 }--->

	#programPaneSlot {visibility:hidden}
	#programPaneSlot  #ProgramExtraDetailsField{ clear:both}
	#programSaveChangesMessage { border:1px solid #b10808; background-color:#F0E7DB  color:#b10808; padding:8px ; display:none } 
	
	#programList { list-style-type: none; margin: 0; padding: 0; width: 685px; float:left }
	
	#programList li { margin: 0px; padding: 0px; font-size:12px; display: block; border-bottom:1px solid #CCC; color:#666666; position:relative; width:685px }
	.ui-state-highlight { height: 70px; padding:8px ;  }
	.ui-sortable-helper{ background: rgba(255, 255, 255, 0.9); border-top:1px solid #CCC}
	
	
	
	
	
	#programList li .slot_sortable_handle{  cursor:move; margin:0 0px 0 0; display:inline; float:left; width:70px}
	
	
	#programList li .slot_speaker{float:left; display:inline; position:absolute; margin:0 0px 0 0; width:550px; color:#000000; font-size:11px;  padding:0 0 0 10px}/*border-right:1px solid #e8e8e8; width:300px*/
	
	#programList li .slot_tabClose{float:right; z-index:5; right:0px; top:-10px; position:relative; width:60px; background: url(../_img/program_bt-close.png) no-repeat left top  }
	#programList li .slot_tabClose:hover{ cursor:pointer}
	
	#programList li .slot_tab{float:right; z-index:5; right:0px; top:0px; position:relative; width:60px; background: url(../_img/program_bt-options.png) no-repeat left top }
	#programList li .slot_tab:hover{ cursor:pointer}
	/*#programList li .list_options{float:left; display:inline; margin:0 5px 0 0; width:110px; border-right:1px solid #e8e8e8}*/
	
	
	/*#programList li .list_speakerContainer {height:80px; overflow:hidden}*/
	
	#programList li .optionsPane_1 .c2{width:100px}
	#programList li .optionsPane_1 .c1{width:70px}
	
	
	/*to 
	#programList li .list_optionsStatus{float:left; display:inline; margin:0 5px 0 0; width:110px; border-right:1px solid #e8e8e8}
	#programList li .list_optionsComments{float:left; display:inline; margin:0 5px 0 0; width:95px; border-right:1px solid #e8e8e8}
	#programList li .list_optionsOrder{float:left; display:inline; margin:0 5px 0 0; width:95px; border-right:1px solid #e8e8e8}go*/
	
	
	#programList li .noBorder{border-right:none}
	#programList li .speakerTopic{ width:542px; height:25px; color:#06406d; font-size:12px; }
	#programList li .border{border:1px solid #e8e8e8}
	#programList li .collapsiblePanel { clear:both; border-top:#CCCCCC  }
	#programList li .collapse { cursor:pointer; padding:3px 0px }
	#programList li .confirmed {background-color:#9cee93}
	#programList li .finalized {background-color:#6fb368}
	
	#programList .tolocation { bottom:5px; right:5px}
	#programList .speakerOrder{ width: 15px; height: 8px; margin:0px; background-color:#fff}
	#programList hr{ margin:2px 0px}
	<!---#programList li .speakerExtendedInfo { padding:15px 10px 15px 136px }--->
	
	#programList li .slot_time_1 { clear:both; padding:10px 0 0 5px; margin:0 ; display:inline; float:left; width:50px; position:relative; height:80px; }
	#programList li .slot_time_2 { clear:both; padding:10px 0 0 5px; margin:0 ; display:inline; float:left; width:50px; position:relative; height:30px}
	#programList li .slot_time_3 { clear:both; padding:10px 0 0 5px; margin:0 ; display:inline; float:left; width:50px; position:relative; height:30px; background-color:#fff}
	#programList li .slot_time_4 { clear:both; padding:10px 0 0 5px; margin:0 ; display:inline; float:left; width:50px; position:relative; height:30px; background-color:#e9e9e9}
	#programList li .slot_time_5 { clear:both; padding:10px 0 0 5px; margin:0 ; display:inline; float:left; width:50px; position:relative; height:80px; background:url("../_img/programOption_bg.png") repeat scroll 0 0 transparent}<!---background-color:#8ddf85;--->
	#programList li .slot_time_6 { clear:both; padding:10px 0 0 5px; margin:0 ; display:inline; float:left; width:50px; position:relative; height:80px;}
	
	#programList li .slot_speakerContainer_1,
	#programList li .slot_speakerContainer_5,
	#programList li .slot_speakerContainer_6 {height:90px; overflow:hidden; }
	#programList li .slot_speakerContainer_2,
	#programList li .slot_speakerContainer_3,
	#programList li .slot_speakerContainer_4 {height:40px; overflow:hidden;}
	
	#programList li .optionsPane_1,
	#programList li .optionsPane_5,
	#programList li .optionsPane_6 { display:none; height:80px; background-color:#eef6fb; width:550px;  padding:10px 0 0 10px; background:url("../_img/programOption_bg.png") repeat scroll 0 0 transparent}
	#programList li .optionsPane_2,
	#programList li .optionsPane_3,
	#programList li .optionsPane_4 { display:none; height:30px; background-color:#eef6fb; width:550px;  padding:10px 0 0 10px; background:url("../_img/programOption_bg.png") repeat scroll 0 0 transparent}
	
	#programList li .height_1,   
	#programList li .height_5,  
	#programList li .height_6{ height:90px}
	#programList li .height_2, 
	#programList li .height_3,
	#programList li .height_4{ height:40px}
	
	/*# { border:1px solid #0b4d85; color:#0b4d85; background-color:#f2fdff}*/
	
	#programList .height_2 i, 
	#programList .height_4 i , 
	#programList .height_3 i, 
	#programList .height_6 i{ margin:0px}
	#programList .height_1 i {  margin:0px 0 4px 0px; padding: 0;font-weight:bold }
	
	#programList .slotType_1,
	#programList .slotType_3,
	#programList .slotType_4,
	#programList .slotType_5 { background-color:#fff}
	#programList .slotType_2 { background-color:#E4F1FF}/* baground color for session*/
	#programList .slotType_6 { background-color:#fff2ef}/* baground color for end of Day*/
	
	
	#programList .slot_optionsOrder i { margin:0 0 0 4px; width: 15px; height: 6px; background-color:#fff}
	 #programList .height_4 i { color:#666}
	 #programList .height_3 i, #programList  .height_6 i { color:#a74832}
	#programList  .slot_speaker .height_6  div { max-height:60px; overflow:hidden; margin:0 10px 0 0}
	#programClose { border-color:#1a5698; color:#1a5698}
	</style>


<script type="text/javascript">









//click function from button  to load program for the event
$("#load_program").live("click", function(){
		eventID = $('#eventid :selected').val();
		if(eventID != 0 ){
			var printAs 			= $(".print:checked").val();
			var searchStatus 	= returnSearchStatus();
		 	$("#eventID").val(eventID);//set value of eventID to hidden field form
			$("#programPaneSlot").css({ 'visibility' : 'visible'});//make button new slot visible//display the pannel buttons
			loadProgram(url_loadProgram, eventID, searchStatus, printAs );
		}else{
			alert("no event selected");
		}
		return false;
	});





//options for the drag and drop function
var sortableOptions = { 
		placeholder: "ui-state-highlight" , 
		cursor		: "move",
		handle 		: '.slot_sortable_handle',
		axis			: 'y',
		update 	: function (event, ui)  {
							EnableProgramSave();
							programOrder = $('#programList').sortable('serialize' );
		}
}

//options for the select dropdown time function
var EIPselectOptions = { 
		indicator 	: '<img src="../img/indicator.gif">',
		data   		: "{'1':'5', '2':'10', '3':'15', '4':'20', '5' : '25', '6' : '30', '7' : '35', '8': '40', '9': '45', '10': '50', '11': '55', '12': '1h', '13': '1h5', '14': '1h10', '15': '1h15', '16': '1h20', '17': '1h25', '18': '1h30', '21': '1h45', '24': '2h', '26': '2h10', '27': '2h15', '28': '2h20', '29': '2h25', '30': '2h30'}",
		type   		: "select",
		style			: 'display: inline',
		id				: 'speakerID',
		width		: 30,
		onblur 		: 'submit',
		submitdata : function() {
							return {"fieldname": "speakerUnit" };
		},
		callback : function() {
						EnableProgramSave();
     	}
}

//options for the speaker position
var EIPpositionOptions = {
		height 		: 9,
		width		: 13,
		id				: 'speakerID',
		type 			: "text",
		indicator 	: '<img src="../img/indicator.gif">',
		tooltip   	: "Click to edit...",
		onblur 		: 'submit',
		style			: 'display: inline',
		submitdata : function(value, settings) {
							return {"fieldname": "speakerOrder" };
		}
}

//options for the speaker topic 
var EIPtopicOptions = {
		height 		: 18,
		width		: 540,
		id				: 'speakerID',
		type 			: "text",
		indicator 	: '<img src="../img/indicator.gif">',
		tooltip   	: "Click to add topic",
		onblur 		: 'submit',
		style			: 'display: inline',
		submitdata : function(value, settings) {
								return {"fieldname": "speakerTopic" };
							}
}


//edit Key note speker status
$('.speakerKeyNote').live('change', function(){
		var get_KeyNoteStatus = $(this).attr("checked") ? $(this).val() : 0
		var get_speakerID = $(this).attr("id");
		postUpdateSlot(get_speakerID, "speakerKeyNote", get_KeyNoteStatus );
});

//function for the speaker status
$(".status:checked").live('change', function(){
		var status = $(this).val();
		var get_speakerID = $(this).attr("id");
			if (status ==1 | status == 2 | status == 3 | status == 6 ){
					postUpdateSlot(get_speakerID, "speakerStatus", status );
					//alert(status + ' ' + get_speakerID );
			}else if ( status == 5){
					postDeleteSlot(get_speakerID, status );
					//alert(' delete this record' + ' ' + get_speakerID   );
			}else if (status == 10 | status == 11){
					postDeleteSlot(get_speakerID, status );
			}
		
		
});
//function save comments
$(".button_comments").live('click', function(){
		var get_field 			= $(this).attr("title");
		var get_speakerID 	= $(this).attr("id"); 
		var get_editor			= get_field+get_speakerID;
		var get_fieldValue	= $( 'textarea#'+get_field +get_speakerID ).val();
		postUpdateSlot(get_speakerID, get_field, get_fieldValue );		
}); 


function closeProgramExtraDetailsPannels(){
	//if ($(".collapsiblePanel").is(':visible')){
			//$(".collapsiblePanel").html("").toggle();
			//$("#openWindow").dialog({ height  : 790});	
	//}
	if ($("#speakerExtraInfo_").is(':visible')){
			$("#speakerExtraInfo_").html("").toggle();
			//$("#openWindow").dialog({ height  : 790});	
	}
}

function EnableProgramSave(){
	$("#programSaveChangesMessage").css({ "display" : "block" });
	$(".ui-dialog-titlebar").addClass('warningBorder');
}

function DisableProgramSave(){
	$("#programSaveChangesMessage").css({ "display" : "none" });
	$(".ui-dialog-titlebar").removeClass('warningBorder');
}

$("#button_saveProgram").live('click', function(){ 	
		saveProgram(programOrder);
		DisableProgramSave();
	});
	


//set search variables for program
function returnSearchStatus(){
	var searchStatus = '';
	var searchStatus = $('input:checkbox:checked.searchStatus').map(function(){ return this.value; }).get().join(',');
	//var searchStatus = $.toJSON(searchStatus);
	//var searchStatus = $(searchStatus).serialize();
	return searchStatus;
}


function addSlotPosition(){
	var position = $(".tolocation:checked").parent().parent().prevAll().length;
	return position;
}

function addSlotToProgram(data){
		var newposition = addSlotPosition();
		$("#programList li:eq("+newposition+")").after(data);
		//pr_showMessage();
}

$(document).ready(function(){
	
	$(".slot_tab").live('click', function(){
			//alert("opt");
			var $panelMove = $(this).parent().prev();
			var $panelHide = $(this).parent();
			$($panelMove).css("display" , "block");
			$($panelHide).css("display" , "none");
			
	});	
	
	$(".slot_tabClose").live('click',function(){
			var $panelHide = $(this).parent();
			var $panelMove = $(this).parent().next();
			$($panelHide).css("display" , "none");
			$($panelMove).css("display" , "block");
	});

	loadProgramMenu(0);
	
//selection of slot type function in add slot pannel	
	$("#speakerType").live('change', function(){
		var slotType = $('#speakerType :selected').val();
			if (slotType == 2){
				var titleLabel = 'Session';
				var filedHide = 'none';
				$("#speakerUnit").get(0).selectedIndex = 0;
				$( '#extraDetails' ).html();
			
			}else if (slotType == 3) {
				var titleLabel = 'Information';
				var filedHide = 'inline';
			
			}else if (slotType == 4){
				var titleLabel = 'File';
				var filedHide = 'none';
				$("#speakerUnit").get(0).selectedIndex = 0;
				$( '#extraDetails' ).html();
			
			}else if (slotType == 6){
				var titleLabel = 'End';
				var filedHide = 'inline';
			
			}else if (slotType == 1){
				var titleLabel = 'Briefing';
				var filedHide = 'inline';
			
			}else if (slotType == 5){
				var titleLabel = 'Moderator';
				var filedHide = 'none';
				$( '#extraDetails' ).html();
			} 
			
			$("#topicLabel").html(titleLabel + " title");
			$("#buttonLabel").html("Add " +titleLabel+ " slot");		
			$("#ProgramExtraDetailsField").css({display: filedHide });
			
	});

});


	</script>
          

<ul id="programList"></ul>