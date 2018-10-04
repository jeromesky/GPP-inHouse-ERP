<cfoutput>
<script type="text/javascript">

	$(document).ready(function(){
		
		var timeKeepStaffID = #session.gpp_id#;
		$("##TimeManagementStartDate, ##TimeManagementEndDate").datepicker({ dateFormat: 'dd MM yy' });
		loadTimeManaged(#session.gpp_id#);
		
	});

function addTimeKeep(){
		var TimeManagementTime = $("##TimeManagementTime").val();
		var TimeManagementDesc = $("##TimeManagementDesc").val();
		var eventID = $("##eventid").val();  
		var taskID = $("##taskID").val(); 
		var projectID = $("##projectID").val();  
		postData({ url:'../TimeManagement/qry_addTimeManage.cfm', callfunction:'TimeManageReturn',  Args: {"taskID": taskID, "projectID":projectID,  "eventID": eventID, "TimeManagementDesc": TimeManagementDesc, "TimeManagementTime":TimeManagementTime}  });
		postData({ url:'../TimeManagement/dsp_timeManagedTotal.cfm', callfunction:'TimeManageReturnTotal',  Args: {"staffID":timeKeepStaffID, "taskID": taskID, "projectID":projectID,  "eventID": eventID, "TimeManagementDesc": TimeManagementDesc, "TimeManagementTime":TimeManagementTime}  });
}
	
function reportTimeKeep(){
		var startDate = $('##TimeManagementStartDate').val();
		var endDate = $('##TimeManagementEndDate').val();
		loadReportTimeManaged(timeKeepStaffID, startDate, endDate)
}

function loadReportTimeManaged(staffID, startDate, endDate){
		postData({ url:'../TimeManagement/dsp_timeManaged.cfm', callfunction:'TimeReportReturn',  Args: {"staffID":staffID, "startDate":startDate, "endDate":endDate}  });
}

function loadTimeManaged(staffID){
		//alert("dkfdjskj");
		postData({ url:'../TimeManagement/dsp_timeManaged.cfm', callfunction:'TimeManageReturn',  Args: {"staffID":staffID}  });
		postData({ url:'../TimeManagement/dsp_timeManagedTotal.cfm', callfunction:'TimeManageReturnTotal',  Args: {"staffID":staffID}  });
		timeKeepStaffID = staffID;
}
		//
//}

function TimeReportReturn(data){
		$('##timeManage').html(data);
}
	
function TimeManageReturn(data){
		$('##timeManage').html("");
		$('##timeManage').append(data);
		$("##TimeManagementTime").val("");
		$("##TimeManagementDesc").val("");
		

}
function TimeManageReturnTotal(data){
		$('##timeManageTotal').html("");
		$('##timeManageTotal').append(data);
}


</script>
<style type="text/css">
##timeManage .row {clear:both; padding:2px 0px}
##timeManage .date {display:inline; float:left; width:60px; color:##999}
##timeManage .insert {display:inline; float:left; width:50px; color:##999}
##timeManage .time{display:inline; float:left; width:50px; color:##666}
##timeManage .comment{display:inline; float:left; width:270px; }
##timeManageIndex ##TimeManagementStartDate, ##timeManageIndex ##TimeManagementEndDate {width:80px}
##timeManageTotal  { padding:6px; margin-top:0px; } <!---position:absolute; bottom:0px; width:93% --->
##timeManage {position:relative}
##timeManage .box { float:left; display:inline; min-width:40px; padding:0px 5px 0px 10px}
</style>

<div class="c4">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Add Task</spam></div>
	<div class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podForm">
        <b>Time in minutes</b>
        <i class="NoFormat"><input type="text" id="TimeManagementTime" maxlength="5" class="ui-corner-all" /></i>
        <b>Task description</b>
        <i class="NoFormat"><textarea id="TimeManagementDesc" style="height:120px;" class="ui-corner-all"></textarea></i>
        <b>For event</b>
        <i class="NoFormat">
        <cf_events_dropDown eventID="676" fieldName="eventid" elapse="0" operator="=" eventType="week"></i>
        <b>For project</b>
        <i class="NoFormat">
        <cfinclude template="../projects/dsp_approvedDropList.cfm"></i>
        <b>Regular task</b>
        <i class="NoFormat">
        <cfinclude template="dsp_tasks.cfm"></i>
        <b></b>
        <i class="NoFormat"><button onclick="javascript:addTimeKeep();" class="ui-corner-all">Add</button></i>
        <div class="clear"></div>
    </div>

   <div class="ui-corner-all marginBottom15 ui-widget ui-widget-content podLinks">
    	<ul class="listMenu">
        <li><a href="javascript:loadTimeManaged(7);">Jerome</a></li>
        <li><a href="javascript:loadTimeManaged(20);">Jason</a></li>
        <li><a href="javascript:loadTimeManaged(5);">Amanda</a></li>
        <li><a href="javascript:loadTimeManaged(10);">Sonika</a></li>
        <li><a href="javascript:loadTimeManaged(11);">Tanya</a></li>
        </ul>
    </div>
</div>

<div class="c6">
	<div id="timeManageIndex" class="ui-corner-top marginBottom15 ui-widget ui-widget-content podBgFade" style="height:37px">
		<div class="index">
            <sup class="displayLabel">Start date</sup>			
        	<sup class="displayData"><input type="text" id="TimeManagementStartDate"></sup>
            <sup class="displayLabel">End date</sup>		
            <sup class="displayData"><input type="text" id="TimeManagementEndDate"></sup>
            <sup class="displayLabel"><button class="ui-corner-all" onclick="javascript:reportTimeKeep();">Display</button></sup>	
            <div class="clear"></div>
        </div>
    </div>
	<div id="timeManage" class="ui-corner-bottom marginBottom15 ui-widget ui-widget-content podForm podBgFade" style="height:340px; overflow:auto">
    </div>
    <div id="timeManageTotal" class="ui-corner-all marginBottom15 ui-widget ui-widget-content" style="background-color:##EEE; ">
    </div>
</div></cfoutput>