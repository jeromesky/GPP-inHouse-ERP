<cfset userID = #form.userid#>
<cfoutput>
<cfquery datasource="#gpp#" name="get_sectors" cachedwithin="#createTimeSpan(0,6,0,0)#">
 	select top 7
    	[sectorID]
    	,[sectorName]
        ,[sectorFieldNameOld]
	from 
    	[CRM_sectors]
</cfquery>

<cfquery datasource="#gpp#" name="get_selected">
 	select  
    	[sectorID]
	from 
    	[CRM_user2Sector]
    WHERE 
    	userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#userID#">
</cfquery>

<cfset selected = ValueList(get_selected.sectorID, ",")>
<script type="text/javascript">
$(document).ready(function() { 
<!--- if page called for new user hide button --->
<cfif parameterexists(form.newuser) >
		breadCrum(<cfoutput>#form.step#</cfoutput>);
<cfelse>
		$('##button_next').css({"display" : 'none' });
</cfif>
});
$('##AreaClientIndustrySector :checkbox').change(function(){
	var get_ClientIndustrySector = $(this).attr("checked") ? $(this).val() : 0
	var get_fieldName = $(this).attr("name");
	var get_sectorID = $(this).attr("id");
			if(get_ClientIndustrySector == 1 ){
				$.post("../Industry_Sector/industry_sector_Update.cfm", {'userid': #userID#, 'sectorid': get_sectorID, 'action': 'add' } );
				//$.post("../User_Edit/Update_Individual.cfm", {id : #userID#, "fieldname": get_fieldName, "oldValue" : 0, "value" : 1 });
			}else{
				$.post("../Industry_Sector/industry_sector_Update.cfm", {'userid': #userID#, 'sectorid': get_sectorID, 'action': 'delete' } );
				//$.post("../User_Edit/Update_Individual.cfm", {id : #userID#, "fieldname": get_fieldName, "oldValue" : 1, "value" : 0 });
			}
});
</script>
<!---<cfif  parameterexists(form.newuser)><cfinclude template="../--New_User/Bread_crum.cfm"></cfif>--->
<div class="ui-corner-top ui-widget ui-widget-content podForm">
<fieldset id="AreaClientIndustrySector">
		<legend>Industry Sector</legend><cfloop query="get_sectors">
               <label><input type="checkbox" name="#get_sectors.sectorFieldNameOld#" id="#get_sectors.sectorID#" value="1" <cfif listcontains(selected, get_sectors.sectorID, ",") NEQ 0> checked="checked"</cfif>>#get_sectors.sectorName#</label><br />
        </cfloop>
		<i class="NoFormat"><button id="button_next">Next</button></i>
<!--- if page is called from new user form <cfif parameterexists(form.newuser)>
<input type="hidden" name="step" value="6" />
<input type="hidden" name="userid" id="userid" value="<cfoutput>#userid#</cfoutput>" />
<input type="hidden" name="page" id="page" value="../user_functions/dsp_Newsletters.cfm" /></cfif>---->
</fieldset></div></cfoutput>