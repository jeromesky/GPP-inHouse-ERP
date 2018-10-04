<cfinclude template="qry_events.cfm">
<cfparam name="form.userid" default="#form.id#">
<cfinclude template="../user_functions/qry_black_listed.cfm">

<script type="text/javascript">
$(document).ready(function(){
	<!---$('#eventGroup :selected').val();
		$("#eventGroup").change(function(){
			var getGroupid = $('#eventGroup').val() ;
			$('#area_yearGroup').fadeIn("fast").load("../eventRegistration/dsp_yearGroups.cfm" , { groupID: getGroupid });
	});--->
	$("#area_events").load("../eventRegistration/dsp_events.cfm" , { "year" :<cfoutput>#dateformat(now(), 'yyyy')#</cfoutput>, "groupID" : 11  });
});
</script>
<table border="0" cellpadding="0" cellspacing="5" >
	<tr>
    	<td valign="top" class="ui-widget-content ui-corner-all">
<!---            <div style="background-color:#FFF; padding:15px 10px; margin:0 0 5px 0">Add a New Event / Select Group<br />
                <select name="eventGroup" style="width:250px;" id="eventGroup">
                    <option value="">Select Conference Group</option><cfoutput query="qryEventGroups">
                    <option value="#qryEventGroups.id#">#qryEventGroups.name#</option></cfoutput>
                </select>
            </div>--->
<cfif qryBlackListed.Black_Listed EQ 1>
           <div style="color:#FFF; padding: 0px 10px">
            	<div class="ui-state-error ui-corner-all" style="padding: 0pt 0.1em;"><em class="ui-icon ui-icon-alert"></em>
                 This User is Black Listed<br /><cfoutput>
                 on: #dateFormat(qryBlackListed.Black_Listed_Date, "dd mmm yyyy")#<br />
    			#qryBlackListed.Black_Listed_comment#</cfoutput></div>
            </div>
</cfif>
            <div id="area_yearGroup"></div>
            <div id="area_events"></div>
        </td>
        <td valign="top" id="area_eventsSelected">

        </td>
    </tr>
</table>