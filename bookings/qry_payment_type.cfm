<cfparam default="3" name="booking.payment_type">

<cfswitch expression="#form.gw_status#">
	
    <cfcase value="declined">
    	<cfset booking.payment_type = "card">
    </cfcase>
    
    <cfcase value="passed">
    	<cfset booking.payment_type = "card">
    </cfcase>
    
    <cfcase value="reqTransfer">
    	<cfset booking.payment_type = "wire">
    </cfcase>
    
    <cfcase value="reqCheque">
    	<cfset booking.payment_type = "cheque">
    </cfcase>
    
    <cfcase value="reqCash">
    	<cfset booking.payment_type = "cash">
    </cfcase>
    
     <cfcase value="reqEmail">
    	<cfset booking.payment_type = "email">
    </cfcase>

	<cfdefaultcase>
    	<cfset booking.payment_type = 3>
    </cfdefaultcase>

</cfswitch>

