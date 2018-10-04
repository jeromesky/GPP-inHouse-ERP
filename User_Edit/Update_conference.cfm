<cfinclude template="../application.cfm">
  
<cfif parameterexists(form.attendType) AND  parameterexists(form.id)>
<cfsilent>
        	<cfif form.attendType EQ "chkDelegate">
					<cfset attendType = 1>
			<cfelseif form.attendType EQ "chkSpeaker">
            		<cfset attendType = 2>
        	<cfelseif form.attendType EQ "chkGuest">
            		<cfset attendType = 3>
        	<cfelseif form.attendType EQ "chkModerator">
            		<cfset attendType = 4>
            <cfelseif form.attendType EQ "chkExhibitor">
            		<cfset attendType = 5>
            <cfelseif form.attendType EQ "chkPress">
            		<cfset attendType = 6>
            <cfelseif form.attendType EQ "chkSponsor">
            		<cfset attendType = 8>
            <cfelseif form.attendType EQ "chkresearch">
					<cfset attendType = 7>
			</cfif>
<!--- INSERT INTO CONFERENCE ---->

        <cfquery datasource="#gpp#" name="new">
            UPDATE   tblConference_Registration 
            SET
             lngStatus_ID 		= <cfqueryparam value="#attendType#">,
                chkDelegate		=  <cfif form.attendType EQ "chkDelegate">1<cfelse>0</cfif>,  
                chkSpeaker		= <cfif form.attendType EQ "chkSpeaker">1<cfelse>0</cfif>,
                chkGuest			=  <cfif form.attendType EQ "chkGuest">1<cfelse>0</cfif>, 
                chkModerator		=  <cfif form.attendType EQ "chkModerator">1<cfelse>0</cfif>, 
                chkExhibitor		= <cfif form.attendType EQ "chkExhibitor">1<cfelse>0</cfif>,
                chkPress 			= <cfif form.attendType EQ "chkPress">1<cfelse>0</cfif>, 
                chkResearch		=  <cfif form.attendType EQ "chkresearch">1<cfelse>0</cfif>, 
                chkSponsor		=  <cfif form.attendType EQ "chkSponsor">1<cfelse>0</cfif>
            WHERE IngClient_Conf_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">    
        </cfquery>
</cfsilent>
			<cfif form.attendType EQ "chkDelegate">Delegate
            <cfelseif form.attendType EQ "chkSpeaker">Speaker
            <cfelseif form.attendType EQ "chkGuest">Guest
            <cfelseif form.attendType EQ "chkModerator">Moderator
            <cfelseif form.attendType EQ "chkExhibitor">Exhibitor
            <cfelseif form.attendType EQ "chkPress">Press
            <cfelseif form.attendType EQ "chkResearch">Research
            <cfelseif form.attendType EQ "chkSponsor">Sponsor</cfif>
</cfif>
<cfif parameterexists(form.econfAccess) AND  parameterexists(form.id)>
<cfsilent>
        <cfquery datasource="#gpp#" name="new">
            UPDATE   tblConference_Registration 
            SET
                econfAccess		= <cfqueryparam cfsqltype="cf_sql_bit" value="#form.econfAccess#">
            WHERE IngClient_Conf_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">    
        </cfquery>
</cfsilent>
	<cfoutput><cfif form.econfAccess EQ 1>Yes<cfelse>No</cfif> </cfoutput>
</cfif>