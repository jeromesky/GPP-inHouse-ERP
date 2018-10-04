<cfinclude template="../application.cfm">
<cfsilent>
    
<cfset editedField = #form.fieldname#>
<cfquery datasource="#gpp#" name="get">
 	UPDATE   tblIndOptions
    SET 
      <cfif editedField EQ "Black_Listed" > 
        	Black_Listed = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.value#">,
            Black_Listed_Date = <cfqueryparam cfsqltype="cf_sql_date" value="#Now()#">
      <cfelseif editedField EQ "Black_Listed_comment"  >          
            Black_Listed_comment = <cfqueryparam  value="#left(form.value, 300)#">
      <cfelseif isdate(form.value) >
     		#editedField# = <cfqueryparam cfsqltype="cf_sql_date"  value="#form.value#">
     <cfelseif Isnumeric(form.value) >
     		#editedField# = <cfqueryparam  value="#form.value#">
     <cfelseif IsBoolean(form.value) >
     		#editedField# = <cfqueryparam cfsqltype="cf_sql_bit"  value="#form.value#">
	 <cfelse>
     		#editedField# = <cfqueryparam  value="#form.value#">
     </cfif>
     WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<!--- save CHEANGE ----->
<cfinclude template="../components/qry_userUpdate.cfm">

</cfsilent>
<!--- check the record ---->
<cfquery datasource="#gpp#" name="CheckRecord">
            SELECT 
                #editedField# AS valueToCheck
            FROM
                tblIndOptions 
            WHERE 
                lngIndividual_ID	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

	<cfif  form.value EQ CheckRecord.valueToCheck>
                <cfset updated = "1">
    <cfelse>
                <cfset updated = "2">
    </cfif>
<cfoutput>{"data" : "#form.value#", "status" : "#updated#"} </cfoutput>


<!--- <cfoutput>#form.value#</cfoutput>

  <cfif isdate(evaluate("form.#editedField#") ) >
     		#editedField# = <cfqueryparam cfsqltype="cf_sql_date"  value="#form.strFirst_Name#">
    
     <cfelseif Isnumeric(evaluate("form.#editedField#")) >
     		#editedField# = <cfqueryparam  value="#form.strFirst_Name#">
    
     <cfelseif IsBoolean(evaluate("form.#editedField#")) >
     		#editedField# = <cfqueryparam cfsqltype="cf_sql_bit"  value="#form.strFirst_Name#">
     
	 <cfelse  >
     		#editedField# = <cfqueryparam  value="#form.strFirst_Name#">
     </cfif>--->
     
   <!---   <cfif parameterExists(form.Title ) >          
            Title = <cfqueryparam  value="#form.Title#">
		</cfif>
        <cfif parameterExists(form.strFirst_Name ) >          
            strFirst_Name = <cfqueryparam  value="#form.strFirst_Name#">
		</cfif>
         <cfif parameterExists(form.strSurname ) >          
            strSurname = <cfqueryparam  value="#form.strSurname#">
		</cfif>
        <cfif parameterExists(form.strDesignation ) >          
            strDesignation = <cfqueryparam  value="#form.strDesignation#">
		</cfif>
        <cfif parameterExists(form.strCity ) >          
            strCity = <cfqueryparam  value="#form.strCity#">
		</cfif>
        
        <cfif parameterExists(form.strEmail ) >          
            strEmail = <cfqueryparam  value="#form.strEmail#">
		</cfif>
        <cfif parameterExists(form.strEmail_Alt ) >          
            strEmail_Alt = <cfqueryparam  value="#form.strEmail_Alt#">
		</cfif>
        <cfif parameterExists(form.email_web ) >          
            email_web = <cfqueryparam  value="#form.email_web#">
		</cfif>
        <cfif parameterExists(form.strSecretary_Email ) >          
            strSecretary_Email = <cfqueryparam  value="#form.strSecretary_Email#">
		</cfif>
        <cfif parameterExists(form.password ) >          
            password = <cfqueryparam  value="#form.password#">
		</cfif>
        <cfif parameterExists(form.strStreet_Adress ) >          
            strStreet_Adress = <cfqueryparam  value="#form.strStreet_Adress#">
		</cfif>
        <cfif parameterExists(form.strPostal_Adress ) >          
            strPostal_Adress = <cfqueryparam  value="#form.strPostal_Adress#">
		</cfif>
        <cfif parameterExists(form.strPhDirect_No ) >          
            strPhDirect_No = <cfqueryparam  value="#form.strPhDirect_No#">
		</cfif>
         <cfif parameterExists(form.strFaxDirect_No ) >          
            strFaxDirect_No = <cfqueryparam  value="#form.strFaxDirect_No#">
		</cfif>
        <cfif parameterExists(form.CountryName ) >          
            CountryName = <cfqueryparam  value="#form.CountryName#">
		</cfif>
        <cfif parameterExists(form.strIndSource ) >          
            strIndSource = <cfqueryparam  value="#form.strIndSource#">
		</cfif>
        <cfif parameterExists(form.BPA_Designation ) >          
            BPA_Designation = <cfqueryparam  value="#form.BPA_Designation#">
		</cfif>
        
       <cfif parameterExists(form.Black_Listed ) >          
            Black_Listed = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.Black_Listed#">,
            Black_Listed_Date = <cfqueryparam cfsqltype="cf_sql_date" value="#Now()#">
		</cfif>
        <cfif parameterExists(form.Black_Listed_comment ) >          
            Black_Listed_comment = <cfqueryparam  value="#left(form.Black_Listed_comment, 300)#">
		</cfif>
        <cfif parameterExists(form.Black_Listed_Date ) >           
            Black_Listed_Date = <cfqueryparam cfsqltype="cf_sql_date" value="#form.Black_Listed_Date#">
		</cfif>
        <cfif parameterExists(form.lngCompany_ID ) >           
            lngCompany_ID = <cfqueryparam  cfsqltype="cf_sql_integer" value="#form.lngCompany_ID#">
		</cfif>
        <cfif parameterExists(form.intCode ) >           
            intCode = <cfqueryparam   value="#form.intCode#">
		</cfif>
		      <cfif parameterExists(form.Black_Listed ) > 
        	Black_Listed = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.Black_Listed#">,
            Black_Listed_Date = <cfqueryparam cfsqltype="cf_sql_date" value="#Now()#">
        
      <cfelseif parameterExists(form.Black_Listed_comment ) >          
            Black_Listed_comment = <cfqueryparam  value="#left(form.Black_Listed_comment, 300)#">
		     
      <cfelseif isdate(evaluate("form.#editedField#") ) >
     		#editedField# = <cfqueryparam cfsqltype="cf_sql_date"  value="#evaluate("form.#editedField#")#">
    
     <cfelseif Isnumeric(evaluate("form.#editedField#")) >
     		#editedField# = <cfqueryparam  value="#evaluate("form.#editedField#")#">
    
     <cfelseif IsBoolean(evaluate("form.#editedField#")) >
     		#editedField# = <cfqueryparam cfsqltype="cf_sql_bit"  value="#evaluate("form.#editedField#")#">
     
	 <cfelse  >
     		#editedField# = <cfqueryparam  value="#evaluate("form.#editedField#")#">
     </cfif>
		--->