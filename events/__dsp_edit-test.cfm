<cfinclude template="../Application.cfm">

<cfquery name="get_event" datasource="#dsnP21#">
SELECT      events.*,  groupby.groupby AS eventgroup, clubs.name AS clubname, hotels.hotelname
FROM          	events 
LEFT JOIN		groupby ON  events.groupby =  groupby.id
LEFT JOIN	 	clubs ON events.club = clubs.id
LEFT JOIN		hotels ON events.hotel = hotels.id 
WHERE     events.id = #url.id#
</cfquery>
<cfquery name="getSelect" datasource="#dsnP21#">
SELECT      id, event_name
FROM          	events 
WHERE    ( groupby = #get_event.groupby# AND event_year = '#get_event.event_year#') AND (event_type <> 'spon' and event_type <> 'both') 
ORDER BY event_type desc
</cfquery>
<cfset pandetails = 540 >
<cfset pantitle = 130 >
<cfset tabs_Exhib =  "" >

	<cfif get_event.event_type eq "event" >
		<cfset tabs_Exhib =  "Exhebition Blurb" >
    <cfelseif get_event.event_type eq "eb" >
    	<cfset tabs_Exhib = "Briefing extended Info" >
    <cfelseif get_event.event_type eq "cm" OR get_event.event_type eq "Advis" OR get_event.event_type eq "book" OR get_event.event_type eq "RE" OR get_event.event_type eq "RE"  OR get_event.event_type eq "club" >
    	<cfset tabs_Exhib = "extended Info" >
    </cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.corner.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jeditable.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.charcounter.js"  ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.jeditable.charcounter.js"  ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jquery.wysiwyg.js" ></script>
<link rel="stylesheet" href="http://www.petro21.com/my-office/Javascript/jquery.wysiwyg.css" >
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jquery.jeditable.wysiwyg.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/Tinymce_Clean/jscripts/tiny_mce/tiny_mce_src.js"></script>
<script type='text/JavaScript' src='http://www.petro21.com/my-office/javascript/scw.js'></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/interface.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/fileUpload.js"  ></script>
<link rel="stylesheet" type="text/css" href="http://www.petro21.com/my-office/javascript/jquerydatepicker/datePicker.css" media="screen" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquerydatepicker/jquery.datePicker.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquerydatepicker/jquery.jeditable.datepicker.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/date.js"></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="../Javascript/jquery.maskedinput-1.2.2.js" ></script>

<link type="text/css"  rel="stylesheet" href="http://www.petro21.com/my-office/javascript/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/colorbox/jquery.colorbox.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/bsn.AutoSuggest/bsn.AutoSuggest_c_2.0.js"></script>
<link rel="stylesheet" href="http://www.petro21.com/my-office/javascript/bsn.AutoSuggest/css/autosuggest_inquisitor.css" type="text/css" media="screen" charset="utf-8" />

<!---<script type="text/javascript" src="../javascript/masks.js"></script>
<script type="text/javascript" src="../javascript/jquery.maskedinput.js"></script>--->

<script language="JavaScript" type="text/javascript"><!--
			function populateHiddenVars() {
				document.getElementById('categoriesListOrder').value = Sortable.serialize('categories');
				return true;
			}
			//-->
		</script>
<script type="text/javascript">
$(document).ready(function(){
		//$("#flashnews").load("../P21Newsmanagement/newsletter_loadForm.cfm", {newsletter: '<cfoutput>#get_event.id#</cfoutput>', field:'flashnews' } );
		
		//function loadbannerToPlace(bannerid, bannerplace, bannerType, newsletter){
		//	$.post("../P21Newsmanagement/newsletter_addbanner.cfm", { bannerid: bannerid, bannerplace: bannerplace, bannerType: bannerType, newsletter: newsletter }, function(data){ 
		//			$('<div></div>').appendTo("#flashnews").load("../P21Newsmanagement/newsletter_getBanner.cfm" , { bannerid: bannerid, bannerplace: bannerplace, bannerType: bannerType , newsletter: newsletter});
		//	 });
	//	}
});
//var $j = jQuery.noConflict();
 $(document).ready(function() {
 	
 //////////UPLOAD 
 <cfoutput>
 <cfif get_event.event_type EQ "week">
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
    data   : "{'$':'US - $','£':'UK - &pound;','EUR':'EU - &euro;','ZAR':'SA - ZAR'}",
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
    data   : "{'Event' :'Conference','eb' : 'Briefing','DIN' : 'Dinner','week' : 'Oil week','book' : 'book','Club' : 'Club','Advis' : 'Advisory','CM' : 'Content Management' , 'RE' : 'Reasearch'}",
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
		type      : 'datepicker',
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
				$('#tabOptions').tabs(); 
				<cfif get_event.event_type EQ "week" >
				$("#Sponsorship").accordion({ header: "h3" });
				</cfif>
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
				$("a[rel*='colorbox']").colorbox({iframe:true, width: "80%", height: "80%"});
				$('.tabEventsOn, .tabEventsOff').corner("top");
 });    
////// SUBMIT FORMS

	
	//////END FORMS
 <!--- });--->

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
theme_advanced_blockformats : "h2,h3,h4,h5,h6,blockquote,sup",
theme_advanced_resizing : true,
//invalid_elements : "*[*]",
valid_elements : "a[href|target=_blank],strong/b,div[align],br,p,ul,ol,li, i ,u, blockquote, h2,h3,h4,h5,h6",
});
//}
</script>

<style type="text/css">
<!--
/*  drag layer styles*/
ul.sortableList {
	list-style-type: none;
	padding: 0px;
	margin: 0px;

}
ul.sortableList li {
	cursor: move;
	
}
ul.sortableList li:HOVER {
	cursor: move;
	background-color: #F4F4F4;
}

