
    </div>
    </div>
   	<div id="loading_overlay">
		<div class="loading_message round_bottom">Loading...</div>
	</div>
<div id="openWindow"></div>
<div id="openSlaveWindow"></div>
<div id="alertUI"></div>
<div id="openModal"></div>

<script type="text/javascript">

////global vars
var $loading = $('<div class="loadingGif"><img src="../img/loaderBar_blue.gif" alt="loading"></div>');
var randomnumber = Math.floor(Math.random()*100002);
var accordionDefault = {autoHeight: false, animated: false, collapsible: true};
var modals = { 
				"branch"			: {"height": 550, "width":825, "title" : 'Manage Branches', "modal":false} , 
				"company" 		: {"height": 490, "width":690, "title" : 'Manage company' , "modal":false} , 
				"AKAcompany"	: {"height": 330, "width":665, "title" : 'Manage company Labels',  "modal":false } , 
				"packages"		: {"height": 600, "width":990, "title" : 'Manage  Packages',  "modal":false } ,
				"files"				: {"height": 500, "width":850, "title" : 'Manage  files',  "modal":false } ,
				"contacts"			: {"height": 505, "width":940, "title" : 'Manage  contacts',  "modal":false } ,
				"tasks"				: {"height": 500, "width":770, "title" : 'Manage  tasks',  "modal":false } ,
				"labelsMove"	: {"height": 340, "width":705, "title" : 'Move labels to new company',  "modal":false } ,
				"eventLocation":{"height": 240, "width":340, "title" : 'Manage Event locations',  "modal":false } ,
				"notes"				: {"height": 550, "width":430, "title" : 'Notes',  "modal":false } 
					};

function createDialog(modal){

	$("#"+modal).dialog({ 
			autoOpen: false,
			bgiframe: true,
			draggable: true,  
  			resizable: true,
			position: 'center',
			forcePlaceholderSize: true, 
  			close: function() { 
				destroyCKE();
				$(this).html("");
 
  			}
	});	
}	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////Pop Up Opener  SITE WIDE//////////////////////////////////////////////////
function openWindow(params){
		
		//createDialog("openWindow");
		var url 						= params.url;
		var Args					= params.Args;
		var param				= params.param;
		var openeModal 		= 'openWindow';
		
		//check to see if first window already open
		if( $("#openWindow").dialog("isOpen")== true ){
			var openeModal = 'openSlaveWindow';
		}
	
		$("#"+openeModal).dialog("open").html($loading).load(url, param).dialog(Args);		//, 'stack' : true
}	
</script>
	</body>
 
</html>