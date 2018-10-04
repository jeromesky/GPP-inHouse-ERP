<script type="text/javascript">

$("#button_mergeCompany").live('click', function(){
		var companyID_remove 	= $("#mergeCompanyID_remove").val();
		var companyID			 	= $("#mergeCompanyID_keep").val();
		
		if ( companyID_remove == '' || companyID == '') {
			alert("you need to select two companies to complete a merge");
		}else{
		
		alertUI({ title:"Warning", callfunction:'actionMergeCompanies', type: "confirmation", param: {"companyID": companyID, "companyID_remove": companyID_remove } , message: "You agree to merge the two selected companies into one umbrella, the lower selected company will be used as the umbrella reference, all users, contacts branches and labels will also be moved, click OK to continue" })	
			
		}
		
});

function actionMergeCompanies(data){
		
		postData({ url:'../companies/qry_merge_companies.cfm', callfunction:'returnMergeCompanies',  Args: {"companyID": data.companyID, "companyID_remove": data.companyID_remove}  });
		//alert("returned function call with params: " + data.companyID + " :: " + data.companyID_remove);	
}

function returnMergeCompanies(data){
		
		$("#form_companyMerge").html(data);
}
</script>

<div id="form_companyMerge">
<fieldset>
	<legend>Moving company</legend>

<cf_companies_search  open="4" random="#RandRange(2011, 6044)#" idName="mergeCompanyID_remove" ><input type="hidden" id="mergeCompanyID_remove">
</fieldset>

<fieldset>
	<legend>to this Holding Company</legend>
<cf_companies_search  open="4" random="#RandRange(6045, 9999)#" idName="mergeCompanyID_keep"  ><input type="hidden" id="mergeCompanyID_keep">
</fieldset>
<b></b>
<i class="NoFormat"><button class="ui-corner-all" id="button_mergeCompany">Merge</button></i></div>