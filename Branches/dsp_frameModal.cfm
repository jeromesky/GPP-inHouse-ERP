<cfparam name="form.userID" default="#form.userID#">
<cfparam name="form.companyID" default="#form.companyID#">
<cfparam name="form.branchID" default="#form.branchID#">
<cfoutput>
<script type="text/javascript">
	loadBranches(#form.branchID#, #form.companyID#, #form.userID#, 'list-modal');

	    $('##branchForm').submit(function() { 
			$(this).ajaxSubmit({ clearForm: false, success: actionSaveBranche}); 
			return false; 
		});
</script>
<style type="text/css">
.manageBranch{cursor:pointer}
##branches{height:460px; overflow:auto}
##branch{height:445px; }
##branch .accordion{height:425px; }
##branch2area {height:455px;}
</style>

<div class="c5" id="branchWindow">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Select Branch to Edit or Add</spam></div>
    <div id="branches" class="ui-corner-bottom ui-widget ui-widget-content"></div>
</div>
<div class="c4" >
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Branch</spam></div>
    <form action="../branches/qry_branch_Save.cfm" method="post" id="branchForm">
   	<div id="branch"></div>
    <b></b>
    <i class="NoFormat" >
    <button class="ui-corner-all" id="button_saveBranch">Save</button>
    </i>
    </form>
</div>
<div class="c2">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Reg of Interest</spam></div>
    <div id="branch2area" class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content"></div>
</div></cfoutput>