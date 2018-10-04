
<cfparam name="form.companyID" default="#form.companyID#">
<cfinclude template="qry_companyLabelList.cfm">
<script type="text/javascript">
$(document).ready(function() { 

});

$("#buttonMoveLabels").live('click', function(){
		var selected = new Array();
		var newCompanyID = $("#newCompanyID").val();
	
		$(".labels2move:checked").each(function() {
			selected.push($(this).val());  
	  });		  
	  
	  if (selected.length){
		postData({ url:'../companyLabels/qry_labels2move.cfm', callfunction:'actionMoveLabelsSave',  Args: {"labelID": selected, "companyID" :newCompanyID}  });
	}else{
		alert("no labels selected to ove");
	}
		
});

function actionMoveLabelsSave(Rdata){
	$("#company2move2").html(Rdata);
}
</script>
<style type="text/css">
	#selectLabels2move, #company2move2 {height:240px}
</style>
				

<div class="c4">
<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Labels to move from <cfoutput>#qryLabelList.companyName#</cfoutput></spam></div>
    <div id="selectLabels2move" class="ui-corner-bottom  ui-widget ui-widget-content ">
    
    <ul class="listMenu">
        <cfoutput query="qryLabelList">
        <li>
        <input type="checkbox" name="labels2move" class="labels2move" value="#qryLabelList.AKA_companyID#" />    <span class="manageLabel cursorPointer" id="#qryLabelList.AKA_companyID#">#qryLabelList.AKA_companyName#</span></li></cfoutput>
    </ul>
    </div>
</div>

<div class="c4">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">to the following company</spam></div>
    <div id="company2move2" class="ui-corner-bottom  ui-widget ui-widget-content podForm">
    
            <b>search</b>
            <i class="NoFormat"><cf_companies_search  open="4" random="#RandRange(2011, 6044)#" idName="newCompanyID" ></i>
            <input type="hidden" id="newCompanyID">
            
            <b></b>
            <i class="NoFormat"><button class="ui-corner-all" id="buttonMoveLabels">transfer</button></i>
    		<div class="clear"></div>
    </div>
</div>