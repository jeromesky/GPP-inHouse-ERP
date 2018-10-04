<cfinclude template="../application.cfm">



<cfswitch expression="#form['#i#_bookingType']#">
		<cfcase value="1">
        	<cfset OldBookingType = "chkDelegate">
         </cfcase>
         
         <cfcase value="2">
        	<cfset OldBookingType = "chkSpeaker">
         </cfcase>
         
         <cfcase value="3">
        	<cfset OldBookingType = "chkGuest">
         </cfcase>
         
         <cfcase value="4">
        	<cfset OldBookingType = "chkModerator">
         </cfcase>
         
         <cfcase value="5">
        	<cfset OldBookingType = "chkExhibitor">
         </cfcase>
         
         <cfcase value="6">
        	<cfset OldBookingType = "chkPress">
         </cfcase>
         
         <cfcase value="8">
        	<cfset OldBookingType = "chkSponsor">
         </cfcase>
 </cfswitch>

<!--- INSERT INTO REGISTRATION ---->
<cfquery datasource="#gpp#" name="new">
 	INSERT INTO  tblConference_Registration 
    (
    insertdate,
    registerdBy
    )
    VALUES
    (
    <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >,
     <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
    )
	SELECT @@IDENTITY AS newid
</cfquery>

<cfquery datasource="#gpp#">
 	UPDATE tblConference_Registration 
    SET
    	ChkCancelled = 0,
        chkCocktail = 0,
        chkDinner = 0,
        chkAttending = 1,   
        chkPaid = 0,
        lngStatus_ID = #form['#i#_bookingType']#,
    	#OldBookingType# = 1,
    	lngConference_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#">,
        chkDiscount = 0,
        chkCompGuest =0,
        lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
	WHERE
    	[IngClient_Conf_ID] = #new.newid#
</cfquery>


<!--- GET THE CONFERENCE CODE ---->
 <cfquery datasource="#gpp#" name="getConfCode">
 SELECT strConference_Code
 FROM tblAnnual_Conf
 WHERE IngConference_ID = <cfqueryparam  value="#i#">
</cfquery>

 <cfquery datasource="#gpp#">
 	INSERT INTO  tblInvoiceDetails 
    	(
        <!---<cfif form['#i#_discount'] NEQ "" >--->
        discountValue,
        <!---</cfif>--->
        AConfID, 
        IND_ID, 
        Conf_Reg_ID, 
        InvoicePaid,
<!---        <cfif parameterexists(form.invoiceProcessPayment) >
        		invoiceProcessPayment,
        </cfif> --->
        INVComments 
<!---        GPP_bankAccount ,
        InvPDBankNumber--->
		)
    VALUES
    ( 
<!---    <cfif form['#i#_discount'] NEQ "" >--->
     <cfqueryparam  value="#form.DISCOUNT#">,
     <!---</cfif>--->
    <cfqueryparam  value="#i#">,
    <cfqueryparam  value="#form.userid#">,
    <cfqueryparam  value="#new.newid#">,
    		<cfif form['#i#_bookingType'] EQ "2">'YES'
        	<cfelseif form['#i#_bookingType'] EQ "3">'YES'
        	<cfelseif form['#i#_bookingType'] EQ "4">'YES'
            <cfelseif form['#i#_bookingType'] EQ "6">'YES'
            <cfelse >
            		'NO'
			</cfif>,    
<!---    <cfif parameterexists(form.invoiceProcessPayment) >
    		<cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >,
    </cfif>--->
   
    <cfqueryparam value="#form['#i#_bookingComment']#">
<!---     <cfqueryparam  value="#form.GPP_bankAccount#">,
     <cfqueryparam  value="#form.InvPDBankNumber#">--->

    )
</cfquery>