<cfinclude template="../application.cfm">

<cfif form.attendeeType EQ "chkSpeaker" OR form.attendeeType EQ "chkModerator">

        <cfswitch expression="#form.attendeeType#">
                <cfcase value="chkSpeaker">
                    <cfset form.speakerType = 1>
                 </cfcase>
                 
                 <cfcase value="chkModerator">
                    <cfset form.speakerType = 5>
                 </cfcase>
        </cfswitch>																		
	<cfinclude template="../program/qry_new_Speake_Save.cfm">

</cfif>



<cfswitch expression="#form.attendeeType#">
		<cfcase value="chkDelegate">
        	<cfset bookingType = 1>
         </cfcase>
         
         <cfcase value="chkSpeaker">
        	<cfset bookingType = 2>
         </cfcase>
         
         <cfcase value="chkGuest">
        	<cfset bookingType = 3>
         </cfcase>
         
         <cfcase value="chkModerator">
        	<cfset bookingType = 4>
         </cfcase>
         
         <cfcase value="chkExhibitor">
        	<cfset bookingType = 5>
         </cfcase>
         
         <cfcase value="chkPress">
        	<cfset bookingType = 6>
         </cfcase>
         
         <cfcase value="chkSponsor">
        	<cfset bookingType = 8>
         </cfcase>
         
         <cfcase value="chkresearch">
        	<cfset bookingType = 7>
         </cfcase>
 </cfswitch>

<!--- INSERT INTO CONFERENCE ---->
<cfloop list="#form.eventid#" delimiters="," index="looped_eventid">

<cfquery datasource="#gpp#" name="new">
 	INSERT INTO  tblConference_Registration 
    (ChkCancelled,chkCocktail, chkDinner, chkAttending,   chkPaid,   lngStatus_ID,
    	chkDelegate, 
        chkSpeaker, 
        chkGuest, 
        chkModerator, 
        chkExhibitor, 
        chkPress, 
        chkResearch, 
        chkSponsor, 
        insertdate,
    	lngConference_ID,
        chkDiscount,
        chkCompGuest,
        lngIndividual_ID,
        registerdBy
    )
    VALUES
    (0, 0, 0, 1, 0, 
    <!--- SORT attendent type CAN bE REMOVED ONCE NEW SYSTEM IS BUILT,, DUPLICATE INFORMATION --->
        <cfif form.attendeeType EQ "chkDelegate">1 
			<cfelseif form.attendeeType EQ "chkSpeaker">2
        	<cfelseif form.attendeeType EQ "chkGuest">3
        	<cfelseif form.attendeeType EQ "chkModerator">4
            <cfelseif form.attendeeType EQ "chkExhibitor">5
            <cfelseif form.attendeeType EQ "chkPress">6
            <cfelseif form.attendeeType EQ "chkSponsor">8
            <cfelseif form.attendeeType EQ "chkresearch">7</cfif>,
    <!--- END SORT attendent type ---> 
    	<cfif form.attendeeType EQ "chkDelegate">1<cfelse>0</cfif>, 
        <cfif form.attendeeType EQ "chkSpeaker">1<cfelse>0</cfif>, 
        <cfif form.attendeeType EQ "chkGuest">1<cfelse>0</cfif>, 
        <cfif form.attendeeType EQ "chkModerator">1<cfelse>0</cfif>,
        <cfif form.attendeeType EQ "chkExhibitor">1<cfelse>0</cfif>, 
        <cfif form.attendeeType EQ "chkPress">1<cfelse>0</cfif>, 
        <cfif form.attendeeType EQ "chkresearch">1<cfelse>0</cfif>,
        <cfif form.attendeeType EQ "chkSponsor">1<cfelse>0</cfif>, 
        <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >,
    	<cfqueryparam cfsqltype="cf_sql_integer" value="#looped_eventid#">,
        <cfif parameterexists(form.discount) >
        		1,
        <cfelse>
        		0,
        </cfif>
        <cfif parameterexists(form.guest) >
        		1,
         <cfelse>
         		0,
        </cfif>
        <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#session.staffID#">
        
     )
	SELECT @@IDENTITY AS newid
</cfquery>
<!--- GET THE CONFERENCE CODE ---->
 <cfquery datasource="#gpp#" name="getConfCode">
 SELECT strConference_Code
 FROM tblAnnual_Conf
 WHERE IngConference_ID = <cfqueryparam  value="#looped_eventid#">
</cfquery>

 <cfquery datasource="#gpp#">
 	INSERT INTO  tblInvoiceDetails 
    	(
        <cfif form.discountValue NEQ "" >
        discountValue,
        </cfif>
        AConfID, 
        IND_ID, 
        Conf_Reg_ID, 
        InvoicePaid,
        <cfif parameterexists(form.invoiceProcessPayment) >
        		invoiceProcessPayment,
        </cfif> 
        INVComments, 
        GPP_bankAccount ,
        InvPDBankNumber
		)
    VALUES
    ( 
    	<cfif form.discountValue NEQ "" >
     <cfqueryparam  value="#form.discountValue#">,
     </cfif>
    <cfqueryparam  value="#looped_eventid#">,
    <cfqueryparam  value="#form.userid#">,
    <cfqueryparam  value="#new.newid#">,
    		<cfif form.attendeeType EQ "chkSpeaker">'YES'
        	<cfelseif form.attendeeType EQ "chkGuest">'YES'
        	<cfelseif form.attendeeType EQ "chkModerator">'YES'
            <cfelseif form.attendeeType EQ "chkPress">'YES'
            <cfelse >
            		<cfqueryparam  value="#form.InvoicePaid#">
			</cfif>,    
    <cfif parameterexists(form.invoiceProcessPayment) >
    		<cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >,
    </cfif>
   
    <cfqueryparam value="#Ucase(form.INVComments)#">,
     <cfqueryparam  value="#form.GPP_bankAccount#">,
     <cfqueryparam  value="#form.InvPDBankNumber#">

    )
</cfquery>

<cfquery datasource="#gpp#" name="get">
SELECT *
FROM CRM_User_Registrations
WHERE user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#" >
ORDER BY ID DESC
</cfquery>

<cfinclude template="dsp_userRegistrations.cfm">

</cfloop>