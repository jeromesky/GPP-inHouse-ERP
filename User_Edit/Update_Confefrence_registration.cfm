<cfinclude template="../application.cfm">

<cfset editedField = #url.fieldname# >   
<cfquery datasource="#gpp#" name="get">
 	UPDATE   tblInvoiceDetails
	SET
     <cfif isdate(evaluate("form.#editedField#") ) >
     
     <cfelseif Isnumeric(evaluate("form.#editedField#")) >
     
     <cfelseif IsBoolean(evaluate("form.#editedField#")) >
     
     <cfelse >

     </cfif>
    
		<cfif parameterExists(form.lngConference_ID ) >
            lngConference_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.lngConference_ID#">
         		</cfif>
        <cfif parameterExists(form.lngIndividual_ID ) > 
            lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.lngIndividual_ID#">
         		</cfif>
        <cfif parameterExists(form.chkDelegate ) > 
            chkDelegate = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkDelegate#">
        		</cfif>
        <cfif parameterExists(form.chkSpeaker ) > 
            chkSpeaker = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkSpeaker#">
         		</cfif>
        <cfif parameterExists(form.chkGuest ) > 
            chkGuest = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkGuest#">
        		</cfif>
        <cfif parameterExists(form.chkModerator ) > 
            chkModerator = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkModerator#">
        		</cfif>
        <cfif parameterExists(form.chkExhibitor ) > 
            chkExhibitor = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkExhibitor#">
         		</cfif>
        <cfif parameterExists(form.chkPress ) > 
            chkPress = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkPress#">
         		</cfif>
        <cfif parameterExists(form.chkResearch ) > 
            chkResearch = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkResearch#">
         		</cfif>
        <cfif parameterExists(form.chkSponsor ) > 
            chkSponsor = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkSponsor#">
         		</cfif>
        <cfif parameterExists(form.strPersonal_Conf_Info ) > 
            strPersonal_Conf_Info = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#left(form.strPersonal_Conf_Info, 400)#">
        		</cfif>
        <cfif parameterExists(form.strInvoice_No ) > 
            strInvoice_No = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#left(form.strInvoice_No, 50)#">
        		</cfif>
        <cfif parameterExists(form.chkPaid ) > 
            chkPaid = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkPaid#">
         		</cfif>
        <cfif parameterExists(form.chkCocktail ) > 
            chkCocktail = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkCocktail#">
         		</cfif>
        <cfif parameterExists(form.chkDinner ) > 
            chkDinner = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkDinner#">
         		</cfif>
        <cfif parameterExists(form.lngInvited_By ) > 
            lngInvited_By = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.lngInvited_By#">
         		</cfif>
        <cfif parameterExists(form.chkAttending ) > 
            chkAttending = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkAttending#">
         		</cfif>
        <cfif parameterExists(form.lngStatus_ID ) > 
            lngStatus_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.lngStatus_ID#">
        		</cfif>
        <cfif parameterExists(form.strWorkshops ) > 
            strWorkshops = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#left(form.strWorkshops, 50)#">
         		</cfif>
        <cfif parameterExists(form.ChkCancelled ) > 
            ChkCancelled = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.ChkCancelled#">
         		</cfif>
        <cfif parameterExists(form.Cancel_Reason ) > 
            Cancel_Reason = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#left(form.Cancel_Reason, 350)#">
         		</cfif>
        <cfif parameterExists(form.chkDiscount ) > 
            chkDiscount = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkDiscount#">
         		</cfif>
        <cfif parameterExists(form.chkCompGuest ) > 
            chkCompGuest = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.chkCompGuest#">
          		</cfif>
        <cfif parameterExists(form.formSent ) > 
            formSent = <cfqueryparam cfsqltype="cf_sql_date" value="#form.formSent#">
          		</cfif>
        <cfif parameterExists(form.welcomeSent ) > 
            welcomeSent = <cfqueryparam cfsqltype="cf_sql_date" value="#form.welcomeSent#">
         		</cfif>
        <cfif parameterExists(form.insertdate ) > 
            insertdate = <cfqueryparam cfsqltype="cf_sql_date" value="#form.insertdate#">
        </cfif>
        <cfif parameterExists(form.Cancel_Date ) > 
            Cancel_Date = <cfqueryparam cfsqltype="cf_sql_date" value="#form.Cancel_Date#">
  		</cfif>
        <cfif parameterExists(form.reActivate_date ) >          
            reActivate_date = <cfqueryparam cfsqltype="cf_sql_date" value="#form.reActivate_date#">
		</cfif>
WHERE IngClient_Conf_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>
<cfoutput>#evaluate("form.#editedField#")#</cfoutput>