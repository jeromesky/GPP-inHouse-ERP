<cfoutput>
<div class="box grid_8">
    <h2 class="box_head grad_colour">New registration</h2>
    <div class="block">
        <table width="100%" border="0" cellspacing="1" cellpadding="5">
          <tr>
            <td width="75"><img src="http://www.petro21.com/images_slate/avatar.jpg" width="65"></td>
            <td>#qryBooking.namePrefixLabel#<br />#qryBooking.p_name#<br />#qryBooking.p_otherNames#<br />#qryBooking.p_lastName#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Possition</td>
            <td>#qryBooking.p_position#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Company</td>
            <td>#qryBooking.p_AKA_companyName#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Registered</td>
            <td>#dateFormat(qryBooking.insertDate, "ddd, dd mmmm yyyy")#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Booking ref</td>
            <td>#qryBooking.bookingReference#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Contact</td>
            <td>#qryBooking.p_email#<br />#qryBooking.countryPhoneCode# - #qryBooking.p_phoneCode# - #qryBooking.p_phoneNo# <br />#qryBooking.countryPhoneCode# - #qryBooking.p_faxCode# - #qryBooking.p_faxNo#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Address</td>
            <td>#qryBooking.p_addressPostal#<br />#qryBooking.p_addressCityName#<br />#qryBooking.P_addressPostalCode#<br />#qryBooking.countryName#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>#EventIDs#</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        </div>
</div>

<div class="box grid_6">
    
    <h2 class="box_head grad_colour">Events booked</h2>
    <div class="block no_padding  ui-corner-bottom">
    	<ul class="full_width">
    	<cfloop query="qryEvents"><li>#qryEvents.eventName# <input type="hidden" name="eventID" value="#qryEvents.eventID#"></li></cfloop>
   		</ul>
   </div>

    <h2 class="box_head grad_colour">Ding user on Current system booked</h2>
    <div class="block">
        <cf_user_search fieldIDname="userID" hiddenFieldName="userID" userID="0" userName=""  random="2322344">
        
        <b></b>
        <i class="NoFormat"><button class="red skin_colour round_all">add events to old table</button></i>

        <div class="clear"></div>
    </div>
</div>

<div class="box grid_2  ">
	 <h2 class="box_head grad_colour">Links</h2> 
     <div class="block no_padding ui-corner-bottom">
        <ul class="full_width">
            <li><a href="">create new user</a></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
</cfoutput>