<script type="text/javascript">
 $(document).ready(function() {
 	
 //////////UPLOAD 
 <cfoutput>
 var eventID = #qryEvent.webID#;
 
 <cfif qryEvent.event_type EQ "cm"  > 
 
  new AjaxUpload('##upload_brochure', {
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'Brochure', field : 'file_update'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_brochure').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_brochure').html("Loading Completed..."); }
});
 
  new AjaxUpload('##upload_banner', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'headBanner', field : 'file_image_pdf'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_banner').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_banner').html("Loading Completed..."); }
});  
 </cfif>
 
 <cfif qryEvent.event_type EQ "week">
 new AjaxUpload('##upload_brochure', {
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'Brochure', field : 'file_update'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_brochure').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_brochure').html("Loading Completed..."); }
});
 new AjaxUpload('##upload_SponsorOp', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'SponsorExhiDoc', field : 'doc_SE_intern'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_SponsorOp').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_SponsorOp').html("Loading Completed..."); }
});

 new AjaxUpload('##upload_banner', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'headBanner', field : 'file_image_pdf'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_banner').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_banner').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_SponsorOpFile', {    
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'HotelForm', field : 'sponsorOppFile'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_SponsorOpFile').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_SponsorOpFile').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_HotelFile', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'HotelForm', field : 'event_loc_weather'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_HotelFile').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_HotelFile').html("Loading Completed..."); }
});  
 new AjaxUpload('##upload_Homebanner', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'HomeBanner', field : 'HomePageBanner'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_Homebanner').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_Homebanner').html("Loading Completed..."); }
}); 
$(".discountDate").editable("update_eventAjax.cfm?field=discountDate", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'discountDate',
		id   : 'id',
		
		type      : 'datepicker',
        
    });
$('.discountValue').editable('update_eventAjax.cfm?field=discountValue', { 
        	id   : 'id',
			name : 'discountValue',
			
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});

</cfif>
////////////////////////////////////////// template Files
 new AjaxUpload('##upload_topBanner', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'BT', field : 'newsletterBannerTop'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_topBanner').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_topBanner').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_colum1', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'Col1', field : 'newsletterBannerCol1'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_colum1').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_colum1').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_colum2', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'Col2', field : 'newsletterBannerCol2'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_colum2').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_colum2').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_topBanner600', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : eventID, for : 'BT600', field : 'newsletterBannerTop600'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_topBanner600').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_topBanner600').html("Loading Completed..."); }
});  
 </cfoutput>
 /////////   
 $("#location").click(function(){
	 openEventLocationWindow(eventID);
 });
 
  $(".eventInfo").click(function(){
	 window.open ("http://www.petro21.com/my-officex/conferences/?fa=layout-eventInfo&eventID=<cfoutput>#qryEvent.eventId#&parentID=#qryEvent.parentID#</cfoutput>");
 });
 
$(".event_cost_currency").editable("update_eventAjax.cfm?field=event_cost_currency", { 
<!---    id   : 'id',
    name : 'event_cost_currency',--->
	indicator : '<img src="../img/indicator.gif">',
    data   : "{'$':'US - $','£':'UK - &pound;','EUR':'EU - &euro;','ZAR':'SA - ZAR', 'AUD' : 'AUD'}",
    type   : "select",
    submit : "OK",
    style  : "inherit",
	onblur 	: 'submit',
    submitdata : function() {
			var oldvalue = this.revert;
      return {'id' : eventID, 'fieldname' : 'event_cost_currency', 'oldvalue' : oldvalue };
    }
  }); 
  
$(".ckeckbox:checkbox").change(function(){
			var get_field = $(this).attr("id");
			var get_value = $(this).attr("checked") ? $(this).val() : 0
			if(get_value == 1 ){
				$.post("../events/update_eventAjax.cfm", {id : eventID,  "fieldname": get_field, "oldvalue": 0, "value": 1  });
			}else{
				$.post("../events/update_eventAjax.cfm", {id : eventID,  "fieldname": get_field, "oldvalue": 1, "value": 0 });
			}
}); 

  ///////////hotels
$(".hotel").editable("update_eventAjax.cfm?field=hotel", { 
<!---    id   		: 'id',
    name 	: 'hotelname',--->
	indicator : '<img src="../img/indicator.gif">',
    loadurl 	: 'hotelList.cfm',
    type   	: "select",
	onblur 	: 'submit',
    submit 	: "OK",
    style  	: "inherit",
    submitdata : function(value, settings) {
					var oldvalue = this.revert;
					return {id : eventID, "fieldname": "hotel", "oldvalue": oldvalue};
    		}
  });
  ///////////Country
