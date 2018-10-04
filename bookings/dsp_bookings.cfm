<br />

<div class="c8 ">
<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Search and find older records</spam></div>
<div class="ui-corner-bottom  ui-widget ui-widget-content podForm">
	<table cellpadding="5" width="100%" class="tableList" >
    	<cfoutput query="qryBookings" group="payment">
    	<tr>
        	<td colspan="2" class="groupLabel" style="background-color:##F2F2F2"><strong>#qryBookings.payment#</strong></td>
         </tr>
		<cfoutput group="bookingReference">
    	<tr>
        	<td colspan="2" class="groupLabel"><strong>(#dateFormat(insertDate, "dd mmmm yyyy")#)</strong> - location [#qryBookings.invoiceLocationID#]<span class="floatRight"><form action="../bookings/?fa=bookings-invoice-view" method="post"><button>#qryBookings.bookingReference#</button><input name="bookingREF" value="#qryBookings.bookingReference#" type="hidden" /></form></span> </td>
         </tr>
         <cfoutput>
         <tr>
        	<td>#qryBookings.name# #qryBookings.lastName#</td>
        	
            <td><cfif qryBookings.profileUserID NEQ 0  ><!---AND qryBookings.userID EQ 0--->
            <a href="javascript:openWindow({ url:'../profiles/?fa=profile-modal', param: {'profileID': '#qryBookings.profileUserID#'}, Args:{  title : 'Manage profile', height:600, width:800, modal:false}});">new profile</a>
            </cfif></td>
       </tr></cfoutput></cfoutput></cfoutput>
   </table>
</div></div>
   
<div class="c4">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Search and find older records</spam></div>
    <div class=" ui-corner-bottom  ui-widget ui-widget-content podForm">
    
            <form action="../bookings/?fa=bookings" method="post">
    
            Search bookings
            <input class="large" type="text" name="searchBookings" original-title="search user delegate name" />
            
            <button class="red skin_colour round_all">search bookings</button>
            </form>
    </div>
    
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Transactions to check</spam></div>
	<div class=" ui-corner-bottom  ui-widget ui-widget-content podForm">
    	<ul class="listMenu">
        	<li><a href="">Card transactions to check <strong><cfoutput>#qryCards.cardsTotal#</cfoutput></strong></a></li>
            <li><a href="">Bank Transfer Requests <strong><cfoutput>#qryTransfer.transferTotal#</cfoutput></strong></a></li><!------>
            <li><a href="">Email form sent to client <strong><cfoutput>#qryEmail.emailTotal#</cfoutput></strong></a></li>
            <li></li>
        </ul>
    </div>
</div>