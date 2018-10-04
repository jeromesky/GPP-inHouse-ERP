<cfquery datasource="#gpp#" name="getGroup">
 	select  *
	from tblConference
    WHERE week = <cfqueryparam value="#form.id#">
    ORDER BY weekDate DESC
</cfquery>

<script type="text/javascript" >
$(document).ready(function(){
	$('#selectweek :selected').val();
		$("#selectweek").change(function(){
			var getWeekid = $('#selectweek').val() ;
			$("#areaWeekEvent").load("../User_Edit/Conference_weekEvents.cfm?weekid="+getWeekid , { "weekid" :getWeekid });
		});

});			
</script>

<div style="background-color:#FFF; padding:15px 10px; margin:0 0 5px 0">Select Week / Club Group<br>
<select name="weekgroup" multiple style="width:250px; height:150px" id="selectweek"><cfoutput query="getGroup">
<option value="#trim(getGroup.IngCon_ID)#">#getGroup.strConference_Description#</option>
</cfoutput></select><!---<br />add a new Week group <img src="../img/new_add.gif" />--->
</div>