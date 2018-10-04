
<style type="text/css">

.FormTableArea {clear:both; display:table-row-group; border:1px solid #CCCCCC; border-top:0px solid #fff}
</style>
<cfoutput>


<script type="text/javascript" >
$(document).ready(function(){
			$("a", ".toolbar").button();
			//var contractTypeGroup = "";
			//$('##loadNewContractForm').parent().css({ 'visibility' : 'hidden'}); 
			<!---$('##area_menu').fadeIn("fast").load("../contract/dsp_contractMenu.cfm" );--->
			loadContracts(0);
			

});

function loadContracts(TypeGroup){
		//contractTypeGroup = TypeGroup;
		//$('##loadNewContractForm').parent().css({'visibility' : 'visible'});
		$('##area_Contract').fadeIn("fast").load("../contract/dsp_contracts.cfm" , {"contractTypeGroup": TypeGroup });
		//alert(contractTypeGroup);
}

function loadContractForm(contractID){
		$('##area_Contract').fadeIn("fast").load("../contract/dsp_contractForm.cfm" , {"contractID" : contractID }); 
}

</script>
<div id="area_menu"><cfinclude template="../contract/dsp_contractMenu.cfm"></div>

<div id="area_Contract"></div>
</cfoutput>

<!---
function loadSponsorForm(id){

$('##area_sponsors').fadeIn("fast").load("../contract/dsp_sponsors.cfm" , { });
}


//$('.tableRow').live("click", function(){
		//var get_contractID = $(this).attr("id");
	//	$('##contractForm_'+get_contractID).fadeIn("fast").load("../contract/dsp_contractForm.cfm" , { "contractID": get_contractID });
//	});
	
//function loadContractForm(contractID){
//		$('##contractForm_'+contractID).fadeIn("fast").load("../contract/dsp_contractForm.cfm" , { "contractID": contractID });
//}	var get_eventID = $('##eventList').val() ;--->
<!---$('##loadNewContractForm').live('click', function(){
		var get_contractTypeGroup 	= $('##contractTypeGroup').val();
		$('##area_loadContract').fadeIn("fast").load("../contract/dsp_contractForm.cfm" , {"contractTypeGroup": get_contractTypeGroup, 'contractID' : 0 }); 
});--->
<!---function ReloadContracts(contractTypeGroup){
		$('##area_loadContract').fadeIn("fast").load("../contract/dsp_contracts.cfm" , {"contractTypeGroup": contractTypeGroup });
}--->