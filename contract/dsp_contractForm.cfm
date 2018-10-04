<cfparam default="0" name="form.contractID">



<cfinclude template="../contract/qry_contractForm.cfm">
<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>
<cfoutput>
<script type="text/javascript">
var contractID = #form.contractID#;

$(document).ready(function(){
		$("###randomID#contractBookedDated").datepicker({ dateFormat: 'dd MM yy' });
		$( ".accordion" ).accordion(accordionDefault);
		$(".numeric").numeric();
				
	<cfif form.contractID EQ 0>
			//$('##loadSponsorForm').parent().css({'display' : 'none'});		
	<cfelse>
			$("fieldset.Collapsible").collapse( { closed: true });
			//loadSponsors(#form.contractID#);
	</cfif>
    $('##FormContract').submit( function() { 
		$(this).ajaxSubmit( { success: function(data){  
				$("##contract").html("");  
				loadContractForm(data);
				growl("well done", 'update successfull', 'message', 'ui-icon ui-icon-check', 'notice');
				}    
		}); 
		return false; 
    }); 
});
</script>
<form method="post" id="FormContract" action="../contract/qry_contractSave.cfm">
<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title"><cfif form.contractID EQ 0>Add a new contract<cfelse>Edit #qryContract.companyName# contract</cfif> </spam></div>


<div  class="ui-corner-bottom  ui-widget ui-widget-content  podForm">
        
		  <cfif form.contractID EQ 0>
          	<cf_companies_suggest  companyID="#qryContract.companyID#" companyName="#qryContract.companyName#" open="1" random="#randomID#">
          <cfelse>
<!---              <b>Company</b>
              <i class="NoFormat">
              #qryContract.companyName#
              </i>--->
          <input id="#randomID#companyID" type="hidden" value="#qryContract.companyID#" name="companyID">
          </cfif>
       <cf_companyLabels_suggest  textVal="#qryContract.AKA_companyName#" textIDName="AKA_companyName" hiddenIDVal="#qryContract.AKA_companyID#" hiddenName="AKA_companyID" companyFieldName="companyID" random="#randomID#"> <!---   --->
         <cf_branch_suggest  branchID="#qryContract.branchID#" branchName="#qryContract.branchName#" open="1" random="#randomID#">
          <cf_contact_suggest  contactID="#qryContract.contactID#" contact="#qryContract.contactName#" open="1" random="#randomID#">
          
          <div id="displayContact" style=" clear:both;padding:10px 0px 10px 0px; margin:0 0 10px 0">
<!---          <b>Details</b>
          <i class="NoFormat">#qryContract.contact#</i>--->
          #qryContract.contact#
          </div>
          
          <b>Booked date</b>
          <i class="NoFormat">
          	<cfif qryContract.contractBookedDated EQ "">
            	<input id="#randomID#contractBookedDated" type="text" name="contractBookedDated" class="ui-corner-all">
           <cfelse>
            	#dateFormat(qryContract.contractBookedDated, "dddd, dd mmm yyyy")#
           </cfif>
        </i>
            
            <b></b>
            <i class="NoFormat">
              <cfif form.contractID NEQ 0>
            
                  <ul class="listMenu ui-corner-bottom  ui-widget ui-widget-content  podBgFade podForm ui-corner-all">
                  		<li><a href="javascript:openWindow({ url:'../contract/packages.cfm', param: {'contractID': #qryContract.contractID#}, Args:modals.packages});">Manage Packages</a></li>
                        <cfif qryContract.contractFile NEQ "">
    	                    <li class="listNotification">
                        	<span class="listNotificationIcon"></span>
                        <cfelse>
	                        <li>
                        </cfif>
                        	<a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'contracts', 'fileTableID': #qryContract.contractID#}, Args:modals.files});">load Contract files </a></li>
                      
                  </ul>
               </cfif>
            </i>
      
          <div class="clear"></div>
 </div> 
 
