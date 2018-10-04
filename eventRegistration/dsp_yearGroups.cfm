<cfquery datasource="#gpp#" name="qryYear">
 	SELECT DISTINCT
    	YEAR(event_expire) AS year
	FROM 
    	[tblAnnual_Conf]
    WHERE 
    	groupby = <cfqueryparam value="#form.groupID#" > AND
        event_type IN ('event', 'din', 'eb', 'spon', 'memb', 'exh', 'week')
</cfquery>

<script type="text/javascript" >
$(document).ready(function(){
	$('#selectYear :selected').val();
		$("#selectYear").change(function(){
			var getyear = $('#selectYear').val() ;
			$("#area_events").load("../eventRegistration/dsp_events.cfm" , { "year" :getyear, "groupID" : <cfoutput>#form.groupID#</cfoutput> });
		});
});			
</script>

<div style="background-color:#FFF; padding:15px 10px; margin:0 0 5px 0">
Select year / Club Group / other<br>
<select multiple style="width:250px; height:80px" id="selectYear"><cfoutput query="qryYear">
<option value="#qryYear.year#">#qryYear.year#</option>
</cfoutput></select><!---<br />add a new Week group <img src="../img/new_add.gif" />--->
</div>