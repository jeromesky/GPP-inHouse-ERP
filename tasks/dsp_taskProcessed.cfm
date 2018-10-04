<script type="text/javascript">
	$("#buttonTaskID").live('click', function(){
		var fetch_taskID = $("#taskIDVal").val();
			postData({ url:'../tasks/qry_taskProcessed.cfm', callfunction:'retunTaskCompleted', Args: {"taskID": fetch_taskID} });
	});
	function retunTaskCompleted(data){
		$("#taskIDVal").val(data);
	}
</script>
<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Contract Submited form</spam></div>
<div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podForm">
    	<input type="text" id="taskIDVal" class="ui-corner-all numeric" style="width:130px"><button id="buttonTaskID" class="ui-corner-all">submit</button>
    <div class="clear"></div>
</div>