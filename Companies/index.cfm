<cfparam name="form.companyID" default="0">
<cfparam name="form.userID" default="0" >

<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>
<cfoutput>
<script type="text/javascript">

	var companies = {};
	companies.companyID = #form.companyID#;
	companies.userID = #form.userID#;

function UpdateUserCompany(){
	
		var fetch_companyID	= $("##company_companyID").val();
	
		if (fetch_companyID != companies.companyID){
			//alert("not same company lets update");
			alertUI({ title:"Update", callfunction:'', type: "message", param: {} , message: "user now updated with this company" })
			
			//reset company
			postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'', Args: {"id":companies.userID, "fieldname" : "companyID", "value" : fetch_companyID, "oldValue" : companies.companyID }  });
			$("##companyName").html($("##company_companyName").val() );
			individual.companyID 		= fetch_companyID;
			individual.AKA_companyID 	= 0;
			individual.branchID 		= 0;
			
			//reset companyAKA
			postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'', Args: {"id":companies.userID, "fieldname" : "AKA_companyID", "value" : 0, "oldValue" : $("##AKA_companyID").val() }  });
			$("##AKA_companyName").html("");
			
			//reset branch
			postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'', Args: {"id":companies.userID, "fieldname" : "branchID", "value" : 0, "oldValue" : $("##branchID").val() }  });
			$("##branchname").html("");
			
			//alert
			growl("Update", 'Company linked to user, label and branch has been removed from individual, you will need to relink', 'message', 'ui-icon ui-icon-check', 'notice');
			
		} else if (fetch_companyID == companies.companyID){
			//alert("this user is already linked to this company");
			alertUI({ title:"Message", callfunction:'', type: "message", param: {} , message: "this user is already linked to this company" })
		}
}

<!---function SaveCompany(){
	var fetch_active 				= $("##company_active").is(':checked');
	var fetch_companyName	= $("##company_companyName").val(); 
	var fetch_companyID		= $("##company_companyID").val();
	var fetch_industryID		= $("##company_industryID").val();
	var fetch_VAT					= $("##company_VATNumber").val();
	var fetch_URL					= $("##company_companyURL").val();
	<!---	var fetch_Bios					= $("##company_companyBios").val();
	var isEditor = CKEDITOR.instances['company_companyBios'] ;
		
		if (isEditor){
				var fetch_Bios					= CKEDITOR.instances.company_companyBios.getData();
		} else {
				var fetch_Bios					= $("##company_companyBios").val();
		}--->
		var fetch_Bios					= CKEDITOR.instances.company_companyBios.getData();
	<!---		 var fetch_Bios 				= CKEDITOR.instances['company_companyBios'];
	 var fetch_Bios 				= CKEDITOR.instances.getData();--->
		<!---var fetch_Bios					= $("##company_companyBios").val();--->
		<!---alert(fetch_Bios);--->
	//alert('active: ' + fetch_active + ' company: ' + fetch_companyName + ' companyID: ' +  fetch_companyID + ' Industry: ' + fetch_industryID + ' VAT: ' + fetch_VAT + ' URL: ' + fetch_URL + ' Bios: ' + fetch_Bios );
	//alert();
	postData({ url:'../companies/qry_company_Update.cfm', callfunction:'actionCompanySave',  Args: {"active" : fetch_active, "companyName" : fetch_companyName, "companyID" : fetch_companyID, "industryID": fetch_industryID, "VATNumber": fetch_VAT, "companyURL": fetch_URL, "companyBios": fetch_Bios}  });
	
}--->

function actionCompanySave(data){
		
		if (companies.userID == 0){
			//alert("New company added to the system");
			alertUI({ title:"New company added to the system", callfunction:'', type: "message", param: {} , message: "Company Added select OK to continue" })
			
		} else if (data != companies.companyID){
			growl("Update", 'Company updated successfully', 'message', 'ui-icon ui-icon-check', 'notice');
			//alert(" you have  updated a different company to the one applied to the user /n if you want to link this company to the user, click LINK THIS COMPANY TO USER");
			alertUI({ title:"Company updated", callfunction:'', type: "message", param: {} , message: "this is a diferent company to the one selected for this user /n click LINK THIS COMPANY TO USER to set for this user" })

		} else {
			growl("Update", 'Company updated successfully', 'message', 'ui-icon ui-icon-check', 'notice');
			$("##companyName").html($("##company_companyName").val() );	
		}
		loadCompany(data, #form.userID#);
}

loadCompany(#form.companyID#, #form.userID#);

function loadCompany(companyID, userID){
	loadPageToPlaceHolder({ url:'../companies/dsp_company_Form.cfm', placeHolder:'companies', textareaID:'companyBios', Args: {"companyID": companyID, "userID": userID}  }); 
}
</script>
<style type="text/css">
##companies {margin-top:15px}
</style>
<div class="index">
        <sup class="displayLabel">
            search companies
        </sup>			
        <sup class="displayData">
            <cf_companies_search open="0" random="#randomID#" userID="#form.userID#" placeHolder="companies">
        </sup>
<!---        <sup class="displayLabel">Updated</sup>			
        <sup class="displayData"> new company </sup>--->
        <div class="clear"></div>
</div>

<div id="companies"></div></cfoutput>