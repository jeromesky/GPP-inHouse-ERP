<cfparam default="3" name="booking.PaymentStatus">

<cfswitch expression="#form.gw_status#">
	
    <cfcase value="declined">
    	<cfset booking.PaymentStatus = 0>
    </cfcase>
    
    <cfcase value="passed">
    	<cfset booking.PaymentStatus = 1>
    </cfcase>
    
    <cfcase value="reqTransfer">
    	<cfset booking.PaymentStatus = 3>
    </cfcase>
    
    <cfcase value="reqCheque">
    	<cfset booking.PaymentStatus = 5>
    </cfcase>
    
    <cfcase value="reqCash">
    	<cfset booking.PaymentStatus = 7>
    </cfcase>
    
     <cfcase value="reqEmail">
    	<cfset booking.PaymentStatus = 9>
    </cfcase>

	<cfdefaultcase>
    	<cfset booking.PaymentStatus = 3>
    </cfdefaultcase>

</cfswitch>


<cfquery datasource="#gpp#" name="qryPaymentsStatus">
	UPDATE bookings
    SET
    Payment = <cfqueryparam cfsqltype="cf_sql_integer" value="#booking.PaymentStatus#">
	WHERE 
    	[bookingReference] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingREF#">
</cfquery>