<table border="0" cellspacing="1" cellpadding="4" class="tableClientHeader">
      <tr >
        <td width="255">Item</td>
        <td class="vtip" width="50" title="Event Attendend Type" >Type</td>
        <td class="vtip" width="30" title="Event Attendend Paid">Paid </td> 
        <td class="vtip" width="50" title="Change Booking - Attendence">Booking</td>       
        <td class="vtip" width="50" title="Event Attendend cancelled">cancel</td>
<!---        <td class="vtip" width="57" title="Recieving Discount for Event">Discount </td>--->
        <td class="vtip" width="40" title="Access to E-confernec">Access</td>
        <td class="vtip" width="50" title="Welcome Letter sent">Welcome</td>
        <td class="vtip" width="50" title="Welcome Letter sent">Pay</td>
      </tr>
</table>
<div id="paneLeft">
<table  border="0" cellspacing="1" cellpadding="4" id="table_attended_events"><cfoutput query="get"><cfset attendee_type = 0 >
      <tr id="event_#get.id#" style="" class="vtip" title="<cfif get.Cancel_Reason NEQ ""><strong>Cancel</strong>: #get.Cancel_Reason#<br><strong>Cancel date</strong>: #dateformat(get.Cancel_Date, "dd mmm yyyy")#</cfif>
				<cfif get.reActivate_date NEQ "" ><br><strong>Reactiveated on</strong>: #dateformat(get.reActivate_date, "dd mmm yyyy")#</cfif>
                <cfif get.welcomeLetter NEQ ""><br><strong>Welcome Letter Sent</strong>: #dateformat(get.welcomeLetter, "dd mmm yyyy")#</cfif>
               <cfif get.registrationDate NEQ ""><br><strong>Registered on the</strong>: #dateformat(get.registrationDate, "dd mmm yyyy")#</cfif>
               <cfif get.registerdBy NEQ 0><br><strong>Registered by</strong>: #get.staffName#</cfif>
                <cfif get.attendanceResponseDate NEQ ""><br><strong>Response form</strong>: #dateFormat(get.attendanceResponseDate, "dd mmm yyyy")#</cfif>">
        <td>#get.conference#&nbsp;</td>
        <td><b class="attendType" id="#get.id#" style="display: inline; width:50px">
        	<cfif get.chkDelegate EQ 1 >delegate<cfset attendee_type = 1 >
            <cfelseif get.chkSpeaker EQ 1>speaker<cfset attendee_type = 1 >
            <cfelseif get.chkGuest EQ 1>guest
            <cfelseif get.chkModerator EQ 1>moderator 
            <cfelseif get.chkExhibitor EQ 1>exhibitor 
            <cfelseif get.chkPress EQ 1>press
            <cfelseif get.chkResearch EQ 1>research
            <cfelseif get.chkSponsor EQ 1>sponsor</cfif></b></td>
                <td><cfif  get.chkDelegate EQ 1 OR  get.chkExhibitor EQ 1 OR get.chkSponsor EQ 1>
            	<cfif get.paid eq "No" OR get.paid eq "">
					<cfif get.guest eq 1 >3<sup>rd</sup> Guest
					<cfelse>
                		<div class="ui-state-error ui-corner-all" style="padding: 0pt 0.1em;"><em class="ui-icon ui-icon-alert"></em></div>
					</cfif>
					<cfelse>Y</cfif>
            </cfif></td>
        		<td <cfif get.cancelled EQ 1 >style="background-color:##f9e60e"</cfif>>
        	<a href="javascript:ExternalModalOpen('../User_Edit/dsp_cancell_conference.cfm', #get.id#, #get.invoiceId#, 250, 150, 'Cancel registration for this user');" class="<cfif get.cancelled EQ 1>display<cfelse>blueBut</cfif>" id="button_Cancel_#get.id#">cancel</a><a href="javascript:ReActivateEvent(#get.id#);" class="<cfif get.cancelled NEQ 1>display<cfelse>blueBut</cfif>" id="button_Activate_#get.id#">activate</a></td>
 	<td><cfif get.cancelled EQ 1><div class="ui-state-highlight ui-corner-all" style="padding: 0pt 0.1em;"><em class="ui-icon ui-icon-info"></em></div>
    <cfelse>No</cfif></td>
  <!--- <td><cfif get.discount eq 0 >No<cfelse>Yes</cfif></td>--->
        <td><strong class="econfAccess" id="#get.id#"><cfif get.chkDelegate EQ 1 >
						  <cfif get.paid eq "No" AND get.econfAccess eq 1 >Yes
                          <cfelseif get.paid eq "No" AND get.econfAccess eq 0 OR get.econfAccess EQ "" >Yes
                          <cfelseif get.econfAccess eq 0 OR get.econfAccess EQ "" AND attendee_type EQ 1>Yes
                          <cfelseif get.econfAccess eq 0 OR get.econfAccess EQ "" >No
                          <cfelseif get.econfAccess eq 1 OR attendee_type EQ 1>Yes</cfif>       
						<cfelseif get.chkSpeaker EQ  1 OR get.chkModerator EQ 1>Yes
                        <cfelse>No</cfif></strong></td>
        <td><!---<cfif get.webID NEQ ""> ---><a href="javascript:ExternalModalOpen('../registration/Form_welcomeLetter.cfm', #get.user_id#, #get.id#, 770, 270, 'Send Welcome letter for this user' );" class="blueBut" id="button_Welcom_#get.id#" ><cfif get.welcomeLetter NEQ "">Resend<cfelse>send</cfif></a> <!---display--->
<!---    <cfelse>id missing
            </cfif>--->
        </td>
        <td><cfif get.paid eq "No" AND  get.chkDelegate EQ 1 OR  get.chkExhibitor EQ 1 OR get.chkSponsor EQ 1><a href="../payments/dsp_events.cfm?id=#get.user_id#&secondaryid=#get.groupby#,#datePart("yyyy", get.Conf_date)#" class="blueBut" id="button_Welcom_#get.id#" target="_blank">Pay</a>
            </cfif></td>
      </tr></cfoutput>
       <tr >
        <td width="255"></td>
        <td width="50"></td>
        <td width="30"></td>
        <td width="50"></td>
        <td width="50"></td>
<!---        <td  width="57"></td>--->
        <td width="40"></td>
        <td width="50"></td>
        <td width="50"></td>
      </tr>
    </table>