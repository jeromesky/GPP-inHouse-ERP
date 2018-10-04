<cfinclude template="../_display/dsp_header.cfm">
<script type="text/javascript">
$(document).ready(function() { 

	// live click
	
});

$('.topic').live('click', function(){
		$(this).editable('../program/qry_updateSpeaker.cfm', { 
         	//id : 'speakerID',
			//name : 'fieldname',
			submitdata : function(value, settings) {
       			return {"speakerID": this.id, "fieldname" : "speakerTopic" , "value": this.value};
   			},
			submit    : 'OK',
			width: 370,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'
     		});							
	});

function presentationDetailsSave(){
	var get_presentationCost = $("#presentationCost").val();
	var get_presentationCurrency = $("#presentationCurrency").val();
	var get_eventID = $("#eventID").val();	
	
	postData({ url:'../presentations/qry_updateDetails.cfm', callfunction:'returnPresentationSave',  Args: {"presentationCost": get_presentationCost, "presentationCurrency":get_presentationCurrency, "eventID":get_eventID}  });
}

function returnPresentationSave(data){
		$("#check").html(data);
}




function fileProgress(speakerID){
	
	$("#loader_"+speakerID).html($loading);
}

function fileLoaded(speakerID, file){
	
	var loadedfile = '<div class=loadedfile>'+file+'</div>';
	
	$("#loader_"+speakerID).html("");
	$("#loaderComplete_"+speakerID).prepend(loadedfile);
}

function loadEconference(eventID){
	$("#presentationsList").html($loading);
	$("#presentationsList").load("../presentations/dsp_presentations.cfm", {eventID: eventID } );
	$("#presentationsDetails").load("../presentations/dsp_details.cfm", {eventID: eventID } ); 
}

$(".loadedfile").live('mouseover', function(){ $(this).addClass("loadedfileOver");  } ).live('mouseout', function(){ $(this).removeClass("loadedfileOver");  }  );
$(".loadedfile").live('dblclick', function(){  
					var fetch_fileID = $(this).attr("id"); 
					var splitID = fetch_fileID.split("_");
					alertUI({ title:"Warning", callfunction:'deletefile', type: "confirmation", param: {"libraryID": splitID[1] } , message: "To delete file select OK" })
					//alert("deleting this file: " + fetch_fileID);
});

function deletefile(data){
		
		postData({ url:'../presentations/qry_deleteFile.cfm', callfunction:'returnDeleteFile',  Args: {"libraryID": data.libraryID}  });
		//alert("returned function call with params: " + data.libraryID);	
		removeRow("f_", data.libraryID);
}

function returnDeleteFile(data){
	alert(data);
	//$("#f_"+data).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast"); 
	removeRow("f_", data.libraryID);
}

function removeSpeaker(speakerID){
	postUpdateSlot(speakerID, "speakerStatus", 2 );	
	removeRow("s_", speakerID)
}

