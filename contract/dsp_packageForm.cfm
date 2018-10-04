<cfinclude template="qry_packageForm.cfm">

<cfoutput>
<script type="text/javascript">
	$(document).ready(function(){
		$("##bookedDated").datepicker({ dateFormat: 'dd MM yy' });
		$( ".accordion" ).accordion(accordionDefault);
		$(".numeric").numeric();
		
    	$('##formPackage').submit( function() { 
			$(this).ajaxSubmit( { success: function(data){  
				$("##package").html("");  
					loadpackage(data);
					growl("well done", 'update successfull', 'message', 'ui-icon ui-icon-check', 'notice');
				}    
		}); 
		return false; 
    }); 
});

</script>
<!---<style type="text/css">
<!---.listMenu li{
	border-bottom:1px solid ##CCC;
	padding:3px 5px 3px 5px;
	position:relative;
}
.listNotificationIcon{ width:16px; height:16px; position:absolute; top:-3px; left:-7px; position:absolute; background-image:url(../_img/listNotification.png);}--->
</style>--->
<form action="../contract/qry_package_save.cfm" method="post" id="formPackage" >
<input type="hidden" name="packagesID" id="packagesID" value="#form.packagesID#" />
<input type="hidden" name="eventID" id="eventID" value="#qryPackage.eventID#" />


<!---<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader">
	#qryPackage.typeLabel# for #qryPackage.event_name#
</div>--->

<div class="accordion">
<h2>#qryPackage.typeLabel# Package for #qryPackage.event_name#</h2>
<div > 

		<div class="c4">
                
                 
                 <b>Contract Fee</b>
                  <i class="NoFormat">
                  	#qryPackage.currencyCode# #numberformat(qryPackage.contractCost, "99999.99")#
                    <!---<cf_Select_Currency_Admin name="currencyCode" value="#qryPackage.currencyCode#"><br />
                 <input  class="ui-corner-all numeric"  type="text" name="packageCost" id="packageCost" value="#qryPackage.packageCost#" />--->
                  </i>
                        
                
                <b>Booked Date</b>
                <i class="NoFormat">
                        <cfif qryPackage.bookedDated EQ "">
                            <input type="text" name="bookedDated" id="bookedDated" class="fl_date ui-corner-all">
                        <cfelse>
                            #dateFormat(qryPackage.bookedDated, "ddd, dd mmmm yyyy")#
                        </cfif>
                </i>
                
                <b>sponsor type</b>
                <i class="NoFormat">
                        <cf_Types name="sponsorTypeID" cat="" catid="#qryPackage.packageTypeID#" id="#qryPackage.sponsorTypeID#">
                </i>
                
                <cfif qryPackage.packageTypeID EQ 201>
				<b>label</b>
                <i class="NoFormat">
                      <input class="ui-corner-all" type="text" name="packageLabel" id="packageLabel" value="#qryPackage.packageLabel#"  <cfif qryPackage.packageTypeID EQ 202>disabled</cfif> />
                </i></cfif>
                
                <b>promo Code</b>
                <i class="NoFormat">
                		<cfif qryPackage.promoCode NEQ "">
                        	#qryPackage.promoCode#
                        <cfelse>
                        	<input class="ui-corner-all" type="text" name="promoCode" value="#form.packagesID#" />
                       </cfif>
                </i>
                
                <b>promo %</b>
               <i class="NoFormat">
               			<input class="ui-corner-all phoneCode numeric" type="text" name="eventPricePercent" value="#qryPackage.eventPricePercent#" />
                        <input type="hidden" name="eventPriceID" value="#qryPackage.eventPriceID#" /> Please set to 0 if none
               </i> 
                
                <b>package Comments</b>
                <i class="NoFormat">
                        <textarea class="ui-corner-all" name="Comments" id="Comments" >#qryPackage.Comments#</textarea>
                </i>
         </div>
         <cfif form.packagesID NEQ 0>
         <div class="c3">
                <ul class="listMenu ui-corner-bottom  ui-widget ui-widget-content  podBgFade podForm ui-corner-all">
                    <cfif qryPackage.tasks NEQ "">
                    	<li class="listNotification">
                    		<span class="listNotificationIcon"></span>
                    <cfelse>
                    <li>
                    </cfif>
                        <a href="javascript:openTasksWindow(#form.packagesID#, #qryPackage.eventID#);">Tasks</a>
                    </li>
                    <cfif qryPackage.notes NEQ "">
                    	<li class="listNotification">
                    		<span class="listNotificationIcon"></span>
                    <cfelse>
                    	<li>
                    </cfif>
                            <a href="javascript:openWindow({ url:'../notes/index.cfm', param: {'noteTable': 'packages', 'noteTableID': #form.packagesID#}, Args: modals.notes});">Notes</a>
                    </li>
                </ul>
                
                <b>Created by</b>
                <i class="NoFormat">
                      #qryPackage.staffName# <br />
                      #qryPackage.packagesDateAdded#
                </i>
                
         </div>
         </cfif>
  		<div class="clear"></div>
  
