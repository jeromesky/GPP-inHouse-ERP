<cfinclude template="qry_Memberships.cfm">

<cfquery datasource="#gpp#" name="get" >
  SELECT *
  FROM CRM_Memberships
  WHERE 
  <cfif form.UserID NEQ 0 >
      UserID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.UserID#" >
  </cfif>
  <cfif form.companyID NEQ 0 >
      companyID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#" >
  </cfif>
</cfquery>

<cfoutput><fieldset id="Membership" style="width:370px">
    <legend>Membership</legend>
    <fieldset >
    <legend>Add a new Membership</legend>
      <b>Find Event</b> 
          <i class="NoFormat"><div id="search_eventID_#diff_id#" class="tagbox"><input type="text" id="eventID_search_#diff_id#"></div></i>
          <input type="hidden" id="Club_eventID_#diff_id#" name="eventID" />
          <input type="hidden" id="companyID_#diff_id#" value="#form.companyID#" />
      <b>Member End Date</b> <i class="NoFormat"><input type="text" id="MembershipExpire_#diff_id#" name="MembershipExpire"  ></i>
      <b></b> <i class="NoFormat"><input type="button" value="Add Membership" id="Add_Membership_#diff_id#" onclick="addMembership_#diff_id#()" disabled="disabled" /></i>		
    </fieldset>
         <div id="areaManageMemberships_#diff_id#" style="height:250px; overflow:auto"><cfloop query="get">
            <div class="record" id="membershipRecord_#get.id#">  
                <b>Event</b><i class="NoFormat">#get.eventName#</i>
                <b>End Date</b> <i class="NoFormat">#dateformat(get.MembershipExpire, "ddd, dd mmm yyyy")#</i>
              <div class="clear"></div>   
           </div></cfloop>
       </div>
        <div class="clear"></div>
</fieldset></cfoutput>

<script type="text/javascript">
$(document).ready(function() { 
	$("#MembershipExpire_<cfoutput>#diff_id#</cfoutput>").datepicker({dateFormat: "d MM, yy"});
	$('#search_eventID_<cfoutput>#diff_id#</cfoutput>').tagdragon({
		'field':'eventID_search_<cfoutput>#diff_id#</cfoutput>',
		'url':'../components/JSON_events.cfm',
		'charMin' : 4, 
		'cache' : true,
		'max' : 100,
			onSelectItem: function(val) { 
				$('#Club_eventID_<cfoutput>#diff_id#</cfoutput>').val(val.id);  
				$('#Add_Membership_<cfoutput>#diff_id#</cfoutput>').attr('disabled', false);
			}
	});
});

function addMembership_<cfoutput>#diff_id#</cfoutput>(){
	var get_eventID = $('#Club_eventID_<cfoutput>#diff_id#</cfoutput>').val();
	var get_MembershipExpire = $('#MembershipExpire_<cfoutput>#diff_id#</cfoutput>').val();
	var get_companyID = $('#companyID_<cfoutput>#diff_id#</cfoutput>').val();	
	$.post('../user_Edit/Add_Memberships.cfm', {'eventid': get_eventID, 'MembershipExpire': get_MembershipExpire, 'userID': Client_ID, CompanyID: get_companyID}, function(data) {
		$('#Club_eventID_<cfoutput>#diff_id#</cfoutput>, #MembershipExpire_<cfoutput>#diff_id#</cfoutput>, #eventID_search_<cfoutput>#diff_id#</cfoutput>').val("");
		$('#Add_Membership_<cfoutput>#diff_id#</cfoutput>').attr('disabled', true);
		$("#areaManageMemberships_<cfoutput>#diff_id#</cfoutput>").prepend(data);
	});
}
</script>