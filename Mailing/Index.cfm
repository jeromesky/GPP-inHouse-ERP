<cfinclude template="../Application.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21</title>
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css" />
<!---<cfinclude template="../components/header_scripts.cfm">--->
<script type="text/javascript" src="../javascript/jquery1.4.js"></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../javascript/interface.js"></script>
<script type="text/javascript" src="../javascript/fileUpload.js"></script>
<!---<script type='text/JavaScript' src='../javascript/scw.js'></script> 
<script type='text/JavaScript' src='../javascript/timepickr/jquery.timepickr.js'></script>--->
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<!---<script type="text/javascript" src="../Javascript/tiny_mce/jscripts/tiny_mce/tiny_mce_gzip.js"></script>--->
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jquery.wysiwyg.js"></script>
<link rel="stylesheet" href="http://www.petro21.com/my-office/Javascript/jquery.wysiwyg.css">
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/jquery.jeditable.wysiwyg.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/Tinymce_Clean/jscripts/tiny_mce/tiny_mce_src.js"></script>
<script type="text/javascript" src="../Javascript/tiny_mce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="../javascript/Tag_dragon/jquery.tagdragon.min.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.CRM.js"></script>

<style type="text/css">
body { font-size:10px; font-family:"Century Gothic", "Century Schoolbook", Georgia; font-size:14px; color:#333333;}
fieldset {padding:20px 10px 10px 10px; margin-top:20px}
#toolbar_template{padding: 5px 5px;}
</style>
<script type="text/javascript" >
function loadEmailList() {
		$("#arealist").fadeIn("slow").load("mailing_list.cfm");
}

function loadTemplateList() {
		$("#area_Template_list").fadeIn("slow").load("Template_list.cfm");
		$("#areaTemplate").html("");
}

function loadTemplateForm() {
		$("#areaTemplate").fadeIn("slow").load("templateForm.cfm", {step:"1"}, "");
}

$(function() {
		$("#tabs_mailer").tabs();
});

function loadForm(id) {
		$("#arealist").fadeIn("slow").load("email_Form.cfm", {id:id}, function(){ 
	<!---				$('#tinymc').ckeditor();
					$( '.fl_area' ).ckeditor({toolbar: 'Basic', width : 150, height: 80, toolbarStartupExpanded : false});--->
				});
}

function loadEditTemplate(id) {
		$("#areaTemplate").fadeIn("slow").load("templateForm.cfm", {id:id});
}

function deleteEmail(id) {
	if (confirm("Are you sure you want to delete")) {
		$.post("delete.cfm", { id: id , choose: "email"}, function(){ $("#rec"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
	}
	}

$(document).ready(function() { 
	//form for the email configuration space
 	$("fieldset.Collapsible").collapse( { closed: true });
			$('#saveEmail').live('submit', function() { 
			<!---	$('form').bind('form-pre-serialize', function(e) {
					tinyMCE.triggerSave();			});--->
				$(this).ajaxSubmit({ clearForm: true, success: loadEmailList});
				<!---tinyMCE.execCommand('mceRemoveControl',false,'content');--->
				return false; 
		});
});
</script>	
<!---<script language="javascript">
tinyMCE.init({
	// General options
	mode : "none",
	theme : "advanced",
	skin : "o2k7",
	width : "650",
	height  : "400",
	plugins : "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",

	// Theme options
	theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
	theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
	theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
	theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	theme_advanced_statusbar_location : "bottom",
	theme_advanced_resizing : true,
	imagemanager_rootpath: "http://www.petro21.com/_files/business/",
	// Example content CSS (should be your site CSS)
	content_css : "css/example.css",

	// Drop lists for link/image/media/template dialogs
	template_external_list_url : "js/template_list.js",
	external_link_list_url : "js/link_list.js",
	external_image_list_url : "js/image_list.js",
	media_external_list_url : "js/media_list.js",

	// Replace values for the template plugin
	template_replace_values : {
		username : "glopac",
		staffid : "glopac"
	}
});
</script>--->
<!---<script type="text/javascript">
// This is where the compressor will load all components, include all components used on the page here
tinyMCE_GZ.init({ plugins: 'style,layer,table,save,advhr,advimage,advlink,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras',
	themes : 'advanced',
	languages : 'en',
	disk_cache : true,
	debug : false
});
</script>--->

</head>

<body onload="javascript:loadEmailList(); loadTemplateList();">
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="outer">
	<div id="iner">
  
<div id="tabs_mailer">
	<ul>
		<li><a href="#emails">Mailouts</a></li>
		<li><a href="#templates">Templates</a></li>
        <li><a href="#flash">Create Flash News</a></li>
        <li><a href="#NewFlash">Edit Flash News</a></li>
	</ul>
    <div id="emails">
    <form id="saveEmail" name="configure" method="post" action="Save_EditEmail.cfm">
   <div id="arealist"></div>
   </form>
    </div>
    <div id="templates" >
         <div id="area_Template_list"></div>
    </div>
    <div id="flash" >
         <div id="areaConference"></div>
         <div class="clear"></div>
    </div>
    <div id="NewFlash" >
            <div id="areaInvoice"></div>
        <div class="clear"></div>
    </div>
</div>  
  </div>
</div>

<!--- START ALL the POP UP TEXT --->
<div id="modalEditEmail"></div>
<div id="modalPopUp"></div>
<script type="text/javascript" >
function ExternalPopUp(URLToLoad, id){		
	$("#modalPopUp").dialog("open");
	$("#modalPopUp").load(URLToLoad, {emailid:id}).dialog( { 'modal' : true, 'title': 'You are about to send the following email', forcePlaceholderSize: true , height : 330, width : 350, buttons: {OK: function() { $(this).dialog('close');}}
	} );		
}	
</script>
</body>
</html>

<!---	$('#configure').submit(function() { 
			$('form').bind('form-pre-serialize', function(e) {
				tinyMCE.triggerSave();
				});
			$(this).ajaxSubmit({ success: loadEmailList, clearForm: true });
			tinyMCE.execCommand('mceRemoveControl',false,'content');
			return false; 
		});--->
<!---function loadTemplateForm() {
		$("#areaTemplate").fadeIn("slow").load("templateForm.cfm", {step:"1"}, "");
}--->
<!---
function loadForm(id) {
		$("#arealist").fadeIn("slow").load("email_Form.cfm", {id:id}, function(){ tinyMCE.execCommand('mceAddControl',false,'content'); });
		//$("#areaConfigure").fadeIn("slow").load("menu.cfm", {id:id});
		//$("#editTitle").html("Edit " + title);
}
<!---function loadMenuConf(id, title) {
		$("#areaConfigure").load("menu.cfm", {id:id});
		//$("#editTitle").val($("#emailname"+id).text());  
		//$("#editTitle").attr("value",$("#emailname"+id).text());
		$("#editTitle").html(title);
}--->

function loadEditTemplate(id) {
		$("#areaTemplate").fadeIn("slow").load("templateForm.cfm", {id:id});
}
$(function() {
		$("#tabs_mailer").tabs();
		$("#newEmail").button();
	});
$(document).ready(function() { 
	<!---	$("#new_Template").button();
		
		$('#new_Templatse').button({
					text: false,
					icons: {
						primary: 'ui-icon-seek-prev'
					}
		});--->
	//form for the email configuration space
		$('#configure').submit(function() { 
			$('form').bind('form-pre-serialize', function(e) {
				tinyMCE.triggerSave();
				});
			$(this).ajaxSubmit({ success: loadEmailList, clearForm: true });
			tinyMCE.execCommand('mceRemoveControl',false,'content');
			return false; 
		});
});
--->
<!---new AjaxUpload('##upload_button', {
  action: 'UploadAttachement.cfm',
  name: 'Upload',
  data: {
    id : '#form.id#',
	field : 'file_update'
  },
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_button').html("<img src=../img/ProgressBar_transparent.gif width=70 >");},
  onComplete: function(file, response) {$('##upload_button').html("Loading Completed..."); $('##fileStatus').append(response);}
});--->

<!---
function ExternalModalOpen(URLToLoad, id){		
		$("#modalEditEmail").dialog("open");
		$("#modalEditEmail").load(URLToLoad, {id:id}).dialog( 
				{ 	open: function(event, ui) { tinyMCE.execCommand('mceAddControl',false,'content'); },
					forcePlaceholderSize: true , 
								height : 620, 
								width : 980, 
								position : 'top'
				} );		
}	
	<!---function showResponse(responseText)  { 
	$("#areaConfigure").html("");
	$("#arealist").load("mailing_list.cfm");
	//$("#areaConfigure").fadeIn("slow").load("menu.cfm", { id:responseText});
} --->

<!---$(document).ready(function() { //form for the file upload
	    var options = { 
		success:       loadTemplateList,
		clearForm: true
    };  
    $('#FormTemplate').submit(function() { 
		$(this).ajaxSubmit(options);
		return false; 
    });
	});--->
///////////Color Pickers
<!---$('#col1color, #col2color, #col3color').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	}
	})--->
//////' FLASH NEWS 
<!---$(document).ready(function() { 
	//form for the email configuration space
    var options = { 
		success:  FlashNewsResponse,
		clearForm: true
    };  
    $('#FormFlashNews').submit(function() { 
		$('form').bind('form-pre-serialize', function(e) {
    		tinyMCE.triggerSave();
			});
		$(this).ajaxSubmit(options);
		return false; 
    });

});--->
<!---function FlashNewsResponse(responseText)  { 
	$("#areaFlashNews").html("");
} 
function deleteSchedule(id) {
			$.post("delete.cfm", { id: id , choose: "shedule"}, function(){  $("#date"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
		}
function deleteAttachment(id) {
			$.post("delete.cfm", { id: id , choose: "attachement"}, function(){  $("#attach"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "slow"); });
}--->
<!---<table border="0" cellpadding="0" cellspacing="4" width="100%">
        <tr>
          <td width="640" bgcolor="#C90900"><div style=" text-align:center;margin:2px; border-right:1px dotted  #fff; width:110px; padding:8px; clear:both; float:left"><a href="javascript:loadEmailList();" style="color:#FFFFFF; text-decoration:none"><br />
            Manage email 
outs</a></div>
          <div style="text-align:center; margin:2px; border-right:1px dotted #ffffff; width:130px;  padding:8px; clear:right; float:left"><a href="javascript:loadTemplateList();" style="color:#FFFFFF; text-decoration:none"><br />
          Manage email template</a></div>
          <div style=" text-align:center; margin:2px; border-right:1px dotted #ffffff; width:110px;  padding:8px; clear:right; float:left"><a href="javascript:loadFlashNewsForm();" style="color:#FFFFFF; text-decoration:none"><br />
          Create News Flash</a></div>
          <div style=" text-align:center; margin:2px; border-right:1px dotted #ffffff; width:100px;  padding:8px; clear:right; float:left"><a href="javascript:loadFlashNewsList('emailblast');" style="color:#FFFFFF; text-decoration:none"><br />
          Edit News Flash</a></div></td>
        </tr>
        <tr>
          <td  bgcolor="#D8E2F9"><h1><div id="editTitle"></div></h1>
          <form id="FormFlashNews" name="name" method="post" action="../P21newsManagement/FlashNews.cfm" enctype="multipart/form-data"><div id="areaFlashNews"></div></form>
          <form id="FormTemplate" name="name" method="post" action="templateForm.cfm" enctype="multipart/form-data"><div id="areaTemplate"></div></form>
          <div id="areaConfigure"></div>         </td>
        </tr>
        <tr>
          <td  bgcolor="#F2F2F2">
          
          </td>
        </tr>
      </table>--->

<!---open:function(event, id) { tinyMCE.init({ mode : "textareas", theme : "advanced" }); }
'open' :function(){ tinyMCE.execCommand('mceAddControl',false,'content'); },			
'modal' : true, 
								forcePlaceholderSize: true , 
								height : 620, 
								width : 980, 
								position : 'top'			--->
<!---function loadFlashNewsForm() {
		$("#areaTemplate").fadeIn("slow").load("../P21newsManagement/FlashNews.cfm");
}
function loadImageForm() {
		$("#areaTemplate").fadeIn("slow").load("ImageForm.cfm", {step:"1"}, "");
}
function loadconfiguration() {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"1"}, "");
}
function loadSendDate(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"sendDate", id:id});
}
function loadMailDetails(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"MailDetails", id:id});
}
function loadCountry(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"country", id:id});
}
function loadSelectTemplate(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"template", id:id});
}
function loadregions(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"region", id:id});
}
function loadcontract(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"contra", id:id});
}
function loadEvent(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"event", id:id});
}
function loadFlashNews(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"flash", id:id});
}
function loadforms(steps,id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:steps , id:id});
}
function loadattachements(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"attachment" , id:id});
}
function loadFlashNewsList(newsletter) {
		$("#arealist").fadeIn("slow").load("../P21newsManagement/newsletter_FlashNewsSelect.cfm" , { newsletter: newsletter  });
		$("#areaTemplate").html("");
}
//function loadForm(id, title) {
//		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"edit", id:id}, function(){ tinyMCE.execCommand('mceAddControl',false,'content'); });
		//$("#areaConfigure").fadeIn("slow").load("menu.cfm", {id:id});
//		$("#editTitle").html("Edit " + title);
//}
//var $j = jQuery.noConflict();
jQuery(function($){
   $("#timeToSend").mask("99");
});
--->
function loadWYSISYG(id) {
		$("#areaConfigure").fadeIn("slow").load("configure_1.cfm", {step:"wysiwyg", id:id}, function(){ tinyMCE.execCommand('mceAddControl',false,'content'); });
	
}--->