</script>
<style type="text/css">
.ui-corner-all {border:1px solid #CCC}
#presentationsList .slot { clear:both; border-top:1px solid #fff;  }
#presentationsList .slot  .loadedfile{ border-bottom:1px solid #e2e2e2; padding:3px 0 3px 5px; overflow:hidden; cursor:pointer}
#presentationsList .slot  .loadedfileOver{ border-bottom:1px solid #F00; background-color:#ffebeb; padding:3px 0 3px 5px; overflow:hidden; cursor:pointer}
#presentationsList .slot_1 { clear:both; border-bottom:1px solid #cccccc; position:relative  }
#presentationsList .slot_1 .time, #presentationsList .slot_4 .time  
{ float:left; clear:both; display:inline; clear:both; width:39px; color:#929293; padding:14px 0 14px 8px  }
#presentationsList .slot_1 .presentation, #presentationsList .slot_4 .presentation
{ float:left; display:inline;  width:359px; color:#929293; padding:14px 14px 14px 0;  } 
#presentationsList .slot_1 .presentation .topic, #presentationsList .slot_4 .presentation .topic
 {color:#1a294f; } 
#presentationsList .slot_1 .presentation .speaker {color:#68696a; } 
#presentationsList .slot_1 .presentation .company {color:#969696; } 
#presentationsList .slot_1 .loader, #presentationsList .slot_4 .loader 
 { float:left; display:inline; margin:0;  width:215px; color:#929293; border-left:1px solid #ccc  } 
#presentationsList .slot_1 .loader .upload, #presentationsList .slot_4 .loader .upload 
{ margin:0px; padding: 6px 10px; background-color:#68dd00; border-bottom:1px solid #277500; color:#fff; font-size:11px; cursor:pointer}
#presentationsList .slot_1 .loader .file, #presentationsList .slot_4 .loader .file
 { padding:0 5px 14px 8px;}
#presentationsList .slot_2{ clear:both; background-color:#deedf7; border-bottom:1px solid #aed0ea; color:#50a7ea; padding:8px 0 8px 12px}
#presentationsList .slot_4{ clear:both; background-color:#ececec; border-bottom:1px solid #cccccc; color:#535457; }

#presentationsList .slot_1 .remove { position:absolute; width:-20px; height:20px; z-index:10} 
</style>

<div style="height:50px"></div>





<div class="c4">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Event Details</spam></div>
     <div id="presentationsDetails" class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content  podForm">

   </div>
   
   <div id="check" class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content podForm"></div>
   
   
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Select event for <cfoutput>#year(now())#</cfoutput></spam></div>
    <div id="presentationsEvents" class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content podLinks">
    	<cfinclude template="dsp_Events.cfm">
   </div>
   
   <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Select year</spam></div>
   <div class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content  podLinks">
    	<ul class="listMenu">
    	<li><a href="index.cfm?year=2011">2011</a></li>
        <li><a href="index.cfm?year=2010">2010</a></li>
        <li><a href="index.cfm?year=2009">2009</a> </li>
        <li><a href="index.cfm?year=2008">2008</a> </li>
        <li> <a href="index.cfm?year=2007">2007</a> </li>
         <li><a href="index.cfm?year=2006">2006</a> </li>
         <li><a href="index.cfm?year=2005">2005</a> </li>
         <li><a href="index.cfm?year=2004">2004</a> </li>
         <li><a href="index.cfm?year=2003">2003</a> </li>
         <li><a href="index.cfm?year=2002">2002</a> </li>
    	<li><a href="index.cfm?year=2001">2001</a> </li>
        </ul>
    </div>
    
    

	</div>

<div class="c8">
    <div id="presentationsList" class="ui-corner-all">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader">
    	Load your files here
    </div>
    <br /><br /><br /><br />      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select event on the left to load files to...<br /><br /><br />
    </div>
</div>

<script type="text/javascript">


function loadPresentationsEvents(){
		$.post("url", { "eventYear": eventYear}, function(data){  $("#presentationsEvents").html(data);  })
		
}
</script>

<cfinclude template="../_display/dsp_footer.cfm">
<!---$(".upload").live('each', function(i){
	
		var speakerID 		= $(this).attr("id");
		var eventType 	= $('#event_type').val();
		var abbr 				= $('#event_abbr').val();
		var speakerType =$(this).attr("title");  
		//speakerID : $(this).attr("id") , eventType: $('#event_type').val(), abbr: $('#event_abbr').val()
		//uploader(speakerID, eventType, abbr, speakerType);
	new AjaxUpload(this, {
			action: '../presentations/qry_uploadFile.cfm',
			name: 'fieldName',
			data: {  "speakerID" : speakerID , "eventType": eventType, "abbr": abbr, "speakerType":speakerType}, 
			autoSubmit: true,
			responseType: false,
			onChange: function(file, extension){},
			onSubmit: function(file, extension) { fileProgress(speakerID); },
			onComplete: function(file, response) { fileLoaded(speakerID, file); $('#check').html(response);}
		});	
	
});


function uploader(speakerID, eventType, abbr, speakerType){
	new AjaxUpload(this, {
			action: '../presentations/qry_uploadFile.cfm',
			name: 'fieldName',
			data: {  "speakerID" : speakerID , "eventType": eventType, "abbr": abbr, "speakerType":speakerType}, 
			autoSubmit: true,
			responseType: false,
			onChange: function(file, extension){},
			onSubmit: function(file, extension) { fileProgress(speakerID); },
			onComplete: function(file, response) { fileLoaded(speakerID, file); $('#check').html(response);}
		});	
	
}--->