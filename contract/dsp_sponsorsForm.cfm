<cfinclude template="qry_sponsorsForm.cfm">
<cfoutput>
<script type="text/javascript">
	var contractID =  #form.contractID#;
	var sponsorID = #form.sponsorID#;
	var contractTypeGroup = '#form.contractTypeGroup#';

$(document).ready(function(){
    $('##sponsorForm').submit( function() { 
		$(this).ajaxSubmit({ success: function(){ loadSponsors(contractID)  } } ); 
		return false; 
		
    }); 
$("##bookedDated").datepicker({ dateFormat: 'dd MM yy' });
	<!---//sponsorID
	
switch (contractTypeGroup)
{
case (contractTypeGroup = "media"):
  loadTaskModule(sponsorID, 0)
  break;
case (contractTypeGroup = "exhibitor"):
  alert("exhibitor");
  break;
case (contractTypeGroup = "sponsor"):
  alert("sponsor");
  break;
default:
  
}
function loadTaskModule(sponsorID, taskID){
	$('##area_sonsorsOption').fadeIn("fast").load("../tasks/index.cfm", {'taskID' : taskID, 'sponsorID' : sponsorID} );
}	--->
	
});


	
</script>


<fieldset>
	<legend class="ui-corner-all" >Event 2 Contract</legend>
    <table border="0" cellspacing="5" cellpadding="5" >
	<tr>
    	<td valign="top">
        <form action="../contract/qry_Save_sponsor.cfm"  method="post" id="sponsorForm">
      	<input type="hidden" name="contractID" id="contractID" value="#form.contractID#" />
    	<input  type="hidden" name="sponsorID" id="sponsorID" value="#form.sponsorID#" />
    	<input  type="hidden" name="contractTypeGroup" id="contractTypeGroup" value="#form.contractTypeGroup#" />

    <b>Event</b>
    <i class="NoFormat">
    <cf_event_List_week name="eventID" id="#get_sponsor.eventid#">
    </i>

    <b>Promo type</b>
    <i class="NoFormat">
     <cf_Types name="sponsorTypeID" cat="#form.contractTypeGroup#" id="#get_sponsor.sponsorTypeID#">
    </i>
    
    <b>Description</b>
    <i class="NoFormat">
    <input class="ui-corner-all" type="text" name="sponsorLabel	" id="sponsorLabel" value="#get_sponsor.sponsorLabel#" />
    </i>
    
    <b>Passes</b>
    <i class="NoFormat">
    <input class="phoneCode ui-corner-all" type="text" name="limitPasses" id="limitPasses" value="#get_sponsor.limitPasses#" />
    </i>
    
    <b class="Inline">Guest Passes</b>
    <i class="NoFormat">
    <input class="ui-corner-all phoneCode" type="text" name="limitGuest" id="limitGuest" value="#get_sponsor.limitGuest#" />
    </i>
    

    <b>Speakers</b>
    <i class="NoFormat">
    <input class="ui-corner-all phoneCode" type="text" name="limitSpeakers" id="limitSpeakers" value="#get_sponsor.limitSpeakers#" />
    </i>
    
  
    <b >Booths</b>
    <i class="NoFormat">
    <input class="ui-corner-all phoneCode" type="text" name="limitBooths" id="limitBooths" value="#get_sponsor.limitBooths#" />
    </i>
    
    <b  class="Inline">Booth Opera</b>
    <i class="NoFormat">
    <input class="ui-corner-all phoneCode" type="text" name="limitBoothOperators" id="limitBoothOperators" value="#get_sponsor.limitBoothOperators#" />
    </i>
    
    

    <b>Discount</b>
    <i class="NoFormat">
    <input class="ui-corner-all phoneCode" type="text" name="discountAmountValue" id="discountAmountValue" value="#get_sponsor.discountAmountValue#" />
    </i>
    
    <b class="Inline">Disc passes</b>
    <i class="NoFormat">
    <input class="ui-corner-all phoneCode" type="text" name="discountValueLimit" id="discountValueLimit" value="#get_sponsor.discountValueLimit#" />
    </i>
    

    
    <b></b>
      <i class="NoFormat">   
      <button>Save</button>
      </i>
       </form>
    </td>
    <td valign="top" id="area_sonsorsOption">
<cfif form.sponsorID NEQ 0>
    <cfswitch expression="#form.contractTypeGroup#">
 			<cfcase value="media">
					<cfinclude template="../tasks/index.cfm">
            </cfcase>
            <cfcase value="exhibitor">
            		
              		<cfinclude template="../booths/dsp_boothForm.cfm">
            </cfcase>
            <cfcase value="sponsor">
               		
            </cfcase>
            <cfdefaultcase>
            	
			</cfdefaultcase>
</cfswitch> 
</cfif>	
    </td>
    </tr>
    </table>
    
 </fieldset>
 </cfoutput>
