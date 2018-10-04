<!--- declare Variables ____________----------->
<cfparam name="eventid" default="#form.eventID#">

<!---<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript">
  tinyMCE.init({ mode : "none"});
</script>--->
<cfoutput>
<script language="javascript">
 var functions = {};
	functions.eventID 	= #form.eventID#;
	functions.parentID 	= #form.parentID#;</cfoutput>	
	
$(document).ready(function() { 
	loadFunctionList(functions.eventID);
	loadFunctionForm(functions.eventID, 0);
	
	   $('#formFunctions').submit(function() { 
			$(this).ajaxSubmit({target: '#functionForm', clearForm: true, success: function() { 
				loadFunctionList(functions.eventID);  
				loadFunctionForm(functions.eventID, 0);   
			} }); 	
		return false; 
    }); 



});  



		function loadFunctionList(eventID) {
				loadPageToPlaceHolder({ url:'../functions/dsp_functionList.cfm', placeHolder:'functionList', textareaID:'no', Args: {"eventid": eventID}  }); 
		}


		function loadFunctionForm(eventID, functionID) {
				loadPageToPlaceHolder({ url:'../functions/dsp_functionForm.cfm', placeHolder:'functionForm', textareaID:'no', Args: {"eventid": eventID, "functionID" : functionID, "parentID": functions.parentID}  }); 
		}
		
		function deleteFunction(functionID) {
				alert("delete function");
					postData({ url:'../functions/qry_deleteFunction.cfm', callfunction:'actionDeleteFunction',  Args: {"functionID" : functionID}  });
		}
		
		function actionDeleteFunction(functionID){
			removeRow("functionRow_", functionID);
			
		}
</script>            

<div class="c4">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><span class="ui-dialog-title">Function already loaded
    	<span style="text-align:right"><a href="javascript:javascript:loadFunctionForm(<cfoutput>#eventid#</cfoutput>,0);"><img src="../img/reload_page.jpg" border="0" />New Function</a></span>
        </span></div>
	<div id="functionList" class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content podForm podBgFade" style="height:425px; overflow:auto">
    </div>
 </div>
 <form action="../functions/act_addFunction.cfm" method="post" id="formFunctions" >
 <div class="c4">
 <div id="functionForm" class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade" style="height:475px; overflow:auto">
 
 </div>
 </div></form>
 <!---    
 
  
 
 
 $('#formFunctions').submit(function() { 
		$(this).ajaxSubmit({target: '#functionForm', clearForm: true, success: function() { loadFunctionList(<cfoutput>#eventid#</cfoutput>);  loadFunctionForm(<cfoutput>#eventid#</cfoutput>, 0);   } }); 	
		return false; 
    }); 
});  --->