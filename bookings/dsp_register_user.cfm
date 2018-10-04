<cfoutput>
<cfif parameterexists(url.bookingReference)>
	<cfset bookingRef = "#url.bookingReference#">
<cfelse>
	<cfset bookingRef = "#CreateUUID()#">
</cfif>
<script type="text/javascript">
var bookingField = "<input type='text' name='bookingReference' id='bookingReference' value='' />";

$(document).ready(function(){
	
	$(".numeric").numeric();
	
	$('##conferenceID :selected').val();
		$("##conferenceID").change(function(){
			var getconferenceID = $(this).val() ;
			$('##area_events').fadeIn("fast").load("../conferences/dsp_events_select.cfm" , { "conferenceID": getconferenceID });
	});
		<cfif NOT parameterexists(url.bookingReference)>
		alertUI({ title:"Warning", callfunction:'addBookingRef', type: "confirmation", param: { } , message: "Would you like to add this user  to an existingbookig bookig/invoice? if yes click OK and supply the booking reference in the booking field, else click CANCEL to start a new booking  " })
		</cfif>
});

function addBookingRef(){
		$("##bookingRefField").html(bookingField);
}

function callUserCard(userID){
		loadPageToPlaceHolder({ url:'../users/dsp_userCard.cfm', placeHolder:'attende', textareaID:'', Args: {"userID": userID}  });
}

</script>
<br />
<form action="../bookings/?fa=booking-register-user-events" method="post">

<div class="c7">

	
    
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Step 1: Select Events for this booking</spam></div>
   <div class="ui-corner-bottom  ui-widget ui-widget-content podForm">
  
   <b>Booking ref</b>
   <i class="NoFormat" id="bookingRefField">
    		#bookingRef#
         <input type="hidden" name="bookingReference" id="bookingReference" value="#bookingRef#" />
    </i>
    			
     <cfif parameterexists(url.userID)>
 	<input type="hidden" name="userID" value="#url.userID#" />
 <cfelse>
 	<cf_user_search fieldIDname="userID" hiddenFieldName="userID" userID="0" userName="" random="2322344" functionCall="callUserCard"> 
 </cfif>  
   
   	<b>Select conference</b>
        <select name="conferenceID" style="width:250px;" id="conferenceID">
        <cfloop query="qryConferences">
        <option value="#qryConferences.confID#">#qryConferences.conferenceName#</option>
        </cfloop>
        </select>

   		<b>Select events</b>
        <div id="area_events"></div>
		  <div class="clear"></div>
          
         <b>Discount</b>
         <i class="NoFormat">
         <input type="text" name="discount" id="discount" class="numeric" maxlength="3" size="10" value="0" />
         </i>
          
        <b></b>
    <i class="NoFormat"><button >Next Step</button></i>
	<div class="clear"></div>        
   </div>
   
   <br />
   
   <div id="attende" class="ui-corner-bottom  ui-widget ui-widget-content podForm">
   <cfif parameterexists(url.userID)>
   <cfset form.userID= url.userID >
   <cfinclude template="../users/dsp_userCard.cfm">
   </cfif>
   </div>
    
</div>
</form></cfoutput>