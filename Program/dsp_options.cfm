<cfoutput>
<cfswitch expression="#qry_program.speakerType#">

<cfcase value="1"><!--- type 1 full features speaker ---->
<div class="slot_speakerContainer_#qry_program.speakerType#">

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
                    <label><input   type="radio" value="3" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 3>checked="checked"</cfif>/>confirmed</label>
                    <br />
                    <label><input   type="radio" value="6" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 6>checked="checked"</cfif> />finalized</label>
            </div>
            <div class="c2 height_#qry_program.speakerType# borderRight">
                    <label><input   type="radio" value="1" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" <cfif qry_program.speakerStatus eq 1>checked="checked"</cfif>/>contacted</label>
                    <br />
                    <label><input   type="radio" value="10" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#"<cfif qry_program.speakerStatus eq 10>checked="checked"</cfif> />declined</label>
                    <label><input   type="radio" value="12" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#"<cfif qry_program.speakerStatus eq 12>checked="checked"</cfif> />no show(notWork)</label>
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
</cfcase>

<cfcase value="2"><!--- type 2 for simple  session slot  ---->
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
</div>
</cfcase>
<cfcase value="3"><!--- type 3 info slot New one  ---->
<div class="slot_speakerContainer_#qry_program.speakerType#">
        <div class="optionsPane_#qry_program.speakerType#">
            <div class="slot_tabClose">&nbsp;</div>
            <div class="c2 height_#qry_program.speakerType# borderRight" style="margin:0px"><!---list_optionsOrder--->
                    
                    <span class="units" id="#qry_program.speakerID#">#(qry_program.speakerUnit*5)# </span> min
                    <hr />
             </div>
             
            <div class="c2 height_#qry_program.speakerType# borderRight">
                    <label><input   type="radio" value="5" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" />delete slot</label> 
            </div>
            
            
            <div class="c1 height_#qry_program.speakerType#"><!---list_optionsComments--->
                    <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="extraDetails" alt="#qry_program.userID#">public info</div>
             </div>
             
             <div class="c1 height_#qry_program.speakerType# borderRight">
                    <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="comment" alt="#qry_program.userID#">private info</div>
             </div>             
        </div>
        
        <div class="slot_speaker height_#qry_program.speakerType#">
    				<div class="slot_tab">&nbsp;</div>
                    <i class="speakerTopic NoFormat" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
        			<div>#qry_program.extraDetails#</div>
        </div>    
</div>
</cfcase>
<cfcase value="4"><!--- type 4 for simple file---->
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
</div>
</cfcase>

<cfcase value="5"><!--- type 5 for full features moderator  ---->
<div class="slot_speakerContainer_#qry_program.speakerType#">
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
                        <label><input   type="radio" value="12" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#"<cfif qry_program.speakerStatus eq 12>checked="checked"</cfif> />no show(notWork)</label>
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
                     <!--- <i class="speakerTopic NoFormat <cfif qry_program.speakerTopic EQ "">border</cfif>" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
                      <div class="clear"></div>--->
                      <strong>#qry_program.speakerName#</strong><br />
                      #qry_program.userPosition# <br />
                      #qry_program.companyName#  
        </div>
</div>
</cfcase>


<cfcase value="6"><!--- type 6 end of day slot  ---->
<div class="slot_speakerContainer_#qry_program.speakerType#">
        <div class="optionsPane_#qry_program.speakerType#">
                <div class="slot_tabClose">&nbsp;</div>
                <div class="c2 height_#qry_program.speakerType# borderRight" style="margin:0px">
                        <span class="units" id="#qry_program.speakerID#">#(qry_program.speakerUnit*5)# </span> min
                        <hr />
               </div>
                
                <div class="c2 height_#qry_program.speakerType# borderRight">
                <label><input   type="radio" value="5" class="status" name="status_#qry_program.speakerID#" id="#qry_program.speakerID#" /> delete slot</label>
                </div>
                <div class="c1 height_#qry_program.speakerType#"><!---list_optionsComments--->
                    <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="extraDetails" alt="#qry_program.userID#">public info</div>
	            </div>
                
        </div>
                
        <div class="slot_speaker height_#qry_program.speakerType#">
                <div class="slot_tab">&nbsp;</div>
                <i class="speakerTopic NoFormat" id="#qry_program.speakerID#" >#qry_program.speakerTopic#</i>
                <div>#qry_program.extraDetails#</div>
        </div>    
</div>
</cfcase></cfswitch></cfoutput><!---<div id="speakerExtraInfo_#qry_program.speakerID#" class="collapsiblePanel"></div>--->