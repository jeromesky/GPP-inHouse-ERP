<cfparam name="form.newsletterID" default="0">
<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>

<cfoutput>
<script type="text/javascript">
$(document).ready(function() {
	
	var searchCompanyID = -1;

		$("##jWizard").jWizard({
					hideTitle: true,
					buttons: {
							finishType: "submit",
							cancelHide: true
								},
					counter: {
							enable: true,
							type: "percentage",	// Default: "count"
							progressbar: true,	// Default: false
							location: "footer",	// Default: "footer"
							startCount: true,	// Default: true
							startHide: true,	// Default: false
							finishCount: false,	// Default: true
							finishHide: false,	// Default: false
							appendText: "Done",	// Default: "Complete"
							orientText: "right"	// Default: "left" ("center" is also valid)
							}
		});
		
		//hide pods 
		hideCompanyPods();
		populateCompanySuggest('searchAssociation', 1);
});

function hideCompanyPods(){
	$("##aka_company").css("display" , "none");
	$("##company_search").css("display" , "none");
	$("##dsp_selectedCompany").css("display" , "none");
}

///////new stuff here
$('##strEmail').live('focusout', function(){
	var GovRegExp 	= / .gov | .gov. | .gouv. | .gob. | .mil. | .mil | .go. /;
	var AcademicRegExp 	= /.edu| .ac. | .ed.  /;  
	var AssociationRegExp 	= / .org | .fi.cr | .og. | /;  
	//var InterRegExp 			= /.int/; 
	//var OrgRegExp 			= /.org/; 
	
	//remove the company pods when going back
	removeCompanyPods();
	var fetch_email = $(this).val();
	$.post("dsp_data.cfm", {"useremail": fetch_email }, function(data){  $("##newUser_search_result").html(data); });
	//set Gov
	var matchGov 			= fetch_email.search(GovRegExp);
	var matchAcademic = fetch_email.search(AcademicRegExp);
	var matchAssociation = fetch_email.search(AssociationRegExp);
		
		if (matchGov !=  -1){
			populateCompanySuggest('searchCountry', 1);
			hideCompanyPods();
			$("##aka_company").css("display" , "block");
			
		} else if (matchAcademic != -1){
			
			populateCompanySuggest('searchAcademic', 1);
			hideCompanyPods();
			$("##aka_company").css("display" , "block");
		
		} else if (matchAssociation != -1){
			populateCompanySuggest('searchAssociation', 1);
			hideCompanyPods();
			$("##aka_company").css("display" , "block");
		
		} else {
			var emailAddress= fetch_email.split('@');
			var fullDomain 	= emailAddress[1];
			var domain 			= fullDomain.split('.');
			var domain 			= domain[0];
			hideCompanyPods();
			populateCompanySuggest('searchDomain', domain);
			populateLabelSuggest('searchDomain', domain);
			$("##company_search").css("display" , "block");
		}
		
		var domain = fetch_email.split('.');
		//var TLD = domain[domain.length-1];
		//$.getJSON("../TLD/JSON_TLD.cfm", { "TLDname": TLD },  function(data){
			//	alert("sdsdsdsd");
		//});
});

//////////Do action when company type is not company
$(".companyAction").live('change', function(){
		
	removeCompanyPods();
	var fetch_type 			= $(this).attr("alt"); 
	//var fetch_companyID 	= $(this).val();
	var fetch_akaCompanyID= $(this).attr("id");
	var fetch_companyID		= $(this).val();
	
	if (fetch_type == 'country' || fetch_type == 'academic' || fetch_type == 'association' || fetch_type == 'company' || fetch_type == 'labels' || fetch_type == 'independent' ){
			$("##aka_company").css("display" , "block");
			$("###randomID#companyID").val(fetch_companyID);
			$("###randomID#AKA_companyID").val("");
			//populateCompanySuggest("searchLabels", fetch_companyID);
			populateLabelSuggest('searchLabels', fetch_companyID);
			populateBranchSuggest(fetch_companyID)

	} else if (fetch_type == 'newCompany'){
			$("##company_search").css("display" , "block");
			
	} else if ( fetch_type == 'companyLabel' ){
			//alert($(this).val());
			$("##dsp_selectedCompany").css("display" , "block");
			$(".aka_companyName").html( $(this).attr("title") );
			$("###randomID#companyID").val(fetch_companyID);
			$("###randomID#AKA_companyID").val(fetch_akaCompanyID);
			$(".companyName").html( $(this).attr("lang") );
			populateBranchSuggest(fetch_companyID)
	}
});

///Do action when company selected and load Branches
$(".newUser2Branch").live('change', function(){
		
		populateBranchForm($(this).val() , $(this).attr("title") );
});

