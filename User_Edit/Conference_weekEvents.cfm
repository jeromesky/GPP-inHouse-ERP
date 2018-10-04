<cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="getweek">
 	select  IngConference_ID, strConference_Name
	from tblAnnual_Conf
    WHERE   lngCon_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.weekid#" > AND (AnType <> 'week' )
    ORDER BY IngConference_ID DESC
</cfquery>
<script type="text/javascript">
$(document).ready(function(){
	$('#weekEvent :selected').val();
		$("#weekEvent").change(function(){
			var getEventid = $('#weekEvent').val() ;
			//alert(getEventid);
			Addevent(getEventid);
	
		});
		
 <!---   $("#weekEvent").change(function () {
          $("weekEvent:selected").each(function () {
                var getEventid = $('#weekEvent').val() ;
				Addevent(getEventid);
              });

        })
        .change();--->
});		
</script>
<div style="background-color:#FFF; padding:15px 10px">Select Event<br />
<select name="pop" multiple="multiple" style="width:250px; height:110px" id="weekEvent"><cfoutput query="getweek">
<option value="#getweek.IngConference_ID#">#getweek.strConference_Name#</option></cfoutput>
</select>
<!---<br />add a conference <img src="../img/new_add.gif" />--->
</div>