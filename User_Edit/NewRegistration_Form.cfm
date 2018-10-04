<cfquery datasource="#gpp#" name="getBanks">
SELECT id, name
FROM  GPP_Bank_Accounts
</cfquery>

<cfquery datasource="#gpp#" name="getEvents">
SELECT
		 eventID, eventName
FROM  
		crm_events_listNames
WHERE 
		<cfif listlen(form.eventid, ",") EQ 1 >
		eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
        <cfelse>
        eventID IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.eventid#">)
        </cfif>        
</cfquery>

<script type="text/javascript" >
 $(document).ready(function() {
 			
			$('#tabs_crm_NewRegistration').tabs();
				
			$('form').submit(function() { 
					var total_tab = <cfoutput>#getEvents.recordcount#</cfoutput>;
					var selected_tab = $(this).attr('id');
					var get_attendType = $('#attendent_type :selected' , this).val();
					var get_userID = $('#userid' , this).val();
					var get_eventID = $('#Adding_eventid' , this).val();
					 
					//alert(get_attendType + ' ' + get_userID + ' ' + get_eventID);
					//$(this).ajaxSubmit({ success: regitrationAdded, clearForm: false }); 
					$(this).ajaxSubmit({ clearForm: false ,
												success: function(returnedRecord){
																			$('#table_attended_events tr:first').before(returnedRecord);
																			$('#tabs_crm_NewRegistration').tabs('select', selected_tab);
																			$('#tabs_crm_NewRegistration #newreg_'+ (selected_tab-1) +' :input').attr('disabled', true);
																			
																				if (selected_tab == total_tab ){
																						$("#modalNewEvent").dialog("close");
																					}
																					
																				if (get_attendType == 'chkSpeaker'){
																				
																					$.post("../speakers/qry_new_Speake_Save.cfm", {'userid' : get_userID, 'eventid' : get_eventID  });
																					//alert("this is a speaker");
																				}
																		}
												}); 
					return false; 
			}); 
});

<cfoutput query="getEvents">
$('##invoiceProcessPayment_#getEvents.eventID#').change(function(){
			if( $('##invoiceProcessPayment_#getEvents.eventID#').is(':checked') == true   ){
					$('.NewEvent_area_InvPDBankNumber_#getEvents.eventID#').css( 'backgroundColor' , '##ffe5e5' );
			}else{
					$('.NewEvent_area_InvPDBankNumber_#getEvents.eventID#').css( 'backgroundColor' , '##ffffff' );
			}
});

$('##invoiceProcessPayment_#getEvents.eventID#').change(function(){
			if( $('##invoiceProcessPayment_#getEvents.eventID#').is(':checked') == true   ){
					$('.NewEvent_area_InvPDBankNumber_#getEvents.eventID#').css( 'backgroundColor' , '##ffe5e5' );
			}else{
					$('.NewEvent_area_InvPDBankNumber_#getEvents.eventID#').css( 'backgroundColor' , '##ffffff' );
			}
});

$('##Payment_#getEvents.eventID#').change(function(){
			if( $('##Payment_#getEvents.eventID#').val() == 'YES'   ){
					$('.NewEvent_area_InvPDBankNumber_#getEvents.eventID#').css( 'backgroundColor' , '##ffe5e5' );
					$('##invoiceProcessPayment_#getEvents.eventID#').attr('checked', true);
			}else{
					$('.NewEvent_area_InvPDBankNumber_#getEvents.eventID#').css( 'backgroundColor' , '##ffffff' );
					$('##invoiceProcessPayment_#getEvents.eventID#').attr('checked', false);

			}
});
</cfoutput>
</script>
<!---<cfdump var="#getEvents#">--->
<div id="tabs_crm_NewRegistration" style="min-height:300px">
		<ul><cfoutput query="getEvents">
                <li><a href="##newreg_#(getEvents.currentrow -1)#">#getEvents.eventName#</a></li></cfoutput>
        </ul>
        <cfoutput query="getEvents">
		<div id="newreg_#(getEvents.currentrow -1)#" >
        		<form action="../User_Edit/conference_add.cfm" method="post" id="#getEvents.currentrow#" >
                <table width="361" border="0" cellpadding="4" >
                <tr>
                <td width="189">Registration type</td>
                <td width="22">
                        <input type="hidden" name="eventid" id="Adding_eventid" value="#getEvents.eventID#"  />
                        <input type="hidden" name="userid" id="userid" value="#form.userid#"  /> 
                        <select name="attendeeType" id="attendent_type">
                        <option value="chkDelegate">Delegate</option>
                        <option value="chkSpeaker">Speaker</option>
                        <option value="chkGuest">Guest</option>
                        <option value="chkModerator">Moderator</option>
                        <option value="chkExhibitor">Exhibitor</option>
                        <option value="chkPress">Press</option>
                        <option value="chkSponsor">Sponsore</option>
                        <option value="chkresearch">Research</option>
                        </select>
                  </td>
                </tr>
                <tr>
                <td>Recieved Payment</td>
                <td><select name="InvoicePaid" id="Payment_#getEvents.eventID#">
                        		<option value="NO" selected="selected">No</option>
                        		<option value="YES">Yes</option>
                        </select>
                 </td>
                </tr>
                <tr>
                <td width="189">Payment Processed</td>
                <td><input type="checkbox" name="invoiceProcessPayment" value="1" id="invoiceProcessPayment_#getEvents.eventID#" />		</td>
                </tr>
                <tr>
                <td  class="NewEvent_area_InvPDBankNumber_#getEvents.eventID#">Transaction Ref Number</td>
                <td  class="NewEvent_area_InvPDBankNumber_#getEvents.eventID#">
                  <input type="text" name="InvPDBankNumber" id="InvPDBankNumber" style="width:150px; " />
                 </td>
                </tr>
                <tr>
                <td>Bank transaction account</td>
                
                <td><select name="GPP_bankAccount" id="GPP_bankAccount">
                  <option value="0"></option>
                  <cfloop query="getBanks">
                    <option value="#getBanks.id#">#getBanks.name#</option></cfloop>
                </select></td>
                </tr>
                <tr>
                <td>discount value</td>
                <td><input type="text" name="discountValue" id="discountValue" maxlength="3" size="10" /> (numbers only)</td>
                </tr>
                <tr>
                <td >Registration Comment</td>
                <td><textarea name="INVComments" id="INVComments" style="width:220px; height:60px"></textarea></td>
                </tr>
                <tr>
                <td>Recieving Discount</td>
                <td><input type="checkbox" name="discount" id="chkDiscount" value="1" /></td>
                </tr>
                <tr>
                <td>3rd Party Guest</td>
                <td><input type="checkbox" name="guest" id="chkCompGuest" value="1" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><input name="Add" value="Add" class="add" id="#getEvents.currentrow#" type="submit"></td>
                </tr>
                </table>
                 </form>   
        </div></cfoutput>
</div>

<!---function regitrationAdded(){
			var get_tab = $(this).attr("id")
			alert(get_tab); 
			$('#tabs_crm_NewRegistration').tabs('select', get_tab);
			$('#tabs_crm_NewRegistration #newreg_'+(get_tab-1)+' :input').attr('disabled', true);
			$("#modalNewEvent").dialog("close");
}--->