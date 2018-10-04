<cfoutput>
<script type="text/javascript">
$(document).ready(function(){
$('##events').tabs();
$(".numeric").numeric();
});

</script>
<br />
<form action="../bookings/?fa=booking-register-payment-method" method="post">
<input type="hidden" name="conference" value="#form.conferenceID#"> 
<input type="hidden" name="bookingReference" value="#form.bookingReference#">
<input type="hidden" name="discount" value="#form.discount#">
<input type="hidden" name="userID" value="#form.userID#">
<div class="c12">

    <div id="events" style="min-height:300px">
            <ul>
           
                    <cfloop query="qryEvents">
                    <li><a href="##event_#qryEvents.eventID#">#qryEvents.eventName#</a></li>
                    </cfloop>
            </ul>

            <cfloop query="qryEvents">
            <div id="event_#qryEvents.eventID#" >
                <table width="361" border="0" cellpadding="4">
                <tr>
                <td width="189">Registration type</td>
                <td width="22">
                        <input type="hidden" name="eventid" value="#qryEvents.eventID#" />
                        <select name="#qryEvents.eventID#_bookingType" id="bookingType">
                        <option value="1">Delegate</option>
                        <option value="2">Speaker</option>
                        <option value="3">Guest</option>
                        <option value="4">Moderator</option>
                        <option value="5">Exhibitor</option>
                        <option value="6">Press</option>
                        <!---<option value="8">Sponsor</option>--->
                        </select>
                  </td>
<!---                </tr>          
                <td>Discount Value</td>
                <td><input type="text" name="#qryEvents.eventID#_discount" id="discount" class="numeric" maxlength="3" size="10" /> (numbers only)</td>
                </tr>--->
                </tr>          
                <td>Paymemnt options</td>
                <td>
                	<select name="#qryEvents.eventID#_Poptions" >
                    	<option value="1">Paying</option>
                        <option value="1">Credit</option>
                        <option value="1">contract Delegate</option>
                        <option value="1">Invitee</option>
                        <option value="1">Package</option>
                        <option value="1">non payment</option>
                    </select>
                </td>
                </tr>
                <tr>
                <td>Booking Comment</td>
               <td><textarea name="#qryEvents.eventID#_bookingComment" id="bookingComment"></textarea></td>
                </tr>
                <cfif qryEvents.currentrow EQ qryEvents.recordcount>
                 <tr>
                <td>im adding this registration as a new booking, (<span style="color:##F00">by clicking this it will add the registration to the old system if not already there</span>)</td>
               <td><input type="checkbox" name="newRegistration" value="1" /></td>
                </tr>
                 <tr>
                <td></td>
               <td><button class="ui-corner-all red skin_colour round_all">Next step</button></td>
                </tr>
              </cfif>
                </table>
            </div></cfloop>
    </div>
</div>

</form>
</cfoutput>