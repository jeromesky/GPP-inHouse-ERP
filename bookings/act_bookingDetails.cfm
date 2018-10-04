<cfquery datasource="#gpp#">
	UPDATE [bookings]
    SET         
    	[status] = -1
      [delegateUserID]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">
	WHERE     
    	[profileUserID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.profileUserID#">
    AND 
    	[bookingReference] = <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingReference#">
</cfquery>

<cfloop index="i" list="#form.eventID#">
	<cfquery datasource="#gpp#" name="qryNewReg">
    	INSERT INTO tblConference_Registration
        	(
            lngIndividual_ID
            ,chkDelegate
            ,lngConference_ID
            ,insertdate
            ,registerdBy
            )
        VALUES
        	(
            <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="1">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#i#">
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#">
            )
		SELECT @@IDENTiTY AS  recordID
    </cfquery>

	<cfquery datasource="#gpp#">
		INSERT INTO tblInvoiceDetails
			(
              Conf_Reg_ID
             ,IND_ID
             ,AConfID
             ,InvoicePaid
<!---     ,InvPDBankNumber NETBANX ref no--->
	<!---		, invPDDateNum if date the InvoicePaid = YES--->
			)
        VALUES
        	(
            <cfqueryparam cfsqltype="cf_sql_integer" value="#qryNewReg.recordID#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#i#">
            ,<cfqueryparam cfsqltype="cf_sql_char" value="NO">
            )
     </cfquery>
</cfloop>
 
<cflocation url="../bookings/" addtoken="no">

<cfdump var="#form#">

<form action="../bookings/" method="post">
	<button>Go</button>
</form>