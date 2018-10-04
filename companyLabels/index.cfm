<cftry>
<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>
<cfoutput>
<script type="text/javascript">
	var companyLabels = {};
	companyLabels.companyID 		= #form.companyID#;
	companyLabels.AKA_companyID= #form.AKA_companyID#;
	companyLabels.userID 				= #form.userID#;
	<!---companyLabels.branchID 			= #form.branchID#;--->
	companyLabels.thisWindow 		= $("##AKA_companyList").parent().attr("id");
	//alert(companyLabels.thisWindow);
	
	//load form and list
	loadLabelForms();

<!---function loadLabelForms(){
		loadCompanyLables(#form.companyID#, #form.AKA_companyID#, #form.userID#);
		loadCompanyLableForm(#form.companyID#, #form.AKA_companyID#);
}
function loadLabelForm(aka_companyID){
		loadCompanyLableForm(#form.companyID#, aka_companyID);
}

$(".manageLabel").live('click', function(){
	var fetch_labelID = $(this).attr("id");
	loadLabelForm(fetch_labelID);
});--->

</script>
<style type="text/css">
	##AKA_companyForm { height:145px }
	##AKA_companyListPane { height:245px; overflow:auto }
	##AKA_companyMenu {}
</style>

<div id="AKA_companyList" class="c4">

</div>

<div class="c4">
    <div id="AKA_companyMenu" class="ui-corner-top marginBottom15 ui-widget ui-widget-content podLinks " style="padding:5px 10px">
            <fieldset>
            	<legend class="ui-corner-all">Menu Options</legend>
                <ul class="listMenu">
                    <li><a href=" javascript:loadCompanyLableForm(#form.companyID#, 0);">Add new Label</a></li>
                    <li><a href="javascript:openWindow({ url:'../companyLabels/dsp_labels2move.cfm', param: {'companyID': #form.companyID#}, Args: modals.labelsMove});">move labels to an alternat company</a></li>
                </ul>
            </fieldset>
    </div>
    <div id="AKA_companyForm" class="ui-corner-bottom   ui-widget ui-widget-content podForm "></div>
</div>

</cfoutput>

<cfcatch type="any">
	<cfmail to="jerome@glopac.com" from="error@petro21.com" subject="error on lables modal" type="html"><cfdump var="#cfcatch#"></cfmail>

</cfcatch></cftry>