</div> 
<cfif  qryPackage.packagetypeID EQ 203>
<h2>Booth</h2>
<div >  
            
            <div class="c4">
                    <b>booth Label</b>
                    <i class="NoFormat">
                          <input class="ui-corner-all" type="text" name="boothLabel" id="boothLabel" value="#qryPackage.boothLabel#" />
                    </i>
                    <b>Location</b>
                    <i class="NoFormat">
                          <input class="ui-corner-all" type="text" name="boothLocation" id="boothLocation" value="#qryPackage.boothLocation#" />
                    </i>
                    
                    <b>booth floor</b>
                    <i class="NoFormat">
                        <input class="ui-corner-all phoneCode numeric" type="text" name="boothFloor" id="boothFloor" value="#qryPackage.boothFloor#" />
                    </i>
                    <div class="clear"></div>
        	</div>
            
            <div class="c2" style="width:132px">
            
            		<b>booth width</b>
                    <i class="NoFormat">
                          <input class="ui-corner-all phoneCode numeric" type="text" name="boothwidth" id="boothwidth" value="#qryPackage.boothwidth#" />
                    </i> 
                    
                    <b>Booths depth</b>
                    <i class="NoFormat">
                          <input class="ui-corner-all phoneCode numeric" type="text" name="boothdepth" id="boothdepth" value="#qryPackage.boothdepth#" />
                    </i>
                    
                    <b>Square meter</b>
                    <i class="NoFormat">
                          (#qryPackage.boothwidth# * #qryPackage.boothdepth#)
                    </i>        
            </div>
            
         	<div class="c2" style="width:132px">
         		                
                <b>Shell Scheme</b>
                <i class="NoFormat">
                	<input class="ui-corner-all phoneCode" type="radio" name="boothSpace" id="boothSpace1" value="1" <cfif qryPackage.boothSpace EQ 1> checked="checked"</cfif> />
                </i> 
                    
                <b>Space Only</b>
                <i class="NoFormat">
                      <input class="ui-corner-all phoneCode" type="radio" name="boothSpace" id="boothSpace2" value="2" <cfif qryPackage.boothSpace EQ 2> checked="checked"</cfif> />
                </i>
                <b>Space Only discout %</b>
                <i class="NoFormat">
                      <input class="ui-corner-all phoneCode numeric" type="text" name="boothSpaceDiscount" id="boothSpaceDiscount" value="#qryPackage.boothSpaceDiscount#" maxlength="4" />
                </i>
        	</div>

</div>
</cfif>


<h2>Passes</h2>
<div >
<!---<cfif  qryPackage.packagetypeID NEQ 203>
        <input  type="hidden" name="boothLabel" id="boothLabel" value="#qryPackage.boothLabel#" />
        <input  type="hidden" name="boothLocation" id="boothLocation" value="#qryPackage.boothLocation#" />
        <input  type="hidden" name="boothwidth" id="boothwidth" value="#qryPackage.boothwidth#" />
        <input  type="hidden" name="boothdepth" id="boothdepth" value="#qryPackage.boothdepth#" />
        <input  type="hidden" name="boothFloor" id="boothFloor" value="#qryPackage.boothFloor#" />
        <input type="hidden" name="boothSpaceDiscount" id="boothSpaceDiscount" value="#qryPackage.boothSpaceDiscount#" />
        <input type="hidden" name="boothSpace" id="boothSpace1" value="1"  />
</cfif>--->

        <div class="c2" style="width:132px"> 
                
                <fieldset>
                	<legend>Passes</legend>
                            <b>Delegate</b>
                            <i class="NoFormat">
                                 <input class="ui-corner-all phoneCode numeric" type="text" name="limitPasses" id="limitPasses" value="#qryPackage.limitPasses#" /> 
                            </i>
                            
                            <b>Speaker</b>
                            <i class="NoFormat">
                                 <input class="ui-corner-all phoneCode numeric" type="text" name="limitSpeakers" id="limitSpeakers" value="#qryPackage.limitSpeakers#" /> 
                            </i>
					</fieldset>
                    
                <fieldset>
                	<legend>Discount</legend>
                            <b>Delegate</b>
                            <i class="NoFormat">
                                  <input class="ui-corner-all phoneCode numeric" type="text" name="discountValueLimit" id="discountValueLimit" value="#qryPackage.discountValueLimit#" />
                            </i>
                            
                            <b>percent off %</b>
                            <i class="NoFormat">
                                 <input class="ui-corner-all phoneCode numeric" type="text" name="discountAmountValue" id="discountAmountValue" value="#qryPackage.discountAmountValue#" /> 
                            </i>
                     </fieldset>  
                 

        </div>
        <div class="c2" style="width:132px">
        		<fieldset>
                	<legend>Booths</legend>
                            <b>Opperator</b>
                            <i class="NoFormat">
                                 <input class="ui-corner-all phoneCode numeric" type="text" name="limitBoothOperators" id="limitBoothOperators" value="#qryPackage.limitBoothOperators#" /> 
                            </i>
                            <b></b>
                            <i class="NoFormat"></i>
                	</fieldset>
                    
                <fieldset>
                	<legend>Additional Guest</legend>
                            <b>Delegate</b>
                            <i class="NoFormat">
                                  <input class="ui-corner-all phoneCode numeric"  type="text" name="limitGuest" id="limitGuest" value="#qryPackage.limitGuest#" />
                            </i>
                    </fieldset>
                    
        </div>
        
        <div class="c4"> 
                <b>passes Comments</b>
                 <i class="NoFormat">
                        <textarea class="ui-corner-all" name="packagePassComments" id="packagePassComments" style="height:130px" >#qryPackage.packagePassComments#</textarea>
                </i>
		</div>
</div>
</div>

<div  class="ui-corner-all  ui-widget ui-widget-content  podForm">
        
        <b></b>
        <i class="NoFormat">
        		<button class="ui-corner-all">Save</button>
        </i>
        <div class="clear"></div>
</div>
</form>
</cfoutput>

<!---          	<b></b>
                <i class="NoFormat">
                     packagesStatusExternalID
                    packagesStatusInternalID
                </i>--->