.tabexOn	{ padding:15px 10px 3px 10px; margin-right:1px;  color:#ffffff;  font-size:11px; color:#333333; background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;font-family:Lucida Grande,Lucida Sans,Arial,sans-serif;line-height:1.3;  }
.tabexOff	{ padding:15px 10px 3px 10px; margin-right:1px; color:#2779AA;  font-size:11px; color:#333333; background:#D7EBF9 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_80_d7ebf9_1x400.png) repeat-x scroll 50% 50%;font-family:Lucida Grande,Lucida Sans,Arial,sans-serif;line-height:1.3;}
.infoText { font-size:10px; color:#990000 }
-->
</style>
<style type="text/css" media="all">
.groupWrapper{}
.serializer{	clear: both;}
.row{ clear:both; margin-bottom:1px;}
.row .col1{ position: relative;   float: left; background-color:#FFFFFF; cursor: move; width:104px; padding:0px; margin:0px; height:45px; border-bottom: 1px solid #CCCCCC; border-left:1px solid #CCCCCC; border-top:1px solid #CCCCCC}
.row .col2{ position: relative;   float: left;  width:184px; margin:0 0 0 0px; padding:10px 0 0 10px; height:35px; border-bottom: 1px solid #CCCCCC; border-right:1px solid #CCCCCC; border-top:1px solid #CCCCCC}
.sortHelper{	border: 2px solid #F2F2F2;	width: auto !important;}
.paneSeperator { border-right:1px dotted #CCCCCC }
.titlesection{ font-family:"Century Gothic", "Century Schoolbook", Georgia; color:#3366CC; margin:8px 0 20px 10px}
.columnPading {padding:20px}

 .ulLeft  {
list-style-type: none;
list-style-position: 0px; 
float:left;
margin:0px;
padding:15px 0px 0px 0px;
}

 .ulMidle  {
list-style-type: none;
list-style-position: 0px; 
float:left;
margin:0px;
padding:15px 40px 0px 0px;
}
  .ulLeft  li {
list-style-type: none;
height:20px;
border-bottom:1px solid #CCCCCC;
padding:4px 0 4px 10px;
width:190px;
margin:0px;
}
 .ulMidle  li {
list-style-type: none;
height:20px;
border-bottom:1px solid #CCCCCC;
padding:4px 0 4px 10px;
width:335px;
margin:0px;
}
.column1 { width:300px;    position: relative;   float: left; margin:0 10px 0 0}
.column2 { width:300px;    position: relative;   float: left;; margin:0 10px 0 0}
#tabs h4 { border-bottom:1px solid #aed0ea; font-family:Lucida Grande, Lucida Sans, Arial, sans-serif; color:#2779aa; font-size:1.1em; margin:20px 0 15px 0; font-size:1.2em}
#navigatEvents{text-decoration:none;
outline-color:-moz-use-text-color !important;
outline-style:none !important;
outline-width:0 !important;
-moz-border-radius-bottomleft:4px;
-moz-border-radius-bottomright:4px;
-moz-border-radius-topleft:4px;
-moz-border-radius-topright:4px;
-moz-background-clip:border;
-moz-background-inline-policy:continuous;
-moz-background-origin:padding;
position:relative; float:right; width:150px;
}
#navigateContent{  width:88%}
.tabEventsOn { font-size:0.9em; color:#FFFFFF;background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%; padding:10px 10px 5px 10px}
.tabEventsOff { font-size:0.9em; background-color:#EBEBEB; color:#666666; padding:10px 10px 5px 10px}
.liFieldCont02 { height:45px;}
#eventTabs { float:right; margin:0 15px 0 0  }
#eventTabs UL {list-style:none; margin: 0; padding: 0; float: left; background-color:#EBEBEB; color:#666666;}
#eventTabs UL  LI { display: inline;font-size:0.9em; padding:10px 10px 5px 10px}
#eventTabs ul li a{text-decoration: none;color:#333333;  padding:10px 10px 5px 10px}
#eventTabs ul li a:hover{ color: #fff; background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%;}
.eventTabs {padding:10px 10px 5px 10px}
.eventTabsOn{font-size:0.9em; color:#FFFFFF;background:#3BAAE3 url(http://www.petro21.com/my-office/javascript/jquery-ui-1.7.2/images/ui-bg_glass_50_3baae3_1x400.png) repeat-x scroll 50% 50%; padding:10px 10px 5px 10px}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>www.petro21.com</title>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<cfoutput>
  <div id="header">Petro21 Web Users:  -- <span class="header_title">Add a new user in the database</span></div>
<div id="outer">
        <div id="iner">
        	<div id="eventTabs">
                    <ul >
                        <cfloop query="getSelect">
                        <li  class="<cfif getSelect.id eq url.id>eventTabsOn<cfelse>eventTabs</cfif>"><a href="dsp_edit.cfm?id=#getSelect.id#"   >#getSelect.event_name#</a></li>
                        </cfloop>
                    </ul>
            </div>
 <div class="clear"></div>       
		<div id="tabs">
			<ul>
				<li><a href="##tabs-details">Details</a></li>
				<li><a href="##tabs-Location">Location/settings</a></li>
				<li><a href="##tabs-Uploads">Uploads</a></li>
                <li><a href="##tabs-EBlurb">Event Blurb</a></li>
<cfif get_event.event_type EQ "week" OR get_event.event_type EQ "RE"  or get_event.event_type eq 'CLUB' or get_event.event_type eq 'BOOK' or get_event.event_type eq 'advis' or get_event.event_type eq 'CM' OR get_event.event_type eq 'EB' >
                <li><a href="##tabs-Sponsor">Sponsorship Blurb</a></li>
                <li><a href="##tabs-Exhib">#tabs_Exhib#</a></li>
                <li><a href="##tabs-logo">Logos</a></li></cfif>
                <li><a href="##tabs-Speakers">Speakers/program</a></li>
                <li><a href="##tabs-Extras">Contacts/functions</a></li>
                <li><a href="##tabs-10">|</a></li>
</ul>
<div id="tabs-details">
    <ul class="ulLeft">
        <li>Event Live<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=live" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event name<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_name" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Slogan<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=briefingSlogan" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li style="height:50px">Event Title<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=Slogan" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li style="height:40px">sticky Note<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=sloganSub" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
    </ul>
    <ul class="ulMidle">
        <li><cfif get_event.live eq 0><span style="color:##CC0000">Event not live on Front End<cfelse><span style="color:##00CC00">Event is live on Front End</cfif></span> <a href="edit_field.cfm?id=#get_event.id#&field=live" rel="colorbox"><img src="../img/Edit_Key_14.gif" border="0" /></a></li>
        <li><span class="event_name" id="#get_event.id#">#get_event.event_name#</span></li>
        <li><span class="briefingSlogan" id="#get_event.id#">#get_event.briefingSlogan#</span></li>
        <li style="height:50px"><span class="Slogan" id="#get_event.id#">#get_event.Slogan#</span></li>
        <li style="height:40px"><span class="sloganSub" id="#get_event.id#">#get_event.sloganSub#</span></li>
    </ul>
    <ul class="ulLeft" style="border-left:1px dotted ##CCCCCC">
        <li>Event Year<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_year" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
        <li>Expire Date<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_expire" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
        <li>Event Days<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_days" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event Month<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_month" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
    <cfif get_event.event_type EQ "week"><!--- Week discount area ------->
        <li>Discount percent/ End Date<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=discountValue" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
    </cfif>
    <cfif get_event.event_type NEQ "week">
        <li>Event Cost<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_cost_currency" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Alternat Cost<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_cost_currency" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>E-conference<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=Econf" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
       <li>registration Open time<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=timereg" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event start time<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=timestart" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>pre registration/ place<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=preRegistration" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
    </cfif>    
    </ul>
    <ul class="ulMidle">
         <li><span class="event_abbr" id="#get_event.id#">#get_event.event_year# </span></li>  
         <li><span class="event_expire" id="#get_event.id#">#dateformat(get_event.event_expire, 'dd mmmm yyyy')#</span> <span class="infoText">(First day of event::Format  14 july 2009 : )</span></li>  
         <li><span class="event_days" id="#get_event.id#"> #get_event.event_days#</span> <span class="infoText">(must be 14th - 16th format)</span></li>  
         <li><span class="event_month"   style="display: inline">#get_event.event_month#</span></li>
    <cfif get_event.event_type EQ "week"><!--- Week discount area ------->
        <li><span class="discountValue"  id="#get_event.id#" >#numberFormat(get_event.discountValue, "9999")#</span> / <span class="discountDate" id="#get_event.id#">#dateformat(get_event.discountDate, "dd mm yyyy")#</span></li>
        
    </cfif>  
    <cfif get_event.event_type NEQ "week">
        <li><span class="event_cost_currency"   style="display: inline">#get_event.event_cost_currency#</span><span class="event_cost_us" id="#get_event.id#">#numberformat(get_event.event_cost_us, "_____.__")#</span></li>
        <li><span class="event_cost_currency"   style="display: inline">#get_event.event_cost_currency#</span><span class="event_cost_uk" id="#get_event.id#">#numberFormat(get_event.event_cost_uk, "_____.__")#</span></li>
        <li><span class="Econf" id="#get_event.id#"><cfif get_event.Econf EQ 1> yes<cfelse>no</cfif></span> <span class="infoText">(type yes or 1 to make live / no or 0 to remove from live state)</span></li>
       <li><span class="timereg" id="#get_event.id#">#get_event.timereg#</span></li>
        <li><span class="timereg" id="#get_event.id#">#get_event.timestart#</span></li>
        <li><span class="preRegistration" id="#get_event.id#">#get_event.preRegistration#</span></li>
        
    
    </cfif>
    </ul>
    <div class="clear"></div>
</div>
<div id="tabs-Location">
    <ul class="ulLeft">
    	<li>Event City<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_loc_city" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event Country<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_loc_country" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Select Hotel for Event<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=hotelname" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        <li>Event Room name<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=venuRoom" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
    </ul>
    <ul class="ulMidle">
    	<li><span class="event_loc_city" id="#get_event.id#">#get_event.event_loc_city#</span></li>
        <li>#get_event.event_loc_country# <a href="edit_field.cfm?id=#get_event.id#&field=event_loc_country" rel="colorbox"><img src="../img/Edit_Key_14.gif" border="0" /></a></li>
        <li><span class="hotelname"   style="display: inline">#get_event.hotelname#</span></li>
        <li><span class="venuRoom" id="#get_event.id#">#get_event.venuRoom#</span></li>
    </ul>
    <!--- COLUMN 2 --------------->
        <ul class="ulLeft" style="border-left:1px dotted ##CCCCCC">
    		<li>Event Group<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=eventgroup" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
            <li>Page Type<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_type" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
        	<li>Event abrev<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_abbr" rel="colorbox"><img src="../img/questionMark.gif" ></a></li>
            <li>Event bookable by itself<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=singleEventNot" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
			<cfif get_event.event_type NEQ "week">
            <li>Link Event to GPP database</li>
            <li>Clubs<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=clubname" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
            <li>Event dark color<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=colorD" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
        	<li>Event light color<a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=colorL" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
            </cfif>
    </ul>
    <ul class="ulMidle">
    <li><span class="groupby" style="display: inline">#get_event.eventgroup#</span></li>
         <li><span class="event_type"   style="display: inline">
                                <cfif get_event.event_type eq "Event" >Conference<cfelseif get_event.event_type eq "eb" >Briefing<cfelseif get_event.event_type eq "DIN" >Dinner<cfelseif get_event.event_type eq "week" >Oil week<cfelseif get_event.event_type eq "book" >Book<cfelseif get_event.event_type eq "Club" >Club<cfelseif get_event.event_type eq "Advis" >Advisory<cfelseif get_event.event_type eq "CM" >Content Management<cfelseif get_event.event_type eq "RE" >Research</cfif>   
                                 </span></li>
         <li><span class="event_abbr" id="#get_event.id#">#get_event.event_abbr#</span></li>                          
    	<li><span class="singleEventNot" id="#get_event.id#"><cfif get_event.singleEventNot eq 1>False<cfelse>True</cfif></span></li>
		<cfif get_event.event_type NEQ "week">
        <li><cfif get_event.id_gpp NEQ "">id number: #get_event.id_gpp#<cfelse>missing</cfif><div class="clicker"><a href="selectGPP_id.cfm?id=#get_event.id#&field=id_gpp"rel="colorbox" ><img src="../img/Edit_Key_14.gif" border="0" /></a></li>
        <li><span class="club"   style="display: inline">#get_event.clubname#</span></li>
        <li style=" background-color:###get_event.colorD#"><span class="colorD" id="#get_event.id#">#get_event.colorD#</span></li>
        <li style=" background-color:###get_event.colorL#"><span class="colorL" id="#get_event.id#">#get_event.colorL#</span></li>
        </cfif>
    </ul>
    
    <div class="clear"></div>
</div>
<div id="tabs-Uploads">
    <ul class="ulLeft">
    	<h4>Event Page</h4>
<cfif get_event.event_type EQ "week">   
    	<li>Page header  	<cfif  get_event.file_image_pdf NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
    	<li>Brochure  		<cfif  get_event.file_update NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
</cfif>
        <li>Hotel Form 		<cfif get_event.event_loc_weather NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
    </ul>
    <ul class="ulMidle">
    	<h4>&nbsp;</h4>
<cfif get_event.event_type EQ "week">
     	<li><div id="upload_banner" class="uploadButton" >Upload</div> </li>
    	<li><div id="upload_brochure" class="uploadButton"  >Upload</div></li>  
</cfif>
        <li><div id="upload_HotelFile" class="uploadButton" >Upload</div></li> 
    </ul>
<cfif get_event.event_type EQ "week">
    <ul class="ulLeft">
    	<h4>Event Page</h4>    
    	<li>Home Page Banner 		<cfif get_event.HomePageBanner NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
        <li>Sponsors Oppertunities <cfif  get_event.sponsorOppFile NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
        <li>S&E doc, GPP use only <cfif  get_event.doc_SE_intern NEQ ""><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
    </ul>
    <ul class="ulMidle">
    	<h4>&nbsp;</h4>
     	<li><div id="upload_Homebanner" class="uploadButton" >Upload</div> </li>
        <li><div id="upload_SponsorOpFile" class="uploadButton"  >Upload</div></li>
        <li><div id="upload_SponsorOp" class="uploadButton"  >Upload</div></li>
    </ul>
</cfif>
 <div class="clear"></div>
 <h4>Upload images for email Template</h4>
     <ul class="ulLeft">
    	<li>Header Image 		<cfif get_event.newsletterBannerTop NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
        <li>Column 1 image 	<cfif get_event.newsletterBannerCol1 NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
        <li>Column 2 image 	<cfif get_event.newsletterBannerCol2 NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
        <li>Top Image 600px	<cfif get_event.newsletterBannerTop600 NEQ "" ><img src="../img/ok_tick-yellow.gif" /><cfelse></cfif></li>
    </ul>
    <ul class="ulMidle">
     	<li><div id="upload_topBanner" class="uploadButton" >Upload </div></li>
        <li><div id="upload_colum1" class="uploadButton" >Upload</div></li>
        <li><div id="upload_colum2" class="uploadButton" >Upload</div></li>
        <li><div id="upload_topBanner600" class="uploadButton" >Upload</div></li>
    </ul>
	<div class="clear"></div>
</div>

<div id="tabs-EBlurb">
        <div class="column1" style="width:600px;">
        <h4>Main blurb <a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_blurb" rel="colorbox"><img src="../img/questionMark.gif"></a></h4>
                <form  name="BlurbForm" id="BlurbForm" method="post" action="update_eventAjax.cfm?field=event_blurb">
                <textarea name="event_blurb"  id="event_blurb"  >#get_event.event_blurb#</textarea>
                <input type="hidden" name="id" value="#get_event.id#" />
                <a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_blurb" rel="colorbox"><img src="../img/questionMark.gif"></a> <button>Save</button><span id="event_blurbResult"></span>
                </form>
        </div>
        <div class="column2" style="width:440px; padding:0 0 0 0; margin:0 0 0 5px; ">
        		<h4>Focus On <a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=focusOn" rel="colorbox"><img src="../img/questionMark.gif"></a></h4>
                	<form   method="post" action="update_eventAjax.cfm?field=focusOn">
                    <textarea name="focusOn" id="focusOn"   >#get_event.focusOn#</textarea>
                    <input type="hidden" name="id" value="#get_event.id#" />
                    <button>Save</button><span id="focusOnResult"></span>
                    </form>
        </div>
		<div class="clear"></div>
</div>
<div id="tabs-Speakers">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="350" valign="top">

 	<ul style="margin:15px 0 45px 0;">
    	<li><a href="javascript:loadProgram();" > Load program  </a></li>
        <li><a href="javascript:loadNewsFlashList('#get_event.id#');">Load Speaker List </a> </li>
        <li><a href="javascript:loadFlashNews();">Create News Flash </a>    </li>
    </ul>
    
    <div id="tabOptions">
			<ul>
				<li><a href="##tabs-newSlot"> new slot</a></li>
                <li><a href="##tabs-newSpeaker">speakers</a></li>
                <li><a href="##tabs-addedit">add/edit</a></li>
            </ul>
                <div id="tabs-newSlot">
                	<form id="editSlot" name="editSlot" method="post" action="http://www.petro21.com/my-office/program/save_slot.cfm">  
                    <div id="areaNewSlot"></div>
                    </form>
                </div>
                <form action="http://www.petro21.com/my-office/program/speakers_list.cfm" method="post" id="formsearchSpeakers">
                <div id="tabs-newSpeaker"> 
                
                </div>
                </form>
                <form action="http://www.petro21.com/my-office/program/speakerSave.cfm" method="post" id="SpeakerNewSubmit" name="SpeakerNewSubmit"  >  
                <div id="tabs-addedit"> 
                </div>
                </form>
    </div>
 <!---   
    <a href="speakers.cfm?id=<cfoutput>#id#&groupby=#groupby#</cfoutput>" ><img src="../img/but_SpeakerAdd.jpg" border="0"/></a> <a href="PDFProgram.cfm?id=<cfoutput>#id#&groupby=#groupby#</cfoutput>" target="pdf" ><img src="../img/but_CreatPDF.jpg" border="0" /></a>    <a href="speakers_program.cfm?id=<cfoutput>#eventid#&groupby=#groupby#</cfoutput>" ><img src="../img/but_refreshP.jpg" border="0" /></a>--->
</td>
    <td   valign="top">
 <div id="flashnews" style="padding:0 0 0 20px"> </div>   </td>
  </tr>
</table>
<div id="areaSelectItem" style="border:1px solid ##B8D9FF; max-height:186px; overflow:auto "></div>
<div id="areaNewLoad"style="border:1px solid ##B8D9FF; max-height:186px; overflow:auto "></div> 
	<div class="clear"></div>
</div>
<div id="tabs-Extras">
<cfquery datasource="#dsnP21#" name="getnames">SELECT id, name FROM gppusers</cfquery>
    <ul class="ulLeft">
<cfif get_event.event_type EQ "book" OR get_event.event_type EQ "re">
		<li>Extra Info / for books or reasearch only <a href="edit_field.cfm?id=#get_event.id#&field=event_cost_details" rel="colorbox"><img src="../img/Edit_Key_14.gif" border="0" /></a></li>
</cfif>
<cfif get_event.event_type NEQ "week">
    	<li> <a href="../functions/welcomeLetter.cfm?eventid=#get_event.id#&groupby=#get_event.groupby#" rel="colorbox">Events functions</a></li>
</cfif>
<cfif get_event.event_type EQ "week">
    	
        <li>Event Floorplan <a href="floorplan.cfm?id=#get_event.groupby#&field=file_banner&for=FPImages" rel="colorbox"></a></li>
        <li>LinkedIn link <a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=linkedIn" rel="colorbox"><img src="../img/questionMark.gif"></a></li>
</cfif>
<cfif get_event.event_type EQ "din">
    	<li><a href="javascript:loadMenuOptions()" >Menu Options</a></li>
        <li><a href="../Counts/dinner_menu.cfm?id=#get_event.id#" rel="colorbox">Menu Counts </a></li>
</cfif>	
		<li><a href="../Counts/functions_attend.cfm?id=#get_event.id#" rel="colorbox">Functions Counts </a></li>
		<li><a href="edit_field.cfm?id=#get_event.id#&field=staffOnDay" rel="colorbox">Staff at the event Enquiries </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=Enquir" rel="colorbox">Registration Enquiries </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=exhEnq"rel="colorbox">Exhibition Enquiries </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=sponEnq" rel="colorbox">Sponsorship Enquiries </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=accPay"rel="colorbox">Accounts & Payments </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=GenCont" rel="colorbox">General Contacts </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=PaCont" rel="colorbox">PetroAfricanus Contacts </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=AcoCont" rel="colorbox">Accomodation Contacts </a></li>
        <li><a href="edit_field.cfm?id=#get_event.id#&field=VisCont" rel="colorbox">Visa Contacts </a></li>
   </ul>
   <ul class="ulMidle">
<cfif get_event.event_type EQ "book" OR get_event.event_type EQ "re">
		<li>#get_event.event_cost_details# </li>
</cfif>
<cfif get_event.event_type NEQ "week">
   		<li></li>
</cfif>
 <cfif get_event.event_type EQ "week">
<li></li>
        <li><span class="linkedIn" id="#get_event.id#">#get_event.linkedIn#</span></li>
 </cfif>
  <cfif get_event.event_type EQ "din">
        <li></li>
        <li></li>
 </cfif>	
 		<li></li>
 		<li><cfloop query="getnames"><cfif  listcontains(get_event.staffOnDay,getnames.id, "," ) NEQ "0"   >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.Enquir,getnames.id, "," ) NEQ "0"   >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.exhEnq,getnames.id, "," ) NEQ "0"   >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.sponEnq, getnames.id, ",") NEQ "0"  >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.accPay, getnames.id) NEQ "0"  >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.GenCont, getnames.id, ",")NEQ "0"   >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.PaCont, getnames.id, "," ) NEQ "0"  >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.AcoCont, getnames.id, ",") NEQ "0" >#getnames.name#, </cfif></cfloop></li>
        <li><cfloop query="getnames"><cfif  listcontains(get_event.VisCont, getnames.id, ",")NEQ "0"  >#getnames.name#, </cfif></cfloop></li>
  </ul>
  <!--- Column 2 start here ------------------------->
	<div id="areaFunctions" style="clear:right; float:left; width:550px; border:1px solid ##E7E7E7; margin:20px 0 0 0"> 
	
    </div>
   <div class="clear"></div>
</div>
<cfif get_event.event_type EQ "week" OR get_event.event_type EQ "RE"  or get_event.event_type eq 'CLUB' or get_event.event_type eq 'BOOK' or get_event.event_type eq 'advis' or get_event.event_type eq 'CM' or get_event.event_type eq 'EB'>
<div id="tabs-Sponsor">
        <form id="sponsorsBlurb" method="post" action="update_eventAjax.cfm?field=event_blurb_sponsors">
        <textarea name="event_blurb_sponsors"  id="event_blurb_sponsors"  >#get_event.event_blurb_sponsors#</textarea>
        <input type="hidden" name="id" value="#get_event.id#" />
        <a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_blurb_sponsors" rel="colorbox"><img src="../img/questionMark.gif"></a> <button >Save</button><span id="event_blurb_sponsorsResult"></span>
        </form>
        <div class="clear"></div>
</div>
<div id="tabs-Exhib">
        <form id="exhibBlurb" method="post" action="update_eventAjax.cfm?field=event_blurb_exhib">
        <textarea name="event_blurb_exhib"  id="event_blurb_exhib"  >#get_event.event_blurb_exhib#</textarea>
        <input type="hidden" name="id" value="#get_event.id#" />
        <a href="fieldUpdateChecker.cfm?id=#get_event.id#&field=event_blurb_exhib" rel="colorbox"><img src="../img/questionMark.gif"></a> <button >Save</button><span id="event_blurb_exhibResult"></span>
        </form>	
        <div class="clear"></div>
</div>
<div id="tabs-logo">
        <table width="100%" border="0" cellspacing="4" cellpadding="4" bgcolor="##F1FDFF" style="color:##FFFFFF">
          <tr>
            <td width="150" style="color:##003366">search companies</td>
            <td ><form id="formSearchCompany"  method="post" action="company_list.cfm">
              <input type="text" name="company" id="company" />
              <input type="hidden" name="eventid" value="#get_event.id#" />
              <input type="submit" name="button" id="button" value="Submit" /></form></td>
          </tr>
        <tr>
            <td colspan="2" bgcolor="##ffffff"><div id="AreaLoadCompanies">s</div>    </td>
          </tr>
        </table>
<div class="column1" >
	<h4>Other Sponsors  (<a href="##" onClick="serialize(); return false;" >Save Order</a>)</h4>
    <div id="logos_supporter" class="groupWrapper">
			 <cfif listLen(get_event.logos_supporter, ",") GT 0 >
                    <cfloop  index="i" list="#get_event.logos_supporter#">
                    <cfquery datasource="#dsnP21#" name="logosSponsor">		SELECT id, company, logofile FROM logos         WHERE id = #i#	</cfquery>
                    <div id="#logosSponsor.id#" class="row" >	 
                    <div class="col1" ><img src="../../logos/#logosSponsor.logofile#" /></div>
                    <div class="col2" >#logosSponsor.company# <a href="javascript:deleteLogo(#logosSponsor.id#, #get_event.id#, 'logos_supporter');"><img src="../img/new_delete.gif" border="0" /></a></div>
                    </div>
                    </cfloop>
            </cfif>
     </div>
</div>
<div class="column1" >

	<h4>Gold Sponsors</h4>
    <div id="sponsor_gold" >
			<cfif listLen(get_event.sponsor_gold, ",") GT 0 >
                    <cfquery datasource="#dsnP21#" name="sponsor_gold">
                    SELECT id, company, logofile FROM logos 
                    <cfif listLen(get_event.sponsor_gold, ",") GT 1 >WHERE id IN (#get_event.sponsor_gold#)<cfelse>
                    WHERE id = #get_event.sponsor_gold#
                    </cfif>
                    </cfquery>
                    <cfloop query="sponsor_gold">
                    <div id="#sponsor_gold.id#" class="row" >	 
                    <div class="col1" ><img src="../../logos/#sponsor_gold.logofile#" /></div>
                    <div class="col2" >#sponsor_gold.company# <a href="javascript:deleteLogo(#sponsor_gold.id#, #get_event.id#, 'sponsor_gold');"><img src="../img/new_delete.gif" border="0" /></a></div>
                    </div>
                    </cfloop>
        </cfif>
    </div>
    <h4>Silver Sponsors</h4>
    <div id="sponsor_silver" >
        <cfif listLen(get_event.sponsor_silver, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_silver">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.sponsor_silver, ",") GT 1 >WHERE id IN (#get_event.sponsor_silver#)<cfelse>
                WHERE id = #get_event.sponsor_silver#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_silver">
                <div id="#sponsor_silver.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#sponsor_silver.logofile#" /></div>
                <div class="col2" >#sponsor_silver.company# <a href="javascript:deleteLogo(#sponsor_silver.id#, #get_event.id#, 'sponsor_silver');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
    	</cfif>
    </div>
    <h4>Bronze Sponsors</h4>
     <div id="sponsor_bronze" >
		 <cfif listLen(get_event.sponsor_bronze, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_bronze">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.sponsor_bronze, ",") GT 1 >WHERE id IN (#get_event.sponsor_bronze#)<cfelse>
                WHERE id = #get_event.sponsor_bronze#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_bronze">
                <div id="#sponsor_bronze.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#sponsor_bronze.logofile#" /></div>
                <div class="col2" >#sponsor_bronze.company# <a href="javascript:deleteLogo(#sponsor_bronze.id#, #get_event.id#, 'sponsor_bronze');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Platinum Sponsors</h4>
    <div id="sponsor_platinum" >
		<cfif listLen(get_event.sponsor_platinum, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="sponsor_platinum">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.sponsor_platinum, ",") GT 1 >WHERE id IN (#get_event.sponsor_platinum#)<cfelse>
                WHERE id = #get_event.sponsor_platinum#
                </cfif>
                </cfquery>
                <cfloop query="sponsor_platinum">
                <div id="#sponsor_platinum.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#sponsor_platinum.logofile#" /></div>
                <div class="col2" >#sponsor_platinum.company# <a href="javascript:deleteLogo(#sponsor_platinum.id#, #get_event.id#, 'sponsor_platinum');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Corporate Menmber Sponsor</h4>
    <div id="logo_corpMembers" >
		<cfif listLen(get_event.logo_corpMembers, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_corpMembers">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.logo_corpMembers, ",") GT 1 >WHERE id IN (#get_event.logo_corpMembers#)<cfelse>
                WHERE id = #get_event.logo_corpMembers#
                </cfif>
                </cfquery>
                <cfloop query="logo_corpMembers">
                <div id="#logo_corpMembers.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#logo_corpMembers.logofile#" /></div>
                <div class="col2" >#logo_corpMembers.company# <a href="javascript:deleteLogo(#logo_corpMembers.id#, #get_event.id#, 'logo_corpMembers');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Corporate Sponsor</h4>
     <div id="logo_CorpSponsor" >
		 <cfif listLen(get_event.logo_CorpSponsor, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_CorpSponsor">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.logo_CorpSponsor, ",") GT 1 >WHERE id IN (#get_event.logo_CorpSponsor#)<cfelse>
                WHERE id = #get_event.logo_CorpSponsor#
                </cfif>
                </cfquery>
                <cfloop query="logo_CorpSponsor">
                <div id="#logo_CorpSponsor.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#logo_CorpSponsor.logofile#" /></div>
                <div class="col2" >#logo_CorpSponsor.company# <a href="javascript:deleteLogo(#logo_CorpSponsor.id#, #get_event.id#, 'logo_CorpSponsor');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Supporting Sponsor</h4>
    <div id="supportedby" >
		<cfif listLen(get_event.supportedby, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="supportedby">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.supportedby, ",") GT 1 >WHERE id IN (#get_event.supportedby#)<cfelse>
                WHERE id = #get_event.supportedby#
                </cfif>
                </cfquery>
                <cfloop query="supportedby">
                <div id="#supportedby.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#supportedby.logofile#" /></div>
                <div class="col2" >#supportedby.company# <a href="javascript:deleteLogo(#supportedby.id#, #get_event.id#, 'supportedby');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
    <h4>Corporate Patron</h4>
    <div id="logo_Patron" >
		<cfif listLen(get_event.logo_Patron, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_Patron">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.logo_Patron, ",") GT 1 >WHERE id IN (#get_event.logo_Patron#)<cfelse>
                WHERE id = #get_event.logo_Patron#
                </cfif>
                </cfquery>
                <cfloop query="logo_Patron">
                <div id="#logo_Patron.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#logo_Patron.logofile#" /></div>
                <div class="col2" >#logo_Patron.company# <a href="javascript:deleteLogo(#logo_Patron.id#, #get_event.id#, 'logo_Patron');"><img src="../img/new_delete.gif" border="0" /></a></div></div>
                </cfloop>
        </cfif>
    </div>
    <h4>Contributing Sponsor</h4>
    <div id="logo_Contributing" >
		<cfif listLen(get_event.logo_Contributing, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logo_Contributing">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.logo_Contributing, ",") GT 1 >WHERE id IN (#get_event.logo_Contributing#)<cfelse>
                WHERE id = #get_event.logo_Contributing#
                </cfif>
                </cfquery>
                <cfloop query="logo_Contributing">
                <div id="#logo_Contributing.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#logo_Contributing.logofile#" /></div>
                <div class="col2" >#logo_Contributing.company# <a href="javascript:deleteLogo(#logo_Contributing.id#, #get_event.id#, 'logo_Contributing');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
</div>
<div class="column2" >
    <h4>Media Sponsor</h4>
    <div id="logos_sponsore" >
		 <cfif listLen(get_event.logos_sponsore, ",") GT 0 >
                <cfquery datasource="#dsnP21#" name="logos_sponsore">
                SELECT id, company, logofile FROM logos 
                <cfif listLen(get_event.logos_sponsore, ",") GT 1 >WHERE id IN (#get_event.logos_sponsore#)<cfelse>
                WHERE id = #get_event.logos_sponsore#
                </cfif>
                </cfquery>
                <cfloop query="logos_sponsore">
                <div id="#logos_sponsore.id#" class="row" >	 
                <div class="col1" ><img src="../../logos/#logos_sponsore.logofile#" /></div>
                <div class="col2" >#logos_sponsore.company# <a href="javascript:deleteLogo(#logos_sponsore.id#, #get_event.id#, 'logos_sponsore');"><img src="../img/new_delete.gif" border="0" /></a></div>
                </div>
                </cfloop>
        </cfif>
    </div>
</div>
<div class="clear"></div>
</div>
</cfif>
		</div>

<div class="clear"></div>
<cfif get_event.event_type EQ "week" >
        <div id="Sponsorship">
        		<h3><a href="##">Sponsorship cost </a></h3>
        		<div>
                		<table border="0"><tr><td width="170"><a href="javascript:loadSponsorList()">Load sponsorship options</a></td><td width="240"><a href="javascript:">Copy Sponsorship 4 following year</a></td><td></td></tr></table>
						<div id="areasponsorList" ></div>
        		</div>
        	<div class="clear"></div>
        </div>
</cfif>   
</cfoutput>        
        </div>
</div>

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


///////////////////////////////////////////
<!---
$(document).ready(function() { 
	
		var options = { 
		target:	 '#AreaLoadCompanies',
		clearForm: true
    	};  
	    $('#formSearchCompany').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
		
    }); 
	 });


$(document).ready(function() { 
		var options = { 
		target:	 '#BlurbFormSaved',
		clearForm: false
    	};  
	    $('#BlurbForm').submit(function() { 
		$('form').bind('form-pre-serialize', function(e) {
    		tinyMCE.triggerSave();
			});
		$(this).ajaxSubmit(options); 
		return false; 
		
    }); 
	}); 
	$(document).ready(function() { 
		var options = { 
		target:	 '#ExhibitFormSaved',
		clearForm: false
    	};  
	    $('#exhibBlurb').submit(function() { 
		$('form').bind('form-pre-serialize', function(e) {
    		tinyMCE.triggerSave();
			});
		$(this).ajaxSubmit(options); 
		return false; 
		
    }); 
	 }); 
$(document).ready(function() { 	
		var options = { 
		target:	 '#SponsorFormSaved',
		clearForm: false
    	};  
	    $('#sponsorsBlurb').submit(function() { 
		$('form').bind('form-pre-serialize', function(e) {
    		tinyMCE.triggerSave();
			});
		$(this).ajaxSubmit(options); 
		return false; 
		
    }); 
	 });
	 --->
	
<!--- LOAD THE DINNER meals PREFERENCE LIST AND ADD A NEW MEAL --------> 
function loadMenuOptions(){
	 	$("#areaFunctions").load("../Meal_Preference/index.cfm", {eventid: <cfoutput>#get_event.id#</cfoutput> } );
	 }

<!--- LOAD PROGRAM FORMS --------> 	 
function loadProgram(){
		$("#flashnews").load("<cfoutput>../Program/speakers_program.cfm?id=#get_event.id#&groupby=#get_event.groupby#");
		$("##areaNewSlot").load("../Program/new_slot.cfm?id=#get_event.id#&groupby=#get_event.groupby#");<!---, function(){ tinyMCE.execCommand('mceAddControl',false,'comment'); } --->
		$("##tabs-newSpeaker").load("../Program/speakers.cfm?id=#get_event.id#&groupby=#get_event.groupby#&event_year=#get_event.event_year#</cfoutput>");
		//$("#tabs-addedit").fadeIn("slow").load("http://www.petro21.com/my-office/program/speakersForm.cfm");
}
function loadNewSlot(){
		$("#areaNewSlot").load("../Program/new_slot.cfm?id=#get_event.id#&groupby=#get_event.groupby#", function(){ tinyMCE.execCommand('mceAddControl',false,'comment'); });
}
function refreshProgram(){
		$("#flashnews").load("<cfoutput>../Program/speakers_program.cfm?id=#get_event.id#&groupby=#get_event.groupby#&event_year=#get_event.event_year#</cfoutput>");
}
function loadEditSlot(id){
	$('#tabOptions').tabs('select', 0);
	$("#areaNewSlot").load("../Program/edit_slot.cfm", {id : id}, function(){ tinyMCE.execCommand('mceAddControl',false,'comment'); });<!---  --->
}
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

function loadForm(id) {
			$('#tabOptions').tabs('select', 2);
			$("#tabs-addedit").fadeIn("slow").load("http://www.petro21.com/my-office/program/speakersForm_Updsate.cfm?id="+id+"");
			
		}
function loadNewForm() {
			$('#tabOptions').tabs('select', 2);
			$("#tabs-addedit").fadeIn("slow").load("http://www.petro21.com/my-office/program/speakersForm.cfm");
			
		}
		
function AddSpeaker(speaker, clientid) {
	$('#SelectedSpeaker').html("<strong>Selected Speaker</strong><br />" + speaker + "<input type=hidden name=clientid value=" + clientid + ">");
	$('#tabOptions').tabs('select', 0);
}
function SpeakerDelete(speakerid) {
	$.post("http://www.petro21.com/my-office/program/speakers_delete.cfm", { speakerid: speakerid}, function(){  $("#speaker"+speakerid).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
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

 
$(document).ready(function() { 	
	    var options = { 
        success:   addNewSpeakerSlot,
		clearForm: false
    	};  
		
		$('#SpeakerNewSubmit').submit(function() { 
		$(this).ajaxSubmit(options); 
		return false; 
    	}); 	--->
}); 

$(document).ready(function() {
    $('form').submit(function() { 
				$('form').bind('form-pre-serialize', function(e) {
    				tinyMCE.triggerSave();
				});
			$(this).ajaxSubmit({ clearForm: false, success: returnData, dataType: 'json' }); 
			return false; 
		}); 

});

function returnData(data) {
		if (data.field == 'focusOnResult'){
				$('#focusOnResult').html(data.data);
		} else if (data.field == 'event_blurb_exhibResult' ){
				$('#event_blurb_exhibResult').html(data.data);
		} else if (data.field == 'event_blurb_sponsorsResult' ){
				$('#event_blurb_sponsorsResult').html(data.data);
		} else if (data.field == 'event_blurbResult' ){
				$('#event_blurbResult').html(data.data);
		}
}
<!---
function addNewSpeakerSlot(data){
		$('#tabOptions').tabs('select', 0);  
		var charLength = $(data).val().length;
			if ( charLength > 0 ) {
				$('#SelectedSpeaker').html(data);
				}
}--->
</script>

</body>
</html>