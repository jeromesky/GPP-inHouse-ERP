<script type="text/javascript">
function loadContractForm(contractID){
	loadPageToPlaceHolder({ url:'../contract/dsp_contractForm.cfm', placeHolder:'contract', textareaID:'contractCompanyComment', Args: {"contractID": contractID}  }); 
	
}

function addContract2package(contractID,eventID,packagetypeID)
	{
		
		$.post("../contract/qry_addPackage.cfm", {"contractID": contractID, "eventID" : eventID, "packagetypeID" : packagetypeID }, function(data){  
								$("#contract2packages li:eq(0)").after(data); 
								$("#button_addPackage").css({"visibility": "visible"});
								$("#packageProcess").html("");
					}, "text");
}

function createPackage(){
		//var contractID = $("#contractID").val();
		var selectedEventID= $("#packageEventID :selected").val();
		var packagetypeID	= $("#packagetypeID :selected").val();
		
		 if (selectedEventID == 0 || packagetypeID == 200){
			 alert("either no event or package type was selected");
		 }else{
			 $("#button_addPackage").css({"visibility": "hidden"});
			$("#packageProcess").html($loading);
			addContract2package(packages.contractID,selectedEventID,packagetypeID);
		 }
}

function loadpackage(packagesID){
		loadPageToPlaceHolder({ url:'../contract/dsp_packageForm.cfm', placeHolder:'package', textareaID:'no', Args: {"packagesID": packagesID}  }); 
}

function searchContracts(){
	loadPageToPlaceHolder({ url:'../contract/dsp_contracts.cfm', placeHolder:'contracts', textareaID:'no', Args: {"packageTypeID": $("#contractPackagetypeID :selected").val() , "eventID" :  $("#contractEventID :selected").val()}  }); 
}

function deleteContract(contractID){  
					alertUI({ title:"Warning", callfunction:'actionDeleteContract', type: "confirmation", param: {"contractID": contractID } , message: "Are u absolutely definitely, 100% sure u really really sure you want to delete this contract, u will not get any of this back ... To delete all file linked to this contract pressed OK" })
}

function actionDeleteContract(data){
		
		postData({ url:'../contract/qry_deleteContract.cfm', callfunction:'',  Args: {"contractID": data.contractID}  });
		//alert("returned function call with params: " + data.contractID);	
		removeRow("contractID_", data.contractID)
}


</script>
<cfoutput>
<div class="c10">
	<div class=" ui-widget ui-widget-content podBgFade" style="padding:5px 10px"  >
    	<cf_Types name="contractPackagetypeID" cat="package" catid="0" id="0">
        <cf_events_dropDown eventID="0" fieldName="contractEventID" elapse="1" operator="=" eventType="week"><br />
        <cf_companiesID_search random="#RandRange(2011, 8044)#">
        <button class="ui-corner-all" id="0" onclick="javascript:searchContracts();">search</button>
	</div>
    
    <div id="contracts" class="ui-corner-bottom  ui-widget ui-widget-content podLinks ">
   <!---	<cfinclude template="dsp_contracts.cfm">--->
    </div>
</div>

<div class="c4">

	<cfinclude template="dsp_menu.cfm">
    <div id="contract"></div>

</div></cfoutput>