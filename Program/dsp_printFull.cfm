<style type="text/css">
table {font-family:Arial, Helvetica, sans-serif; font-size:11px}
td	{border-bottom:1px solid #CCC; border-right:1px solid #f8f8f8; padding:3px 0 3px 3px;}
.session {background-color:#ececec}
.header {background-color:#bee3ff}
</style>
<cfoutput>

<table cellpadding="0" cellspacing="0" >
<tr>
	<td colspan="11" class="header">    
        <!---<cf_event_name eventID="#form.eventID#">--->#eventName#
      </td>
</tr>
<tr>
        <td  class="header">    
          Speaker
        </td>
        <td  class="header">
            position
        </td>
        <td  class="header">
            company
        </td>
        <td  class="header">
            Topic
        </td>
        <td  class="header">
           time
        </td>
        <td  class="header">
            duration
        </td>
        <td  class="header">
            status
        </td>
        <!---<td>
            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
         </td>--->
         <td  class="header">
            comment
        </td>
        <td  class="header">
            arragements
        </td>
        <td  class="header">
            CV
        </td>
        <td  class="header">
            photo
        </td> 
 </tr>


 
 

<cfloop query="qry_program">
<tr>
<cfswitch expression="#qry_program.speakerType#">

	<cfcase value="1">
		<td>    
          <strong>#qry_program.speakerName#</strong>
        </td>
        <td>
            #qry_program.userPosition#
        </td>
        <td>
            #qry_program.companyName#
        </td>
        <td>
            #qry_program.speakerTopic#
        </td>
        <td>
            #qry_program.speakerTime#
        </td>
        <td>
            #(qry_program.speakerUnit*5)#  min
        </td>
        <td>
            <cfswitch expression="#qry_program.speakerStatus#">
                <cfcase value="1">
                    contacted
                </cfcase>
                <cfcase value="2">
                     in progress
                </cfcase>
                <cfcase value="3">
                     confirmed
                </cfcase>
                <cfcase value="6">
                     finalized
                </cfcase>
                <cfcase value="11">
                     declined
                </cfcase>
            </cfswitch>
        </td>
        <!---<td>
            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
         </td>--->
         <td>
            #qry_program.comment#
        </td>
        <td>
            #qry_program.arragements#
        </td>
        <td>
            <cfif qry_program.cvFileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td>
        <td>
            <cfif qry_program.fileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td>     
     </cfcase>
     
     
     <cfcase value="2">
      <td colspan="11" class="session">    
        <strong>#qry_program.speakerTopic#</strong>
      </td>
     </cfcase>   
     
     	<cfcase value="5">
        <td>    
          <strong>#qry_program.speakerName#</strong>
        </td>
        <td>
            #qry_program.userPosition#
        </td>
        <td>
            #qry_program.companyName#
        </td>
        <td>
            
        </td>
        <td>
            #qry_program.speakerTime#
        </td>
        <td>
            #(qry_program.speakerUnit*5)#  min
        </td>
        <td>
            <cfswitch expression="#qry_program.speakerUnit#">
                <cfcase value="1">
                    contacted
                </cfcase>
                <cfcase value="2">
                     in progress
                </cfcase>
                <cfcase value="3">
                     confirmed
                </cfcase>
                <cfcase value="6">
                     finalized
                </cfcase>
                <cfcase value="11">
                     declined
                </cfcase>
            </cfswitch>
        </td>
        <!---<td>
            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
         </td>--->
         <td>
            #qry_program.comment#
        </td>
        <td>
            #qry_program.arragements#
        </td>
        <td>
            <cfif qry_program.cvFileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td>
        <td>
            <cfif qry_program.fileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td> 
     </cfcase>
     
     
</cfswitch></tr></cfloop></table></cfoutput>