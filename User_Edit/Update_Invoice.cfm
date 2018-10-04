<cfinclude template="../application.cfm">

<cfif parameterexists(form.id) AND form.value NEQ "">
	<cfset editedField = #form.fieldname# >
        <cfquery datasource="#gpp#" name="get">
                UPDATE 
                	tblInvoiceDetails
                SET 
				<cfif editedField EQ "INVCancelledNo" >
                    INVCancelledNo	= <cfqueryparam  value="#form.value#">,
                    InvCanDateNum 	= <cfqueryparam cfsqltype="cf_sql_date"  value="#NOW()#">
                <cfelseif  editedField EQ "Invoice_Sent">
                    Invoice_Sent	  = 1,
                    Invoice_Sent_Date = <cfqueryparam cfsqltype="cf_sql_date" value="#NOW()#">
                <cfelseif  editedField EQ "InvoicePaid">
                    InvoicePaid		= <cfqueryparam  value="#form.value#">,
                    invPDDateNum	= <cfqueryparam cfsqltype="cf_sql_date" value="#NOW()#">
                <cfelseif editedField EQ "RefundAmount">
                    RefundAmount	 = <cfqueryparam cfsqltype="cf_sql_money" value="#form.value#">,
                    InvRefundDateNum = <cfqueryparam cfsqltype="cf_sql_date" value="#NOW()#">
                <cfelseif isdate(form.value)>
                	#editedField# = <cfqueryparam cfsqltype="cf_sql_date" value="#form.value#">
                <cfelseif Isnumeric(form.value)>
                	#editedField# = <cfqueryparam  value="#form.value#">
                <cfelseif IsBoolean(form.value)>
                	#editedField# = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.value#">
                <cfelse>
                	#editedField# = <cfqueryparam  value="#form.value#">
                </cfif>
                WHERE 
                	INVRecIDX = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        </cfquery>

		<cfoutput>#form.value#</cfoutput>
</cfif>

  <!---  
		<cfif parameterExists(form.AConfID ) >
                AConfID  = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.AConfID#">
        </cfif>
        <cfif parameterExists(form.AConfCode ) >
                AConfCode = <cfqueryparam  value="#form.AConfCode#">
        </cfif>
        <cfif parameterExists(form.IND_ID ) >
                IND_ID  = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.IND_ID#"> 
       </cfif>
        <cfif parameterExists(form.Conf_Reg_ID ) >
                Conf_Reg_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.Conf_Reg_ID#"> 
       </cfif>
        <cfif parameterExists(form.InvoiceNo_LNK) >
                InvoiceNo_LNK = <cfqueryparam value="#form.InvoiceNo_LNK#">
       </cfif>
        <cfif parameterExists(form.InvoiceAmount ) >
                InvoiceAmount  = <cfqueryparam cfsqltype="cf_sql_money" value="#form.InvoiceAmount#"> 
       </cfif>
        <cfif parameterExists(form.InvoicePaid ) >
                InvoicePaid  = <cfqueryparam value="#form.InvoicePaid#"> 
        </cfif>
        <cfif parameterExists(form.InvPDBank ) >
                InvPDBank= <cfqueryparam value="#form.InvPDBank#">
        </cfif>
        <cfif parameterExists(form.InvPDBankNumber ) >
                InvPDBankNumber= <cfqueryparam value="#form.InvPDBankNumber#">
       </cfif>
        <cfif parameterExists(form.InvPDDateNum ) >
                InvPDDateNum= <cfqueryparam cfsqltype="cf_sql_date" value="#form.InvPDDateNum#">
      </cfif>
        <cfif parameterExists(form.INVCancelled ) >
                INVCancelled  = <cfqueryparam value="#form.INVCancelled#">
     </cfif>
        <cfif parameterExists(form.InvCanDateNum ) >
                InvCanDateNum= <cfqueryparam value="#form.InvCanDateNum#">
    </cfif>
        <cfif parameterExists(form.UpdateBy ) >
                UpdateBy= <cfqueryparam value="#form.UpdateBy#">
   </cfif>
        <cfif parameterExists(form.UpdateDateNum ) >
                UpdateDateNum  = <cfqueryparam value="#form.UpdateDateNum#"> 
   </cfif>
        <cfif parameterExists(form.INVComments ) >
                INVComments = <cfqueryparam value="#form.INVComments#">
       </cfif>
        <cfif parameterExists(form.InvRefunded ) >
                InvRefunded = <cfqueryparam value="#form.InvRefunded#"> 
       </cfif>
        <cfif parameterExists(form.InvRefundComment ) >
                InvRefundComment = <cfqueryparam value="#form.InvRefundComment#"> 
       </cfif>
        <cfif parameterExists(form.InvRefundDateNum ) >
                InvRefundDateNum= <cfqueryparam value="#form.InvRefundDateNum#">
       </cfif>
        <cfif parameterExists(form. RefundAmount) >
                RefundAmount  = <cfqueryparam cfsqltype="cf_sql_money" value="#form.#RefundAmount"> 
       </cfif>
        <cfif parameterExists(form.INVCancelledNo ) >
                INVCancelledNo= <cfqueryparam value="#form.INVCancelledNo#">
       </cfif>
        <cfif parameterExists(form.GPP_bankAccount ) >
                GPP_bankAccount = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.GPP_bankAccount#"> 
        </cfif>
        <cfif parameterExists(form.Comment_Public ) >
                Comment_Public= <cfqueryparam value="#form.Comment_Public#">
        </cfif>
        <cfif parameterExists(form.Comment_Paid_Status ) >
                Comment_Paid_Status= <cfqueryparam value="#form.Comment_Paid_Status#"> 
        </cfif>--->