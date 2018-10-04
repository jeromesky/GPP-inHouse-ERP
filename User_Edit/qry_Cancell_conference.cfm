<cfinclude template="../application.cfm">
<cfsilent>
<!--- INSERT INTO CONFERENCE --->
<cfquery datasource="#gpp#" >
 	UPDATE tblConference_Registration
    SET
		ChkCancelled = 1,
        Cancel_Reason = <cfqueryparam value="#left(form.Cancel_Reason , 350)#" >  ,
        Cancel_date		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" > ,
        cancelStaffID	= <cfqueryparam cfsqltype="cf_sql_integer" value="#session.staffID#">
 	WHERE 
    	IngClient_Conf_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.registrationID#">
</cfquery>
</cfsilent>

<cfquery datasource="#gpp#" name="new">
 	UPDATE tblInvoiceDetails
    SET
        INVComments = <cfqueryparam value="#left(form.Cancel_Reason , 1000)#"> , <!--- should concact to string ------>
        InvCanDateNum = <cfqueryparam  value="#now()#" >  
 	WHERE Conf_Reg_ID = <cfqueryparam  value="#form.registrationID#" >
</cfquery>

<cfquery datasource="#gpp#" name="get">
 	INSERT INTO InvoiceNotes
    (InvoiceNoteDate, InvoiceNoteComment, InvoiceID, staffID)
	VALUES
    (
    <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">, 
    <cfqueryparam  value="#left(form.Cancel_Reason, 600)#">, 
    <cfqueryparam  value="#form.invoiceId#">, 
    <cfqueryparam  value="#session.staffID#">
    ) 
</cfquery>

<cfmail to="jason@glopac.com" cc="jerome@glopac.com" from="error@petro21.com" subject="Event Reg Cancellation on Old System #form.invoiceId# #now()#"><br>
Details Required for new System
<pre>
Reason: #form.Cancel_Reason#"
Date: #now()#
StaffID: #session.staffID#
IngClient_Conf_ID: #form.registrationID#
InvoiceID: #form.invoiceId#
</pre>
</cfmail>