<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.form.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/_js/fileuploader.js"></script>

<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script
<script type="text/javascript" src="http://www.petro21.com/my-office/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/ckeditor/ckeditor.js"></script>

<style type="text/css">
	.row{position:relative}
	.layer{ right:-70px; width:100px; height:100px;}
	.layerbottom{ z-index:1; border:1px solid #930;position:absolute;}
	.layerBottomTab{ width:30px; height:50px; top:50px; background-color:#930}
	.layerTop{z-index:2; border: 1px solid #6C9;position:absolute;}
	
	.layerTop .layerTopTab{ width:30px; height:50px; top:0px; background-color:#6C9}
	
	.programList  .list_optionsStatus{ width:110px; border-right:1px solid #e8e8e8}
	.programList  .list_optionsComments{width:95px; border-right:1px solid #e8e8e8}
	.programList  .list_optionsOrder{width:95px; border-right:1px solid #e8e8e8}
	.programList {position:relative}
	.slideContainer{
		    position: absolute;   /*Panel will overlap  content */
			left:430px;
			top: 0px;
			width: 350px;
			height:80px;
			text-align:left;
			z-index: 10;
			/*margin-left: auto;
			margin-right: auto;*/
		}
		
	.slideContainer .slidingpanel {
			width: 348px;
			height: 60px;
			overflow: hidden;
			position: relative;
			z-index: 3;
			display: none;
			
	}
	.slideContainer .slideTab {
		border:1px solid #CCC;
		height: 20px;
		width:60px;
		left:0px;
		float:left;
		background-color:#F00;
		color:#fff
	}
	.slideContainer .slideTab:hover {
		cursor:pointer
	}
	

</style>
</head>

<body>

<div class="bbbuton" style="border:1px solid #999; background-color:#CCC; padding:5px; min-width:60px ">button</div>
<hr />
<div class="bbbuton" style="border:1px solid #999; background-color:#CCC; padding:5px; min-width:60px ">button</div>









<hr />

<hr />
<a href="javascript:openWindow({ url:'page.cfm', param: {'contractID': 33}, Args:{  title : 'Manage contact', height:600, width:990, modal:false}});">open windoew</a>
<textarea id="texxt"></textarea>
<hr />

<div id="openWindow"></div>
<div id="openSlaveWindow"></div>
</body>
<script type="text/javascript">

$(document).ready(function(){
	
	var uploadParams = { 
				element: $('.bbbuton')[0], 
				action: 'uploader.cfm', 
				params: { param1: 'value1',param2: 'value2' }, 
				allowedExtensions: ['pdf','jpg', 'jpeg', 'png'], 
				sizeLimit: 0,  
				debug: true, 
				onSubmit: function(id, fileName){}, 
				onProgress: function(id, fileName, loaded, total){ $(this).html($loading) } };
	
	var uploader = new qq.FileUploader(  uploadParams 	);
	//document.getElementById('file-uploader'),// pass the dom node (ex. $(selector)[0] for jQuery users) id^=jCalendar
	
	
	//$("#texxt").ckeditor();
	
	
});
////global vars
var $loading = $('<div class="loadingGif"><img src="../img/loaderBar_blue.gif" alt="loading" ></div>');
var randomnumber = Math.floor(Math.random()*10002);

function createDialog(modal){

	$("#"+modal).dialog({ 
			autoOpen: false,
			bgiframe: true,
			draggable: true,  
  			resizable: true,
			position: 'center',
			forcePlaceholderSize: true,
			//open: function() {  
    			//$(this).find("textarea").ckeditor(editor_config).dialog( "close" );  
  			//},  
			open:function(){
                        //$(this).find('textarea').ckeditor();
                },
  			close: function() { 
				//$(this).dialog("destroy");
				//destroyCKeditor("all");
				var instanceName = CKEDITOR.instances.name;
				var instance = CKEDITOR.instances[instanceName];
				//alert(instance);
					if( instance ) { 
					instance.destroy(true);
					}
				//clear the modal window
				$(this).html("");
 
  			}
	});	
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//LOAD PAGE TO PLACEHOLDER  SITE WIDE //////////////////////////////////////////////////
function loadPageToPlaceHolder(params){
		
		var url 						= params.url;
		var placeHolder		= params.placeHolder;
		var textareaID			= params.textareaID;
		var Args					= params.Args;
		
		destroyCKeditor(textareaID);
		$("#"+placeHolder).html($loading);
		
		
		$.post(url, Args, function(data){
			$("#"+placeHolder).html(data);
			CKEDITOR.replaceAll( function( textarea, config ){
						if (textarea.className=="noEditor") return false;
						consol.log(textarea);
						consol.log(config);
						config.toolbar_Basic = [['Bold', 'Italic','NumberedList','BulletedList' ]]; 
						config.toolbar = 'Basic';
						config.toolbarStartupExpanded = false;
						config.width = '165px';
						config.height = '55px';
						config.removePlugins = 'elementspath';
						config.language = 'en';
						//config.skin = 'Kama';
						//config.autoGrow_maxHeight = 200;
				
			});
		});
}

<!---var basicEditor = CKEDITOR.config.toolbar_Basic[[ 'Source','-','Bold','Italic','Underline','NumberedList','BulletedList', ]];

var basicEditoeer = CKEDITOR.replace('interp3',{toolbarStatus:'hide', scayt_autoStartup:true,disableNativeSpellChecker:false,skin:'kama',uiColor:'#e6edf3',toolbar:[['Bold','Italic','Underline','-','SelectAll','-','SpellChecker','Scayt',]]});--->
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////Pop Up Opener  SITE WIDE//////////////////////////////////////////////////
function openWindow(params){
		
		
		//createDialog("openWindow");
		var url 						= params.url;
		var Args					= params.Args;
		var param				= params.param;
		var openeModal 		= 'openWindow';
		
		if( $("#openWindow").dialog("isOpen")== true ){
			//if( $("#openWindow div").length ){ 
			//alert("already open");
			var openeModal = 'openSlaveWindow';
			//openDialog()
		}

		
		<!---if(modal == this){
			var openeModal = openWindow;
		else if(modal == this){
			var openeModal = openWindowSlave;
		}--->
	
		$("#"+openeModal).dialog("open").html($loading).load(url, param, function(){
			CKEDITOR.replaceAll( function( textarea, config ){
						if (textarea.className=="noEditor") return false;
						config.toolbar_Basic = [['Bold', 'Italic','NumberedList','BulletedList' ]]; 
						config.toolbar = 'Basic';
						config.toolbarStartupExpanded = false;
						config.width = '165px';
						config.height = '55px';
						config.removePlugins = 'elementspath';
						config.language = 'en';
						//config.skin = 'Kama';
						//config.autoGrow_maxHeight = 200;
				
			});	
		}).dialog(Args);		//, 'stack' : true
}

//SCRIPTS FOR  TO DESTROY CKEDITOR ON THE FLY//////////////////////////////////////////////////	
function destroyCKeditor(textareaID){	
	var instanceName = textareaID;
	var editor = CKEDITOR.instances[instanceName];
				if( editor ) { 
					alert(editor);

					editor.destroy(true);
				}
}

function postData(params){
	
		var url 						= params.url;
		var Args					= params.Args;
		var callfunction		= params.callfunction;
		
		$.post(url, Args, function(data){
			window[callfunction](data);
		});
}




//this destroy works FOR INDEX //////////////////////////////////////////////////
function loadProgramMenu(eventID){
	$(".ui-dialog-titlebar").load("../program/dsp_menu.cfm", {"eventID": eventID}, function(){
			var instanceName = 'extraDetails';
			var instance = CKEDITOR.instances[instanceName];
				if( instance ) { 
					instance.destroy(true);
				}
				//set editor in slot manager
			$( '#extraDetails' ).ckeditor({toolbar: 'Basic', width : 465, height: 250, removePlugins : 'elementspath'});
			$("#extraDetailsPain").css({display: 'none' });	
	});	
}



</script>
</html>
