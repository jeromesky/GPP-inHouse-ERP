<cfoutput>
<cfset eventLocation = qryEvents.countryID>
<fieldset>
  <legend>Paiment Options</legend>
<table width="600" height="60px"   cellspacing="0" cellpadding="2" border="1" style=" padding:10px; color:##666">
  <tr>
    <td bgcolor="##F2FFFC" >Booking ref</td>
    <td bgcolor="##FDEEE1" >#form.bookingReference#</td>
    <td bgcolor="##F5EAFF" >&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="##F2FFFC" colspan="3" style="border-bottom:1px solid ##999; border-left:1px solid ##999"><a href="../bookings/?fa=booking-register-paymentBranch&bookingReference=#form.bookingReference#&eventLocationID=#eventLocation#">Select Invoice billing branch </a></td>

  </tr>
  <tr>
    <td><a href="../bookings/?fa=booking-register-user&bookingReference=#form.bookingReference#">add an other perso to this booking / invoice</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</fieldset>

<fieldset>
  <legend>Price per event</legend>
<table >
	
    <cfloop query="qryEvents"><tr>
    	<td>#qryEvents.eventName# </td>
    	<td> </td>
        <td>#qryEvents.eventCurrency# #qryEvents.eventPrice#</td>
    </tr></cfloop>
    <tr>
      <td style="border-bottom:1px solid ##666">&nbsp;</td>
      <td style="border-bottom:1px solid ##666">&nbsp;</td>
      <td style="border-bottom:1px solid ##666">&nbsp;</td>
    </tr>
        <tr>
    	<td>        Full price</td>
    	<td>&nbsp;</td>
        <td>#qryEvents.eventCurrency# #ArraySum(qryEvents["eventPrice"])#</td>
    </tr>
    <tr>
      <td>combined fee <cfif isdDnner EQ 1>(Excluding Dinners)</cfif></td>
      <td>&nbsp;</td>
      <td>#qryEvents.eventCurrency# #qry_bookingTotal.PRICECOMBO#</td>
    </tr>
        <tr>
      <td>discount amount%</td>
      <td>&nbsp;</td>
      <td>#qry_bookingTotal.DISCOUNTPERCENTAGE#%</td>
    </tr>
        <tr>
      <td >discount value</td>
      <td>&nbsp;</td>
      <td>#qryEvents.eventCurrency# #qry_bookingTotal.DISCOUNTVALUE#</td>
    </tr>
    <tr>
      <td>combined Fee with discount 
        <cfif isdDnner EQ 1> (Excluding Dinners)</cfif></td>
      <td>&nbsp;</td>
      <td>#qryEvents.eventCurrency# #qry_bookingTotal.priceComboDiscountVal#</td>
    </tr>



    <tr>
    	<td >Total Price <cfif isdDnner EQ 1> (Including Dinners)</cfif></td>
    	<td>&nbsp;</td> 
        <td>#qryEvents.eventCurrency# #qry_bookingTotal.PRICETOTAL#
        </td>
	</tr>
</table>    
</fieldset>


<!---<cfdump var="#qryEvents#">

form
<cfdump var="#form#">
url
<cfdump var="#form#">
<cfdump var="#url#">
list of ids for delegates only: #bookingTypeIDsDelegates#

<cfdump var="#qry_bookingTotal#">--->
</cfoutput>