<cfquery datasource="#gpp#" name="getBanks">
SELECT bankID, name
FROM bankAccounts
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
			$(".numeric").numeric();
			$('form').submit(function() { 
					var total_tab = <cfoutput>#getEvents.recordcount#</cfoutput>;
					var selected_tab = $(this).attr('id');
					var get_attendType = $('#attendent_type :selected' , this).val();
					var get_userID = $('#userid' , this).val();
					var get_eventID = $('#Adding_eventid' , this).val();
					var get_speakerTopic = $('#speakerTopic' , this).val();
					//alert(get_speakerTopic);
					 
					//alert(get_attendType + ' ' + get_userID + ' ' + get_eventID);
					//$(this).ajaxSubmit({ success: regitrationAdded, clearForm: false }); 
					$(this).ajaxSubmit({ clearForm: false ,
												success: function(returnedRecord){
												//$('#table_attended_events tr:first').before(returnedRecord);
												$('#userRegistrations').html(returnedRecord);
												$('#tabs_crm_NewRegistration').tabs('select', selected_tab);
												$('#tabs_crm_NewRegistration #newreg_'+ (selected_tab-1) +' :input').attr('disabled', true);
												
													if (selected_tab == total_tab ){
															$("#modalNewEvent").dialog("close");
														}
														
													if (get_attendType == 'chkSpeaker' | get_attendType == 'chkModerator' ){
															var speakerType = '';
															
															switch(get_attendType)
																		{
																		case 'chkSpeaker':
																		  var speakerType = 1;
																		  break;
																		case 'chkModerator':
																		  var speakerType = 5;
																		  break;
																		}
																																													
																					//$.post("../program/qry_new_Speake_Save.cfm", {'userid' : get_userID, 'eventid' : get_eventID, 'speakerType': speakerType, "speakerTopic": get_speakerTopic });
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

$("[id^=attendent_type_]").change(function(){
			var getTheNme = $(this).attr("id");
			var getID 	= getTheNme.split('_');
			var get_attendent_type = $(this).val() ;
			
			if (get_attendent_type == "chkSpeaker"){
					$("##speakerTopic_"+getID[2]).css("display", "block");
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
		<div id="newreg_#(getEvents.currentrow -1)#" style="padding:10px 5px">
        		<form action="../User_Edit/conference_add.cfm" method="post" id="#getEvents.currentrow#" >

                <b>Registration type</b>
                <i class="NoFormat">
                        <input type="hidden" name="eventid" id="Adding_eventid" value="#getEvents.eventID#"  />
                        <input type="hidden" name="userid" id="userid" value="#form.userid#"  /> 

                        <select name="attendeeType" id="attendent_type_#getEvents.eventID#">
                          <option value="chkDelegate">Delegate</option>
                          <option value="chkSpeaker">Speaker</option>
                          <option value="chkGuest">Guest</option>
                          <option value="chkModerator">Moderator</option>
                          <option value="chkExhibitor">Exhibitor</option>
                          <option value="chkPress">Press</option>
                          <option value="chkSponsor">Sponsore</option>
                          <option value="chkresearch">Research</option>
                        </select>
                  </i>

                <div id="speakerTopic_#getEvents.eventID#" class="speakerTopic">
                        <b style="color:##F00">Speaker Topic for program</b>
                         <i class="NoFormat"><textarea name="speakerTopic" id="speakerTopic" style="width:220px; height:60px"></textarea></i>
                  </div>
                                <tr>
            <b>Recieved Payment </b>
             <i class="NoFormat">
             <select name="InvoicePaid" id="Payment_#getEvents.eventID#">
                  <option value="NO" selected="selected">No</option>
                  <option value="YES">Yes</option>
             </select>
             </i>
            <b>Payment Processed</b>
<i class="NoFormat"><input type="checkbox" name="invoiceProcessPayment" value="1" id="invoiceProcessPayment_#getEvents.eventID#" /></i>
                
                <b class="NewEvent_area_InvPDBankNumber_#getEvents.eventID#">transaction Ref Number  </b>
                <i class="NoFormat NewEvent_area_InvPDBankNumber_#getEvents.eventID#"> 
                  <input type="text" name="InvPDBankNumber" id="InvPDBankNumber" style="width:150px;" />
                 </i>
                
                <b>Bank transaction account</b>
                
                <i class="NoFormat"><select name="GPP_bankAccount" id="GPP_bankAccount">
                  <option value="0"></option>
                  <cfloop query="getBanks"><option value="#getBanks.bankID#">#getBanks.name#</option>
                  </cfloop>
                </select></i>
                
                <b>discount value</b>
                <i class="NoFormat"><input type="text" name="discountValue" id="discountValue" class="numeric" maxlength="3" size="10" /> (numbers only)</i>
                <b>Registration Comment</b>
               <i class="NoFormat"><textarea name="INVComments" id="INVComments" style="width:220px; height:60px"></textarea> </i>
                <b>Recieving discount</b>
                <i class="NoFormat"><input type="checkbox" name="discount" id="chkDiscount" value="1" /></i>
                <b>3rd Party Guest</b>
                <i class="NoFormat"><input type="checkbox" name="guest" id="chkCompGuest" value="1" /> <input name="Add" value="Add" class="add" id="#getEvents.currentrow#" type="submit" style="float:right"></i>
                <!---<b></b>
                <i class="NoFormat"><input name="Add" value="Add" class="add" id="#getEvents.currentrow#" type="submit"></i>--->
				<div class="clear"></div>
                 </form>   
        </div></cfoutput>
</div>
<style type="text/css">
.speakerTopic{
	display:none
}
</style>
<!---function regitrationAdded(){
			var get_tab = $(this).attr("id")
			alert(get_tab); 
			$('#tabs_crm_NewRegistration').tabs('select', get_tab);
			$('#tabs_crm_NewRegistration #newreg_'+(get_tab-1)+' :input').attr('disabled', true);
			$("#modalNewEvent").dialog("close");
}
<table width="361" border="0" cellpadding="4">
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
                <div id="speakerTopic">
                                <tr>
                                  <td >Speaker Topic for program</td>
                                  <td><textarea name="" style="width:220px; height:60px"></textarea></td>
                                </tr>
                  </div>
                                <tr>
                <td>Recieved Payment </td>
                <td><select name="InvoicePaid" id="Payment_#getEvents.eventID#">
                        		<option value="NO" selected="selected">No</option>
                        		<option value="YES">Yes</option>
                        </select>
                 </td>
                </tr>
                <tr>
                <td width="189">Payment Processed</td>
                <td><input type="checkbox" name="invoiceProcessPayment" value="1" id="invoiceProcessPayment_#getEvents.eventID#" /></td>
                </tr>
                <tr>
                <td class="NewEvent_area_InvPDBankNumber_#getEvents.eventID#">transaction Ref Number</td>
                <td class="NewEvent_area_InvPDBankNumber_#getEvents.eventID#">
                  <input type="text" name="InvPDBankNumber" id="InvPDBankNumber" style="width:150px;" />
                 </td>
                </tr>

                <tr>
                <td >Bank transaction account</td>

                <td ><select name="GPP_bankAccount" id="GPP_bankAccount">
                  <option value="0"></option>
                  <cfloop query="getBanks"><option value="#getBanks.bankID#">#getBanks.name#</option>
                  </cfloop>
                </select></td>
                </tr>
                <tr>
                <td>discount value</td>
                <td><input type="text" name="discountValue" id="discountValue" class="numeric" maxlength="3" size="10" /> (numbers only)</td>
                </tr>
                <tr>
                <td>Registration Comment</td>

               <td><textarea name="INVComments" id="INVComments" style="width:220px; height:60px"></textarea></td>
                </tr>
                <tr>
                <td>Recieving discount</td>
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
--->