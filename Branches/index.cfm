<cfinclude template="fbx_settings.cfm">

<cfset fusebox = structNew()>

<cfif isDefined('url.fa')>
  <cfset fusebox.fuseaction = url.fa>
<cfelseif isDefined('form.fa')>
  <cfset fusebox.fuseaction = form.fa>
<cfelse>
  <cfset fusebox.fuseaction = defaultFuseAction>
</cfif>

<cfoutput>
<cfinclude template="fbx_switch.cfm">
</cfoutput>


<!---<cfparam name="form.userID" default="#form.userID#">
<cfparam name="form.companyID" default="#form.companyID#">
<cfparam name="form.branchID" default="#form.branchID#">

<cfoutput>
<script type="text/javascript">
<!---delete branches;
var branches = {};
	branches.companyID = #form.companyID#;
	branches.userID 		= #form.userID#;
	branches.branchID	= #form.branchID#;--->
	
	loadBranches(#form.branchID#, #form.companyID#, #form.userID#);
<!---	loadBranches(branches.branchID, branches.companyID, branches.userID);--->
</script>
<style type="text/css">
.manageBranch{cursor:pointer}
##branches{height:460px; overflow:auto}
##branch{height:465px; }
##branch .accordion{height:425px; }
##branch2area {height:455px;}
</style>

<div class="c4" id="branchWindow">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Select Branch to Edit or Add</spam></div>
    <div  id="branches" class="ui-corner-bottom ui-widget ui-widget-content"></div>
</div>

<div class="c4" id="branch">

</div>

<div class="c2">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Reg of Interest</spam></div>
    <div id="branch2area" class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content"></div>

</div></cfoutput>--->
<!---
$(".manageBranch").live('click', function(){
	var fetch_branchID = $(this).attr("id");
	$("##branch2area").html("");
	loadBranche(fetch_branchID, branches.companyID, branches.userID);
	///loadPageToPlaceHolder({ url:'../branches/dsp_branche_Form.cfm', placeHolder:'branch', textareaID:'branchBios', Args: {"branchID": get_branchID, "companyID": branches.companyID, "userID": branches.userID }  }); 
});

function loadBranche(branchID, companyID, userID){
	loadPageToPlaceHolder({ url:'../branches/dsp_branche_Form.cfm', placeHolder:'branch', textareaID:'', Args: {"branchID": branchID, "companyID": companyID, "userID": userID}  });
}

function loadBranches(branchID, companyID, userID){
	loadPageToPlaceHolder({ url:'../branches/dsp_branches.cfm', placeHolder:'branches', textareaID:'', Args: {"branchID": branchID, "companyID": companyID, "userID": userID}  });
}--->

<!---$("input[name='branche2user']").live('change', function(){
	var fetch_branch = $(this).val();
	postData({ url:'../user_edit/Update_Individual.cfm', callfunction:'actionBranch2userAdded',  Args: {id : branches.userID, "fieldname": "branchid",  "value" : fetch_branch, "oldvalue": branches.branchID }  });
});--->

<!---function actionBranch2userAdded(params){
	growl('Update', 'branch added to user or company', 'message', 'ui-icon ui-icon-check', 'notice');
	var jsonData = jQuery.parseJSON(params);
	alert(jsonData.data);
}---> 

<!---function actionSaveBranche(params){
	loadBranches(branches.branchID, branches.companyID, branches.userID);
	loadBranche(0, branches.companyID, branches.userID);
}--->
<!---<div class=" ui-widget ui-widget-content podBgFade" style="padding:5px 0"  >
    	<button class="manageBranch ui-corner-all" id="0">Create branch</button>
    </div>--->