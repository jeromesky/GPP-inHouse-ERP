<div class="flat_area grid_16">
					<h2>New registrations</h2>
					<p>Like accordions, tabs are a great way to<strong> present alot of content/data without overwhelming the user</strong>. <strong>Adminica</strong> has two types: a regular <strong>horizontal tab</strong> layout and a <strong>vertical tab</strong> layout. </p>
					<p><strong>Note: </strong>Like nearly all Adminica layout objects, the tab boxes width can be controlled using the <a href="http://www.960.gs" target="_blank">960.gs Grid System</a>. In this example, both tab boxes have a <strong>class="grid_8".</strong></p>
</div>
<!---<h2 class="box_head grad_colour round_top">New registrations</h2>--->

<div class="box grid_8 tabs  ui-corner-all">
	<table cellpadding="5" width="100%" class="static" >
    	<cfoutput query="qryBookings" group="bookingReference">
    	<tr>
        	<td colspan="2" class="fg-toolbar ui-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix"><strong>(#dateFormat(insertDate, "dd mmmm yyyy")#)</strong> <span class="floatRight">Booking ref: #qryBookings.bookingReference#</span> </td>
         </tr>
         
         <cfoutput>
    	<tr>
        	<td>#qryBookings.delegate#</td>
        	<td><a href="../bookings/?fa=booking-details&bookingReference=#qryBookings.bookingReference#&profileUserID=#qryBookings.profileUserID#">view</a></td>

       </tr></cfoutput></cfoutput>
   </table>
</div>

<div class="box grid_4 tabs ui-corner-all">
	<h2 class="box_head grad_colour">Search old records</h2>
    <div class="block   ui-corner-bottom">
    	<form>

		Data to come... form here
        <input class="large" type="text"  original-title="search user delegate name" />
        
        <button class="red skin_colour round_all">add events to old table</button>
        </form>
    </div>
</div>