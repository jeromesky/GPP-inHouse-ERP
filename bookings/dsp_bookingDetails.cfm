<cfoutput>
<br />
<form action="act_bookingdetails.cfm" method="post">
<div class="c6">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">New registration for: #qryBooking.namePrefixLabel# #qryBooking.p_name# #qryBooking.p_lastName#</spam></div>
   <div class="ui-corner-bottom   ui-widget ui-widget-content  podForm">
     <!---   <table width="100%" border="0" cellspacing="1" cellpadding="5">
          <tr>
            <td>registration type</td>
            <td>card payments</td>
          </tr>
          <tr>
            <td width="75"><img src="http://www.petro21.com/images_slate/avatar.jpg" width="65"></td>
            <td>#qryBooking.namePrefixLabel#<br />#qryBooking.p_name#<br />#qryBooking.p_otherNames#<br />#qryBooking.p_lastName#</td>
          </tr>
          <tr>
            <td>Possition</td>
            <td>#qryBooking.p_position#</td>
          </tr>
          <tr>
            <td>Company</td>
            <td>#qryBooking.p_AKA_companyName#</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Registered</td>
            <td>#dateFormat(qryBooking.insertDate, "ddd, dd mmmm yyyy")#</td>
          </tr>
          <tr>
            <td>Booking ref</td>
            <td>#qryBooking.bookingReference#</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Contact</td>
            <td>#qryBooking.p_email#<br />#qryBooking.countryPhoneCode# - #qryBooking.p_phoneCode# - #qryBooking.p_phoneNo# <br />#qryBooking.countryPhoneCode# - #qryBooking.p_faxCode# - #qryBooking.p_faxNo#</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Address</td>
            <td>#qryBooking.p_addressPostal#<br />#qryBooking.p_addressCityName#<br />#qryBooking.P_addressPostalCode#<br />#qryBooking.countryName#</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="hidden" name="profileUserID" value="#qryBooking.profileUserID#" />
            <input type="hidden" name="bookingReference" value="#qryBooking.bookingReference#" />
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table> --->
        </div>
</div>

<div class="c4">
   <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Events booked</spam></div>
   <div class="ui-widget ui-widget-content  podLinks marginBottom15">
    	<ul class="listMenu">
    	<cfloop query="qryEvents"><li>#qryEvents.eventName# <input type="hidden" name="eventID" value="#qryEvents.eventID#"></li></cfloop>
   		</ul>
   </div>

    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">find user on Current booking system </spam></div>
    <div class="ui-widget ui-widget-content podForm">
        <cf_user_search fieldIDname="userID" hiddenFieldName="userID" userID="0" userName=""  random="2322344">
        
        <b></b>
        <i class="NoFormat"><button class="ui-corner-all red skin_colour round_all">search old records</button></i>
        
        <div class="clear"></div>
    </div>

</div>

<div class="c2">
      <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Links</spam></div>
     <div class="ui-widget ui-widget-content  podLinks">
        <ul class="listMenu">
            <li><a href="">creat new user</a></li>
            <li>sssss</li>
            <li></li>
        </ul>
</div>
</form>
</cfoutput>