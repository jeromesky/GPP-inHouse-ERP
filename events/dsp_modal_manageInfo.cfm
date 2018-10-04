<!---<cfset form.newForm = 1>--->
<script language="javascript">
	var eventsInformation = {};
	eventsInformation.eventID = <cfoutput>#form.eventID#</cfoutput>;
	eventsInformation.parentID = <cfoutput>#form.parentID#</cfoutput>;
	
	<!---$(document).ready(function(){
			$(".collapse").css("visibility", "hidden")
	});--->
	
	$(".date").datepicker({ dateFormat: 'dd MM yy' });
	
	function loadEventInfo_list(){	
		$("#div_eventInfo_list").html($loading);
		loadPageToPlaceHolder({ url:'../events/dsp_eventInfo_pane.cfm', placeHolder:'div_eventInfo_list', textareaID:'no', Args: {"eventID": eventsInformation.eventID} });
	}
	
	function loadEventInfo_form(eventInfoID){	
		$("#eventInfo_form").html($loading);
		loadPageToPlaceHolder({ url:'../events/dsp_eventInfo_form.cfm', placeHolder:'eventInfo_form', textareaID:'no', Args: {"eventInfoID": eventInfoID, "parentID": eventsInformation.parentID, "eventID": eventsInformation.eventID } });
	}
	
	function loadEventInfo_newForm(eventInfoID){	
		$("#eventInfo_form").html($loading);
		loadPageToPlaceHolder({ url:'../events/dsp_eventInfo_form.cfm', placeHolder:'eventInfo_form', textareaID:'no', Args: {"newForm": 1, "parentID": eventsInformation.parentID, "eventID": eventsInformation.eventID } });
	}
	
	function actionloadEventInfo_Save(data){
		 loadEventInfo_list(eventsInformation.eventID);
		 loadEventInfo_newForm(1);
		//alert(data);
	}
	
	$(".tocollapse").live("click", function(){
      $(".collapse").hide("fast");
      //$(this).toggle("fast");
	});
	
	
	$("#eventInfoType").live("change", function(){
		//alert( $(this).val() );	
	<!---	$("#LeventInfoDateStart").html(valSD);
		$("#LeventInfoTimeStart").html(valST);
		$("#LeventInfoDateEnd").html(valED);
		$("#LeventInfoTimeEnd").html(valET);
		$("#LeventInfoLocation").html(valL);--->
		
	});
	

    $('#form_eventInformation').live("submit", function() { 
		$(this).ajaxSubmit( { clearForm: false, success: actionloadEventInfo_Save}); 
		return false; 	
    }); 
	loadEventInfo_list();
 	loadEventInfo_newForm();
</script>
<style type="text/css">
table{border-bottom:1px solid #CCC;}
.labels{color:#666; text-align:right}
td{padding:5px}
/*/.collapse{display:none}*/
h3{border-bottom:1px solid #CCC; background-color:#F6FCFF}
</style>
<div id="eventInfo_form" style="background-color:#F5F5F5">

</div>
<hr>

<div id="div_eventInfo_list"></div>