<div class="accordion">
<h2>Contract cost</h2>
<div >

		<b>Contract type</b>
        <i class="NoFormat">
        		<select name="contractType" id="contractType" class="ui-corner-all">
                		<option value="3" <cfif qryContract.contractType EQ 3>selected</cfif>>Payable</option>
                        <option value="1" <cfif qryContract.contractType EQ 1>selected</cfif>>Free</option>
                		<option value="2" <cfif qryContract.contractType EQ 2>selected</cfif>>Swap</option>
                		
               </select>
        </i>
        
		<b>Contract Fee</b>
        <i class="NoFormat">
         <cf_Select_Currency_Admin name="currencyCode" value="#qryContract.currencyCode#"><br />
        		<input  class="ui-corner-all numeric"  type="text" name="contractCost" id="contractCost" value="<cfif qryContract.contractCost EQ "">0<cfelse>#qryContract.contractCost#</cfif>" />
        </i>


</div>
<h2>Status</h2>
<div >    

<!---          <b>Client Status</b>
          <i class="NoFormat">
          		<cf_status name="statusExternalID" cat="1" id="#qryContract.statusExternalID#">
          </i>--->
          
          <b>Status</b>
          <i class="NoFormat"> 
          		<cf_status name="statusInternalID" cat="2" id="#qryContract.statusInternalID#">
          </i>
          
          <b>Added by</b>
          <i class="NoFormat"> #qryContract.staffName# #dateFormat(qryContract.contractDateAdded, "dd mm yyyy")#
          </i>
          
          <b>Last Udate</b>
          <i class="NoFormat"> #qryContract.staffNameUpdated# #dateFormat(qryContract.contractDateUpdated, "dd mm yyyy")#
          </i>

</div>
<h2>Contract Details</h2>
<div >  

    
     
          <b>Comment</b>
          <i class="NoFormat">
          <textarea class="ui-corner-bottom noEditor" name="contractComment" id="contractComment">#qryContract.contractComment#</textarea>
          </i>
    
   
          <b>URL override</b>
          <i class="NoFormat">
          <input class="ui-corner-all" type="text" name="contractURL" id="contractURL" value="#qryContract.contractURL#" />
          </i>
          
          
          <b>Company Bios Override</b>
          <i class="NoFormat">
          <textarea class="ui-corner-all" name="contractCompanyComment" id="contractCompanyComment" style="height:100px">#qryContract.contractCompanyComment#</textarea>
          </i>
      
     
</div>
</div>


<div  class="ui-corner-all  ui-widget ui-widget-content  podForm">
      <b></b>
      <i class="NoFormat">
          <input type="hidden" name="contractID" id="contractID" value="#form.contractID#" />
          <button class="ui-corner-all">Save</button>
      </i>
      <div class="clear"></div>
</div>




 </form>
</cfoutput>
 <div id="area_sponsors"></div>
 
 <!---          <b></b>
       <i class="NoFormat">
          <!---<div  class="ui-widget-header ui-corner-all toolbar" style="display:inline;"><a href="javascript:loadSponsorForm(#qryContract.contractID#, '#form.contractTypeGroup#', 0);" id="loadSponsorForm">Sponsorship</a></div>--->
          <span id="loadSponsorForm" class="toolbar ui-widget-header ui-corner-all">
        	<a href="javascript:loadSponsorForm(#qryContract.contractID#,  'sponsor', 0);" >Sponsors</a>
        	<a href="javascript:loadSponsorForm(#qryContract.contractID#,  'exhibitor', 0);" >Exhibitors</a>
        	<a href="javascript:loadSponsorForm(#qryContract.contractID#,  'media', 0);" >Media</a>
        </span>
       </i>--->
 <!---      <b>Contract Fee</b>
      <i class="NoFormat">
       <cf_Select_Currency_Admin name="currencyCode" value="#qryContract.currencyCode#"><br />
      <input  class="ui-corner-all"  type="text" name="contractCost" id="contractCost" value="#qryContract.contractCost#" />
      </i>
---> 
	   <!---<input type="hidden" name="contractTypeGroup" id="contractTypeGroup" value="#form.contractTypeGroup#" />	--->