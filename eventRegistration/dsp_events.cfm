<cfquery datasource="#gpp#" name="qryEvents">
 	select  
    	IngConference_ID, event_name, event_expire, event_type
	from 
    	[tblAnnual_Conf]
    WHERE 1=1
    AND YEAR(event_expire) = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.year#"> 
	AND groupby = <cfqueryparam value="#form.groupID#"> 
	<!---AND (event_type <> 'week')--->
    ORDER BY 
    	event_name DESC
</cfquery>
<script type="text/javascript">
	$(document).ready(function(){
		$('#events :selected').val();
			$("#events").change(function(){
				var getEventid = $('#events').val();
				$('#area_eventsSelected').load("../eventRegistration/dsp_registrationForm.cfm", {'eventid':getEventid, 'userid': userID});
				//Addevent(getEventid);
		});	
	});	
</script>
<div style="background-color:#FFF; padding:15px 10px">Select events<br />
<select multiple="multiple" style="width:400px; height:150px" id="events"><cfoutput query="qryEvents">
<option value="#qryEvents.IngConference_ID#">#left(qryEvents.event_name, 30)#.. (#qryEvents.event_type# <cfif qryEvents.event_type eq "week">dont use</cfif>) (#dateFormat(event_expire, "dd.mm.yyyy")#)</option></cfoutput>
</select>
</div>