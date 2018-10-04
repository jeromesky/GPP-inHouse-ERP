<cfset parentID = form.parentID>
<cfparam name="eventPriceType" default="1">
<cfinclude template="qry_eventGroup.cfm">
<cfinclude template="qry_eventsCurrency.cfm">
<script type="text/javascript">
$(document).ready(function() {
		$( "#availableEvents, #dropEvents" ).sortable({
				connectWith: ".connectedSortable"
		}).disableSelection();
});

$('#AddCombination').click(function(){
	var get_ids = $('#dropEvents').sortable('serialize');
	var get_cost = $('#combinationPrice').val();
	//alert(get_ids);
		if (get_ids.length){
			postData({ url:'../eventPricing/qry_addCombination.cfm', callfunction:'actionEventCombinationSave',  Args: {"eventPriceCombination" : get_ids, "eventPriceValue" : get_cost, "parentID" : <cfoutput>#form.parentID#</cfoutput>, "eventCurrency" : "<cfoutput>#eventCurrency.eventCurrencyLabel#</cfoutput>"}  });
		}else{
			alert("no events have been selected");
		}
<!---	$.post("../eventPricing/qry_addCombination.cfm", { "eventPriceCombination" : get_ids, "eventPriceValue" : get_cost, "parentID" : <cfoutput>#form.parentID#</cfoutput> }, function(data){
	
				$('#area_selectedCombinations').html(data);
		})--->
});

function actionEventCombinationSave(data){
		$('#area_selectedCombinations').html(data);
}
	//actionCompanySave
</script>
<style>
	#availableEvents, #dropEvents { list-style-type: none; margin: 0; padding: 0; float: left; margin-right: 10px; }
	#availableEvents li, #dropEvents li { margin: 0 5px 5px 5px; padding: 5px; border:1px solid #F7F7F7  }
	#dropEvents{ border:1px solid #FF9900; width:100%; height:120px}
	#availableEvents{ border:1px solid #589ff6; width:100%; height:170px}
	#area_selectedCombinations{height:390px; overflow:auto}
	</style>

<cfoutput>
<div class="c4">
		<div class="ui-dialog-titlebar ui-widget-header ui-corner-bottom ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Available Events</spam></div>
		<ul id="availableEvents" class="connectedSortable  ui-corner-top ui-widget ui-widget-content "><!---podForm--->
        	<cfloop query="qryEventsGroup_names"><li id="set_#qryEventsGroup_names.eventID#" class="ui-state-default">#qryEventsGroup_names.event_name#</li></cfloop>
		</ul>
</div>

<div class="c4">
		<div class="ui-dialog-titlebar ui-widget-header ui-corner-bottom ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Drop Box combination</spam></div>
		<ul id="dropEvents" class="connectedSortable ui-corner-top ui-widget ui-widget-content ">
			<!---<li class="ui-state-highlight" id="_">drop here</li>--->
		</ul>
	
        <b>price combination </b>
    	<i class="NoFormat"><input type="text" id="combinationPrice"  /></i>
        
        <b> </b>
    	<i class="NoFormat"><button id="AddCombination">Add Combination</button></i>
</div>

<div class="clear"></div>


<div class="c8" style="margin-top:20px">
		<div class="ui-dialog-titlebar ui-widget-header ui-corner-bottom ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Price Combinations</spam></div>
        <div id="area_selectedCombinations" class="ui-corner-all ui-widget ui-widget-content ">

        <cfinclude template="dsp_selectedCombinations.cfm">

        </div>
</div>
</cfoutput>