
<script type="text/javascript">
function noPost(userID){
	postData({ url:'../User_Edit/update_individual.cfm', callfunction:'noPostCall',  Args: {"fieldname": "chkMail", "id": userID, "oldValue":	0, "value" :	1 }  });
	noPostAction(userID);
}

function noPostAction(userID){
	removeRow('rowNoPost_', userID);
	
}
function noPostCall(){}

refreshContent(5000);

function refreshContent(time){
		
			var auto_refresh = setInterval(	function(){ $('#noPost').load('../noPost/dsp_records.cfm'); } , time);
}
</script>
<style type="text/css">
	#noPost .user, #noPost .comapny {color:#999}
	#noPost .header {background-color:#36C; color:#fff}
</style>
<div id="noPost" class="ui-corner-all marginBottom15  ui-widget ui-widget-content " style="">
	<cfinclude template="dsp_records.cfm">
</div>