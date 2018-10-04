<cfinclude template="../Application.cfm">
<!---<cftry>--->

<cfinclude template="qry_Event_attandence.cfm">

<cfloop query="qryAttendenceList"> 
<!--- cfset the email to send out if main email emty then try secratery  startrow="1" endrow="1"  --->
<cfif url.test NEQ 1>
	<cfif qryAttendenceList.email NEQ "">
		<cfset email = qryAttendenceList.email>
    <cfelseif qryAttendenceList.email EQ "" AND qryAttendenceList.emailSecond NEQ "" >
		<cfset email = qryAttendenceList.emailSecond>
    <cfelseif qryAttendenceList.email EQ "" AND qryAttendenceList.emailSecond EQ "" AND qryAttendenceList.emailSecretary NEQ "" >
		<cfset email = qryAttendenceList.emailSecretary>
    <cfelse >
		<cfset email = "">
    </cfif> 
</cfif>

<cfif email NEQ "">

    <!--- isvalid --->
    <cfif IsValid("email", #Lcase(email)#) >  
                                 
    <cfmail to="#Lcase(email)#"
            cc="#CCadress#"
            failto="bounce--#trim(qryAttendenceList.id)#@petro21.com" 
            from="events@petro21.com" 
            subject="#corespondenceLabel#: #geteventidGPP.event_name#" 
            type="html">
		<cfinclude template="#template#">  
    </cfmail>

		<cfset counter = counter + 1>
        <cfset sentList = listAppend(sentList, qryAttendenceList.RegTable_id, ",")> 

	<cfelse>
        		
		<!--- SEND AN EMAIL IF FAILED --->
        <cfmail to="#contactRego#"
                from="events@petro21.com" 
                subject="#corespondenceLabel#" 
                type="html">
        	Could not send to :	#qryAttendenceList.title# #qryAttendenceList.name# #qryAttendenceList.surname#
        </cfmail>
    </cfif>
<cfelse>
			<!--- SEND AN EMAIL IF FAILED --->
             <cfmail to="#contactRego#"
                    from="events@petro21.com" 
                    subject="#corespondenceLabel#" 
                    type="html">
             			Could not send to :	#qryAttendenceList.title# #qryAttendenceList.name# #qryAttendenceList.surname#
             </cfmail>
</cfif>
</cfloop>

<!--- ATTENDENCE FOR EMAIL HAS BEEN SENT, MARK ON DB --->
		<cfif url.test NEQ 1 AND corespondence EQ 1>
            <cfquery datasource="#gpp#">
            UPDATE tblConference_Registration
            SET formsent = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >
            WHERE IngClient_Conf_ID IN (#sentList#) 
            </cfquery>
        </cfif>

<cfoutput>#qryAttendenceList.recordcount#<br /> 
#listLen(sentList)#<br />
#sentList#<br>
#qryAttendenceList.recordcount#
</cfoutput>