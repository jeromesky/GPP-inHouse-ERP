<!--- <cfdump var="#fusebox#"><cfabort> ---><cftry>

<cfswitch expression="#fusebox.fuseAction#">
  
	<cfcase value="home">
    	<cfinclude template="qry_bookings.cfm">
		<cfinclude template="dsp_bookings.cfm">
	</cfcase>
    
    	<cfcase value="bookings">
        <cftry>
    	<cfinclude template="qry_bookings.cfm">
		<cfinclude template="dsp_bookings.cfm">
       
       <cfcatch type="any">
        <cfdump var="#cfcatch#">
        </cfcatch>
        
        </cftry>
	</cfcase>
    
    <cfcase value="bookings-invoice-view">
        <cftry>
        	<!---<cfset form.bookingRef="ABCE948F-1F29-65A5-4C6DDB987CE3B0EA">--->
        <cfinclude template="qry_attendents.cfm">
        <cfinclude template="qry_invoice.cfm">
        <cfinclude template="gw_settings_netBanx.cfm">
        <cfinclude template="dsp_invoice.cfm"><!------>
        
        <cfcatch type="any">
        <cfdump var="#cfcatch#">
        </cfcatch>
        
        </cftry>
	</cfcase>
    
    <cfcase value="update-invoice">
        <cftry>
			<cfinclude template="act_invoice_update.cfm">        
        <cfcatch type="any"><cfdump var="#cfcatch#"></cfcatch></cftry>
	</cfcase>
    
    <!--- registration stuff starts here --->
    
     <cfcase value="booking-register-user">
     	<cfinclude template="../conferences/qry_conferences.cfm">
		<cfinclude template="dsp_register_user.cfm">
	</cfcase>    

     <cfcase value="booking-register-user-events">
     	<cfinclude template="../conferences/qry_eventsBy_ID.cfm">
		<cfinclude template="dsp_register_user_events.cfm">
	</cfcase>
    
     <cfcase value="booking-register-payment-method">
     	<cftry>
        <cfinclude template="../conferences/qry_eventsBy_ID.cfm">
        <cfinclude template="act_register_booking.cfm">
		<cfinclude template="dsp_payment_method.cfm">
        
        <cfcatch type="any">
        <cfdump var="#form#">
        <cfdump var="#cfcatch#">
        </cfcatch>        
        </cftry>
	</cfcase>

     <cfcase value="booking-register-paymentBranch">
     	<!---<cfinclude template="qry_register_paymentBranch.cfm">--->
        <cfinclude template="dsp_register_paymentBranch.cfm">
	</cfcase>
    
    <cfcase value="booking-register-invoice">
    <cftry>
    	<cfinclude template="qry_make_invoice.cfm">
    	<cfinclude template="qry_attendents.cfm">
     	<cfinclude template="qry_register_invoice.cfm">
        <cfinclude template="qry_invoice.cfm">
        <cfinclude template="gw_settings_netBanx.cfm">
        <cfinclude template="dsp_register_invoice.cfm">

        <cfcatch type="any">
        <!---<cfdump var="#qryAttendents#">
        <cfoutput>#qryAttendents.invoiceLocationID#</cfoutput>--->
        <cfdump var="#cfcatch#">
        </cfcatch>        
        </cftry>

	</cfcase>
    
    <cfcase value="booking-register-transfer">
    	<cfinclude template="qry_payment_type.cfm">
     	<cfinclude template="qry_register_transfer.cfm">
        <cfinclude template="qry_bookings_payment_status.cfm">
        <cfinclude template="qry_Statement_request_bookings.cfm">
        <cfinclude template="dsp_register_transfer.cfm">
        <cfinclude template="act_register_transfer.cfm">
	</cfcase>
    
    <cfcase value="booking-payment-email">
    	<cfinclude template="qry_payment_type.cfm">
		<cfinclude template="qry_register_transfer.cfm">
        <cfinclude template="qry_bookings_payment_status.cfm">
        <cfinclude template="qry_Statement_request_bookings.cfm">
        <cfinclude template="dsp_Statement_emailRequest_booking.cfm">
        <cfinclude template="act_bookingPayment_email.cfm">
	</cfcase>
    
<!---    <cfcase value="booking-register-act">
		<cfinclude template="act_register.cfm">
	</cfcase>	--->
	
	<cfdefaultcase>
	<!---	<cfinclude template="dsp_bookings.cfm"> --->
	</cfdefaultcase>

</cfswitch>

<cfcatch type="any">
<cfmail to="jerome@glopac.com" from="error@petro21.com" subject="error on switch bookings">#cfcatch#<</cfmail>
<cfoutput>#cfcatch#</cfoutput>
</cfcatch>
</cftry>