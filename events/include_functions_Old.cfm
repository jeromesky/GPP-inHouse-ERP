
<script type="text/javascript">
 $(document).ready(function() {
 	
 //////////UPLOAD 
 <cfoutput>
 var eventID = #get_event.id#;
 
 <cfif get_event.event_type EQ "cm"  > 
 
  new AjaxUpload('##upload_brochure', {
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'Brochure', field : 'file_update'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_brochure').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_brochure').html("Loading Completed..."); }
});
 
  new AjaxUpload('##upload_banner', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'headBanner', field : 'file_image_pdf'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_banner').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_banner').html("Loading Completed..."); }
});  
 
 </cfif>
 
 <cfif get_event.event_type EQ "week"  >
 new AjaxUpload('##upload_brochure', {
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'Brochure', field : 'file_update'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_brochure').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_brochure').html("Loading Completed..."); }
});
 new AjaxUpload('##upload_SponsorOp', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'SponsorExhiDoc', field : 'doc_SE_intern'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_SponsorOp').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_SponsorOp').html("Loading Completed..."); }
});


 new AjaxUpload('##upload_banner', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'headBanner', field : 'file_image_pdf'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_banner').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_banner').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_SponsorOpFile', {    
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'HotelForm', field : 'sponsorOppFile'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_SponsorOpFile').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_SponsorOpFile').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_HotelFile', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'HotelForm', field : 'event_loc_weather'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_HotelFile').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_HotelFile').html("Loading Completed..."); }
});  
 new AjaxUpload('##upload_Homebanner', {   
  action: 'dsp_ftp.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'HomeBanner', field : 'HomePageBanner'},
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
		submit    : 'OK',
		type      : 'datepicker',
        tooltip   : "Click to edit..."
    });
$('.discountValue').editable('update_eventAjax.cfm?field=discountValue', { 
        	id   : 'id',
			name : 'discountValue',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});

</cfif>
///////////////////////////////////////////////////////////////////////////////////////////////// template Files
 new AjaxUpload('##upload_topBanner', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'BT', field : 'newsletterBannerTop'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_topBanner').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_topBanner').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_colum1', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'Col1', field : 'newsletterBannerCol1'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_colum1').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_colum1').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_colum2', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'Col2', field : 'newsletterBannerCol2'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_colum2').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_colum2').html("Loading Completed..."); }
});  

 new AjaxUpload('##upload_topBanner600', {   
  action: 'UploadTemplateFiles.cfm',
  name: 'Upload',
  data: { id : '#get_event.id#', for : 'BT600', field : 'newsletterBannerTop600'},
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_topBanner600').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_topBanner600').html("Loading Completed..."); }
});  
 </cfoutput>
 /////////   
<!---
    $(".focusOn").editable("update_eventAjax.cfm?field=focusOn", { 
	id  		: 'id',
    name 		: 'focusOn',
	type      	: 'wysiwyg',
    onblur    	: 'ignore',
	submit   	: "Save",
	cancel    	: 'Cancel',
	tooltip   		: 'Click to edit...',
	indicator 	: "<img src='../img/indicator.gif'>",
	wysiwyg   	: { controls : { separator04         : { visible : true },
                               insertOrderedList   : { visible : true },
                               insertUnorderedList : { visible : true },					   
                }
  }
 });--->
 