function removeCompanyPods(){
	$("##aka_company").css("display" , "none");
	//$("###randomID#companyID").val("");
	//$("###randomID#AKA_companyID").val("");
	$("##company_search").css("display" , "none");
	$("##dsp_selectedCompany").css("display" , "none");
	$("##companies").html("");
}

function populateBranchSuggest(companyID){
	loadPageToPlaceHolder({ url:'../branches/?fa=list-newUser', placeHolder:'suggestBranch', textareaID:'no', Args: {"branchID": 0, "companyID": companyID , "userID": #form.userID#} });
}

function populateBranchForm(branchID, companyID){
	loadPageToPlaceHolder({ url:'../branches/dsp_branche_Form_newUser.cfm', placeHolder:'branchForm', textareaID:'no', Args: {"branchID": branchID, "companyID": companyID , "userID": #form.userID#} });
}

function populateCompanySuggest(sName, sVal){
	loadPageToPlaceHolder({ url:'../companies/dsp_suggestCompany.cfm', placeHolder:'suggestCompanies', textareaID:'no', Args: {"sName": sName, "sVal":sVal} });
}

function populateLabelSuggest(sName, sVal){
	loadPageToPlaceHolder({ url:'../companyLabels/dsp_suggestLablels.cfm', placeHolder:'suggestLabels', textareaID:'no', Args: {"sName": sName, "sVal":sVal} });
}

function newCompanyForm(companyID, companyName){
		if (companyID == 0){
				loadPageToPlaceHolder({ url:'../companies/dsp_Form.cfm', placeHolder:'companies', textareaID:'no', Args: {"companyID": companyID, "userID": #form.userID#, "companyName": companyName }  });
				populateBranchSuggest(companyID);
				
			}else {
				$('#randomID#companyID').val(companyID);
				populateCompanySuggest("searchLabels", companyID);
			}	
}
</script>

<form action="../newUser/act_userSave.cfm" id="formNewUser" method="post">

<div id="jWizard" class="jWizard">
    <div  id="test1-step1" >
            <input type="hidden" name="userID" value="#form.userid#">
            <cfinclude template="dsp_userDetails.cfm">
    </div>
    
    <div  id="test2-step2" ><!--- STEP 2 --->
                <div class="c5">
                		<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Select from suggested companies on the system</spam></div>
                        <div id="suggestCompanies" class="ui-widget ui-widget-content marginBottom15"></div>
                        <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Select from suggested lablels on the system</spam></div>
                        <div id="suggestLabels" class="ui-widget ui-widget-content"></div>
                </div>
                
                <div class="c4">
        		<input type="hidden" name="companyID" id="#randomID#companyID"/>
				<input type="hidden" name="aka_companyID" id="#randomID#AKA_companyID"/>
                       
                        <div id="aka_company"><!--- display aka_companyName filed display --->
                       		<div class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Step 2: Company Label </spam></div>
                        		<div class="ui-widget ui-widget-content podForm">
                                    <b>Company</b>
                                    <i class="NoFormat companyName"></i>
                                    <b>Company Label</b>
                                    <i class="NoFormat"><input type="text" name="aka_companyName" id="" value="" class="ui-corner-all" /></i>
                                    <b>Company Label URL</b>
                                    <i class="NoFormat"><input type="text" name="AKA_companyURL" id="" value="" class="ui-corner-all" /></i>
                                    <!---<input type="hidden"  name="aka_companyID" value="0" /> 
                                    <input type="hidden" name="companyID" id="compayID" />--->
                                    <div class="clear"></div>
                                </div>
                        </div>
                        
                        <div id="dsp_selectedCompany"><!--- display select label and company --->
                         		<div class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Your selected Company </spam></div>
                        		<div class="ui-widget ui-widget-content podForm">                       
                                    <b>Company</b>
                                    <i class="NoFormat companyName"></i>
                                    <b>Label</b>
                                    <i class="NoFormat aka_companyName"></i>
                                    <div class="clear"></div>                                                        		
                                </div>
                        </div>
                        
                        <div id="company_search">
                                <div class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Option 2: Search company if not in list</spam></div>
                                <div class="ui-widget ui-widget-content podForm" >
                                        <b>Search Companies</b>
                                        <i class="NoFormat"><cf_companies_search random="#randomID#" userID="0" functionCall="newCompanyForm" placeHolder="companies"></i>
                                        <div class="clear"></div>
                                </div>
                        </div>

                        <div id="companies"></div><!--- load company form to here --->&nbsp;
                </div>
                
                <div class="c2">
                	<div class="ui-widget ui-widget-content podForm">
                			<cfinclude template="dsp_key.cfm">
                    </div>
                </div>
	</div>
   
    <div id="test3-step3"><!--- User Address --->
    
    		<div class="c5">
                		<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Option 1: Select from suggested branch on the system</spam></div>
                        <div id="suggestBranch" class="ui-widget ui-widget-content"></div>
           </div>
           <div class="c4" id="branch"></div>
	</div>
	
    <div id="test4-step4"><!--- industry sector and Role --->
        	<div class="c5">
				<cfinclude template="../roles/dsp_roles.cfm">
            </div>
            <div class="c4">
                <cfinclude template="../Industry_Sector/industry_sector.cfm">
            </div>
	</div>

	<div id="test5-step5" ><!---Regions of interest --->
            <div class="c4">
                <cfinclude template="../user_functions/dsp_RegionInterest_email.cfm">
             </div>
             <div class="c4">
                <cfinclude template="../user_functions/dsp_RegionInterest_post.cfm">
             </div>
	</div>
    
	<div id="test6-step6" ><!---Newsletters --->
        	<cfinclude template="../user_functions/dsp_Newsletters.cfm">
	</div>  
</div>
</form>  
</cfoutput>


<!---	 function actionTLD(data){
			var data;
			var data = eval( "(" +data + ")" );
			$("###randomID#country_ID").val(data.countryID);
	 $("###randomID#country_ID").val(data.countryID);
		  $(".countryCode").val(data.countryPhoneCode);
		  $("###randomID#CountryName").val(data.countryName);	
}--->
<!---<cfoutput>#randomID#
{
		counter: {
			enable: true,
			type: "percentage",	// Default: "count"
			progressbar: true,	// Default: false
			location: "footer",	// Default: "footer"
			startCount: true,		// Default: true
			startHide: true,		// Default: false
			finishCount: false,	// Default: true
			finishHide: false,	// Default: false
			appendText: "Done",	// Default: "Complete"
			orientText: "right"	// Default: "left" ("center" is also valid)
		},
		buttons: {
			finishType: "submit"
		}
	}

</cfoutput>

//function loadSuggestionCompanies(){
//	loadPageToPlaceHolder({ url:'../companies/dsp_SuggestLabelANDCompananies.cfm', placeHolder:'suggestCompanies', textareaID:'no', Args: {"searchAssociation": "1"}  });	
//}

//function loadAKA_Company(companyID){
	//	loadPageToPlaceHolder({ url:'../companyLabels/dsp_companyLabelForm.cfm', placeHolder:'aka_company', textareaID:'no', Args: {"companyID": companyID}  });
//}

//function loadLabels(companyID){
//	loadPageToPlaceHolder({ url:'../companies/dsp_SuggestLabelANDCompananies.cfm', placeHolder:'suggestCompanies', textareaID:'no', Args: {"searchLabels": companyID}  });
//}
--->
		
	<!---} else if (){
			$("##aka_company").css("display" , "block");
			$("##companyID").val( $(this).val() );
			$("##aka_companyID").val("");
			
	} else if (){
			$("##aka_company").css("display" , "block");
			$("##companyID").val( $(this).val() );
			$("##aka_companyID").val("");
			
	} else if (){
			$("##aka_company").css("display" , "block");
			$("##companyID").val( $(this).val() );
			$("##aka_companyID").val("");
			
	} else if (){
			$("##aka_company").css("display" , "block");
			$("##companyID").val( $(this).val() );
			$("##aka_companyID").val("");--->
            		<!---loadPageToPlaceHolder({ url:'../companies/dsp_SuggestLabelANDCompananies.cfm', placeHolder:'suggestCompanies', textareaID:'no', Args: {"searchDomain": domain}  });--->
					<!---loadPageToPlaceHolder({ url:'../companies/dsp_SuggestLabelANDCompananies.cfm', placeHolder:'suggestCompanies', textareaID:'no', Args: {"searchCountry": "1"}  });--->
			<!---loadPageToPlaceHolder({ url:'../companies/dsp_SuggestLabelANDCompananies.cfm', placeHolder:'suggestCompanies', textareaID:'no', Args: {"searchAssociation": "1"}  });--->
<!---<input type="hidden" id="aka_companyID" name="aka_companyID" /> 
                                    <input type="hidden" id="companyID" name="companyID" />--->  <!---<input type="hidden" id="#randomID#companyID" name="companyID">--->
<!---loadPageToPlaceHolder({ url:'../companies/dsp_SuggestLabelANDCompananies.cfm', placeHolder:'suggestCompanies', textareaID:'no', Args: {"searchAcademic": "1"}  });--->