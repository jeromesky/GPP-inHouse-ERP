
<cfoutput>
<script type="text/javascript">
	
	var eventID = #form.eventID#;
	var parentID = #form.parentID#;
	
	$(document).ready(function(){
		$("##eventPricePercentDate").datepicker({ dateFormat: 'dd MM yy' });
		postData({ url:'../discounts/dsp_discounts.cfm', callfunction:'discountReturn',  Args: {"eventID":eventID}  });
		
	});
	


function discountReturn(data){
		$('##discounts').append(data);
		$("##eventPricePercent").val("");
		$("##eventPricePercentDate").val("");
}

function discountDeleteReturn(data){
		 removeRow('discount', data);
}

function addDiscount(){
		var eventPricePercent 		= $("##eventPricePercent").val();
		var eventPricePercentDate = $("##eventPricePercentDate").val();
		
		postData({ url:'../discounts/qry_addDiscount.cfm', callfunction:'discountReturn',  Args: {"eventPricePercent": eventPricePercent, "eventPricePercentDate":eventPricePercentDate, "eventID":eventID, "parentID":parentID}  });
}
function deletDiscount(eventPriceID){
		postData({ url:'../discounts/qry_deleteDiscount.cfm', callfunction:'discountDeleteReturn',  Args: {"eventPriceID": eventPriceID}  });
}

</script>
<style type="text/css">
##discounts .row {clear:both}
##discounts .percent {display:inline; float:left; width:50px}
##discounts .endDate{display:inline; float:left; width:70px; color:##666}
##discounts .dateAdded{display:inline; float:left; width:70px; color:##999}
</style>

<div class="c4">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title"> Add a discount</spam></div>
	<div  class="ui-corner-bottom marginBottom15  ui-widget ui-widget-content  podForm ">
       
        <b>Value</b>
        <i class="NoFormat">
            <input type="text"  id="eventPricePercent" maxlength="3" />
        </i>
        <b>end date</b>
        <i class="NoFormat">
        <input type="text" id="eventPricePercentDate"  />
        </i>
        <b></b>
        <i class="NoFormat">
        <button onclick="javascript:addDiscount();">Add</button>
        </i>
        <div class="clear"></div>
    </div>

</div>

<div class="c3">
	<div id="discounts"  class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm " style="height:120px; overflow:auto">
    	<div class="row">
            <div class="percent">&nbsp;</div>
            <div class="endDate">end date</div>
            <div class="dateAdded">added date</div>
    	</div>
        <hr />
    </div>

</div>
</cfoutput>