$(".event_cost_currency").editable("update_eventAjax.cfm?field=event_cost_currency", { 
    id   : 'id',
    name : 'event_cost_currency',
	indicator : '<img src="../img/indicator.gif">',
    data   : "{'$':'US - $','£':'UK - &pound;','EUR':'EU - &euro;','ZAR':'SA - ZAR', 'AUD' : 'AUD'}",
    type   : "select",
    submit : "OK",
    style  : "inherit",
    submitdata : function() {
      return {id : <cfoutput>#get_event.id#</cfoutput>};
    }
  }); 
  
$(".event_month").editable("update_eventAjax.cfm?field=event_month", { 
    id   : 'id',
    name : 'event_month',
	indicator : '<img src="../img/indicator.gif">',
    data   : "{'January':'January','February':'February','March':'March','April':'April','May':'May','June':'June','July':'July','August':'August','September':'September','October':'October','November':'November','December':'December'}",
    type   : "select",
    submit : "OK",
    style  : "inherit",
    submitdata : function() {
      return {id : <cfoutput>#get_event.id#</cfoutput>};
    }
  }); 
  
$(".event_type").editable("update_eventAjax.cfm?field=event_type", { 
    id   : 'id',
    name : 'event_type',
	indicator : '<img src="../img/indicator.gif">',
   // data   : "{'Event' :'Conference','eb' : 'Briefing','DIN' : 'Dinner','week' : 'Oil week','book' : 'book','Club' : 'Club','Advis' : 'Advisory','CM' : 'Content Management' , 'RE' : 'Reasearch'}",
    loadurl:'../components/JSON_Event_types.cfm', 
	type   : "select",
    submit : "OK",
    style  : "inherit",
    submitdata : function() {
      return {id : <cfoutput>#get_event.id#</cfoutput>};
    }
  });     
 
$(".club").editable("update_eventAjax.cfm?field=club", { 
    id   		: 'id',
    name 	: 'club',
	indicator : '<img src="../img/indicator.gif">',
    loadurl 	: 'clublist.cfm',
    type   	: "select",
    submit 	: "OK",
    style  	: "inherit",
    submitdata : function() {
      return {id : <cfoutput>#get_event.id#</cfoutput>};
    }
  });
  ///////////hotels
$(".hotelname").editable("update_eventAjax.cfm?field=hotelname", { 
    id   		: 'id',
    name 	: 'hotelname',
	indicator : '<img src="../img/indicator.gif">',
    loadurl 	: 'hotelList.cfm',
    type   	: "select",
    submit 	: "OK",
    style  	: "inherit",
    submitdata : function() {
      return {id : <cfoutput>#get_event.id#</cfoutput>};
    }
  });
  ///////////Country
$(".event_loc_country").editable("update_eventAjax.cfm?field=event_loc_country", { 
    id   		: 'id',
    name 	: 'event_loc_country',
	indicator : '<img src="../img/indicator.gif">',
    loadurl 	: 'Json_country.cfm',
    type   	: "select",
    submit 	: "OK",
    style  	: "inherit",
    submitdata : function() {
      return {id : <cfoutput>#get_event.id#</cfoutput>};
    }
  }); 
 
$(".groupby").editable("update_eventAjax.cfm?field=groupby", { 
    id   		: 'id',
    name 	: 'groupby',
	indicator : '<img src="../img/indicator.gif">',
    loadurl 	: 'eventGroups.cfm',
    type   	: "select",
    submit 	: "OK",
    style  	: "inherit",
    submitdata : function() {
      return {id : <cfoutput>#get_event.id#</cfoutput>};
    }
  }); 
  
  
       $('.event_name').editable('update_eventAjax.cfm?field=event_name', { 
        	id   : 'id',
			name : 'event_name',
			submit    : 'OK',
			width		: 320,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.event_abbr').editable('update_eventAjax.cfm?field=event_abbr', { 
        	id   : 'id',
			name : 'event_abbr',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.event_year').editable('update_eventAjax.cfm?field=event_year', { 
        	id   : 'id',
			name : 'event_year',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			
			
		$('.event_days').editable('update_eventAjax.cfm?field=event_days', { 
        	id   : 'id',
			name : 'event_days',
			//type      : "masked",
        	//mask      : "99/99/9999",
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.event_loc_city').editable('update_eventAjax.cfm?field=event_loc_city', { 
        	id   : 'id',
			name : 'event_loc_city',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.venuRoom').editable('update_eventAjax.cfm?field=venuRoom', { 
        	id   : 'id',
			name : 'venuRoom',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.colorD').editable('update_eventAjax.cfm?field=colorD', { 
        	id   : 'id',
			name : 'colorD',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.colorL').editable('update_eventAjax.cfm?field=colorL', { 
        	id   : 'id',
			name : 'colorL',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.timereg').editable('update_eventAjax.cfm?field=timereg', { 
        	id   : 'id',
			name : 'timereg',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.timestart').editable('update_eventAjax.cfm?field=timestart', { 
        	id   : 'id',
			name : 'timestart',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			
			
	
			

		$('.event_cost_us').editable('update_eventAjax.cfm?field=event_cost_us', { 
        	id   : 'id',
			name : 'event_cost_us',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.event_cost_uk').editable('update_eventAjax.cfm?field=event_cost_uk', { 
        	id   : 'id',
			name : 'event_cost_uk',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		$('.Econf').editable('update_eventAjax.cfm?field=Econf', { 
        	id   : 'id',
			name : 'Econf',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
		
		$(".event_expire").editable("update_eventAjax.cfm?field=event_expire", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'event_expire',
		id   : 'id',
		submit    : 'OK',
		type      : 'ui_datepicker',
        tooltip   : "Click to edit..."
    }); 
	
		$(".eventDateEnd").editable("update_eventAjax.cfm?field=eventDateEnd", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'eventDateEnd',
		id   : 'id',
		submit    : 'OK',
		type      : 'ui_datepicker',
        tooltip   : "Click to edit..."
    }); 
	
$('.boothTimeSetup').editable('update_eventAjax.cfm?field=boothTimeSetup', { 
        	id   : 'id',
			name : 'boothTimeSetup',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

});
$('.boothTimeRemove').editable('update_eventAjax.cfm?field=boothTimeRemove', { 
        	id   : 'id',
			name : 'boothTimeRemove',
			submit    : 'OK',
			width		: 120,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

});	
$('.preRegistrationTime').editable('update_eventAjax.cfm?field=preRegistrationTime', { 
        	id   : 'id',
			name : 'preRegistrationTime',
			submit    : 'OK',
			width		: 40,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

});	


$(".preRegistrationDate").editable("update_eventAjax.cfm?field=preRegistrationDate", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'preRegistrationDate',
		id   : 'id',
		submit    : 'OK',
		type      : 'ui_datepicker',
        tooltip   : "Click to edit..."
});
$(".boothDateSetup").editable("update_eventAjax.cfm?field=boothDateSetup", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'boothDateSetup',
		id   : 'id',
		submit    : 'OK',
		type      : 'ui_datepicker',
        tooltip   : "Click to edit..."
});
$(".boothDateRemove").editable("update_eventAjax.cfm?field=boothDateRemove", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'boothDateRemove',
		id   : 'id',
		submit    : 'OK',
		type      : 'ui_datepicker',
        tooltip   : "Click to edit..."
   });
	
	

		$(".filesAvailableDate").editable("update_eventAjax.cfm?field=filesAvailableDate", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'filesAvailableDate',
		id   : 'id',
		submit    : 'OK',
		type      : 'ui_datepicker',
        tooltip   : "Click to edit..."
    });
		$(".AttendFormDate").editable("update_eventAjax.cfm?field=AttendFormDate", { 
        indicator : "<img src='../img/indicator.gif'>",
        name : 'AttendFormDate',
		id   : 'id',
		submit    : 'OK',
		type      : 'ui_datepicker',
        tooltip   : "Click to edit..."
    });		
	
	
		$('.Slogan').editable('update_eventAjax.cfm?field=Slogan', { 
        	id   : 'id',
			name : 'Slogan',
			submit    : 'OK',
			width		: 320,
			height	: 30,
         	indicator : '<img src="../img/indicator.gif">',
			type      : "charcounter",
			charcounter : { characters : 120      },
         	tooltip   : 'Click to edit...'

     		});
		$('.sloganSub').editable('update_eventAjax.cfm?field=sloganSub', { 
        	id   : 'id',
			name : 'sloganSub',
			submit    : 'OK',
			width		: 320,
			height	: 30,
         	indicator : '<img src="../img/indicator.gif">',
			type      : "charcounter",
			charcounter : { characters : 120      },
         	tooltip   : 'Click to edit...'

     		});
			$('.linkedIn').editable('update_eventAjax.cfm?field=linkedIn', { 
        	id   : 'id',
			name : 'linkedIn',
			submit    : 'OK',
			width		: 320,
         	indicator : '<img src="../img/indicator.gif">',
			type      : "charcounter",
			charcounter : { characters : 80    },
         	tooltip   : 'Click to edit...'

     		});
			$('.briefingSlogan').editable('update_eventAjax.cfm?field=briefingSlogan', { 
        	id   : 'id',
			name : 'briefingSlogan',
			submit    : 'OK',
			width		: 320,
			height	: 40,
         	indicator : '<img src="../img/indicator.gif">',
			type      : "charcounter",
			charcounter : { characters : 120      },
         	tooltip   : 'Click to edit...'

     		});
	$('.singleEventNot').editable('update_eventAjax.cfm?field=singleEventNot', { 
        	id   : 'id',
			name : 'singleEventNot',
			submit    : 'OK',
			width		: 30,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
			
			$('.preRegistration').editable('update_eventAjax.cfm?field=preRegistration', { 
        	id   : 'id',
			name : 'preRegistration',
			
			submit    : 'OK',
			width		: 30,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
//// END 
				$('#tabs').tabs();
				 
				<cfif get_event.event_type EQ "week" >
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
<cfoutput>
function loadSponsorList(){
			$("##areasponsorList").fadeIn("slow").load("../sponsorship/sponsorshipList.cfm" , { groupby: #get_event.groupby# , event_year :  #get_event.event_year#  });
		}
		
</cfoutput>		
		  
</script>
<script type="text/javascript">
//function initMCE(){
tinyMCE.init({
mode : "none",
mode : "textareas",
elements : "event_blurb,event_blurb_exhib,event_blurb_sponsors, focusOn",
theme : "advanced",
skin : "o2k7",

width : "100%",
height  : "500",
plugins : "safari,spellchecker,pagebreak,style,save,advlink,iespell,inlinepopups,preview,searchreplace,print,contextmenu,paste,directionality,noneditable,visualchars,nonbreaking,xhtmlxtras",
theme_advanced_buttons1 : "formatselect,bold,italic,underline,|,spellchecker,|,nonbreaking,|,pastetext,|,bullist,numlist,|,outdent,indent,blockquote,|,link,unlink,cleanup,code,|,iespell",
theme_advanced_buttons2 : "",
theme_advanced_buttons3 : "",
theme_advanced_buttons4 : "",
theme_advanced_toolbar_location : "top",
theme_advanced_toolbar_align : "left",
theme_advanced_statusbar_location : "bottom",
theme_advanced_blockformats : "h6,blockquote,sup",
theme_advanced_resizing : true,
content_css : "Content_class.css",
//invalid_elements : "*[*]",
valid_elements : "a[href|target=_blank],strong/b,div[align],br,p,ul,ol,li, i ,u, blockquote, h6",
add_form_submit_trigger : true
});
//}
<!---
tinyMCE.init({
mode : "exact",
theme : "simple",
elements : "comment"
});--->
</script>





<script type="text/javascript">
$(document).ready(
	function () {
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
	$.post("logosave.cfm", {  eventid: <cfoutput>#get_event.id#</cfoutput>, list: serial.hash  }, function(data){ alert(data);} );
	//alert(serial.hash);
	
};




	
$(document).ready(function() { 	
<!--- SEARCH AND FIND COMPANIES FOR LOGOS --------------->
    	$('#formSearchCompany').submit(function() { 
				$(this).ajaxSubmit({ target: '#AreaLoadCompanies', clearForm: true}); 
				return false; 
    	}); 
});


$(document).ready(function() { 	
<!--- SUBMIT FORMS FIELDS ------------------->		
	    $('#BlurbFocus, #BlurbForm, #exhibBlurb, #sponsorsBlurb').submit(function() { 
					
				$(this).ajaxSubmit({ success: returnFormData, clearForm: false }); 
				return false; 
    	});
});	
<!--- , dataType: 'json' 
function returnFormData(dataReturn){
		$('#'+dataReturn.field).html(dataReturn.data);
}--->

<!--- Set the Dialog Box ----------->
 $('#dialog').dialog({
     autoOpen:false,
     modal:'true',
     overlay: {background: '#ffffff' }
  });

function returnFormData(){
$("#dialog").dialog({
			bgiframe: true,
			modal: true,
			buttons: {
				Close: function() {
					$(this).dialog('close');
				}
			}
		});

}

///////////////////////////////////////////
	 
	
	 
	 
<!--- LOAD THE DINNER meals PREFERENCE LIST AND ADD A NEW MEAL --------> 
function loadMenuOptions(){
	 	$("#areaFunctions").load("../Meal_Preference/index.cfm", {eventid: <cfoutput>#get_event.id#</cfoutput> } );
	 }

<!--- LOAD PROGRAM FORMS  
function loadProgram(){
		$("#flashnews").load("<cfoutput>../Program/speakers_program.cfm?id=#get_event.id#&groupby=#get_event.groupby#");
		$("##areaNewSlot").load("../Program/new_slot.cfm?id=#get_event.id#&groupby=#get_event.groupby#", function(){ tinyMCE.execCommand('mceAddControl',false,'comment');});<!---, function(){ tinyMCE.execCommand('mceAddControl',false,'comment'); } --->
		$("##tabs-newSpeaker").load("../Program/speakers.cfm?id=#get_event.id#&groupby=#get_event.groupby#&event_year=#get_event.event_year#</cfoutput>");
		//$("#tabs-addedit").fadeIn("slow").load("http://www.petro21.com/my-office/program/speakersForm.cfm");
}--------> 	


function loadSelectedFlash(){
$("#flashnews").load("../P21Newsmanagement/newsletter_loadForm.cfm", {newsletter: '<cfoutput>#get_event.id#</cfoutput>', field:'flashnews' } );
}
<!---
$(document).ready(function() { 	
	    var options = { 
        target:        '#areaResultspeakersSearch',
		clearForm: false
    };  
    $('#formsearchSpeakers').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    }); 	
}); 
--->



		
	
function Rem_Speak_Slot(id){
		$.post("http://www.petro21.com/my-office/program/Update_program_speaker.cfm", { id: id}, function(){  $("#SelectedSpeaker").html(""); });
}
function Rem_Speak_SlotNew(){
		 $("#SelectedSpeaker").html("");
}
function secondTab(){
			$('#tabOptions').tabs('select', 1);
}


<!---
$(document).ready(function() { 	
	    var options = { 
        target:   addUpdateSpeakerSlot,
		clearForm: false
    };  
    $('#formEditSpeakers').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    }); 	
}); 

function addUpdateSpeakerSlot(data){
		$('#tabOptions').tabs('select', 0);  
		$('#SelectedSpeaker').html(data);
}
--->




<!---

$(document).ready(function() { 	
	    var options = { 
        success:   addNewSpeakerSlot,
		clearForm: false
    	};  
		
		$('#SpeakerNewSubmit').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    	}); 	
}); --->
<!--- 
$(document).ready(function() {
    $('form').submit(function() { 
			$(this).ajaxSubmit({ clearForm: false }); 
			return false; 
		}); 

});--->




</script>