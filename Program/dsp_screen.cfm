<cfoutput>
<cfloop query="qry_program">
<li class="slotType_#qry_program.speakerType#"  id="slot_#qry_program.speakerID#" >
<cfinclude template="dsp_slotTime.cfm">
<cfinclude template="dsp_options.cfm">
<div class="clear"></div>
</li></cfloop></cfoutput>


 <!---   <cfcase value="4"><!--- file slot --->
         <div class="list_time">&nbsp;#qry_program.speakerTime# </div>
    	<img src="http://www.petro21.com/my-office/_img/program_holder-file.jpg" width="70" height="40" class="list_sortable_handle"  alt="move" />
        
        <div class="list_speakerContainer_#qry_program.speakerType#">
    			<div class="optionsPane_#qry_program.speakerType#">
                		<div class="list_tabClose"> </div>
                        <div class="c2 height_#qry_program.speakerType#">        
            				<label><input   type="radio" value="5" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" />delete slot</label> 
						</div>
               </div>
               
               <div class="list_speaker height_#qry_program.speakerType#">
                	<div class="list_tab"> </div>
    				<i class="speakerTopic NoFormat" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
        		</div>
       </div>   
     </cfcase>
     
     
	<cfcase value="5"><!--- Moderator slot --->
        <div class="list_time">
            #qry_program.speakerTime#<!---(#qry_program.speakerID#)--->
        </div>
    	<cfif qry_program.fileName NEQ "">
    		<img src="http://www.petro21.com/_files/client/#qry_program.fileName#" width="70" height="80" class="list_sortable_handle"  alt="move" />
    	<cfelse>
        	<img src="http://www.petro21.com/_files/client/MugShots.jpg" width="70" height="80" class="list_sortable_handle"  alt="move" />
        </cfif>
    
    <div class="list_speaker height_#qry_program.speakerType#">

        <strong>#qry_program.speakerName#</strong><br />
        #qry_program.userPosition# <br />
        #qry_program.companyName#
        <div >
            #qry_program.extraDetails#   <span class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="extraDetails" alt="#qry_program.userID#">more</span>...
        </div>
        
    </div>
    
    <div class="list_optionsStatus height_#qry_program.speakerType#">        
            <label>
               <input   type="radio" value="1" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 1>checked="checked"</cfif>/>
              contacted</label>
            <br />
            <label>
               <input   type="radio" value="2" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 2>checked="checked"</cfif>/>
              in progress</label>
            <br />
            <label>
              <input   type="radio" value="3" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 3>checked="checked"</cfif>/>  
              confirmed</label>
            <br />
            <label>
            	 <input   type="radio" value="6" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 6>checked="checked"</cfif> />
              finalized</label>
              <br />
            <label>
            	 <input   type="radio" value="11" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" />
              declined</label>
            
    </div>
    
    
    <div class="list_optionsComments height_#qry_program.speakerType#">
        		<div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="extraDetails" alt="#qry_program.userID#">public info</div>
                <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="comment" alt="#qry_program.userID#">private info</div>
                <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="arragements" alt="#qry_program.userID#">arragements</div>
                <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
                <cfif qry_program.cvFileName NEQ "">
                <a href="../_files/client/#qry_program.cvFileName#" target="_blank">download CV</a>
                <cfelse>
                <a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'tblIndividual', 'fileTableID': #qry_program.userID#}, Args:{  title : 'Manage files', height:650, width:770, modal:false}});">upload CV</a>

                </cfif>
     </div>
     
     <div class="list_optionsOrder height_#qry_program.speakerType# noBorder" style="margin:0px">
         
            <span class="units" id="#qry_program.speakerID#">#(qry_program.speakerUnit*5)# </span> min
     </div>
     
     <div id="speakerExtraInfo_#qry_program.speakerID#" class="collapsiblePanel"></div>    
     </cfcase>
     
          <cfcase value="6">
         <div class="list_time">
        		 #qry_program.speakerTime#
                 <!---(#qry_program.speakerID#)--->
         </div>
    	<img src="http://www.petro21.com/my-office/_img/program_holder-info.jpg" width="86" height="110" class="list_sortable_handle"  alt="move" />
    	
        <div class="list_speaker height_#qry_program.speakerType#">
    	<i class="speakerTopic NoFormat" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
       	<div>
            #qry_program.extraDetails#   <span class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="extraDetails" alt="#qry_program.userID#">more</span>...
         </div>
        </div>    
        
        <div class="list_optionsStatus height_#qry_program.speakerType#">        
            <label>
               <input   type="radio" value="5" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" />
              delete slot</label>
		</div>
        
        <div class="list_optionsComments">&nbsp;</div>
        
        <div class="list_optionsOrder height_#qry_program.speakerType# noBorder" style="margin:0px">
           
            <span class="units" id="#qry_program.speakerID#">#(qry_program.speakerUnit*5)# </span> min
        </div>
     
     	<div id="speakerExtraInfo_#qry_program.speakerID#" class="collapsiblePanel"></div>
     </cfcase>--->
	 <!---<cfswitch expression="#qry_program.speakerType#">

	<cfcase value="1,5" delimiters=","><!--- Speaker --->   
   <!--- <div class="slot_time_#qry_program.speakerType#">
    	#timeFormat(qry_program.speakerTime, "hh:mm")#<!---  (#qry_program.speakerID#) [#qry_program.speakerSession#]--->
        <input type="radio" name="tolocation" class="tolocation" />
    </div>
    	<cfif qry_program.fileName NEQ "">
    		<img src="http://www.petro21.com/_files/client/#qry_program.fileName#" width="70" height="90" class="slot_sortable_handle"  alt="move" /><!---width="86" height="110"--->
    	<cfelse>
        	<img src="http://www.petro21.com/_files/client/MugShots.jpg" width="70" height="90" class="slot_sortable_handle"  alt="move" />
        </cfif>--->
    <cfinclude template="dsp_slotTime.cfm">
    
    <cfinclude template="dsp_options.cfm">
 <!---    <div class="slot_speakerContainer_#qry_program.speakerType#">
   <div class="optionsPane_#qry_program.speakerType#">
    			<div class="slot_tabClose">&nbsp;</div>
                <div class="c2 height_#qry_program.speakerType# borderRight" style="margin:0px"><!---list_optionsOrder--->
                        <div><input type="checkbox" id="#qry_program.speakerID#" class="speakerKeyNote" value="1" <cfif qry_program.speakerKeyNote EQ 1> checked="checked"</cfif> /> KeyNote </div>
                        <hr />
                        <div><i class="speakerOrder" id="#qry_program.speakerID#" style="width:15px; height:8px">#qry_program.speakerOrder#</i>&nbsp;  Order</div>
                        <hr />
                        <span class="units" id="#qry_program.speakerID#">#(qry_program.speakerUnit*5)# </span> min
                        
                 </div>
                 
                <div class="c2 height_#qry_program.speakerType#"><!---list_optionsStatus--->        
                        <label> <input   type="radio" value="2" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 2>checked="checked"</cfif>/>in progress</label>
                        <br />
                        <label><input   type="radio" value="3" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 3>checked="checked"</cfif>/>  confirmed</label>
                        <br />
                        <label><input   type="radio" value="6" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 6>checked="checked"</cfif> />finalized</label>
                </div>
                <div class="c2 height_#qry_program.speakerType# borderRight">
                		<label><input   type="radio" value="1" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 1>checked="checked"</cfif>/>contacted</label>
                        <br />
                        <label><input   type="radio" value="10" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#"<cfif qry_program.speakerStatus eq 10>checked="checked"</cfif> />declined</label>
                        <label><input   type="radio" value="12" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#"<cfif qry_program.speakerStatus eq 12>checked="checked"</cfif> />cancelled</label>
                </div>
                
                
                <div class="c1 height_#qry_program.speakerType#"><!---list_optionsComments--->
                            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="extraDetails" alt="#qry_program.userID#">public info</div>
                            <cfif qry_program.cvFileName NEQ "">
                            <a href="../_files/client/#qry_program.cvFileName#" target="_blank">download CV</a>
                            <cfelse>
                            <a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable': 'tblIndividual', 'fileTableID': #qry_program.userID#}, Args:{  title : 'Manage files', height:500, width:900, modal:false}});">upload CV</a>
                            </cfif>   
                 </div>
                 <div class="c1 height_#qry_program.speakerType#">
                 			<div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
                            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="comment" alt="#qry_program.userID#">private info</div>
                            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="arragements" alt="#qry_program.userID#">arragements</div>
                 </div>
                
                 
    </div>
            
            <div class="slot_speaker height_#qry_program.speakerType#">
                        <div class="slot_tab">&nbsp;</div>
                        <i class="speakerTopic NoFormat <cfif qry_program.speakerTopic EQ "">border</cfif>" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
                        <div class="clear"></div>
                        <strong>#qry_program.speakerName#</strong><br />
                        #qry_program.userPosition# <br />
                        #qry_program.companyName#   
                        
            </div>
    </div>
     <div id="speakerExtraInfo_#qry_program.speakerID#" class="collapsiblePanel"></div>    ---> 
     </cfcase>
     
     
     <cfcase value="2,4" delimiters=","><!--- Session slot & file slot --->
     <cfinclude template="dsp_slotTime.cfm">
     <cfinclude template="dsp_options.cfm">
     <!---<div class="slot_time_#qry_program.speakerType#">
            &nbsp;#timeFormat(qry_program.speakerTime, "hh:mm")#<!--- (#qry_program.speakerID#)[#qry_program.speakerSession#]--->
      </div>
    	<img src="http://www.petro21.com/my-office/_img/program_holder-session.jpg" width="70" height="40" class="slot_sortable_handle"  alt="move" />--->
    	
        <!---<div class="slot_speakerContainer_#qry_program.speakerType#">
        <div class="slot_speakerContainer_#qry_program.speakerType#">
    			<div class="optionsPane_#qry_program.speakerType#">
                		<div class="slot_tabClose">&nbsp;</div>
                        <div class="c2 height_#qry_program.speakerType#">        
                        <label><input   type="radio" value="5" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" />delete slot</label> 
                        </div>
                </div>
        		
                <div class="slot_speaker height_#qry_program.speakerType#">
                	<div class="slot_tab">&nbsp;</div>
                    <i class="speakerTopic NoFormat" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
                </div>
        </div> --->
     </cfcase>
     
     
     <cfcase value="3,6" delimiters=","><!--- Info slot and 6 for end of day  --->
         <cfinclude template="dsp_slotTime.cfm">
         <cfinclude template="dsp_options.cfm">
		 <!---<div class="slot_time_#qry_program.speakerType#">
        		 #timeFormat(qry_program.speakerTime, "hh:mm")#<!--- (#qry_program.speakerID#) [#qry_program.speakerSession#]--->
         </div>
    	<img src="http://www.petro21.com/my-office/_img/program_holder-info.jpg" width="70" height="90" class="slot_sortable_handle"  alt="move" />--->
    	
        <div class="slot_speakerContainer_#qry_program.speakerType#">
<!---    			<div class="optionsPane_#qry_program.speakerType#">
                		<div class="slot_tabClose">&nbsp;</div>
                        <div class="c2 height_#qry_program.speakerType# borderRight" style="margin:0px">
                        		<span class="units" id="#qry_program.speakerID#">#(qry_program.speakerUnit*5)# </span> min
                                <hr />
                       </div>
                        
                        <div class="c2 height_#qry_program.speakerType#">
                        <label><input   type="radio" value="5" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" /> delete slot</label>
                        </div>
                </div>--->
                
        		<div class="slot_speaker height_#qry_program.speakerType#">
    				<div class="slot_tab">&nbsp;</div>
                    <i class="speakerTopic NoFormat" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
        			<div>#qry_program.extraDetails#</div>
        		</div>    
		</div>
        
     	<div id="speakerExtraInfo_#qry_program.speakerID#" class="collapsiblePanel"></div>
     </cfcase>
     
     
 
     
</cfswitch>     --->