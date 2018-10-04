<cfoutput>
<!---<script type="text/javascript">


function registerPaymentBranchLoadBranch(companyID){
	loadPageToPlaceHolder({ url:'../branches/dsp_branches.cfm', placeHolder:'branches', textareaID:'no', Args: {"companyID": companyID, "userID": 0, "BranchID": 0 }  });

}
$(document).ready(function(){
//registerPaymentBranchLoadBranch(22);
});
</script>--->
		<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
<style>
	##branches, ##branch,  ##CarbonCopy{height:400px; overflow:auto}
</style>
<form action="../bookings/?fa=booking-register-invoice" method="post">
<input type="hidden" name="bookingREf" value="#url.bookingReference#">
<input type="hidden" name="eventLocationID" value="#url.eventLocationID#">

<div class="c4" >
	<fieldset>
	<legend>select company</legend>
    	<cf_companies_suggest  random="#randomID#"    functionCall="registerPaymentBranchLoadBranch" companyID="companyID">   <!---random="983746"--->
	</fieldset>
</div>

<hr />
<div class="c4">
	<fieldset>
	<legend>Select Banch / Ofice to manage the invoice</legend>
    	<div id="branches"></div>
	</fieldset>
</div>
<div class="c4">
	<fieldset>
	<legend>View  Banch details</legend>
		<div id="branch" ></div>
     </fieldset>
</div>

<div class="c4">
	<fieldset>
	<legend>Select Carbon Copy contact to send file to </legend>
		<div id="CarbonCopy">
        	<cf_contact_suggest  random="#randomID#" displayReturn="contactEmail"  contactID="0" textName="contactName">  <!---random="983746" --->
		</div>
    </fieldset>
</div>  
    
</fieldset>
<hr />
<button>Next</button>
</form></cfoutput>
<cfhtmlhead text='<script type="text/javascript">function registerPaymentBranchLoadBranch(companyID){	loadPageToPlaceHolder({ url:"../branches/?fa=list-booking", placeHolder:"branches", textareaID:"no", Args: {"companyID": companyID, "userID": 0, "BranchID": 0 }  });}</script>'>