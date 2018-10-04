<cfinclude template="../application.cfm">
<cfquery datasource="#dsnP21#" name="getGroup">
 	select  *
	from groupby
    order by name
</cfquery>

<script type="text/javascript">
var TheWeekId = 0 ; 

function RemoveFromList(id) {
		 $("#rec_"+id).animate( { backgroundColor: "#0b860b" }, "fast").animate({ opacity: "hide" }, "fast");	  
}

function DeleteRecord(id) {
		$.post("../GPP_events/delete.cfm", { id: id }, function() { $("#rec_"+id).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");    }  ); 	 
}
<!--- ON SELECT OF DROP MENU ------->
$(document).ready(function(){
	$('#weekgroup :selected').val();
		$("#weekgroup").change(function(){
			var getGroupid = $('#weekgroup').val() ;
			$('#areaWeekYear').fadeIn("fast").load("../gpp_events/Conference_week.cfm" , { id: getGroupid });
			$('#areaWeekgrouped').html("");
		});	

    $('#submitWeek, #submitGroup').submit(function() { 
		$(this).ajaxSubmit( {clearForm: false}  ) ; 
		return false; 
    }); 
	
	
	$('#formConference').live("submit", function() { 
		$(this).ajaxSubmit( {clearForm: false, success: function (){ $('#areaConferenceEdit').html("");  $('#table_weekevent tr:first').before(returnData); }   }) ; 
		return false; 
    }); 
});		

function EditAddWeek(id){
		$('#areaWeekYear').fadeIn("fast").load("../gpp_events/Conference_week.cfm" , { id: id });
}
function ViewWeek(id){
		TheWeekId = id;
		$('#areaWeekgrouped').fadeIn("fast").load("../gpp_events/Conference_events.cfm" , { id: id });
		$(this).parent().parent('td').css('background-color', 'red');
		//alert(TheWeekId);
}

function LoadWeekPane(id, week){
		$('#areaWeekGroupEdit').load("../GPP_events/WeekGroupForm.cfm" , { id: id , week: week });
}
	
function LoadConferencePane(id, week){
		$('#areaConferenceEdit').load("../GPP_events/ConferenceForm.cfm" , { id: id , week: week });
}

function LoadList(){
		$('#listEvents').load("../GPP_events/Event_list.cfm");
}
</script>

<style type="text/css">
<!--

<!---.fieldarea{clear:right; float:left; padding:0px; margin:1px 1px 1px 10px; width:445px}
.rightSeparator { border-right:1px dotted #666666; border-bottom:1px dotted #666666; }
.JustRight { border-right:1px dotted #666666;  }--->

h4 {border-bottom:1px solid #ccc; }

</style>
</head>

	        <div style="background-color:#FFF; padding:5px 15px; margin:0 0 5px 0; border:1px dotted #CCCCCC">
            Select Event Group 
            <select name="weekgroup" style="width:330px;" id="weekgroup">
            <cfoutput query="getGroup">
            <option value="#getGroup.id#">#getGroup.name#</option></cfoutput>
            </select>
            </div>

<h4>Select week / club Group</h4>
            <div id="areaWeekYear" style=" clear:both; display:block;  margin:0 0 5px 0; height:200px; width:450px; overflow:auto;  float:left"></div>

        <form id="formWeek" action="../GPP_events/WeekGroupForm.cfm" method="post">
        <div id="areaWeekGroupEdit" style=" display:block; margin:0 0 0 15px; height:200px; width:400px;  float:left; border:1px dotted #CCCCCC">
        </div>
        </form>

<div class="clear"></div>

<h4>Edit / Add event</h4>
<div id="areaWeekgrouped" style="background-color:#FFF;  margin:0 0 5px 0;  height:220px; width:450px; clear:both; float:left; display:block; overflow:auto"></div>

        <form id="formConference" action="ConferenceForm.cfm" method="post">
        <div id="areaConferenceEdit" style=" margin:0 0 0 15px; height:220px; width:400px; display:block; float:left; border:1px dotted #CCCCCC"></div>
        </form>

<div class="clear"></div>