$(".event_loc_country").editable("update_eventAjax.cfm?field=event_loc_country", { 
<!---    id   		: 'id',
    name 	: 'event_loc_country',--->
	indicator : '<img src="../img/indicator.gif">',
    loadurl 	: 'Json_country.cfm',
    type   	: "select",
	onblur 	: 'submit',
    submit 	: "OK",
    style  	: "inherit",
	submitdata : function(value, settings) {
					var oldvalue = this.revert;
					return {id : eventID, "fieldname": "event_loc_country", "oldvalue": oldvalue};
    		}
  }); 
 
//// END 
				$('#tabs').tabs();
				 
				<cfif qryEvent.event_type EQ "week" >
				$("#Sponsorship").accordion({ header: "h3" });
				</cfif>
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
				$("a[rel*='colorbox']").colorbox({iframe:true, width: "100%", height: "97%"});
				$('.tabEventsOn, .tabEventsOff').corner("top");
 });    
 
 
 function loadFunction(url, placement, value1){
			$("#"+placement).fadeIn("slow").load(url, {value1:value1} );
		}	
		
function DeleteFunction(url, id, record){
					$.post(url, {deleteID:id}, function(){ $("#"+record+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow").remove("");  });
}	

function addContactFunction(url, eventID, staffID, table){
					var contactTypeID = $('#contactType').val();
					$.post(url, {eventID:eventID, staffID:staffID, contactTypeID:contactTypeID }, function(returnedData){ $('#'+table+' tr:first').before(returnedData);	  });
}	

function loadFlashNews(){
			$("#areaNewLoad").fadeIn("slow").load("../P21Newsmanagement/FlashNews.cfm");
		}	
function loadNewsFlashList(newsletter){
			$("#areaNewLoad").fadeIn("slow").load("../P21Newsmanagement/newsletter_FlashNewsSelect.cfm" , { newsletter: newsletter  });
		}

function deleteLogo(id, eventid, field) {
			$.post("company_sponsorDelete.cfm", { id: id , eventid: eventid, field:field }, function(){  $("#"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
		}
function deleteBanner(bannerid, bannerplace, bannerType, newsletter){
			$.post("../P21Newsmanagement/newsletter_Deletebanner.cfm", { bannerid: bannerid, bannerplace: bannerplace, bannerType: bannerType, newsletter: newsletter }, function(){ 
					$("#"+bannerid).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow").remove("");
			 });
		}
<!---<cfoutput>
function loadSponsorList(){
			$("##areasponsorList").fadeIn("slow").load("../sponsorship/sponsorshipList.cfm" , { groupby: #qryEvent.groupby# , event_year :  #qryEvent.event_year#  });
		}
		
</cfoutput>	--->	
		  
</script>

<script type="text/javascript">
$(document).ready(
	function () {
	$("#focusOn").ckeditor({ toolbar: 'Basic', width : 440 });
	$("#event_blurb").ckeditor({toolbar: 'Basic' ,  width : 600}); 
	$("#event_blurb_sponsors").ckeditor({toolbar: 'Basic' });  
	$("#event_blurb_exhib").ckeditor({toolbar: 'Basic' });  
	
		//$('a.closeEl').bind('click', toggleContent);
		$('div.groupWrapper').Sortable(
			{
				accept: 'row',
				helperclass: 'sortHelper',
				activeclass : 	'sortableactive',
				hoverclass : 	'sortablehover',
				handle: 'div.col1',
				tolerance: 'pointer',
				onChange : function(ser)
				{
				},
				onStart : function()
				{
					$.iAutoscroller.start(this, document.getElementsByTagName('body'));
				},
				onStop : function()
				{
					$.iAutoscroller.stop();
				}
			}
		);
	}
);
var toggleContent = function(e)
{
	var targetContent = $('div.col2', this.parentNode.parentNode);
	if (targetContent.css('display') == 'none') {
		targetContent.slideDown(300);
		$(this).html('[-]');
	} else {
		targetContent.slideUp(300);
		$(this).html('[+]');
	}
	return false;
};
function serialize(s)
{
	serial = $.SortSerialize(s);
	$.post("logosave.cfm", {  eventid: eventID, list: serial.hash  }, function(data){ alert(data);} );
	//alert(serial.hash);
	
};

$(document).ready(function() { 	
<!--- SEARCH AND FIND COMPANIES FOR LOGOS ----------->
    	$('#formSearchCompany').submit(function() { 
				$(this).ajaxSubmit({ target: '#AreaLoadCompanies', clearForm: true}); 
				return false; 
    	}); 
<!---});

$(document).ready(function() { --->	
<!--- SUBMIT FORMS FIELDS --------------->		
	    $('#BlurbFocus, #BlurbForm, #exhibBlurb, #sponsorsBlurb').submit(function() { 
				$(this).ajaxSubmit({ success: returnFormData, clearForm: false }); 
				return false; 
    	});
});	
<!--- 
				//$('form').bind('form-pre-serialize', function(e) {
									//tinyMCE.triggerSave();
					//});
, dataType: 'json' 
function returnFormData(dataReturn){
		$('#'+dataReturn.field).html(dataReturn.data);
}--->

<!--- Set the Dialog Box 
 $('#dialog').dialog({
     autoOpen:false,
     modal:'true',
     overlay: {background: '#ffffff' }
  });--------->

function returnFormData(){
<!---$("#dialog").html("Text has saved").dialog({
			bgiframe: true,
			modal: true,
			buttons: {
				Close: function() {
					$(this).dialog('close');
				}
			}
		});--->

}

<!--- LOAD THE DINNER meals PREFERENCE LIST AND ADD A NEW MEAL --------> 
function loadMenuOptions(){
	 	$("#areaFunctions").load("../Meal_Preference/index.cfm", {eventid: eventID } );
	 }

function Rem_Speak_Slot(id){
		$.post("http://www.petro21.com/my-office/program/Update_program_speaker.cfm", { id: id}, function(){  $("#SelectedSpeaker").html(""); });
}
function Rem_Speak_SlotNew(){
		 $("#SelectedSpeaker").html("");
}
function secondTab(){
			$('#tabOptions').tabs('select', 1);
}

//LOAD SAVED PRICE 
function load_price_result(data){
	$('#area_areaPrices').html(data);
}

$(document).ready(function() { 	

	//Ajax form save price
	$("#EventNewPriceForm").live("submit", function() { 
				//alert("form will submit");
				$(this).ajaxSubmit({ success:  load_price_result, clearForm: false  }); 
				return false;
	}); 

	<cfoutput>
 var eventID = #qryEvent.webID#;
 	</cfoutput>

	$('.fl_area').editable('update_eventAjax.cfm', { 
			onblur 	: 'submit',
			width	: 205,
			height	: 51,
         	indicator : '<img src="../img/indicator.gif">',
			class 	:  'inherit',
			submitdata : function(value, settings) {
				var fieldname = $(this).attr("id");
				var oldvalue = this.revert;
				return {"id" : eventID  , "fieldname": fieldname, "oldValue" : oldvalue };
 			}
     });
	 
	 $('.fl_comboShort').editable('update_eventAjax.cfm', { 
			onblur 	: 'submit',
			width	: 113,
			height	: 20,
         	indicator : '<img src="../img/indicator.gif">',
			submitdata : function(value, settings) {
				var fieldname = $(this).attr("title");
				var oldvalue = this.revert;
				return {"id" : eventID  , "fieldname": fieldname, "oldValue" : oldvalue };
 			}
     });
	 
	 $('.fl_text').editable('update_eventAjax.cfm', { 
			onblur 	: 'submit',
			width		: 205,
			height:  20,
         	indicator : '<img src="../img/indicator.gif">',
         	submitdata : function(value, settings) {
				var fieldname = $(this).attr("id");
				var oldvalue = this.revert;
				return {"id" : eventID  , "fieldname": fieldname, "oldValue" : oldvalue };
 			}
     });
	 
	 $(".fl_date").editable("update_eventAjax.cfm", { 
        indicator : "<img src='../img/indicator.gif'>",
		onblur 	: 'submit',
		type : 'ui_datepicker',
		submitdata : function(value, settings) {
								var fieldname = $(this).attr("id");
								var oldvalue = this.revert;
 								return {"fieldname": fieldname, "oldValue" : oldvalue, "id" : eventID  };
 								}
	});
});
</script>
